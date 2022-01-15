package college_system;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Teacher;

/**
 * Servlet implementation class Save_attendance
 */
@WebServlet("/Save_attendance")
public class Save_attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Teacher te = (Teacher) se.getAttribute("tdetail");
		if(te==null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}
		Database db = new Database();
		if (db.checkTodayAttendanceStatus(te.getDeptid())) {
			return;
		}
		Map<Integer, String> m = (Map<Integer, String>) se.getAttribute("student_Id_List_Attendance");
		Map<Integer, Boolean> att = new HashMap<Integer, Boolean>();
		
		for (Map.Entry<Integer, String> mp : m.entrySet()) {
			att.put(mp.getKey(), Integer.parseInt(request.getParameter(mp.getKey().toString())) == 1 );
		}
		
		if (!db.checkTodayAttendanceStatus(te.getDeptid())) {
			db.saveAttendance(att, te.getDeptid());
			
			request.setAttribute("msg", "Attendance Saved!");
			request.setAttribute("link", "teacher_option.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		} else {
			request.setAttribute("msg", "Attendance Already Saved!");
			request.setAttribute("link", "teacher_option.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "danger");
		}
		
		request.getRequestDispatcher("msg.jsp").forward(request, response);
		
	}

}
