<?php include('includes/config.php');
if(!isset($_SESSION['admin_login'])) {
header("Location: login.php");
}

 $q = mysql_query("select * from credit_card");

 

include('includes/header.php');        
include('includes/nav.php'); ?> 		

   <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="page-titles">
					<h4>Credit Card</h4>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active"><a href="credit_card.php">Card Details</a></li>
					</ol>
                </div>
    
                <!-- row -->
                
                <div class="row">
                	<div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Card Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example3" class="display min-w850">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Card Name</th>
                                                <th>Card No</th>
                                                <th>Expiry</th>
                                                <th>CVC</th>
                                                <th>Username</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<?php           
                                         while($query = mysql_fetch_assoc($q)) {
                                      ?>
                                            <tr>
                                                <td><?php echo $query['id'] ?></td>
                                                <td><?php echo $query['card_name'] ?></td>
                                                <td><?php echo $query['card_no'] ?></td>
                                                <td><?php echo $query['expiry'] ?></td>
                                                <td><?php echo $query['cvc'] ?></td>
                                                <td><?php echo mysql_result(mysql_query("select username from users where id = '{$query['user_id']}'"),0) ?></td>
                                               											
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