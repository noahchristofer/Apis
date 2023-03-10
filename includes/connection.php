<?php
include 'admin/includes/config.php';
include 'lib/ImageResize.php';
use \Gumlet\ImageResize;
 $conn=mysqli_connect($hostname, $username, $password, $db_name);
 

   function base64_to_jpeg($base64_string, $output_file) {
        $ifp = fopen( $output_file, 'wb' ); 
        $data = explode( ',', $base64_string );
        fwrite( $ifp, base64_decode( $data[ 1 ] ) );
        fclose( $ifp ); 
        return $output_file; 
    }
	function image_resize_str($image, $newwidth, $type, $id)
	{
	    $im = "tmp.png";
        base64_to_jpeg($image, $im);
		$image = new ImageResize($image);
        $image->quality_jpg = 90;
        $image->resizeToWidth($newwidth, $allow_enlarge = True);
        $name = $type.'_'.$id.'.jpg';
		$image->save('images/'.$name);
		return $name;
	}

function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}
		function image_resize_str1($image, $newwidth, $type, $id)
	{
	    $im = "tmp.png";
        base64_to_jpeg($image, $im);
		$image = new ImageResize($image);
        $image->quality_jpg = 90;
        $image->resizeToWidth($newwidth, $allow_enlarge = True);
        $name = $type.'_'.$id.'.jpg';
		$image->save('../glemtech/uploads/user_image/'.$name);
		return $name;
	}
	
	function sendEmail($mailTo, $mailSubject, $mailMessage)
  {
     $mailFrom = 'danishgoheer17@hotmail.com';
    $mailHeaders = "From: {$mailFrom}\r\n";
    $mailHeaders .= "Reply-To: {$mailFrom}\r\n";
    $mailHeaders .= "X-Mailer: PHP/".phpversion()."\r\n";
    $mailHeaders .= "MIME-Version: 1.0\r\n";
    $mailHeaders .= "Content-Type: text/html; charset=utf-8\r\n";
    $mailHeaders .= "Content-Transfer-Encoding: 8bit\r\n"; 
    $mailParams = "-f" . $mailFrom; 
    return @mail($mailTo, $mailSubject, $mailMessage, $mailHeaders, $mailParams);   
  }
  function obfuscate_card($email)
  {
	 $prop=2;
  $domain = substr(strrchr($email, "@"), 1);
  $mailname=str_replace($domain,'',$email);
  $name_l=strlen($mailname);
  $domain_l=strlen($domain);
  for($i=0;$i<=$name_l/$prop-1;$i++)
  {
  $start.='x';
  }

  for($i=0;$i<=$domain_l/$prop-1;$i++)
  {
  $end.='x';
  }

return substr_replace($mailname, $start, 2, $name_l/$prop).substr_replace($domain, $end, 2, $domain_l/$prop);   
  }
function sendRequest($to, $message)
	{
		global $conn;
		$title = "Contribution Reminder";
	    $url = 'https://fcm.googleapis.com/fcm/send';
		$getDevices = mysqli_query($conn, "select * from bc_devices where user_id='{$to}'") or die(mysqli_error($conn));
		if($getDevices && mysqli_num_rows($getDevices)>0)
		{
		    $dev = mysqli_fetch_assoc($getDevices);
		    $dev_token = $dev['deviceRID'];
		  //  $deviceRIDArr = array();
		  //  while($dev = mysqli_fetch_assoc($getDevices)) {
		  //      $deviceRIDArr[] = $dev['deviceRID'];
		  //  }
			
			if(!empty($dev_token))
			{
    
    define( 'API_ACCESS_KEY', 'AAAA7kDSqnk:APA91bH4M_fCD3IuWPcB8e6md4DleHaUfD_4ZFEkzWRNZkk0aSjthkelGVg4TIZUKbTzC-IGVQcGTK-wSCcXanr_8qz3vjWASTWZwXXaBZVL5dRGILta3KQZvzq_2LLHd17nHeHV7fY3');

     $msg = array
          (
		'body' 	=> $title,
		'title'	=> $message,
             	
          );
	$fields = array
			(
				'to'=> $dev_token,
				'notification'	=> $msg
			);
	
	$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json'
			);
#Send Reponse To FireBase Server	
		$ch = curl_init();
		curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
		curl_setopt( $ch,CURLOPT_POST, true );
		curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
		curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
		curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
		$result = curl_exec($ch );
	    return $result;
		curl_close( $ch );
	}}}
function sendsms($to, $code,$hash) {
	$username = "AC07b84614f43547374a9fa9876f087419";
	$password = "49730861867f43d0663da880581e5528";
	$from = "+14056890353";
	$message = urlencode("Your Elamor verification code is {$code}\n{$hash}");
	$ch = curl_init("https://api.twilio.com/2010-04-01/Accounts/{$username}/Messages.json");
	curl_setopt($ch, CURLOPT_USERPWD, $username . ":" . $password);
	curl_setopt($ch, CURLOPT_TIMEOUT, 30);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, "Body={$message}&From={$from}&To={$to}");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	$return = curl_exec($ch);
	curl_close($ch);
	return $return;
}
?>