<?php 

    require_once("conn.php");
    
    if(isset($_POST['update']))
    {
        $userEmail = $_GET['GetID'];

        $query2="select empId from empdetail where empEmail='".$userEmail."' ";
        $result2=mysqli_query($con,$query2);
        // echo $result2;
        $row=mysqli_fetch_assoc($result2);
        $userId = $row['empId'];
        //echo "my id is : " .$userId.


        $userPwd = $_POST['password'];
        $userPhone = $_POST['phoneno'];
        $userAddress = $_POST['address'];
        $userSkills = $_POST['skills'];
        
        //fetching the previous date to get inserted into the new record
        $query7="select * from updatedetail where empId='".$userId."' order by updateDate desc ";
        $result7=mysqli_query($con,$query7);
        // echo $result2;
        $row=mysqli_fetch_assoc($result7);
        $projectStartDate = $row['projectStartDate'];
        $projectEndDate = $row['projectEndDate'];


        $query1 = " update empdetail set empPwd = '".$userPwd."',empPhone='".$userPhone."',empAddress='".$userAddress."',empSkills='".$userSkills."' where empEmail='".$userEmail."' ";
        $result=mysqli_query($con,$query1);

        $query4 ="insert into updatedetail (empId,empPhone,empAddress,empSkills,updatedBy,projectStartDate,projectEndDate) values('$userId','$userPhone','$userAddress','$userSkills','E','$projectStartDate','$projectEndDate')";
        mysqli_query($con,$query4);

    
        if($result)
        {
            header("location:Employee Dashboard.php");
        }
        else
        {
            echo"<script>alert('Please check your Query');</script>";
        }
    }
    else if(isset($_POST['back']))
    {
        header("location:Employee Dashboard.php");
    }
    else
    {
        header("location:view.php");
    }


?>