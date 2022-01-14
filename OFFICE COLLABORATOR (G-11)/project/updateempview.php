
<?php 

    require_once("conn.php");
    $query = " select * from employee where email='".$_POST['AdminLoginId']."' ";
    $result = mysqli_query($con,$query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Update Personal Details</title>
</head>
<body class="bg-dark">

        <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                        <table class="table table-bordered">
                            <tr bgcolor="lightgreen">
                                <td> Password </td>
                                <td> PhoneNo </td>
                                <td> Address </td>
                                <td> Skills </td>
                                <td>   </td>
                            </tr>

                            <?php 
                                    
                                    while($row=mysqli_fetch_assoc($result))
                                    {
                                        $userEmail = $row['email'];
                                        $userPassword = $row['password'];
                                        $userPhoneNo = $row['phoneno'];
                                        $userAddress = $row['address'];
                                        $userSkills = $row['skills'];
                            ?>
                                    <tr>
                                        <td><?php echo $userPassword ?></td>
                                        <td><?php echo $userPhoneNo ?></td>
                                        <td><?php echo $userAddress ?></td>
                                        <td><?php echo $userSkills ?></td>
                                        <td><a href='empedit.php?GetEmpEmail=<?php echo $userEmail ?>&
                                        epw=<?php echo $userPassword ?>&
                                        epno=<?php echo $userPhoneNo ?>&
                                        ea=<?php echo $userAddress ?>&
                                        es=<?php echo $userSkills ?>'>UPDATE</a></td>
                                        
                                        
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