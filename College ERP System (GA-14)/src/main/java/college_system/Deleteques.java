package college_system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Teacher;

/**
 * Servlet implementation class Deleteques
 */
@WebServlet("/Deleteques")
public class Deleteques extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Teacher te = (Teacher) se.getAttribute("tdetail");
		if (te == null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}
		int examid, qid;
		examid = Integer.parseInt(request.getParameter("examId"));
		qid = Integer.parseInt(request.getParameter("qid"));
		Database db = new Database();
		if (db.deleteQuestion(examid, qid)) {
			System.out.println("question deleted");
			response.sendRedirect("update_question.jsp?examId=" + examid);
		}
	}

}
