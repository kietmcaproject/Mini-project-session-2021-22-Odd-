package college_system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Fee;

/**
 * Servlet implementation class Feeadmin_login
 */
@WebServlet("/Feeadmin_login")
public class Feeadmin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fid = Integer.parseInt(request.getParameter("fid"));
		String pass= request.getParameter("pass");
		Database db = new Database();
		if(db.feeadminlogin(fid,pass)) {
			Fee fd= db.feeadminDetail();
			HttpSession fe = request.getSession();
			fe.setAttribute("fdetail", fd);
			response.sendRedirect("feeadmin_option.jsp");
		}
		else {
			request.setAttribute("errMsg", "Invalid Credentials!");
			request.getRequestDispatcher("feeadmin_login.jsp").forward(request, response);
		}
	}

}
