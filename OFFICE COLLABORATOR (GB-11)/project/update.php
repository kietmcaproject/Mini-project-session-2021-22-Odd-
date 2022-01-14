<?php 

    require_once("conn.php");
    
    if(isset($_POST['update']))
    {
        $userEmail = $_GET['GetEmail'];
        $query2="select empId from empdetail where empEmail='".$userEmail."' ";
        $result2=mysqli_query($con,$query2);
        // echo $result2;
        $row=mysqli_fetch_assoc($result2);
        $userId = $row['empId'];
        //echo "my id is : " .$userId.



        $userDesg = $_POST['desg'];
        $projectManager = $_POST['pManager'];
        $projectAllocated = $_POST['pAllocated'];
        $projectStart = $_POST['pStart'];
        $projectEnd = $_POST['pEnd'];
        $projectStatus = $_POST['projectstatus'];
        $projectOutcome = $_POST['projectoutcome'];
        $empStatus = $_POST['empstatus'];

        $query5="select pName,pManager from project where pId='".$projectAllocated."' ";
        $result5=mysqli_query($con,$query5);
        // echo $result2;
        $row=mysqli_fetch_assoc($result5);
        $pName = $row['pName'];
        $pManager = $row['pManager'];

       
        $query1 = " update empdetail set empDesg = '".$userDesg."',empStatus='".$empStatus."' where empEmail='".$userEmail."' ";
        mysqli_query($con,$query1);

        $query4 ="insert into updatedetail (empId,empDesg,projectManager,allocatedProject,projectStartDate,projectEndDate,projectStatus,projectOutcome,empStatus,updatedBy) values('$userId','$userDesg','$projectManager','$projectAllocated','$projectStart','$projectEnd','$projectStatus','$projectOutcome','$empStatus','A')";
        mysqli_query($con,$query4);

        $query = " update projectdetails set projectManager = '".$pManager."',allocatedProject='".$pName."',
        projectStartDate='".$projectStart."',projectEndDate='".$projectEnd."',projectOutcome='".$projectOutcome."',
        projectStatus='".$projectStatus."' where empId='".$userId."'";
        $result = mysqli_query($con,$query);

    
        if($result)
        {
            header("location:Admin Panel.php");
        }
        else
        {
            echo"<script>alert('Please check your Query');</script>";
        }
    }
    else if(isset($_POST['back']))
    {
        header("location:Admin Panel.php");
    }
    else
    {
        header("location:view.php");
    }


?>