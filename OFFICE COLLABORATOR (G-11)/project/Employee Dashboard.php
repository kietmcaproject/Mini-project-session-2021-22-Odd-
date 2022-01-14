
<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
    header("Location: login panel.php");
}
?>
<?php 

require_once("conn.php");
$query = " select * from empdetail INNER JOIN projectdetails ON empdetail.empId = projectdetails.empId where empEmail='".$_SESSION['AdminLoginId']."' ";
$result = mysqli_query($con,$query);

$query2 = "select empName from empdetail where empEmail='".$_SESSION['AdminLoginId']."' ";
$result2 = mysqli_query($con,$query2);
$row1=mysqli_fetch_assoc($result2);
$empName = $row1['empName'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  
    <style>
        body {
            margin: 0px;
        }
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
        div.div.but{
            align-items: center;
            margin-left: 25%;
            padding:150px;
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
</head>
<body>
    <div class="header">
        <h1 style="font-size:32px;">Employee Panel - <?php echo $empName?></h1>
        <form method="POST" action="empview.php">
            <button name="view" ><i class="fas fa-user-plus"></i> VIEW COMPANIANS</button>
        </form>
        <form method="POST" action="companiansearch.php">
            <button name="update" ><i class="fas fa-search"></i> SEARCH</button>
        </form>
        <form method="POST">
            <button name="logout">LOGOUT</button>
        </form>
        
    </div>
    <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                    <table class="table table-bordered">
                            <tr style="background-color:lightgreen;border: 2px solid black;">
                                <th> EmpId </th>
                                <th> Employee Name </th>
                                <th> Email </th>
                                <th> Designation </th>
                                <th> Address </th>
                                <th> Phone No </th>
                                <th> Skills </th>
                                <th> Date of Reg </th>                       
                                
                            </tr>
                            <?php 
                                    while($row=mysqli_fetch_assoc($result))
                                    {
                                        $userId = $row['empId'];
                                        $userName = $row['empName'];
                                        $userEmail = $row['empEmail'];
                                        $userDesg = $row['empDesg'];
                                        $userAddress = $row['empAddress'];
                                        $userPhone = $row['empPhone'];
                                        $userSkills = $row['empSkills'];
                                        $userDoj = $row['dateOfReg'];
                                        $userStatus = $row['empStatus'];
                                        $userPmanager= $row['projectManager'];
                                        $allocatedProject = $row['allocatedProject'];
                                        $projectStartDate = $row['projectStartDate'];
                                        $projectEndDate = $row['projectEndDate'];
                                        $projectStatus = $row['projectStatus'];
                                        $projectOutcome = $row['projectOutcome'];
                            ?>
                                    <tr>
                                        <td><?php echo $userId ?></td>
                                        <td><?php echo $userName ?></td>
                                        <td><?php echo $userEmail ?></td>
                                        <td><?php echo $userDesg ?></td>
                                        <td><?php echo $userAddress ?></td>
                                        <td><?php echo $userPhone ?></td>
                                        <td><?php echo $userSkills ?></td>
                                        <td><?php echo $userDoj ?></td>
                                    </tr>
                                    <tr style="background-color:lightgreen;border: 2px solid black;">
                                        <th> Project Manager </th>
                                        <th> Allocated Project </th>
                                        <th> Project Start Date </th>
                                        <th> Project End Date </th>
                                        <th> Project Status </th>
                                        <th> Project Outcome </th>
                                        <th> Employee Status </th>
                                        <td> </td>
                                    </tr> 
                                    <tr>
                                        <td><?php echo $userPmanager ?></td>
                                        <td><?php echo $allocatedProject ?></td>
                                        <td><?php echo $projectStartDate ?></td>
                                        <td><?php echo $projectEndDate ?></td>
                                        <td><?php echo $projectStatus ?></td>
                                        <td><?php echo $projectOutcome ?></td>
                                        <td><?php echo $userStatus ?></td>
                                        <td><a href="empedit.php?GetEmail=<?php echo $userEmail ?>"><b>Update</b></a></td>
                                    </tr> 
                            <?php 
                                }  
                            ?> 
                            </table>
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
<?php
    