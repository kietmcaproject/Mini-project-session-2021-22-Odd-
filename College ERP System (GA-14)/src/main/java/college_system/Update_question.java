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
 * Servlet implementation class Update_question
 */
@WebServlet("/Update_question")
public class Update_question extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Teacher te = (Teacher) se.getAttribute("tdetail");
		if(te==null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}
		Database db = new Database();
		Question q = new Question();
		int examId = Integer.parseInt(request.getParameter("examId"));
		q.setQues(request.getParameter("ques"));
		q.setOp1(request.getParameter("op1"));
		q.setOp2(request.getParameter("op2"));
		q.setOp3(request.getParameter("op3"));
		q.setOp4(request.getParameter("op4"));
		q.setCoption(Integer.parseInt(request.getParameter("coption")));
		q.setQid(Integer.parseInt(request.getParameter("qid")));
		if (db.updateQues(examId, q)) {
			request.setAttribute("msg", "Question Updated!");
			request.setAttribute("msg2", "Want to See Questions?");
			request.setAttribute("link", "update_question.jsp?examId=" + examId);
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		}
		request.getRequestDispatcher("msg.jsp").forward(request, response);
	}

}
