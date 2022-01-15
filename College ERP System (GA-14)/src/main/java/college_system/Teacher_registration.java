package college_system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Admin;
import database.Database;
import database.Teacher;

/**
 * Servlet implementation class Teacher_registration
 */
@WebServlet("/Teacher_registration")
public class Teacher_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Admin ad = (Admin) se.getAttribute("detail");
		if(ad==null) {
			response.sendRedirect("admin_login.jsp");
			return;
		}
		Teacher t= new Teacher();
		t.setName(request.getParameter("tname"));
		t.setEmail(request.getParameter("email"));
		t.setPassword(request.getParameter("pass"));
		t.setDeptid(Integer.parseInt(request.getParameter("departmentid")));
		t.setMobileno(request.getParameter("mob"));
		Database db = new Database();
		
		int sta = db.addTeacher(t);
		if ( sta == 1 ) {
			request.setAttribute("msg", "Registration Successfull!");
			request.setAttribute("msg2", "Teacher Id = "+t.getTid());
			request.setAttribute("link", "teacher_login.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		} else if ( sta == 2 ) {
			request.setAttribute("msg", "E-mail Already Exists!");
			request.setAttribute("link", "teacher_registration.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		} else {
			request.setAttribute("msg", "500! Some Error Occur");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		}
		RequestDispatcher rd=request.getRequestDispatcher("msg.jsp");
		rd.forward(request, response);
	}

}
