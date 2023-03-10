<?php 
header("access-control-allow-origin: *");
header("access-control-allow-credentials: true");
header("access-control-allow-headers: Content-Type, *"); 
header("Content-Type: application/json");   
include_once('includes/connection.php');
include_once('includes/stripe/init.php');
ini_set("display_errors", "off");
$data = array();
$profile_url = 'https://7tracking.com/openhouse/images/';
$api_url = 'https://7tracking.com/openhouse/';
$apikey = "AIzaSyCdQH3wQxsqL7vdA-5oQiUP-UwhGjgDTLQ";

//echo json_encode($data);
file_put_contents("test.txt", "********************************\n",FILE_APPEND);
file_put_contents("test.txt", print_r($_POST, true),FILE_APPEND);
//file_put_contents("test.txt", print_r($data, true),FILE_APPEND);
//die();
$d = file_get_contents('php://input');
$d = json_decode($d, true);
foreach ($d['_parts'] as $key => $value) {
	$_POST[$value[0]] = $value[1];
}
function sendotp($phone,$hash) {
	global $conn;
	$code = 1234;
	// $code = mt_rand(1000, 9999);
	// mysqli_query($conn, "insert into otp(`code`, user_id) values('{$code}', '{$phone}')");
	// $c = sendsms($phone, $code, $hash);
	//file_put_contents("test.txt", $c, FILE_APPEND);
	return $code;
}
 
function sendnotification($user_id, $text, $from_id = 0, $type = '') {
	global $conn;
	mysqli_query($conn, "INSERT INTO `notifications`(`from_id`, `notification`, `user_id`, `type`) VALUES ('{$from_id}', '{$text}', '{$user_id}', '{$type}')");
}
function db_filter($value='')
{
	if(!is_array($value) && strlen($value) < 255) {
		global $conn;
	    $value = trim($value);
	   // $value = stripslashes($value);
	   // $value = htmlspecialchars($value);
		return mysqli_real_escape_string($conn,$value);
	} else
		return $value;
}
if($_POST) {
	foreach($_POST as $key=>$b) {
		if($key != "image")
			$_POST[$key] = db_filter($b);
	}
}
if(isset($_POST['phone']))
	$_POST['phone'] = ltrim($_POST['phone'], "0");
if(!empty($_POST['type']))
{	
	switch($_POST['type']) 
	{
     	case 'login':
	if(!empty($_POST['email'])){
	    $email = mysqli_real_escape_string($conn,$_POST['email']);
	    $password = mysqli_real_escape_string($conn,hash('sha256', $_POST['password'].'openhouse'));
    	$user = mysqli_query($conn,"SELECT * from users where email='{$email}' and password='{$password}'"); 		
    	$rq=mysqli_fetch_assoc($user);
        $by_user = $rq['id'];
		if(mysqli_num_rows($user)>0){
		   $data['user_id'] = $by_user;
		   $data['name'] = $rq['username'];
		   $data['email'] = $rq['email'];
		   $data['user_type'] = $rq['user_type'];
		   $data['result']=true;
		   $data['message']='login Successfully';
		}
		else{
			$data['result']=false;
			$data['message']='Login Failed';
		}
     }
    	else{
			$data['result']=false;
			$data['message']='Fill Missing Field';
    	}
	break;

	case 'social_login':
	if(!empty($_POST['token'])){
		$token = mysqli_real_escape_string($conn,$_POST['token']);
    	$user = mysqli_query($conn,"select * from users where social_token='{$token}'"); 		
    	$rq=mysqli_fetch_assoc($user);
        $by_user = $rq['id'];
		if(mysqli_num_rows($user)>0){
		   $data['user_id'] = $by_user;
		   $data['name'] = $rq['username'];
		   $data['user_type'] = $rq['user_type'];
		   $data['result']=true;
		   $data['created'] = false;
		   $data['message']='login Successfully';
		}
		else{
			$token = mysqli_real_escape_string($conn,$_POST['token']);
		    $username = $_POST['first_name']."_".$_POST['last_name'];
			$upd_query = "insert into users (first_name, last_name, phone, email, social_token)
			values ('{$_POST['first_name']}', '{$_POST['last_name']}', '{$_POST['phone']}', '{$_POST['email']}','{$token}')";
			if(mysqli_query($conn,$upd_query))
			{
				$data['result']=true;
				$by_user = mysqli_insert_id($conn);
				$data['user_id'] = $by_user;
				$data['user_type'] = 0;
				$data['name'] = $username;
				$data['created'] = true;
				$data['message']='Created Successfully';
			} else{
				$data['result'] = false;
			}
		}
     }
    	else{
			$data['result']=false;
			$data['message']='Fill Missing Field';
    	}
	break;

	 case 'register':
	
		$username = mysqli_real_escape_string($conn,$_POST['email']);
		$password = mysqli_real_escape_string($conn,hash('sha256', $_POST['password'].'openhouse'));
		$ch = mysqli_query($conn, "SELECT * FROM users where email = '{$username}'");
		if(mysqli_num_rows($ch) == 0) {
			$upd_query = "insert into users (email, password)
			values ('{$username}','{$password}')";
			if(mysqli_query($conn,$upd_query))
			{
				$by_user = mysqli_insert_id($conn);
				$data['user_id'] = $by_user;
				$data['email'] = $username;
				//$data['otp_code'] = sendotp($username);
				$data['result'] = true;
				$data['message'] = 'Registered Successfully!';
			}else{
				$data['result'] = false;
			}
		} else {
			$data['result'] = false;
			$data['message'] = 'Email already exists!';
		}

	     break;

	     case 'check_username':
			if(!empty($_POST['username'])){
			$username = mysqli_real_escape_string($conn,$_POST['username']);
	    	$user = mysqli_query($conn,"select * from users where username='{$username}'"); 		
			if(mysqli_num_rows($user)>0){
			   $data['result']=false;
			   $data['message']='Username already Exists';
			}
			else{
				$data['result']=true;
				$data['message']='Available';
			}
		}
	     break;
	     
	     case 'send_otp':
	     if(!empty($_POST['email'])){
			$data['code'] = sendotp($_POST['email'],$_POST['hash']);
            $data['result'] = true;
            // $user_chk = mysqli_query($conn, "select * from users where phone = '{$_POST['phone']}'");
            // if(mysqli_num_rows($user_chk)) {
            // 	$user = mysqli_fetch_assoc($user_chk);
            // 	$data['user_id'] = $user['id'];
            // 	$data['image'] = $profile_url.$user['image'];
            // } else
            // $data['user_id'] = false;
            // $data['message'] = 'Registered Successfully!';
	     } else {
	     	$data['result'] = false;
	     }
	     break;

	     case 'resend_otp':
	     if(!empty($_POST['phone'])){
			$data['code'] = sendotp($_POST['phone'],$_POST['hash']);
            $data['result'] = true;
            $user_chk = mysqli_query($conn, "select * from users where phone = '{$_POST['phone']}'");
            if(mysqli_num_rows($user_chk)) {
            	$user = mysqli_fetch_assoc($user_chk);
            	$data['user_id'] = $user['id'];
            	$data['image'] = $profile_url.$user['image'];
            } else
            $data['user_id'] = false;
            $data['message'] = 'Registered Successfully!';
	     } else {
	     	$data['result'] = false;
	     }
	     break;

	    case 'update_profile_d':
	     if($_POST['user_id'] && $_POST['field']) {
	     	$_POST['value'] = mysqli_real_escape_string($conn, $_POST['value']);
	        $query = mysqli_query($conn,"update users set `{$_POST['field']}`='{$_POST['value']}' where id='{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['img']=true;
	            $data['message']='Updated Successfully';
	        }else
	            $data['result']=false;
	    } else{
	    $data['result']=false;
		$data['message']='Data missing';
	   }
	     break;

	     case 'update_profile':
	     if($_POST['id'] && $_POST['first_name']) {
	        $query = mysqli_query($conn,"update users set `first_name`='{$_POST['first_name']}', `last_name`='{$_POST['last_name']}', `middle_name`='{$_POST['middle_name']}', `email`='{$_POST['email']}', `phone`='{$_POST['phone']}' where id='{$_POST['id']}'");
	        if($query){
	        	if(isset($_POST['image']) && $_POST['image'] && $_POST['image'] != 'undefined' && $_POST['image'] != 'assets/images/profile.png' && !filter_var($_POST['image'], FILTER_VALIDATE_URL)) {
		        	$id = $_POST['id'];
					$image = image_resize_str($_POST['image'], 640, 'profile', $id);
					mysqli_query($conn,"update users set image='{$image}' where id='{$_POST['id']}'");
	        	}
	            $data['result']=true;
	            $data['img']=true;
	            $data['message']='Updated Successfully';
	        }else
	            $data['result']=false;
	    } else{
	    $data['result']=false;
		$data['message']='Data missing';
	   }
	     break;

		 case 'register_img':
			if($_POST['img'] && $_POST['img'] != 'null' && $_POST['img'] != 'undefined' && $_POST['img'] != 'assets/images/profile.png') {
				$id = mysqli_fetch_array(mysqli_query($conn, "select max(id) from users"))[0]+1;
				$image = image_resize_str($_POST['img'], 320, 'logo', $id);
			} else{
				$image = "";
			}
			mysqli_query($conn,"update users set image='{$image}' where id='{$_POST['user_id']}'");
			$data['img'] = $image;
		 break;

		 case 'update_payments':
			if($_POST['user_id']) {
				$query = mysqli_query($conn,"update users set `payment_methods`='{$_POST['payment_method']}', `min_payment`='{$_POST['min_payment']}' where id='{$_POST['user_id']}'");
				if($query){
					$data['result']=true;
					$data['message']='Updated Successfully';
				}else
					$data['result']=false;
			} else
			$data['result']=false;
		  break;

		case 'get_skills':
			$query = mysqli_query($conn,"select * from `skills`");
			$i=0;
			while($row=mysqli_fetch_assoc($query)){
				$data['skills'][$i]['name'] = $row['name'];
				$i++;
			}
		break;

		case 'get_cities':
			$query = mysqli_query($conn,"SELECT DISTINCT city FROM `users`");
			$i=0;
			while($row=mysqli_fetch_assoc($query)){
				$data['cities'][$i]['name'] = $row['city'];
				$i++;
			}
			$query = mysqli_query($conn,"SELECT DISTINCT state FROM `users`");
			$i=0;
			while($row=mysqli_fetch_assoc($query)){
				$data['states'][$i]['name'] = $row['state'];
				$i++;
			}
		break;

	     case 'update_booking':
	     if($_POST['user_id']) {
	        $query = mysqli_query($conn,"update users set `month`='{$_POST['month']}', `avail_days`='{$_POST['avail_days']}', `start_time`='{$_POST['start_time']}', `end_time`='{$_POST['end_time']}', `accept_lessons`='{$_POST['accept_lessons']}', `accept_bookings`='{$_POST['accept_bookings']}', `return_date`='{$_POST['return_date']}' where id='{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['img']=true;
	            $data['message']='Updated Successfully';
	        }else
	            $data['result']=false;
	    } else
	    $data['result']=false;
	     break;

	     case "upload_images":
	     	if($_POST['user_id']) {
	          $id = $_POST['user_id'];
	          //$_POST['gallery'] = json_decode($_POST['gallery']);
	          //$data["gallery"] = $_POST['gallery'];
	          // $user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where id = '{$id}'"));
	          // if($user['image'] == '') {
	          // 	//$image = image_resize_str($_POST['gallery'][0]['img'], 640, 'logo', $id);
	          // 	$query = mysqli_query($conn,"update users set image='{$image}' where id='{$id}'");
	          // 	$start = 1;
	          // } else {
	          // 	$start = 0;
	          // }
	          $gallery = array();
	          $array = json_decode($_POST['gallery']);
    	        foreach($array as $index => $value) {
    	          $data1 = $value;
    	          if (filter_var($data1, FILTER_VALIDATE_URL) === FALSE) {
	        	    $logo_img = image_resize_str($data1, 320, 'gallery', $id.'_'.mt_rand());
        	      } else {
        	      	$logo_img = str_replace($profile_url, '', $data1);
        	      }
        	      $gallery[]['img'] = $logo_img;
        	     $i++;
         	  }
	          $gallery = mysqli_real_escape_string($conn, json_encode($gallery));
	          $query = mysqli_query($conn,"update users set gallery='{$gallery}' where id='{$id}'");
	          if($query){
    	      $data["result"] = true;
    	      $data["message"] = "Image uploaded successfully";
	          }else
	          $data['result'] = false;
	        } else
	        $data['result'] = false;
	     break;

	     case "forgot_password":
	      if(!empty($_POST['email'])){
        		$query = mysqli_query($conn,"select * from users where email='{$_POST['email']}'");
        		if(mysqli_num_rows($query) > 0){
        		$get_res = mysqli_fetch_assoc($query);
        		$data['result']=true;
				$data['otp']='1234';
				sendEmail($_POST['email'],'Playerange','Forgot Password OTP from playerange is '.$data['otp']);
        		$data['message']='OTP sent successfully!';
        	} else {
        		$data['result']=false;
                $data['message']='Email Does not exist, Please enter registered email';
        	 }
        	}

	        break;

			case 'change_password':
				$new_password = mysqli_real_escape_string($conn,hash('sha256', $_POST['password'].'askimam'));
				$count = mysqli_query($conn,"select * from users where email='{$_POST['email']}'");
				if(mysqli_num_rows($count)>0){
				$query = mysqli_query($conn,"update users set password='{$new_password}' where email='{$_POST['email']}'") or die(mysqli_error($conn));

				if($query){
					$data['result'] = true;
				}else{
					$data['result'] = false;	
				}
			}else{
				$data['result'] = false;	
				$data['message'] = 'Email does not exist, Please enter correct email';
			}
				
			break;
	        
	       case "upload_img":
	          $id = $_POST['user_id'];
	          if($_POST['profile_pic'] && $_POST['profile_pic'] != 'null' && $_POST['profile_pic'] != 'assets/images/profile.png') {
	          	$image = image_resize_str($_POST['profile_pic'], 320, 'logo', $id);
	          	$query = mysqli_query($conn,"update users set image='{$image}' where id='{$id}'");
	          }
	          if($query){
    	      $data["result"] = true;
    	      $data["message"] = "Image uploaded successfully";
	          }else{
	              $data['result'] = false;
	          }
	     break;
	     
	     case 'profile':
	           $profile = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['user_id']}'"));
        	   $profile['image'] = $profile_url.$profile['image'];
        	   $profile['age'] = date("Y")-date("Y", strtotime($profile['dob']));
	           $data['profile'] = $profile;
	     break;
	     
	     case 'save_profile':
	     if($_POST['img'] && $_POST['img'] != 'null' && $_POST['img'] != 'assets/images/profile.png') {
	         	$image = image_resize_str($_POST['img'], 320, 'logo', $_POST['user_id']);
	         	mysqli_query($conn,"update users set image='{$image}' where id='{$_POST['user_id']}'");
	          }
	        $query = mysqli_query($conn,"update users set full_name='{$_POST['name']}',email='{$_POST['email']}',username='{$_POST['username']}', dob='{$_POST['dob']}', phone_number='{$_POST['phone']}' where id='{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['img']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	     break;

	    case 'add_data':
	    $fields = "";
		$data1 = "";
		$table_name = $_POST['table_name'];
		if($table_name == 'requests') {
			$_POST['order_id'] = mt_rand(10000000,99999999);
		}
		// if($_POST['address'] && $_POST['city']) {
  //    		$address = urlencode("{$_POST['address']} {$_POST['city']} {$_POST['state']} {$_POST['postal_code']}");
  //    		$d = json_decode(file_get_contents("https://maps.googleapis.com/maps/api/geocode/json?address={$address}&key={$apikey}"), true);
  //    		$d = $d['results'][0]['geometry']['location'];
  //    		$_POST['lat'] = $d['lat'];
  //    		$_POST['lng'] = $d['lng'];
  //    	}
		$images = array();
		$id = mysqli_fetch_array(mysqli_query($conn, "SELECT id from `{$table_name}` order by id desc limit 1"))[0]+1;
		if(isset($_POST['image'])) {
			$i = json_decode($_POST['image'], true);
			foreach ($i as $value) {
				$images[] = image_resize_str($value['img'], 640, $table_name."_".mt_rand(1, 999), $id);
			}
			$_POST['image'] = db_filter(json_encode($images));
		}
		$numItems = count($_POST) - 2;
		$i = 0;
		foreach($_POST as $a=>$b) {
		  if($a != "type" && $a != "table_name") {
			  if(++$i == $numItems) {
				  $fields .= "`$a`";
				  $data1 .= "'$b'";
				} else {
				  $fields .= "`$a`, ";
				  $data1 .= "'$b', ";
				  }
			  }
		  }
		$q = "insert into {$table_name}($fields) values($data1)";
		file_put_contents("test.txt", "insert into {$table_name}($fields) values($data1)s",FILE_APPEND);

		$query = mysqli_query($conn,$q);
        if($query){
            $data['result']=true;
            $data['message']='Added Successfully';
        }else{
            $data['result']=false;
        }
	    break;

	    case 'update_data':
	    $fields = "";
		$data1 = "";
		$table_name = $_POST['table_name'];
		if($_POST['address'] && $_POST['city']) {
     		$address = urlencode("{$_POST['address']} {$_POST['city']} {$_POST['state']} {$_POST['postal_code']}");
     		$d = json_decode(file_get_contents("https://maps.googleapis.com/maps/api/geocode/json?address={$address}&key={$apikey}"), true);
     		$d = $d['results'][0]['geometry']['location'];
     		$_POST['lat'] = $d['lat'];
     		$_POST['lng'] = $d['lng'];
     	}
		$images = array();
		$id = $_POST['id'];
		if(isset($_POST['image']) && $_POST['image']) {
			if(!filter_var($_POST['image'], FILTER_VALIDATE_URL) && $table_name == 'users') {
	        	$id = $_POST['user_id'];
				$image = image_resize_str($_POST['image'], 640, 'profile', $id);
				$_POST['image'] = $image;
	        } else {
				$i = json_decode($_POST['image'], true);
				foreach ($i as $value) {
					if (strpos($value['img'], $profile_url) === 0)
					    $images[] = str_replace($profile_url, "", $value['img']);
					else
						$images[] = image_resize_str($value['img'], 640, $table_name."_".mt_rand(1, 999), $id);
				}
				$_POST['image'] = db_filter(json_encode($images));
			}
		}
		if($table_name == 'users' && $_POST['password']) {
			$_POST['password'] = mysqli_real_escape_string($conn,hash('sha256', $_POST['password'].'openhouse'));
		}
		$numItems = count($_POST) - 3;
		$i = 0;
		$q = "UPDATE `{$table_name}` SET ";
		foreach($_POST as $a=>$b) {
			if($a != "type" && $a != "table_name" && $a != "id" && $a != "user_id") {
				if(++$i == $numItems)
				$q .= "`$a` = '$b'";
				else				
				$q .= "`$a` = '$b', ";
			}
		}
		// and user_id = '{$_POST['user_id']}'
		$q .= " WHERE `id` = '{$id}'";
		file_put_contents("test.txt", $q."\n",FILE_APPEND);
		$query = mysqli_query($conn,$q);
        if($query){
            $data['result']=true;
            $data['message']='Updated Successfully';
        }else{
            $data['result']=false;
        }
	    break;

	    case 'get_data':
		$table_name = $_POST['table_name'];
		$o = " order by id desc";
		$whr = "where 1";
		$per_page = 20;
		$cpage = 0;
		$limit = "";
		if(isset($_POST['last_id']) && $_POST['last_id']) {
			//$whr .= " and id < {$_POST['last_id']}";
			$cpage = $_POST['last_id'];
			$cpage = $cpage * $per_page;
		}
		$limit = " limit $cpage, $per_page";
		if(isset($_POST['status']) && ($_POST['status'] == 0 || $_POST['status'])) {
			$whr .= " and status = {$_POST['status']}";
		}
		if(isset($_POST['user_type']) && $_POST['user_type']) {
			$whr .= " and user_type = {$_POST['user_type']}";
		}
		if(isset($_POST['user_id']) && $_POST['user_id'] && $table_name == 'offers') {
			$whr .= " and (user_id = '{$_POST['user_id']}' or listing_id in (select id from listing where user_id = '{$_POST['user_id']}'))";
		} elseif(in_array($table_name, array('favourites')) && $_POST['user_id']) {
			$whr .= " and user_id = {$_POST['user_id']}";
		}
		if(isset($_POST['listing_id']) && $_POST['listing_id'] && $table_name == 'appraisals') {
			$whr .= " and listing_id = '{$_POST['listing_id']}'";
		}
		if(in_array($table_name, array('listing')) && $_POST['user_id'] && $_POST['own']) {
			$whr .= " and user_id = {$_POST['user_id']}";
		} else {
			$fa = "";
			if(in_array($table_name, array('listing')) && $_POST['user_id']) {
				$fa = ", (select status from favourites where user_id = '{$_POST['user_id']}' and like_type = '{$table_name}' and favourites.to_id = {$table_name}.id order by id desc limit 1) as favourite";
				$whr .= " and user_id != {$_POST['user_id']}";
			}
		}
		if(isset($_POST['like_type']) && $_POST['like_type']) {
			$whr .= " and like_type = '{$_POST['like_type']}'";
		}
		if(isset($_POST['id']) && $_POST['id']) {
			$whr .= " and id = {$_POST['id']}";
		}
		if(isset($_POST['user_id']) && $table_name == 'connects1' ) {
			$whr .= " and user_id = {$_POST['user_id']}";
		}
		if(isset($_POST['search']) && $table_name == 'listing' ) {
			$whr .= " and (address like '%{$_POST['search']}%' or city like '%{$_POST['search']}%' or state like '%{$_POST['search']}%' or estate_type like '%{$_POST['search']}%' or (SELECT concat(first_name, ' ', last_name) from users where id = listing.user_id) like '%{$_POST['search']}%')";
		}
	
		$g = "";
		if(isset($_POST['cities']) && $table_name == 'listing' ) {
			$g = " group by city";
		}
		$d = "";
		if(isset($_POST['sort']) && $table_name == 'listing' ) {
			if($_POST['sort'] == 'near') {
				if($_POST['lat'] && $_POST['lng']) {
					$d = ", ( 6371 * acos( cos( radians({$_POST['lat']}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians({$_POST['lng']}) ) + sin( radians({$_POST['lat']}) ) * sin(radians(lat)) ) ) AS distance";
					$o = " order by distance asc";
				}
			} elseif($_POST['sort'] == 'popular') {
				$d = ", (SELECT COUNT(*) from offers where listing_id = listing.id) as connects";
				$o = " order by connects desc";
			}
		}
		if(isset($_POST['user_id']) && $table_name== 'connects' ) {
			$whr .= " and (to_id = {$_POST['user_id']} or user_id = {$_POST['user_id']})";
		}
		if(isset($_POST['state']) || isset($_POST['city'])) {
			if($_POST['city'])
				$whr .= " and city = '{$_POST['city']}'";
			elseif($_POST['state'])
				$whr .= " and state = '{$_POST['state']}'";
		}
		//echo "SELECT *{$fa}{$d} from `{$table_name}` {$whr} {$g} {$o} {$limit}";
		// file_put_contents("test.txt", "SELECT *{$fa}{$d} from `{$table_name}` {$whr} {$o} {$limit}",FILE_APPEND);
		$company = mysqli_query($conn, "SELECT *{$fa}{$d} from `{$table_name}` {$whr} {$g} {$o} {$limit}");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
			if($row['user_id']) {
				$row['user'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from users where id = '{$row['user_id']}'"));
			}
			if($row['from_id']) {
				$row['from_user'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from users where id = '{$row['from_id']}'"));
			}
			if($row['listing_id']) {
				$row['listing'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from listing where id = '{$row['listing_id']}'"));
			}
			if($row['to_id'] && $row['like_type'] == 'listing') {
				$row['listing'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from listing where id = '{$row['to_id']}'"));
				$row['to_user'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from users where id = '{$row['listing']['user_id']}'"));
			} else {
				$row['to_user'] = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from users where id = '{$row['to_id']}'"));
			}
			if($row['image']) {
				$row['thumb'] = $profile_url.json_decode($row['image'], true)[0];
			}
			if($row['renovation']) {
				$row['renovation'] = json_decode($row['renovation'], true);
			}
			$row['timestamp'] = date("D, M y H:i", strtotime($row['timestamp']));
			$row['expanded'] = false;
			$data['data'][$i] = $row;
			$i++;
		}
	    break;

	    case 'delete_data':
		$table_name = $_POST['table_name'];
		$query = mysqli_query($conn, "delete from `{$table_name}` where id = '{$_POST['id']}' and user_id = '{$_POST['user_id']}'");
		if($query){
            $data['result']=true;
            $data['message']='Deleted Successfully';
        }else{
            $data['result']=false;
        }
	    break;

	    case 'delete_account':
		$table_name = 'users';
		$query = mysqli_query($conn, "delete from `{$table_name}` where id = '{$_POST['user_id']}'");
		if($query){
            $data['result']=true;
            $data['message']='Deleted Successfully';
        }else{
            $data['result']=false;
        }
	    break;

	    case 'get_orders':
		$table_name = $_POST['table_name'];
		$company = mysqli_query($conn, "SELECT * from `{$table_name}` where 1 order by id desc");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
			$row['user'] = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where id = '{$row['user_id']}'"));
			if($table_name == 'requests') {
				$row['datetime'] = date("l, F d, Y", strtotime($row['delivery_time']));
			}
			if($row['image']) {
				$row['thumb'] = $profile_url.json_decode($row['image'], true)[0];
			}
			$data['data'][$i] = $row;
			$i++;
		}
	    break;

	    case 'get_data_full':
		$table_name = $_POST['table_name'];
		$company = mysqli_query($conn, "SELECT * from `{$table_name}`");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
		$data['data'][$i] = $row;
		$i++;
		}
	    break;

	    case 'get_event_going':
		$company = mysqli_query($conn, "SELECT *, (select image from users where id = event_going.user_id) as image FROM `event_going` WHERE event_id = '{$_POST['event_id']}'");
		$data['data']['count'] = mysqli_num_rows($company);
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
            if($row['image']) {
                $row['thumb'] = $profile_url.$row['image'];
            }
			$data['data']['user'][$i] = $row;
			$i++;
			if($i == 10)
				break;
		}
	    break;

	    case 'get_talent':
		$table_name = 'users';
		$whr = "";
		if(isset($_POST['last_id'])) {
			$whr .= " and id < {$_POST['last_id']}";
		}
		$company = mysqli_query($conn, "SELECT * from `{$table_name}` where user_type = 1 {$whr} order by id desc limit 10");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
			if($table_name == 'users') {
				$row['age'] = date("Y")-date("Y", strtotime($row['dob']));
			}
			if($row['image']) {
				$row['thumb'] = $profile_url.json_decode($row['image'], true)[0];
			}
		$data['data'][$i] = $row;
		$i++;
		}
	    break;

	    case 'get_data_user':
		$table_name = $_POST['table_name'];
		$company = mysqli_query($conn, "SELECT * from `{$table_name}` where user_id = '{$_POST['user_id']}'");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
            if($row['image']) {
                $row['thumb'] = $profile_url.json_decode($row['image'], true)[0];
            }
		$data['data'][$i] = $row;
		$i++;
		}
	    break;

	    case 'get_hire_talent':
		$table_name = 'hire_talent';
		$company = mysqli_query($conn, "SELECT *, (select image from users where id = hire_talent.to_id) as image, (select username from users where id = hire_talent.to_id) as username, (select about from users where id = hire_talent.to_id) as about, (select concat(city, ' ', state) from users where id = hire_talent.to_id) as address from `{$table_name}` where user_id = '{$_POST['user_id']}'");
		$i=0;
		while($row = mysqli_fetch_assoc($company)){
			if($row['booking_date'] >= date("Y-m-d")) {
				$type = "ongoing";
			} else
			$type = "past";
            if($row['image']) {
                $row['thumb'] = $profile_url.$row['image'];
            }
		$data['data'][$type][] = $row;
		$i++;
		}
	    break;

	    case 'map_events':
	     if($_POST['lat'] && $_POST['lng']) {
	     	$d = $_POST;
	     	$fields = "concat(address, ' ', city, ' ', state, ' ', postal_code) as address, lat, lng, image";
	     	$d = "( 6371 * acos( cos( radians({$d['lat']}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians({$d['lng']}) ) + sin( radians({$d['lat']}) ) * sin(radians(lat)) ) ) AS distance";
	     	$qu = "SELECT name, 'Events' as type, {$fields}, {$d} FROM `events` HAVING distance < 20
				UNION 
				SELECT name, 'Performances' as type, {$fields}, {$d} FROM `gigs` HAVING distance < 20
				UNION 
				SELECT name, 'Equipments' as type, {$fields}, {$d} FROM `equipments` HAVING distance < 20
				UNION 
				SELECT username as name, 'Talents' as type, {$fields}, {$d} FROM `users` HAVING distance < 20";
	        $query = mysqli_query($conn,$qu);
	        if($query){
	            $data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
	            	$q['distance'] = round($q['distance'], 1);
	               $q['thumb'] = $profile_url.json_decode($q['image'], true)[0];
	               $data['event'][$i++] = $q;
	            }
	            $data['message']='Ran Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;
	     
	     case 'update_package':
	     if($_POST['user_id']) {
	        $query = mysqli_query($conn,"update users set package_type='{$_POST['package_type']}' where id='{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['img']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'update_location':
	     if($_POST['user_id']) {
	         	
	        $query = mysqli_query($conn,"update users set current_lat='{$_POST['current_lat']}',current_lng='{$_POST['current_lng']}',address='{$_POST['address']}' where id='{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'update_noti':
	     if($_POST['user_id']) {
	        $query = mysqli_query($conn,"INSERT INTO `devices`(`user_id`, `devicePlatform`, `deviceRid`, `deviceModel`) VALUES ('{$_POST['user_id']}', '{$_POST['devicePlatform']}', '{$_POST['deviceRid']}', '{$_POST['deviceModel']}')");
	        if($query){
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'add_service':
	     if($_POST['user_id']) {
	        $query = mysqli_query($conn,"INSERT INTO `services`(`user_id`, `service_name`, `price`, `duration`) VALUES ('{$_POST['user_id']}', '{$_POST['service_name']}', '{$_POST['price']}', '{$_POST['duration']}')");
	        if($query){
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'add_gallery':
	     if($_POST['user_id'] && $_POST['img'] && $_POST['img'] != 'null' && $_POST['img'] != 'assets/images/profile.png') {
	     	$id = mysqli_fetch_array(mysqli_query($conn, "select max(id) from gallery"))[0]+1;
	     	$image = image_resize_str($_POST['img'], 320, 'gallery', $id);
	        $query = mysqli_query($conn,"INSERT INTO `gallery`(`user_id`, `image`) VALUES ('{$_POST['user_id']}', '{$image}')");
	        if($query){
	            $data['result']=true;
	            $data['message']='Uploaded Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'add_story':
	     $_POST['filename'] = mt_rand(1000, 999999);
	     if($_POST['user_id'] && $_POST['data'] && $_POST['filename'] && $_POST['data'] != 'null' && $_POST['data'] != 'assets/images/profile.png') {
	     	$id = mysqli_fetch_array(mysqli_query($conn, "select max(id) from stories"))[0]+1;
	     	$mime = mime_content_type($_POST['data']);
	     	$extension = explode('/', $mime)[1];
	     	$path = 'stories/'.$id.'-'.$_POST['filename'].".".$extension;
			if(strstr($mime, "video/")){
			    $type = 1;
			    $media = base64_to_jpeg($_POST['data'], $path);
			}else if(strstr($mime, "image/")){
				$type = 0;
				$media = image_resize_str($_POST['data'], 640, 'story', $id);
			}
	        $query = mysqli_query($conn,"INSERT INTO `stories`(`id`, `user_id`, `media`,  `type`, `duration`) VALUES ('{$id}', '{$_POST['user_id']}', '{$media}', '{$type}', '10')");
	        if($query){
	            $data['result']=true;
	            $data['message']='Uploaded Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'del_gallery':
	     if($_POST['user_id'] && $_POST['gal_id']) {
	        $query = mysqli_query($conn,"DELETE from `gallery` where `user_id` = '{$_POST['user_id']}' and `id` = '{$_POST['gal_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['message']='Deleted Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'update_service':
	     if($_POST['service_id']) {
	        $query = mysqli_query($conn,"UPDATE `services` SET `service_name` = '{$_POST['service_name']}', `price` = '{$_POST['price']}', `duration` = '{$_POST['duration']}' WHERE id = '{$_POST['service_id']}' limit 1");
	        if($query){
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'add_appointment':
	     if($_POST['user_id'] && $_POST['service_id']) {
	     	$num = mt_rand(100000, 999999);
	     	$_POST['service_id'] = mysqli_real_escape_string($conn, $_POST['service_id']);
	        $query = mysqli_query($conn,"INSERT INTO `appointments`(`user_id`, `service_id`, `app_no`, `app_type`, `app_date`, `app_time`, `price`, `vendor_id`) VALUES ('{$_POST['user_id']}', '{$_POST['service_id']}', '{$num}', '{$_POST['app_type']}', '{$_POST['app_date']}', '{$_POST['app_time']}', '{$_POST['price']}', '{$_POST['vendor_id']}')");
	        if($query){
	        	$app_id = mysqli_insert_id($conn);
	            $data['result']=true;
	            $data['app_id']=$app_id;
	            $data['message']='Added Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='Invalid Input Data';
	    	}
	     break;

	     case 'update_appointment':
	     if($_POST['app_id']) {
	     	$_POST['app_id'] = mysqli_real_escape_string($conn, $_POST['app_id']);
	     	if(isset($_POST['app_time'])) {
	     		$query = mysqli_query($conn,"UPDATE `appointments` set `app_date` = '{$_POST['app_date']}', `app_time` = '{$_POST['app_time']}' WHERE id = '{$_POST['app_id']}'");
	     	}
	     	if(isset($_POST['service_id'])) {
	     	$_POST['service_id'] = mysqli_real_escape_string($conn, $_POST['service_id']);
	     		$query = mysqli_query($conn,"UPDATE `appointments` set `service_id` = '{$_POST['service_id']}' WHERE id = '{$_POST['app_id']}'");
	     	}
	        if($query){
	        	$app_id = $_POST['app_id'];
	            $data['result']=true;
	            $data['app_id']=$app_id;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='Invalid Input Data';
	    	}
	     break;

	     case 'change_status':
	     if($_POST['user_id'] && $_POST['req_id'] && $_POST['status']) {
	        $query = mysqli_query($conn,"update `requests` set status = '{$_POST['status']}' where id = '{$_POST['req_id']}'");
	        if($query){
	        	mysqli_query($conn, "INSERT INTO `status_history`(`req_id`, `user_id`, `status`) VALUES ('{$_POST['req_id']}', '{$_POST['user_id']}', '{$_POST['status']}')");
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='Invalid Input Data';
	    	}
	     break;

	     case 'appointment_detail':
	     if($_POST['app_id']) {
	        $query = mysqli_query($conn,"select * from `appointments` where id = '{$_POST['app_id']}'");
	        if($query){
	        	$q = mysqli_fetch_assoc($query);
	        	$j = 0;
	        	$ser = json_decode($q['service_id'], true);
	        	foreach ($ser as $key => $value) {
            		$services[$j]['name'] = mysqli_fetch_array(mysqli_query($conn, "select service_name from services where id = '{$value['service_id']}'"))[0];
					$services[$j]['id'] = mysqli_fetch_array(mysqli_query($conn, "select id from services where id = '{$value['service_id']}'"))[0];
					$services[$j]['service_id'] = $services[$j]['id'];
					$services[$j++]['price'] = $value['price'];
            	}
            	$q['services'] = $services;
            	$vendor = mysqli_fetch_assoc(mysqli_query($conn, "select *, (select count(*) from rating_review where vendor_id = users.id) as reviews, (select avg(rating) from rating_review where vendor_id = users.id) as rating from users where id = '{$q['vendor_id']}'"));
            	$user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where id = '{$q['user_id']}'"));
            	$q['vendor'] = $vendor;
            	$q['user'] = $user;
	        	$data['appointment'][0] = $q;
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='Invalid Input Data';
	    	}
	     break;
	     case 'update_filters':
	     	$chk = mysqli_query($conn, "INSERT INTO `filters`(`user_id`, `looking_for`, `active_passive`) VALUES ('{$_POST['user_id']}', '{$_POST['looking_for']}', '{$_POST['active_passive']}')");
	     	if($chk) {
	     		$data['result']=true;
	     	} else {
		    	$data['result']=false;
		    	$data['message']='Invalid Input Data';
	    	}
	     break;

		 case 'today_orders':
			if($_POST['user_id']) {
				if($_POST['type'] == 1)
					$type = "vendor";
				else
					$type = "user";
			   $query = mysqli_query($conn,"SELECT *, (select full_name from users where id = appointments.user_id) as username, (select image from users where id = appointments.user_id) as image, (select phone from users where id = appointments.user_id) as phone, (select concat('address') from users where id = appointments.user_id) as address, (select count(*) from rating_review where vendor_id = appointments.user_id) as reviews, (select avg(rating) from rating_review where vendor_id = appointments.user_id) as rating, (select full_name from users where id = appointments.vendor_id) as vendor_name FROM `appointments` where {$type}_id = '{$_POST['user_id']}' limit 3");
			   if($query){
				   $data['result']=true;
				   $i = 0;
				   while ($q = mysqli_fetch_assoc($query)) {
					   $service = array();
					   $q['image'] = $profile_url.$q['image'];
					   $q['price'] = 0;
					   $q['app_time'] = date("h:i", strtotime($q['app_time']));
					   $q['app_a'] = date("A", strtotime($q['app_time']));
					   $q['service'] = json_decode($q['service_id'], true);
					   $q['services'] = count($q['service']);
					   foreach ($q['service'] as $key => $value) {
						   $service[] = mysqli_fetch_array(mysqli_query($conn, "select service_name from services where id = '{$value['service_id']}'"))[0];
						   $q['price'] += $value['price'];
					   }
					   $q['status'] = ucfirst($q['status']);
					   $q['service'] = implode(" | ", $service);
					   $q['app_at'] = date("d M Y", strtotime($q['app_date']))." | ".date("h:i A", strtotime($q['app_time']));
					  $data['appointments'][$i++] = $q;
				   }
			   }else{
				   $data['result']=false;
			   }
		   } else {
			   $data['result']=false;
			   $data['message']='Invalid Input Data';
			   }
			break;
   
	     case 'services_list':
	     if($_POST['user_id']) {
	        $query = mysqli_query($conn,"SELECT * from services where user_id = '{$_POST['user_id']}'");
	        if($query){
	            $data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
	               $data['service'][$i++] = $q;
	            }
	            $data['message']='Ran Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'get_services':
	     if($_POST['lat'] && $_POST['lng']) {
	     	$d = $_POST;
	     	$name = str_replace(" ", "%", $_POST['name']);
	     	$d = ", ( 3959 * acos( cos( radians({$d['lat']}) ) * cos( radians( current_lat ) ) * cos( radians( current_lng ) - radians({$d['lng']}) ) + sin( radians({$d['lat']}) ) * sin(radians(current_lat)) ) ) AS distance";
	        $query = mysqli_query($conn,"SELECT services.id as id, user_id as vendor_id, service_name, state, 3 as rating, 12 as reviews, phone, about, 149 as orders, image, current_lat, current_lng, duration, price, username, full_name{$d} FROM `services` JOIN users on services.user_id = users.id where service_name like '%{$name}%' HAVING distance < 20");
	        if($query){
	            $data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
	               $q['img'] = $profile_url.$q['image'];
	               $data['service'][$i++] = $q;
	            }
	            $data['message']='Ran Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'get_service':
	     if($_POST['vendor_id']) {
	        $query = mysqli_query($conn,"select * from services where user_id = '{$_POST['vendor_id']}'");
	        if($query){
	            $data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
					$q['chk'] = false;
	               $data['service'][$i++] = $q;
	            }
	            $fc = mysqli_query($conn, "select * from favourites where user_id = '{$_POST['user_id']}' and vendor_id = '{$_POST['vendor_id']}'");
	            if(mysqli_num_rows($fc))
	            	$data['favourite'] = true;
	            else
	            	$data['favourite'] = false;
	            $query = mysqli_query($conn,"select * from rating_review where vendor_id = '{$_POST['vendor_id']}'");
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
	            	$user = mysqli_fetch_assoc(mysqli_query($conn, "select img from users where id = '{$q['user_id']}'"));
	            	$q['image'] = $profile_url.$user['image'];
	               $data['review'][$i++] = $q;
	            }
	            $query = mysqli_query($conn,"select * from gallery where user_id = '{$_POST['vendor_id']}'");
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
	               $data['gallery'][$i++] = $q;
	            }
	            $data['message']='Ran Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	   case 'add_rating':
	     if($_POST['vendor_id'] && $_POST['user_id'] && $_POST['rating']) {
	        $query = mysqli_query($conn,"select * from services where user_id = '{$_POST['vendor_id']}'");
	        if($query){
	            $data['result']=true;
	            $data['message']='Updated Successfully';
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	   case 'notifications':
	     if($_POST['user_id']) {
	         $query = mysqli_query($conn,"SELECT *, (SELECT image from users where id = notifications.from_id) as image FROM `notifications` where user_id = '{$_POST['user_id']}' order by id DESC limit 10");
	        if($query){
	            $data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
					$q['chk'] = false;
					$q['listing'] = mysqli_fetch_assoc(mysqli_query($conn, "select * from listing where id = '{$q['listing_id']}'"));
					$q['datetime'] = date("H:i", strtotime($q['timestamp']));
					$q['image'] = $profile_url.$q['image'];
	            	$data['service'][$i++] = $q;
	            }
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

	     case 'matches_list':
	     if($_POST['user_id']) {
	         $query = mysqli_query($conn,"SELECT id, username, address, `image` FROM `users` where id in (SELECT user_id FROM `favourites` where user_id in (SELECT to_id FROM `favourites` where user_id = '{$_POST['user_id']}' and status in( 'like', 'superlike')) and to_id = '{$_POST['user_id']}' and status in( 'like', 'superlike'))");
	        if($query){
	            //$data['result']=true;
	            $i = 0;
	            while ($q = mysqli_fetch_assoc($query)) {
					$q['chk'] = false;
					$q['image'] = $profile_url.$q['image'];
	            	$data['match'][$i++] = $q;
	            }
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
	     break;

		 case 'chat_user_data':
			$user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['u_id']}'"));
			$vendor = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['to_id']}'"));
			$data['chat'][0]['sender_name'] = $vendor['username'];
			$data['chat'][0]['sender_img'] = $profile_url.$user['image'];
		break;

		case 'chat_status':
			if($_POST['user_id'] && $_POST['action'] && $_POST['to_id']) {
	         $query = mysqli_query($conn,"INSERT INTO `chat_users`(`user_id`, `to_id`, `type`) VALUES ('{$_POST['user_id']}', '{$_POST['to_id']}', '{$_POST['action']}')");
	        if($query){
	            $data['result']=true;
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
		break;

		case 'chat_delete':
			if($_POST['user_id'] && $_POST['to_id']) {
	         $query = mysqli_query($conn,"DELETE from chat where (from_id='{$_POST['user_id']}' and to_id='{$_POST['to_id']}') OR (from_id='{$_POST['to_id']}' and to_id='{$_POST['user_id']}') ");
	        if($query){
	            $data['result']=true;
	        }else{
	            $data['result']=false;
	        }
	    } else {
	    	$data['result']=false;
	    	$data['message']='User Id not found';
	    	}
		break;

		 case 'sendmsg':
			$msg = mysqli_real_escape_string($conn,$_POST['msg']);
			 $timestamp = time();
			 $query = mysqli_query($conn,"insert into chat(msg,from_id,to_id,datetime,seen,msg_type,listing_id)values
			 ('{$msg}','{$_POST['u_id']}','{$_POST['to_id']}','{$timestamp}','0','0', '{$_POST['listing_id']}')") or die (mysqli_error($conn));
			  if($query){
				  $data['result'] = true;
				  $data['timestamp'] = $timestamp;
			  }else{
				  $data['result'] = false;
			  }
		   break;

		   case 'chat_attach':
			$timestamp = time();
			$id = mysqli_fetch_array(mysqli_query($conn, "select max(id) from chat"))[0]+1;
	     	$image = image_resize_str($_POST['data'], 640, 'chat', $id);
			$query = mysqli_query($conn,"insert into chat(msg,from_id,to_id,datetime,seen,msg_type)values
			 ('{$image}','{$_POST['u_id']}','{$_POST['to_id']}','{$timestamp}','0','1')") or die (mysqli_error($conn));
			  if($query){
				  $data['result'] = true;
				  $data['timestamp'] = $timestamp;
			  }else{
				  $data['result'] = false;
			  }
		   break;

		   case 'story_msg':
			$msg = mysqli_real_escape_string($conn,$_POST['msg']);
			 $timestamp = time();
			 $query = mysqli_query($conn,"insert into chat(msg,from_id,to_id,datetime,seen,msg_type,story_id)values
			 ('{$msg}','{$_POST['u_id']}','{$_POST['to_id']}','{$timestamp}','0','2','{$_POST['story_id']}')") or die (mysqli_error($conn));
			  if($query){
				  $data['result'] = true;
				  $data['timestamp'] = $timestamp;
			  }else{
				  $data['result'] = false;
			  }
		   break;
		   
		   case 'getchat':
			   $query = mysqli_query($conn,"SELECT * from chat where (from_id='{$_POST['u_id']}' and to_id='{$_POST['to_id']}') OR (from_id='{$_POST['to_id']}' and to_id='{$_POST['u_id']}') ");
			   mysqli_query($conn,"UPDATE chat set seen = 1 where from_id='{$_POST['to_id']}' and to_id='{$_POST['u_id']}'");
			   $i=0;
			   $user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['to_id']}'"));
			   $sender_user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['u_id']}'"));
			   while($row=mysqli_fetch_assoc($query)){
				   $date = date("h:i a",$row['datetime']);
				   $data['chat'][$i]['timestamp'] = $row['datetime'];
				   if($row['msg_type'] != 1)
				   	   $data['chat'][$i]['msg'] = $row['msg'];
				   else
					   $data['chat'][$i]['msg'] = $profile_url.$row['msg'];
				   $data['chat'][$i]['msg_type'] = $row['msg_type'];
				   $data['chat'][$i]['story_id'] = $row['story_id'];
				   $data['chat'][$i]['sender_id'] = $row['from_id'];
				   $data['chat'][$i]['watch'] = false;
				   $data['chat'][$i]['online_status'] = $user['online_status'];
				   $data['chat'][$i]['date'] = $date;
				   $data['chat'][$i]['sender_name'] = $user['username'];
				   $data['chat'][$i]['img'] = $profile_url.$user['image'];
				   $data['chat'][$i]['sender_img'] = $profile_url.$sender_user['image'];
				   $i++;
			   }
			break;

			case 'get_unseen':
			   $query = mysqli_query($conn,"SELECT * from chat where to_id='{$_POST['u_id']}' AND seen = 0");
			   $data['count'] = mysqli_num_rows($query);
			break;

			case 'chat_list':
				$user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['u_id']}'"));
				$user_id = $user['id'];
			   $c = mysqli_query($conn,"SELECT * FROM `chat` WHERE to_id = {$_POST['u_id']} or from_id = {$_POST['u_id']} GROUP BY to_id, from_id");
			   $chats = array();
                while ($chat = mysqli_fetch_assoc($c)) {
                    $chats[] = $chat['from_id'];
                    $chats[] = $chat['to_id'];
                }
                $chats = array_unique($chats);
                $key = array_search($user['id'], $chats);
                unset($chats[$key]);
                $i=0;
                foreach ($chats as $value) {
                    //iah-unread
                    $d = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM `chat` where (to_id = $user_id and from_id = $value) or (from_id = $user_id and to_id = $value) order by datetime desc LIMIT 1 "));
                    $unseen = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `chat` where (to_id = $user_id and from_id = $value) and seen = 0"));
                    $fr = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from users where id = '{$value}'"));
                    $date = date("h:i a",$d['datetime']);
                  
				   $data['chat'][$i]['timestamp'] = $d['datetime'];
				   $data['chat'][$i]['unseen'] = $unseen;
				   $data['chat'][$i]['msg'] = $d['msg'];
				   $data['chat'][$i]['sender_id'] = $value;
				   $data['chat'][$i]['date'] = $date;
				   $data['chat'][$i]['sender_name'] = $fr['first_name']." ".$fr['last_name'];
				   $data['chat'][$i]['sender_img'] = $profile_url.$fr['image'];
				   $i++;
                    }
			break;
			
			case 'checkmsg':
			   $query = mysqli_query($conn,"SELECT * from chat where (from_id='{$_POST['u_id']}' and to_id='{$_POST['to_id']}' and datetime>'{$_POST['timestamp']}') OR (from_id='{$_POST['to_id']}' and to_id='{$_POST['u_id']}' and datetime>'{$_POST['timestamp']}') ");
			   mysqli_query($conn,"UPDATE chat set seen = 1 where (from_id='{$_POST['u_id']}' and to_id='{$_POST['to_id']}' and datetime>'{$_POST['timestamp']}') OR (from_id='{$_POST['to_id']}' and to_id='{$_POST['u_id']}' and datetime>'{$_POST['timestamp']}') ");
			   $i=0;
			   $user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$_POST['to_id']}'"));
			   while($row=mysqli_fetch_assoc($query)){
				//   $timestamp = date("m-d-Y h:i:s",$row['timestamp']);
				   $date = date("h:i a",$row['datetime']);
				   if($row['msg_type'] != 1)
				   	   $data['chat'][$i]['msg'] = $row['msg'];
				   else
					   $data['chat'][$i]['msg'] = $profile_url.$row['msg'];
				   $data['chat'][$i]['msg_type'] = $row['msg_type'];
				   $data['chat'][$i]['story_id'] = $row['story_id'];
				   $data['chat'][$i]['timestamp'] = $row['datetime'];
				   $data['chat'][$i]['watch'] = false;
				   $data['chat'][$i]['msg'] = $row['msg'];
				   $data['chat'][$i]['sender_id'] = $row['from_id'];
				   $data['chat'][$i]['date'] = $date;
				   $data['chat'][$i]['sender_name'] = $user['username'];
				   $data['chat'][$i]['img'] = $profile_url.$user['image'];
				   $i++;
			   }
			break;

			case 'msg_seen':
				$query = mysqli_query($conn,"update chat set seen='1' where from_id='{$_POST['to_id']}' and to_id='{$_POST['u_id']}'");
				if($query){
					$data['result']=true;
				}else{
					$data['result']=false;
				}
				break;

				case 'read_msg':
					$query = mysqli_query($conn,"select * from chat where to_id='{$_POST['user_id']}' and seen='1'");
					$i=0;
					while($row = mysqli_fetch_assoc($query)){
						$sent_user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$row['from_id']}'"));
						$data['chat'][$i]['msg'] = $row['msg'];
						$data['chat'][$i]['from_id'] = $row['from_id'];
						$data['chat'][$i]['to_id'] = $row['to_id'];
						$data['chat'][$i]['full_name'] = $sent_user['full_name'];
						$data['chat'][$i]['img'] = $profile_url.$sent_user['image'];
						$i++;
					}
				 break;

				 case 'unread_msg':
					$query = mysqli_query($conn,"select * from chat where to_id='{$_POST['user_id']}' and seen='0'");
					$i=0;
					while($row = mysqli_fetch_assoc($query)){
						$sent_user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$row['from_id']}'"));
						$data['chat'][$i]['msg'] = $row['msg'];
						$data['chat'][$i]['from_id'] = $row['from_id'];
						$data['chat'][$i]['to_id'] = $row['to_id'];
						$data['chat'][$i]['full_name'] = $sent_user['full_name'];
						$data['chat'][$i]['img'] = $profile_url.$sent_user['image'];
						$i++;
					}
				 break;

				case 'sent_msg':
					$query = mysqli_query($conn,"select * from chat where from_id='{$_POST['user_id']}'");
					$i=0;
					while($row = mysqli_fetch_assoc($query)){
						$sent_user = mysqli_fetch_assoc(mysqli_query($conn,"select * from users where id='{$row['to_id']}'"));
						$data['chat'][$i]['msg'] = $row['msg'];
						$data['chat'][$i]['from_id'] = $row['from_id'];
						$data['chat'][$i]['to_id'] = $row['to_id'];
						$data['chat'][$i]['full_name'] = $sent_user['full_name'];
						$data['chat'][$i]['img'] = $profile_url.$sent_user['image'];
						$i++;
					}
				break;

	case 'add_bank':
		$query = mysqli_query($conn,"insert into bank_info (user_id,user_type,bank_name,holder_name,account_no,iban_no,swift_code)
		values('{$_POST['user_id']}','{$_POST['user_type']}','{$_POST['bank_name']}','{$_POST['holder_name']}',
		'{$_POST['acc_no']}','{$_POST['iban_no']}','{$_POST['swift_code']}')");
		if($query){
			$data['result']=true;
		}else{
			$data['result']=false;
		}
	break;
                              
    case 'get_favourite':
       $row = mysqli_fetch_assoc(mysqli_query($conn,"select * from favourites where user_id='{$_POST['user_id']}' and to_id='{$_POST['to_id']}' and like_type='{$_POST['like_type']}'"));
        if($row['status']==null) { $data['status']=0;} else { $data['status']=$row['status']; }
        
    break;

	case 'like_dislike':
       $chk = mysqli_query($conn,"SELECT * from favourites where user_id='{$_POST['user_id']}' and to_id='{$_POST['to_id']}' and like_type='{$_POST['like_type']}'");
        if(mysqli_num_rows($chk)>0){
        	//set status='{$_POST['status']}' 
          $query = mysqli_query($conn,"DELETE from favourites where user_id='{$_POST['user_id']}' and like_type='{$_POST['like_type']}' and to_id='{$_POST['to_id']}'");
          if($query){
            $data['result']=true;
            }else{
             $data['result']=false;
          }
        }else{
		$query = mysqli_query($conn,"INSERT INTO `favourites`(`user_id`, `to_id`, `like_type`, `status`) VALUES ('{$_POST['user_id']}', '{$_POST['to_id']}', '{$_POST['like_type']}', '{$_POST['status']}')");
		if($query){
			//$username = mysqli_fetch_array(mysqli_query($conn, "select username from users where id = '{$_POST['to_id']}'"))[0];
			//mysqli_query($conn, "INSERT INTO `activity`(`user_id`, `detail`, `to_id`, `type`) VALUES ('{$_POST['user_id']}', 'You {$_POST['status']} {$username}','{$_POST['to_id']}' ,'{$_POST['status']}')");
			//sendnotification($_POST['user_id'], "You {$_POST['status']} {$username}", $_POST['to_id'], $_POST['status']);
			$data['result']=true;
		}else{
			$data['result']=false;
		}
       }
    
	break;

	case 'activity_list':
	if($_POST['user_id']) {
		$query = mysqli_query($conn,"SELECT *, (select image from users where id = activity.to_id) as image FROM `activity` WHERE user_id = '{$_POST['user_id']}' order by id desc") or die(mysqli_error($conn));
		$a = array();
		$i = 0;
		while ($q = mysqli_fetch_assoc($query)) {
			$q['datetime'] = date("H:i", strtotime($q['timestamp']));
			$q['image'] = $profile_url.$q['image'];
 			$a[$i++] = $q;
		}
		$data['activity'] = $a;
		 $q['datetime'] = date("H:i", strtotime($q['timestamp']));

		if($query){
			$data['result']=true;
		}else{
			$data['result']=false;
		}
	} else {
		$data['result']=false;
	}
	break;

	case 'remove_favourite':
		$query = mysqli_query($conn,"DELETE FROM `favourites` where user_id = '{$_POST['user_id']}' and vendor_id = '{$_POST['vendor_id']}'");
		if($query){
			$data['result']=true;
		}else{
			$data['result']=false;
		}
	break;


	case 'check_favourite':
		$query = mysqli_query($conn,"SELECT * from `favourites` where user_id = '{$_POST['user_id']}' and to_id = '{$_POST['to_id']}'");
		if(mysqli_num_rows($query)>0){
			$data['fav']=true;
		}
		else{
			$data['fav']=false;
		}
	break;

	case 'dashboard':
		$data['result']=true;
		$user = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * from users WHERE id = '{$_POST['user_id']}'"));
		$data['profit']=$user['earning'];
		$data['balance']=$user['balance'];
		$data['active_orders']=0;
		$data['pending_orders']=0;
		$data['cancelled_orders']=0;
		$data['avg_price']=0;
		$data['new_customers']=50;
		$data['returning_customers']=50;
		$data['total_customers']=0;
		$data['app_total']=0;
		$data['app_canceled']=0;
	break;
 }
}
echo json_encode($data);
file_put_contents("test.txt", "********************************\n",FILE_APPEND);
//file_put_contents("test.txt", print_r($_POST, true),FILE_APPEND);
file_put_contents("test.txt", print_r($data, true),FILE_APPEND);
