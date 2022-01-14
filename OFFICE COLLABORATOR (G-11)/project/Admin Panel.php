<?php
session_start();
if(!isset($_SESSION['AdminLoginId']))
{
     header("Location: login panel.php");
    
}
?>
<?php 

require_once("conn.php");
$query = " select * from `ocdb`.`empdetail` ";
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
        <form method="POST" action="empregform.php">
            <button name="update" style="margin-left:400px;" ><i class="fas fa-user-edit"></i> ADD</button>
        </form>
        <form method="POST" action="adminsearch.php">
            <button name="update" ><i class="fas fa-search"></i> SEARCH</button>
        </form>
        <form method="POST" >
            <button name="logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</button>
        </form>
    </div>
    <div>
        <h2 style="font-size:22px;margin-top: 7px;text-align: center;
        margin-bottom: -29px;"><u>All Employee Details</u></h2>
    </div>
    
    <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                        <table class="table table-bordered">
                            <tr style="background-color:lightgreen;border: 2px solid black;">
                                <td> EmpId </td>
                                <td> Employee Name </td>
                                <td> Email </td>
                                <td> Designation </td>
                                <!-- <td> Address </td> -->
                                <td> Phone No </td>
                                <td> Employee Status </td>
                                <td>  </td>
                            </tr>

                            <?php 
                                    // display number total employees
                                    while($row=mysqli_fetch_assoc($result))
                                    {
                                        $userId = $row['empId'];
                                        $userName = $row['empName'];
                                        $userEmail = $row['empEmail'];
                                        $userDesg = $row['empDesg'];
                                        $empStatus = $row['empStatus'];
                                        $userPhone = $row['empPhone'];
                            ?>
                                    <tr>
                                        <td><?php echo $userId ?></td>
                                        <td><?php echo $userName ?></td>
                                        <td><?php echo $userEmail ?></td>
                                        <td><?php echo $userDesg ?></td>
                                        <!-- <td><?php echo $userAddress ?></td> -->
                                        <td><?php echo $userPhone ?></td>
                                        <td><?php echo $empStatus ?></td>
                                        <td><a href="empfulldetail.php?GetEmail=<?php echo $userEmail ?>">See details</a></td>
                                        
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