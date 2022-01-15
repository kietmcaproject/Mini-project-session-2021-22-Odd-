package college_system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Admin;
import database.Database;

/**
 * Servlet implementation class Abc
 */
@WebServlet("/Admin_login")
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aid = Integer.parseInt(request.getParameter("aid"));
		String pass= request.getParameter("pass");
		Database db = new Database();
		if(db.adminlogin(aid,pass)) {
			Admin ad= db.adminDetail();
			HttpSession se = request.getSession();
			se.setAttribute("detail", ad);
			response.sendRedirect("admin_option.jsp");
		}
		else {
			request.setAttribute("errMsg", "Invalid Credentials!");
			request.getRequestDispatcher("admin_login.jsp").forward(request, response);
		}
		
	}

	

}
