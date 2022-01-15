package college_system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Student_logout
 */
@WebServlet("/Student_logout")
public class Student_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sse=request.getSession(false);
		sse.removeAttribute("sdetail");
		sse.invalidate();
		response.sendRedirect("index.jsp");
	}

}
