package college_system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Feeadmin_logout
 */
@WebServlet("/Feeadmin_logout")
public class Feeadmin_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se=request.getSession(false);
		se.removeAttribute("fdetail");
		se.invalidate();
		response.sendRedirect("index.jsp");
	}


}
