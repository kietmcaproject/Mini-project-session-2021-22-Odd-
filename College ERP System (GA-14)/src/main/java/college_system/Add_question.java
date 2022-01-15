package college_system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Question;
import database.Teacher;

/**
 * Servlet implementation class Add_question
 */
@WebServlet("/Add_question")
public class Add_question extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Teacher te = (Teacher) se.getAttribute("tdetail");
		if(te==null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}
		Question q = new Question();
		q.setQues(request.getParameter("ques"));
		q.setOp1(request.getParameter("op1"));
		q.setOp2(request.getParameter("op2"));
		q.setOp3(request.getParameter("op3"));
		q.setOp4(request.getParameter("op4"));
		q.setCoption(Integer.parseInt(request.getParameter("coption")));
		Database db = new Database();
		if (db.addQues(Integer.parseInt(request.getParameter("examid")), q)) {
			request.setAttribute("msg", "Question Added!");
			request.setAttribute("msg2", "Want to Add More?");
			request.setAttribute("link", "add_question.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		}
		request.getRequestDispatcher("msg.jsp").forward(request, response);
	}

}
