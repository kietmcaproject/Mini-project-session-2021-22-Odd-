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
import database.Student;

/**
 * Servlet implementation class Feesubmit
 */
@WebServlet("/Feesubmit")
public class Feesubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int amount = Integer.parseInt(request.getParameter("sfee"));
		HttpSession se = request.getSession(false);//false se purane seddion ko check krta h 
		Fee fe = (Fee) se.getAttribute("fdetail");
		Student st = (Student) se.getAttribute("studentdetail");
		if (fe == null || st == null) {
			response.sendRedirect("feeadmin_login.jsp");
			return;
		}
		
		
		int sid = st.getSid();
		int rfee = st.getTotalfees() - st.getSubmitedfees();
		if(amount <= rfee) {
			Database db = new Database();
				if(db.feesubmit(amount+st.getSubmitedfees(),sid))
				{	
					request.setAttribute("msg", "Fee Submitted!");
					request.setAttribute("link", "feeadmin_option.jsp");
					request.setAttribute("bname", "Continue");
					request.setAttribute("color", "success");
				}
		}
		else {
			response.getWriter().print( "<a href=\"feestudent_submit.jsp?fsid="+sid+"\">feesubmit</a>");
			request.setAttribute("msg", "Amount is more than required!");
			request.setAttribute("link", "feestudent_submit.jsp?fsid="+sid);
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		}
		request.getRequestDispatcher("msg.jsp").forward(request, response);
		
	}

}
