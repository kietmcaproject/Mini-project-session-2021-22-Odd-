<?php
require_once("conn.php");
if(isset($_GET['Del']))
{
    $userEmail = $_GET['Del'];
    $query = " delete from employee where email = '".$userEmail."'";
    $result = mysqli_query($con,$query);
    if($result)
    {
        header("location:Admin Panel.php");
    }
    else
    {
        echo ' Please Check Your Query ';
    }
}
?>