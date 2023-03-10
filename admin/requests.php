<?php include('includes/config.php');

if(!isset($_SESSION['admin_login'])) {

header("Location: login.php");

}

if(isset($_POST['submit_x'])) {

if(isset($_POST['action'])) {

if($_POST['action'] == 'delete') {

$dquery = "delete from requests where id = {$_POST['id']}";

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

if(mysql_query("UPDATE requests SET detail='{$_POST['detail']}', budget = '{$_POST['budget']}',status = '{$_POST['status']}' WHERE id='{$_POST['id']}'")) {

$msg = 0;

} else {

$msg = 1;

}

} 

}


 $q = mysql_query("select * from requests");


include('includes/header.php');        

include('includes/nav.php'); ?>         



   <!--**********************************

            Content body start

        ***********************************-->

        <div class="content-body">

            <div class="container-fluid">

                <div class="page-titles">

                    <h4>Request</h4>

                    <ol class="breadcrumb">

                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>

                        <li class="breadcrumb-item active"><a href="requests.php"> Request</a></li>

                    </ol>

                </div>



                <?php

        

                 if(isset($_GET['action']) && $_GET['action'] == 'edit') {

                  $b = mysql_query("select * from requests where id = {$_GET['id']}");

                    if(true) {

                      ?>

                <!-- row -->

                <div class="row">

                    <div class="col-xl-12 col-lg-12">

                        <div class="card">

                            <div class="card-header">

                                <h4 class="card-title">Input Data Here</h4>

                            </div>

                            <div class="card-body">

                                <div class="basic-form">

                                    <form method="post" action="requests.php">
                                               
                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="Detail" name="detail" value="<?php echo mysql_result($b,0,"detail") ?>">

                                        </div>
                                       
                                        <div class="form-group">

                                            <input type="number" class="form-control input-rounded" placeholder="Budget" name="budget" value="<?php echo mysql_result($b,0,"budget") ?>">

                                        </div>
                                        <div class="form-group">

                                            <input type="text" class="form-control input-rounded" placeholder="status" name="status" value="<?php echo mysql_result($b,0,"status") ?>">

                                        </div>
                                       
                                        <div class="form-group">

                                            <input type="hidden" name="action" value="update" /><input type="hidden" name="id" value="<?php echo mysql_result($b,0,"id") ?>" />

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

                                <h4 class="card-title">Request talent Table</h4>

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

                                                <th> Details </th>

                                                <th> Delivery Time</th>

                                                <th> Budget</th>

                                                <th> Order Id</th>

                                                <th> Status</th>

                                                <th> Timestamp</th>
                                               
                                                <th>Action</th>

                                            </tr>

                                        </thead>

                                        <tbody>

                                            <?php           

                                         while($query = mysql_fetch_assoc($q)) {

                                      ?>

                                            <tr>

                                                <td><?php echo $query['id'] ?></td>

                                                <td><?php echo $query['detail'] ?></td>

                                                <td><?php echo $query['delivery_time'] ?></td>

                                                <td><?php echo $query['budget'] ?></td>

                                                <td><?php echo $query['order_id'] ?></td>

                                                <td><?php echo $query['status'] ?></td>

                                                <td><?php echo $query['timestamp'] ?></td>

                                                <td>

                                                    <div class="d-flex">

                                                        <a href="requests.php?action=edit&id=<?php echo $query['id'] ?>" class="btn btn-primary shadow btn-xs sharp mr-1"><i class="fa fa-pencil"></i></a>

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