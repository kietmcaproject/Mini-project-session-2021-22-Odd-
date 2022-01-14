<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
     header("Location: login panel.php");
    
}
?>
<?php 

require_once("conn.php");
$userId = $_GET['GetID'];
$query2 = " select empName from `ocdb`.`empdetail` where empId='".$userId."' ";
$result2=mysqli_query($con,$query2);
$row=mysqli_fetch_assoc($result2);
$userName = $row['empName'];


$query = " select * from `ocdb`.`updatedetail` where empId='".$userId."' order by updateDate desc ";
$result = mysqli_query($con,$query);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN PANEL</title>
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
</head>
<body>
    <div class="header">
        <h1 style="font-size:32px;">Admin Dashboard - <?php echo $_SESSION['AdminLoginId']?></h1>
        <form method="POST" action="Admin Panel.php">
            <button style="margin-left:500px;background-color:#e9e9e9;" name="update" ><i class="fas fa-backward"></i> BACK</button>
        </form>
        <form method="POST" >
            <button name="logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</button>
        </form>
    </div>
    <div>
        <h1 style="font-size:30px;margin-top: 7px;text-align: center;
        margin-bottom: -29px;"><u>Previous Updated Details of Employee</u></h1></br></br>
        <h2 style="font-size:22px;margin-top: 7px;text-align: center;
        margin-bottom: -29px;"><u>Employee ID</u> : <?php echo $userId?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Employee Name</u> : <?php echo $userName?></h2>
    </div>
    
    <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                        <table class="table table-bordered">
                            <tr style="background-color:lightgreen;border: 2px solid black;">
                                <th> Employee Designation </th>
                                <th> Skills </th>
                                <th> Project Manager </th>
                          
                                <th> Allocated Project </th>
                                <th> Project Start Date </th>
                                <th> Project End Date </th>
                                <th> Project Status </th>
                                <th> Project Outcome </th>
                                <th> Employee Status </th>
                                <th> Update Date </th>
                                <th> Update BY </th>

                            </tr>

                            <?php 
                                    // display number total employees
                                    while($row=mysqli_fetch_assoc($result))
                                    {
                                        $userDesg = $row['empDesg'];
                                        $projectManager = $row['projectManager'];
                                        $skills=$row['empSkills'];
                                        $allocatedProject = $row['allocatedProject'];
                                        $projectStartDate = $row['projectStartDate'];
                                        $projectEndDate = $row['projectEndDate'];
                                        $projectStatus = $row['projectStatus'];
                                        $projectOutcome = $row['projectOutcome'];
                                        $empStatus = $row['empStatus'];
                                        $updateDate = $row['updateDate'];
                                        $updatedBy = $row['updatedBy'];
                            ?>
                                    <tr>
                                        <td><?php echo $userDesg ?></td>
                                        <td><?php echo $skills ?></td>
                                        <td><?php echo $projectManager ?></td>
                                       
                                        <td><?php echo $allocatedProject ?></td>
                                        <td><?php echo $projectStartDate ?></td>
                                        <td><?php echo $projectEndDate ?></td>
                                        <td><?php echo $projectStatus ?></td>
                                        <td><?php echo $projectOutcome ?></td>
                                        <td><?php echo $empStatus ?></td>
                                        <td><?php echo $updateDate ?></td>
                                        <td><?php echo $updatedBy ?></td>
                                        <!-- <td><a href="empfulldetail.php?GetEmail=<?php echo $userEmail ?>">See details</a></td> -->
                                        
                                        <!-- <td><a href="delete.php?Del=<?php echo $userEmail ?>">Delete</a></td> -->
                                    </tr>        
                            <?php 
                                    }  
                            ?>                                                                    
                                   

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <?php
    if(isset($_POST['logout']))
    {
        session_destroy();
        echo"<script>window.location.href=window.location.origin+'/project/login%20panel.php';</script>";
    }
    else if(isset($_POST['add']))
    {
     header("Location: empaddingquery.php");
    }
    ?>
    
</body>
</html>