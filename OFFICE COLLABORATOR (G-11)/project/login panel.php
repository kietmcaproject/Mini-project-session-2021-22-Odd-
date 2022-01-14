<!DOCTYPE html>
<html lang="en">
<head>
<title>OFFICE COLLABORATOR</title>
    <meta charset="UTF-8" content="shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="style.css">   
</head>
<body>
    
    <br><h2 style="font-size:25px;font-family:Verdana;margin-left: 34%;">OFFICE COLLABORATOR</h2>
    <br>
    <div class="login-form" style="margin:auto;">
        <h2>LOGIN PANEL</h2>
        <form method="POST">
            <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Email" name="AdminEmail">
            </div>
            <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="AdminPassword">
            </div>
            <button type="submit" name="signin">LOGIN</button>
        </form>
    </div>
</body>
</html>
<?php
    require("conn.php");
?>
<?php
if(isset($_POST['signin']))
{
    $query="SELECT * FROM `ocdb`.`admin` WHERE `adminEmail` ='$_POST[AdminEmail]' AND `adminPassword`='$_POST[AdminPassword]'";
 
    $result=mysqli_query($con,$query);
    
    //echo (mysqli_num_rows($result));
    if(mysqli_num_rows($result)==1)
    {
        session_start();
        $row=mysqli_fetch_assoc($result);
        $_SESSION['AdminLoginId']=$row['adminName'];
        header("location: Admin Panel.php");
        //echo "correct";
    }
    else
    {
        echo"<script>alert('Incorrect password');</script>";
        //echo "incorrect";
    }
}
if(isset($_POST['signin']))
{
    //$userStatus = "Active";
    $query="SELECT * FROM `ocdb`.`empdetail` WHERE `empEmail` ='$_POST[AdminEmail]' AND `empPwd`='$_POST[AdminPassword]' ";
    $result=mysqli_query($con,$query);

    // $row1=mysqli_fetch_assoc($result);
    // $empStatus = $row1['empStatus'];

    // //echo (mysqli_num_rows($result));
    // $cmpResult=strcmp($userStatus,$empStatus);
    // if($cmpResult==0){
       
    // }
    // else{
    //     echo"<script>alert('User is Not Active');</script>";
    // }
    if(mysqli_num_rows($result)==1)
    {
        session_start();
        $row=mysqli_fetch_assoc($result);
        $_SESSION['AdminLoginId']=$row['empEmail'];
        header("location: Employee Dashboard.php");
        //echo "correct";
    }
    else
    {
        echo"<script>alert('Incorrect password');</script>";
        //echo "incorrect";
    }
}

?>