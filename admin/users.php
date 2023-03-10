<?php include('includes/config.php');

if(!isset($_SESSION['admin_login'])) {

header("Location: login.php");

}

if(isset($_POST['submit_x'])) {

if(isset($_POST['action'])) {

if($_POST['action'] == 'delete') {

$dquery = "delete from users where id = {$_POST['id']}";

if(mysql_query($dquery)) {

$message = 0;

} else {

$message = 1;

}

}

}

}

if(isset($_POST['submit'])) {

if($_POST['action'] == 'update') {

if(mysql_query("UPDATE users SET username = '{$_POST['username']}',email = '{$_POST['email']}',city = '{$_POST['city']}',user_type = '{$_POST['user_type']}'  WHERE id='{$_POST['id']}'")) {

$msg = 0;

} else {

$msg = 1;

}

} 

}

$q = mysql_query("select * from users");


include('includes/header.php');        

include('includes/nav.php');

?>

<div class="content-body">

<div class="container-fluid">

<div class="page-titles">

<h4>Users</h4>

<ol class="breadcrumb">

<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>

<li class="breadcrumb-item active"><a href="users.php">Users</a></li>

</ol>

    </div>
               <?php

                 if(isset($_GET['action']) && $_GET['action'] == 'edit') {

                  $b = mysql_query("select * from users where id = {$_GET['id']}");

                    if(true) {
                      ?>

                <!-- row -->

                <div class="row">


                    <div class="col-xl-12 col-lg-12">

                        <div class="card">

                            <div class="card-header">

                                <h4 class="card-title">Update Data Here</h4>

                            </div>

                            <div class="card-body">

                                <div class="basic-form">

                                    <form method="post" action="users.php">

                                        <div class="form-group">

                                        <input type="text" class="form-control input-rounded" placeholder="Username" name="username" value="<?php echo mysql_result($b,0,"username") ?>">

                                        </div>

                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="Email" name="email" value="<?php echo mysql_result($b,0,"email") ?>">

                                        </div>

                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="City" name="city" value="<?php echo mysql_result($b,0,"city") ?>">

                                        </div>

                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="User Type" name="user_type" value="<?php echo mysql_result($b,0,"user_type") ?>">

                                        </div>
                                       
                                        <div class="form-group">

                                            <input type="hidden" name="action" value="update" /><input type="hidden" name="id"value="<?php echo mysql_result($b,0,"id") ?>"/>

                                            <button type="submit" class="btn btn-primary" name="submit">Update</button>

                                        </div>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                 
                 <?php

                }} else {

                ?>     
                  
				<!-- row -->

                <div class="row">

                	<div class="col-12">

                        <div class="card">

                            <div class="card-header">

                                <h4 class="card-title">Talent Table</h4>

                            </div>

                            <div class="card-body">
                              
                                        <?php if (isset($msg)) {

                                            if($msg == 0) {

                                            echo '<div class="alert alert-success solid alert-right-icon alert-dismissible fade show">

                                         <span><i class="mdi mdi-check"></i></span>

                                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span>

                                        </button><strong>Well done!</strong> Successfully Perform the Operation!

                                         </div>';

                                            } elseif($msg == 1) {

                                            echo '<div class="alert alert-danger solid alert-right-icon alert-dismissible fade show">

                                    <span><i class="mdi mdi-help"></i></span>

                                    <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span>

                                    </button><strong>Oh snap!</strong> Error. Try Again! 

                                          </div>';

                                            }} 

                                            if (isset($message)) {

                                         if($message == 0) {

                                          echo '<div class="alert alert-success solid alert-right-icon alert-dismissible fade show">

                                         <span><i class="mdi mdi-check"></i></span>

                                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close">

                                        <span><i class="mdi mdi-close"></i></span>

                                        </button><strong>Well done!</strong> Deleted Successfully

                                         </div>';

                                           } elseif($message == 1) {

                                             echo '<div class="alert alert-danger solid alert-right-icon alert-dismissible fade show">

                                    <span><i class="mdi mdi-help"></i></span>

                                    <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span>

                                    </button><strong>Oh snap!</strong> Error In Deleting Record. Try Again! 

                                          </div>';

                                                 }}

                                            ?>
                                <div class="table-responsive">
                                  
                                    <table id="example3" class="display min-w850">

                                        <thead>

                                            <tr>

                                                <th>#</th>

                                                <th>User Name</th>

                                                <th>Email</th>

                                                <th>city</th>

                                                <th>User Type</th>

                                            </tr>

                                        </thead>

                                        <tbody>
                                        	<?php           
                                           $q = mysql_query("select * from users where user_type='0'");
                                         while($query = mysql_fetch_assoc($q)) {

                                      ?>
                                            <tr>
                                                <td><?php echo $query['id'] ?></td>

                                                <td><?php echo $query['username'] ?></td>

                                                <td><?php echo $query['email'] ?></td>

                                                <td><?php echo $query['city'] ?></td>

                                                <td><?php if($query['user_type'] == "0") {echo "user";} ?></td> 
                                               <td>
                                                <div class="d-flex">

                                                    <a href="users.php?action=edit&id=<?php echo $query['id'] ?>" class="btn btn-primary shadow btn-xs sharp mr-1"><i class="fa fa-pencil"></i></a>

                                                    <form method="post" onsubmit="return confirm('Do you really want to Delete?');" style="float:left"><input type="hidden" value="delete" name="action" /><input type="hidden" name="id" value="<?php echo $query['id'] ?>" /><button type="submit" class="btn btn-danger shadow btn-xs sharp" name="submit_x" /><i class="fa fa-trash"></i></button> </form>

                                                    </div>

                                                </td>

                                            </tr>

                                            <?php

                                              }

                                           ?>

                                        </tbody>

                                    </table>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>	

            </div>

        </div>

        <!--**********************************

            Content body end

        ***********************************-->
 <?php } ?>


<?php  include('includes/footer.php'); ?>  