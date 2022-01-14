<?php 

    require_once("conn.php");
    $query = " select * from employee ";
    $result = mysqli_query($con,$query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" a href="CSS/bootstrap.css"/>
    <title>Records in Database</title>
</head>
<body class="bg-white">

        <div class="container">
            <div class="row">
                <div class="col m-auto">
                    <div class="card mt-5">
                        <table class="table table-bordered">
                            <tr bgcolor="lightgreen">
                                <td> Employee Name </td>
                                <td> Email </td>
                                <td> Designation </td>
                                <td> Manager </td>
                                <td> Project Allocated </td>
                                <td>  </td>
                                <td>  </td>
                            </tr>

                            <?php 
                                    
                                    while($row=mysqli_fetch_assoc($result))
                                    {
                                        $userName = $row['name'];
                                        $userEmail = $row['email'];
                                        $userDesg = $row['desg'];
                                        $userManager = $row['manager'];
                                        $userAllocated = $row['allocated'];
                            ?>
                                    <tr>
                                        <td><?php echo $userName ?></td>
                                        <td><?php echo $userEmail ?></td>
                                        <td><?php echo $userDesg ?></td>
                                        <td><?php echo $userManager ?></td>
                                        <td><?php echo $userAllocated ?></td>
                                        <td><a href="edit.php?GetEmail=<?php echo $userEmail ?>">Update</a></td>
                                        
                                        <td><a href="delete.php?Del=<?php echo $userEmail ?>">Delete</a></td>
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
        <form method="POST" action="Admin Panel.php">
            <div style="margin-left: 47%;" >   
                <button name="back" style="background-color:#0d6efd;border-radius:10px;padding: 0.375rem 0.75rem;font-weight:500;color:white;">BACK</button>
            </div>    
        </form>
    
</body>
</html>