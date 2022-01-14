<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
     header("Location: login panel.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
        div.header{
            display:flex;
            font-family:poppins;
            justify-content:space-between;
            align-items:center;
            padding: 18px 60px;
            background-color: darkseagreen;

        }
        div.header button{
            background-color: revert;
            font-size: 16px;
            font-weight: 550;
            padding: 14px 22px;
            border: 2px solid black;
            border-radius: 5px;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Employee Registration Form</title>
</head>
<body class="bg-white">
<div class="header">
        <h1 style="font-size:32px;">Admin Dashboard - <?php echo $_SESSION['AdminLoginId']?></h1>
        <!-- <form method="POST" action="empview.php">
            <button name="view" ><i class="fas fa-user-plus"></i> VIEW COMPANIANS</button>
        </form> -->
        <form method="POST" action="login panel.php">
            <button name="logout">LOGOUT</button>
        </form>
        
    </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-6 m-auto">
                    <div class="card mt-5">
                        <div class="card-title">
                            <h3 class="bg-secondary text-white text-center py-3">Employee Registration Form </h3>
                        </div>
                        <div class="card-body">

                            <form action="empaddingquery.php" method="post" name="myform">
                                <input type="text" class="form-control mb-2" placeholder=" Employee Name " name="name" required>
                                <input type="email" onblur="return validateemail();" class="form-control mb-2" placeholder=" Employee Email " name="email" required>
                                <input type="password" class="form-control mb-2" placeholder=" Password "id="myInput" name="password" required>
                                <input type="checkbox" onclick="myFunction()" style="margin-left:10px;margin-bottom:10px;"> Show Password
                                
                                <input type="text" class="form-control mb-2" placeholder=" Designation " name="desg" required>
                                <input type="text" class="form-control mb-2" placeholder=" Address " name="address" required>
                                <input type="text" onblur="return validatePhoneNo()" class="form-control mb-2" placeholder=" Phone No " name="phoneno" required><span id="numloc"></span>
                                <input type="text" class="form-control mb-2" placeholder=" Skills " name="skills" autocomplete="off" required>
                                <button class="btn btn-primary" onclick="return CheckPassword();" name="submit">Submit</button>
                                
                            </form>
                            <form action="Admin Panel.php" method="post">
                                <button style="margin-top: -67px;margin-left: 90px"
                                 class="btn btn-primary" name="back">Back</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
<script>  
function validatePhoneNo()
{  
    var num=document.myform.phoneno.value;  
    if (isNaN(num))
    {  
        alert("Phone No. must be numeric only");  
        return false;  
    }
    if(num.length>10 || num.length<10)
    {
        alert("Phone No. must be of 10 characters");
        return false;
    } 
    if(num.charAt(0)<='5'){
        alert("Phone no. must start with 6 and greater values");
        return false;
    }
}  
</script>
<script>  
function validateemail()  
{  
var x=document.myform.email.value;  
var atposition=x.indexOf("@");  
var dotposition=x.lastIndexOf(".");  
if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
  alert("Please enter a valid e-mail address");  
  return false;  
  }  
}  
</script> 
<script>
function CheckPassword() 
{ 
    var text=document.myform.password.value;
    if(text.length<8 ||text.length>15) 
    { 
        alert("Password length must be of 8 to 15 char long");  
        return false;
    }
    //console.log(text);
    // var capCount=0,lowCount=0,speCount=0,numCount=0,speCountType2=0;
    // if(text.lenght>8 && text.length<15)
    // {
    //  for(var i=0;i<text.length;i++)
    //  {console.log(text.charAt(i));
    //      if(text.chatAt(i)>64 && text.chatAt(i)<91)
    //      {capCount=1;}
    //      else if(text.chatAt(i)>96 && text.chatAt(i)<123)
    //      {lowCount=1;}
    //      else if(text.chatAt(i)>32 && text.chatAt(i)<48)
    //      {speCount=1;}
    //      else if(text.chatAt(i)>57 && text.chatAt(i)<65)
    //      {speCountType2=1;}
    //      else if(text.chatAt(i)>47 && text.chatAt(i)<58)
    //      {numCount=1;}
    //  }
    //  if(speCountType2==0  || speCount=0)
    //  { alert("password must contain a special character");
    //      return false;
    //  }
    //  if(capCount==0 && lowCount==0 )
    //  {
    //     alert("password must contain a upper case and a lower case character");
    //      return false;
    //  }
    //  if(numCount==0)
    //  {
    //     alert("password must contain a number");
    //      return false;
    //  }
    // }
    // else{
    //     alert("password length must be 8 t0 15 character long");
    //     return false;
    // }
} 
</script>
</body>
</html>
<?php
    if(isset($_POST['logout']))
    {
        session_destroy();
        echo"<script>window.location.href=window.location.origin+'/project/login%20panel.php';</script>";
    }
?>