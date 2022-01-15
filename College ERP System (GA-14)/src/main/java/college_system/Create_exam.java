package college_system;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import database.Exam;
import database.Teacher;

/**
 * Servlet implementation class Create_exam
 */
@WebServlet("/Create_exam")
public class Create_exam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession(false);
		Teacher te = (Teacher) se.getAttribute("tdetail");
		if(te==null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}
		Exam ex = new Exam();
		ex.setExamName(request.getParameter("examName"));
		java.util.Date dt = null;

		try {
			dt = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
			Date d = new Date(dt.getTime());
			ex.setDate(d);
			dt = new SimpleDateFormat("HH:mm").parse(request.getParameter("time"));
			Time ti = new Time(dt.getTime());
			ex.setTime(ti);
			System.out.println(ti);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ex.setDeptid(Integer.parseInt(request.getParameter("deptid")));
		ex.setNmarks(Integer.parseInt(request.getParameter("nmarks")));
		ex.setNoOfQues(Integer.parseInt(request.getParameter("noOfQues")));
		ex.setPmarks(Integer.parseInt(request.getParameter("pmarks")));
		ex.setDtime(Integer.parseInt(request.getParameter("dtime")));

		Database db = new Database();
		if (db.addExam(ex)) {
			request.setAttribute("msg", "Exam Created!");
			request.setAttribute("link", "teacher_option.jsp");
			request.setAttribute("bname", "Continue");
			request.setAttribute("color", "success");
		}
		request.getRequestDispatcher("msg.jsp").forward(request, response);
	}

}
