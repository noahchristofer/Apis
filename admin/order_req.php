<?php include('includes/config.php');

if(!isset($_SESSION['admin_login'])) {

header("Location: login.php");

}

include('includes/header.php');        

include('includes/nav.php');


?>

<div class="content-body">

<div class="container-fluid">

<div class="page-titles">

<h4>Order Request</h4>

<ol class="breadcrumb">

<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>

<li class="breadcrumb-item active"><a href="order_req.php">Order Request</a></li>

</ol>

    </div>

				<!-- row -->

                <div class="row">

                	<div class="col-12">

                        <div class="card">

                            <div class="card-header">

                                <h4 class="card-title">User Table</h4>

                            </div>

                            <div class="card-body">

                                <div class="table-responsive">

                                    <table id="example3" class="display min-w850">

                                        <thead>

                                            <tr>

                                                <th>#</th>

                                                <th>User Name</th>

                                                <th>Equipment Name</th>

                                                <th>Order Type</th>

                                                <th>Amount</th>

                                            </tr>

                                        </thead>

                                        <tbody>

                                        	<?php           
                                           $q = mysql_query("SELECT users.username, orders.id, equipments.name, orders.order_type,orders.amount FROM orders INNER JOIN users ON orders.user_id=users.id INNER JOIN equipments ON orders.equipment_id=equipments.id");
                                         while($query = mysql_fetch_assoc($q)) {

                                      ?>

                                            <tr>

                                                <td><?php echo $query['id'] ?></td>


                                                <td><?php echo $query['username'] ?></td>

                                                <td><?php echo $query['name'] ?></td>

                                                <td><?php echo $query['order_type'] ?></td>
												
                                                <td><?php echo $query['amount'] ?></td>
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







<?php  include('includes/footer.php'); ?>  