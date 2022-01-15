<%@page import="database.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Exam"%>
<%@page import="database.Database"%>
<%@page import="database.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/online_Exam_Page.css">

<title>Hello, world!</title>
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http1.0
		response.setHeader("Expires", "0"); //proxies

		Student stu = (Student) session.getAttribute("sdetail");
		if (stu == null) {
			response.sendRedirect("student_login.jsp");
			return;
		}

		Exam ex = (Exam) session.getAttribute("examdetails");
		if (ex == null) {
			response.sendRedirect("student_option.jsp");
			return;
		}
		ArrayList<Question> aq = (ArrayList<Question>) session.getAttribute("examques");
	%>
	<%@ include file="partials/header.jsp"%>

	<script type="text/javascript">
        var currentQues = 1;
    </script>

	<main>
	<div class="container-fluid">
		<div class="row text-center shadow-sm mt-2 mx-1 py-3 border">
			<div class="col fw-bold fs-4">
				<span>Exam Name: <%=ex.getExamName()%>
				</span>
			</div>
			<div class="col fw-bold fs-4">
				<span>Total Marks: <%=ex.getNoOfQues() * ex.getPmarks()%></span>
			</div>
			<div class="col fw-bold fs-4">
				<span>Positive Marking: <%=ex.getPmarks()%>
				</span>
			</div>
			<div class="col fw-bold fs-4">
				<span>Negative Marking: <%=ex.getNmarks()%>
				</span>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row mx-1 mt-3">
			<div class="col-8 border p-4 shadow-sm">
				<div class="ques fs-5">
					Q<span id="questionNo">1</span>. <span id="question"></span>
				</div>
				<div class="option-container">
					<div class="my-3">
						1. <label> <input class="form-check-input" type="radio"
							name="option" value="1" /> <span id="text-op1"></span>
						</label>
					</div>
					<div class="my-3">
						2. <label> <input class="form-check-input" type="radio"
							name="option" value="2" /> <span id="text-op2"></span>
						</label>
					</div>
					<div class="my-3">
						3. <label> <input class="form-check-input" type="radio"
							name="option" value="3" /> <span id="text-op3"></span>
						</label>
					</div>
					<div class="my-3">
						4. <label> <input class="form-check-input" type="radio"
							name="option" value="4" /> <span id="text-op4"></span>
						</label>
					</div>
				</div>
				<div class="row text-center mb-4">
					<div class="col">
						<a onclick="saveAnswer()" class="btn btn-primary">Save</a>
					</div>
					<div class="col">
						<a onclick="gotoQuestion(currentQues-1)" class="btn btn-primary">Previous</a>
					</div>
					<div class="col">
						<a onclick="gotoQuestion(currentQues+1)" class="btn btn-primary">Next</a>
					</div>
				</div>
				<div class="fw-bold mb-5" id="choice"></div>
			</div>
			<div class="col-4">
				<div class="text-center border p-4 shadow-sm">
					<div class="fw-bold fs-4 mb-3">
						<span>Time :- &nbsp;</span><span id="timer">--:--</span>
					</div>
					<div class="row text-white fs-5 mb-4">
						<div class="col" style="background-color: #dc3545;">Visited
						</div>
						<div class="col" style="background-color: #198754;">
							Submitted</div>
					</div>
					<form action="Save_result" method="post">
						<%
							for (int i = 0; i < aq.size(); i++) {
						%>
						<input type="hidden" name="user-answers" id="ans<%=i + 1%>" /> <a
							id="qBtn<%=i + 1%>" onclick="gotoQuestion(<%=i + 1%>)"
							class="btn border shadow-sm btn-light"><%=i + 1%></a>

						<%
							}
						%>


						<br>
						<button id="submitbutton" type="submit" name="action"
							class="btn text-white bg-themeColor2 mt-3">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>

	<%@ include file="partials/footer.jsp"%>


	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
            function Question (ques,op1,op2,op3,op4,status){
                this.ques = ques;
                this.op1 = op1;
                this.op2 = op2;
                this.op3 = op3;
                this.op4 = op4;
                this.status = status;
            }
            var questionList = [];
            <%for (int i = 0; i < aq.size(); i++) {
				Question q = aq.get(i);%>
           
            questionList.push(new Question("<%=q.getQues()%>","<%=q.getOp1()%>","<%=q.getOp2()%>","<%=q.getOp3()%>","<%=q.getOp4()%>",0));
            
            <%}%>
            
           
            function gotoQuestion(q)
            {
            	if(q<1 || q><%=ex.getNoOfQues()%>) {
            		
            		return ;
            	}
                currentQues=q;
                var e=document.getElementById("qBtn"+q);
                if(questionList[q-1].status == 0)
                {
                    questionList[q-1].status=1;
                    e.classList.replace("btn-light","btn-danger");
                }
                document.getElementById("questionNo").innerHTML=q;
                document.getElementById("question").innerHTML=questionList[q-1].ques;
                document.getElementById("text-op1").innerHTML=questionList[q-1].op1;
                document.getElementById("text-op2").innerHTML=questionList[q-1].op2;
                document.getElementById("text-op3").innerHTML=questionList[q-1].op3;
                document.getElementById("text-op4").innerHTML=questionList[q-1].op4;
                var choice=document.getElementById("choice");
                if(questionList[q-1].status == 2)
                {
                     choice.innerHTML="Your Choice :- "+document.getElementById("ans"+q).value;
                }
                else
                {
                    choice.innerHTML="";
                }
                var op=document.getElementsByName("option");
                op[0].checked=false;
                op[1].checked=false;
                op[2].checked=false;
                op[3].checked=false;
            }
    
    function saveAnswer()
    {
         var op=document.getElementsByName("option");
         if(op[0].checked)
             {
             document.getElementById("ans"+currentQues).value=1;
             changeOptionStatus();
             }
         else if(op[1].checked)
             {
             document.getElementById("ans"+currentQues).value=2;
             changeOptionStatus();
             }
         else if(op[2].checked)
             {
             document.getElementById("ans"+currentQues).value=3;
             changeOptionStatus();
             }
         else if(op[3].checked)
             {
             document.getElementById("ans"+currentQues).value=4;
             changeOptionStatus();
             }
    }
    function changeOptionStatus()
    {
        if(questionList[currentQues-1].status==1)
          {
              questionList[currentQues-1].status=2;
              document.getElementById("qBtn"+currentQues).classList.replace("btn-danger","btn-success");
          }
        var choice=document.getElementById("choice");
           choice.innerHTML="Your Choice :- "+document.getElementById("ans"+currentQues).value;
    }

    gotoQuestion(1);
</script>
	<script type="text/javascript">
    var time = <%=ex.getDtime() * 60%>;
    if(sessionStorage.getItem('time')){
        time=Number.parseInt(sessionStorage.getItem('time'));
    }
    
    function convertsec(s)
    {
        var min =Math.floor(s/60);
        var sec= s%60;
        if(sec<10)
            sec='0'+sec;
        if(min<10)
            min='0'+min;
        return min + ':' +sec;
    }
    
    var interval=setInterval(countdown,1000);
    
    function countdown() {
    	var p = document.getElementById("timer");
    	p.innerHTML = convertsec(time);
    	time = time - 1;
    	sessionStorage.setItem('time',time.toString());
    	if (time < 0){ 
    		sessionStorage.clear();
    		clearInterval(interval);
    		document.getElementById("submitbutton").click();
    	}
	}
</script>
</body>
</html>