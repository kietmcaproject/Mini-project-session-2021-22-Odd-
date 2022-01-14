<?php
require_once("conn.php");
if(isset($_POST['submit']))
{
    
    if(empty($_POST['name']) || empty($_POST['email']) || empty($_POST['password']) || empty($_POST['desg']) || empty($_POST['address']) || empty($_POST['phoneno']) || empty($_POST['skills']))
    {
        echo"<script>alert('All fields are mandatory.');</script>";
    }
    else{
        $userName=$_POST['name'];
        $userEmail=$_POST['email'];
        $userPassword=$_POST['password'];
        $userDesg=$_POST['desg'];
        $userAddress=$_POST['address'];
        $userPhoneNo=$_POST['phoneno'];
        $userSkills=$_POST['skills'];
        
        $query3 = " select * from empdetail";
        $result3 = mysqli_query($con,$query3);
        $row=mysqli_num_rows($result3);
        $empId=$row+1;
        //echo "there are".$empId."rows";

        $query1 = " insert into empdetail (empId,empName,empEmail,empPwd,empDesg,empAddress,empPhone,empSkills)
         values('$empId','$userName','$userEmail','$userPassword','$userDesg','$userAddress','$userPhoneNo','$userSkills')";
        $result = mysqli_query($con,$query1);

        $query2 ="insert into projectdetails (empId,projectManager) values('$empId','NULL')";
        mysqli_query($con,$query2);
        
        $query4 ="insert into updatedetail (empId,empDesg,updatedBy) values('$empId','$userDesg','A')";
        mysqli_query($con,$query4);

        if($result)
        {
            header("location:Admin Panel.php");
        }
        else
        {
            echo"<script>alert('Please check your Query');</script>";
            
            
        }
    }
}
// else if(isset($_POST['back']))
// {
//     header("location:Admin Panel.php");
// }
else
{
    header("location:index1.php");
}
?>