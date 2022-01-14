<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
    header("Location: login panel.php");
}
?>
<?php 

    require_once("conn.php");
    $query1="select empId,empName from empdetail where empEmail='".$_SESSION['AdminLoginId']."' ";
    $result1 = mysqli_query($con,$query1);
    $row1=mysqli_fetch_assoc($result1);
    $userId = $row1['empId'];
    $empName = $row1['empName'];

    $query2 ="select allocatedProject from projectdetails where empId='".$userId."' ";
    $result2 = mysqli_query($con,$query2);
    $row2=mysqli_fetch_assoc($result2);
    $allocatedProject = $row2['allocatedProject'];


    $query = " select * from empdetail INNER JOIN projectdetails ON empdetail.empId = projectdetails.empId where allocatedProject='".$allocatedProject."' ";
    $result = mysqli_query($con,$query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
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
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Employee Companians</title>
</head>
<body class="bg-white">
<div class="header">
        <h1 style="font-size:32px;">Employee -<?php echo $empName?></h1>
        <form method="POST" action="Employee Dashboard.php">
            <button name="update" style="margin-left:450px;"><i class="fas fa-backward"></i> BACK</button>
        </form>
        <form method="POST" action="login panel.php">
            <button name="logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</button>
        </form>
        
    </div>
    <h1 style="font-size:30px;margin-top: 7px;text-align: center;
        margin-bottom: -29px;"><u>My Project Companians</u></h1></br></br>
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
                                        $projectManager = $row['projectManager'];
                                        $allocatedProject = $row['allocatedProject'];
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