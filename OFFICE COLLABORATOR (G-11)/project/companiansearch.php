<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
     header("Location: login panel.php");
}
?>
<?php 
error_reporting(0);
require_once("conn.php");
    $query2 = "select empName from empdetail where empEmail='".$_SESSION['AdminLoginId']."' ";
    $result2 = mysqli_query($con,$query2);
    $row1=mysqli_fetch_assoc($result2);
    $empName = $row1['empName'];
if(isset($_POST['search']))
{
    
    $str=mysqli_real_escape_string($con,$_POST['str']);
    $sql="select * from empdetail where empEmail='$str' OR empPhone='$str' OR empId='$str' OR empStatus='$str' ";
    $result2 = mysqli_query($con,$sql);
    $row1=mysqli_fetch_assoc($result2);
    $empId = $row1['empId'];

    $sql2 = "select projectManager,allocatedProject from projectdetails where empId='$empId' ";
    $result3 = mysqli_query($con,$sql2);
    $row2=mysqli_fetch_assoc($result3);
    $projectManager = $row2['projectManager'];
    $allocatedProject = $row2['allocatedProject'];
    
    $result=mysqli_query($con,$sql);
   
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
            padding: 15px 60px;
            background-color: darkseagreen;
        }
        div.header button{
            background-color: revert;
            font-size: 16px;
            font-weight: 550;
            padding: 14px 19px;
            border: 2px solid black;
            border-radius: 5px;
        }
    </style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Search</title>
</head>
<body>
    <div class="header">
        <h1 style="font-size:32px;">Employee -<?php echo $empName?></h1>
        <form method="POST" action="Employee Dashboard.php">
            <button name="update" style="margin-left:450px;"><i class="fas fa-backward"></i> BACK</button>
        </form>
            <form method="POST" action="login panel.php">
            <button name="logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</button>
        </form>
    </div>
    <h2 style="font-size: 1.5rem;text-align: center;">Search Companians by their Details</h2>
    <form method="POST">
    <div class="srch" style="text-align: center;">
        <label style="padding: 10px;font-size: 20px;font-weight: 600;">Search by - </label>
        <select name="str1" id="pstatus">
            <option value="empEmail">Email</option>
            <option value="empId">Employee ID</option>
            <option value="empPhone">Phone No</option>
            <!-- <option value="empPhone">Project Name</option> -->
        </select>
        <b> : </b><input type="textbox" name="str" required/>
        <input type="submit" name="search" value="SEARCH"/>
    </div>
    </form>
    <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                        <table class="table table-bordered">
                            <tr style="background-color:lightgreen;border: 2px solid black;">
                                <th> EmpId </th>
                                <th> Employee Name </th>
                                <th> Email </th>
                                <th> Address </th>
                                <th> Phone </th>
                                <th> Skills </th>
                                <th> Designation </th>
                                <th> Project Manager </th>
                                <th> Project Allocated </th>
                                
                            </tr>

                            <?php 
                                    
                                    while($row=mysqli_fetch_assoc($result) )
                                    {
                                        $userId = $row['empId'];
                                        $userName = $row['empName'];
                                        $userEmail = $row['empEmail'];
                                        $userAddress = $row['empAddress'];
                                        $userPhone = $row['empPhone'];
                                        $userSkills = $row['empSkills'];
                                        $userDesg = $row['empDesg'];
                                        // $projectManager = $row['projectManager'];
                                        // $projectAllocated = $row['projectAllocated'];
                            ?>
                                    <tr>
                                        <td><?php echo $userId ?></td>
                                        <td><?php echo $userName ?></td>
                                        <td><?php echo $userEmail ?></td>
                                        <td><?php echo $userAddress ?></td>
                                        <td><?php echo $userPhone ?></td>
                                        <td><?php echo $userSkills ?></td>
                                        <td><?php echo $userDesg ?></td>
                                        <td><?php echo $projectManager ?></td>
                                        <td><?php echo $allocatedProject ?></td>
                                                                              
                                    </tr>
                                            
                            <?php 
                                    }  
                            ?>                                                                    
                                   

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- <form action="Admin Panel.php" >
        <div style="    margin-left: 50%;
    margin-top: 2%;"><button class="btn btn-primary" name="back">BACK</button></div>
                                </form>         -->
   
</body>
</html>
<?php
    if(isset($_POST['logout']))
    {
        session_destroy();
        echo"<script>window.location.href=window.location.origin+'/project/login%20panel.php';</script>";
       // header("Location:login panel.php");
    }
?>
