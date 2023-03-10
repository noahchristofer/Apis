<?php include('includes/config.php');

if(isset($_SESSION['admin_login'])) {
header("Location: login.php");
}

if(isset($_POST['submit'])) {
$user = trim($_POST['username']);
$pass = trim($_POST['password']);
$query = sprintf("SELECT * FROM admin WHERE username='%s' AND password='%s'",
mysql_real_escape_string($user),
mysql_real_escape_string($pass));
$login = mysql_query($query);
$num = mysql_num_rows($login);
if($num > 0) {
$_SESSION['admin_login'] = mysql_result($login,0,"id");
$_SESSION['role'] = mysql_result($login,0, "user_role");
header("Location: index.php");
} else {
$message = 1;
}
}

if ((isset($_GET['logout'])) &&($_GET['logout']=="true")){

$_SESSION['admin_login'] = NULL;
unset($_SESSION['admin_login']);
session_destroy();
$message = 0;
}
?>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <div class="text-center mb-3">
                                        <a href="index.php"><img src="images/icon.png" style=" width: 50%; " alt=""></a>
                                    </div>
                                    <h4 class="text-center mb-4 text-white">Sign in your account</h4>
                                    <form action="login.php" role="form" method="post">
                                        <?php if (isset($message)) {
                                            if($message == 0) {
                                            echo "<p><span class=\"btn btn-success\" style=\"cursor:default;\">You have Successfully Logged Out!</span> </p>";
                                            } elseif($message == 1) {
                                            echo "<p><span class=\"btn btn-danger\" style=\"cursor:default;\">Credentials Does not Match!</span> </p>";
                                            }} ?>
                                        <div class="form-group">
                                            <label class="mb-1 text-white"><strong>Username</strong></label>
                                            <input type="text" class="form-control" name="username">
                                        </div>
                                        <div class="form-group">
                                            <label class="mb-1 text-white"><strong>Password</strong></label>
                                            <input type="password" class="form-control" name="password">
                                        </div>
                                         
                                        <div class="text-center">
                                            <button type="submit" class="btn bg-white text-primary btn-block" name="submit">Sign Me In</button>
                                        </div>
                                    </form>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/deznav-init.js"></script>

</body>

</html>