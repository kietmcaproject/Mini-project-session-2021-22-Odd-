package college_system;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Exam;
import database.Question;
import database.Student;

/**
 * Servlet implementation class Prepare_onlineexam
 */
@WebServlet("/Prepare_onlineexam")
public class Prepare_onlineexam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession(false);//false se purane seddion ko check krta h 
		Student st = (Student) se.getAttribute("sdetail");
		if(st==null) {
			response.sendRedirect("student_login.jsp");
			return;
		}
		Database db = new Database();
		Exam ex = (Exam) se.getAttribute("examdetails");
		if (ex == null) {
			response.sendRedirect("student_option.jsp");
			return;
		}
		ArrayList<Question> qal = db.getExamQuestion(ex);
    
		se.setAttribute("examques", qal);//it set different ques for different student
		response.sendRedirect("online_exam_quespage.jsp");
	}

	

}
