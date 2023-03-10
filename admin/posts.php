<?php include('includes/config.php');

if(!isset($_SESSION['admin_login'])) {

header("Location: login.php");

}

if(isset($_POST['submit_x'])) {

if(isset($_POST['action'])) {

if($_POST['action'] == 'delete') {

$dquery = "delete from posts where id = {$_POST['id']}";

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

if(mysql_query("UPDATE posts SET details = '{$_POST['details']}',location = '{$_POST['location']}'  WHERE id='{$_POST['id']}'")) {

$msg = 0;

} else {

$msg = 1;

}

} 

}

$q = mysql_query("select * from posts");

include('includes/header.php');        

include('includes/nav.php');


?>

<div class="content-body">

<div class="container-fluid">

    <div class="page-titles">

<h4>Weeks</h4>

<ol class="breadcrumb">

<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>

<li class="breadcrumb-item active"><a href="weeks.php">Weeks</a></li>

</ol>

    </div>     
                <?php

                 if(isset($_GET['action']) && $_GET['action'] == 'edit') {

                  $b = mysql_query("select * from posts where id = {$_GET['id']}");


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

                                    <form method="post" action="posts.php">

                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="Details" name="details" value="<?php echo mysql_result($b,0,"details") ?>">
                                        </div>

                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="location" name="location" value="<?php echo mysql_result($b,0,"location") ?>">

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

                                <h4 class="card-title">User Table</h4>

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

                                                <th>Name</th>

                                                <th>Details</th>

                                                <th>Location</th>

                                            </tr>

                                        </thead>

                                        <tbody>

                                    	<?php

                                        $q = mysql_query("SELECT posts.id, users.username, posts.details,posts.location FROM posts INNER JOIN users ON posts.user_id=users.id");
                                         while($query = mysql_fetch_assoc($q)) {

                                        ?>

                                            <tr>

                                                <td><?php echo $query['id'] ?></td>

                                                <td><?php echo $query['username'] ?></td>

                                                <td><?php echo $query['details'] ?></td>

                                                <td><?php echo $query['location'] ?></td>
												
                                                <td>
                                                    <div class="d-flex">
                                                        
                                                        <a href="posts.php?action=edit&id=<?php echo $query['id'] ?>" class="btn btn-primary shadow btn-xs sharp mr-1"><i class="fa fa-pencil"></i></a>

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