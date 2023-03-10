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

<h4>Dashboard</h4>

<ol class="breadcrumb">

<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>

<li class="breadcrumb-item active"><a href="index.php">Dashboard</a></li>

</ol>

    </div>
</div>
</div>
	<?php include('includes/footer.php');?>