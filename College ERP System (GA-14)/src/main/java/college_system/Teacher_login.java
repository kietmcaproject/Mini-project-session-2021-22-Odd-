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
 * Servlet implementation class Teacher_login
 */
@WebServlet("/Teacher_login")
public class Teacher_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tid = Integer.parseInt(request.getParameter("tid"));
		String pass = request.getParameter("pass");
		Database db = new Database();
		if (db.teacherLogin(tid, pass)) {
			Teacher te = db.teacherDetail();
			HttpSession tl = request.getSession();
			tl.setAttribute("tdetail", te);
			response.sendRedirect("teacher_option.jsp");
		} else {
			request.setAttribute("errMsg", "Invalid Credentials!");
			request.getRequestDispatcher("teacher_login.jsp").forward(request, response);
		}
	}

}
