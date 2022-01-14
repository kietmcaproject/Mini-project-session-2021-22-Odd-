<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
     header("Location: login panel.php");
    
}
?>
<?php 

    require_once("conn.php");
    $userEmail = $_GET['GetEmail'];
    $query = " select * from empdetail where empEmail='".$userEmail."' ";

    $result = mysqli_query($con,$query);

    while($row=mysqli_fetch_assoc($result))
    {
        $userName = $row['empName'];
        $userPwd = $row['empPwd'];
        $userAddress = $row['empAddress'];
        $userPhone = $row['empPhone'];
        $userSkills = $row['empSkills'];
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
        body {
            margin: 0px;
        }
        div.header{
            display:flex;
            font-family:poppins;
            justify-content:space-between;
            align-items:center;
            padding: 15px 60px;
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
        div.div.but{
            align-items: center;
            margin-left: 25%;
            padding:250px;
        }
        div.but button{
            
            padding:30px;
            align-items: center;
            width:150px;
            height:50px;
            border: 2px solid black;
            border-radius: 5px;
            background-color: #ff6d6d;
            /* font-size: 16px;
            font-weight: 550;
            padding: 8px 12px;
            border: 2px solid black;
            border-radius: 5px; */
            
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Employee Updation Form</title>
</head>
<body class="bg-white">
<div class="header">
    <script>
        console.log($result);
    </script>
        <h1 style="font-size:32px;">Employee :  <?php echo $userName?></h1>
        <!-- logout button -->
        <form method="POST" action="login panel.php">
            <button name="logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</button>
        </form>
    </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-6 m-auto">
                    <div class="card mt-5">
                        <div class="card-title">
                            <h3 class="bg-secondary text-white text-center py-3"> Update Employee Details Here </h3>
                        </div>
                        <div class="card-body">
                            <!-- Fields which employee can edit -->
                            <form action="empupdate.php?GetID=<?php echo $userEmail ?>" method="post">
                                <label style="padding: 10px;font-size: 20px;font-weight: 600;">Password</label>
                                <input type="password" class="form-control mb-2" name="password" value="<?php echo $userPwd ?>">
                                <label style="padding: 10px;font-size: 20px;font-weight: 600;">Address</label>
                                <input type="text" class="form-control mb-2" name="address" value="<?php echo $userAddress ?>">
                                <label style="padding: 10px;font-size: 20px;font-weight: 600;">Phone No</label>
                                <input type="text" class="form-control mb-2" name="phoneno" value="<?php echo $userPhone ?>">
                                <label style="padding: 10px;font-size: 20px;font-weight: 600;">Skills</label> 
                                <input type="text" class="form-control mb-2" name="skills" value="<?php echo $userSkills ?>">                          
                                <button class="btn btn-primary" name="update">Update</button>
                                <button class="btn btn-primary" name="back">BACK</button>
                                
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php
    if(isset($_POST['logout']))
    {
        session_destroy();
        echo"<script>window.location.href=window.location.origin+'/project/login%20panel.php';</script>";
    }
    ?>
    
</body>
</html>