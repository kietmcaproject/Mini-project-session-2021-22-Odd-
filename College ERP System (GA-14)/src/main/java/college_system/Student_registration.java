package college_system;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import database.Student;

/**
 * Servlet implementation class Student_registration
 */
@WebServlet("/Student_registration")
public class Student_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student stu = new Student();
		stu.setName(request.getParameter("name"));
		stu.setPassword(request.getParameter("pass"));
		stu.setEmail(request.getParameter("email"));
		stu.setMobno(request.getParameter("mob"));
		stu.setGender(request.getParameter("gender"));
		stu.setDob(request.getParameter("dob"));
		stu.setTenth(Integer.parseInt(request.getParameter("10%")));
		stu.setTwelfth(Integer.parseInt(request.getParameter("12%")));
		stu.setDeptid(Integer.parseInt(request.getParameter("deptid")));
		Database db = new Database();
		int sta = db.addStudent(stu);
		if ( sta == 1 ) {
			request.setAttribute("msg", "Registration Successfull!");
			request.setAttribute("msg2", "Your Id = "+stu.getSid());
			request.setAttribute("link", "student_login.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		} else if ( sta == 2 ) {
			request.setAttribute("msg", "E-mail Already Exists!");
			request.setAttribute("link", "student_registration.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		} else {
			request.setAttribute("msg", "500! Some Error Occur");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		}
		request.getRequestDispatcher("msg.jsp").forward(request, response);

	}

}
