package database;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class Database {
	private static final int NULL = 0;
	private Connection con = null;
	private PreparedStatement st;
	private ResultSet rs;

	public Database() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + System.getenv("dbServer"), System.getenv("dbUser"),
					System.getenv("dbPassword"));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void finalize() {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> getDatabaseTables() {// db ki table ki arraylist return krege search krne k liye
		ArrayList<String> tables = new ArrayList<String>();

		try {
			st = con.prepareStatement("show tables");
			rs = st.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tables;
	}

	public void createDefaultTable() { // isme table create kr rhe h agr phle se nhi h
		if (con==null) {
			System.out.println("Connection to DB Not Established");
			return;
		}
		
		Map<String, String> tables = new LinkedHashMap<String, String>();
		tables.put("admin", "(a_id int NOT NULL, password varchar(20),name varchar(50) NOT NULL,PRIMARY KEY(a_id))");
		tables.put("department",
				"(d_id int NOT NULL AUTO_INCREMENT,name varchar(20) NOT NULL ,PRIMARY KEY(d_id)) AUTO_INCREMENT=1001");
		tables.put("teacher",
				"(t_id int NOT NULL AUTO_INCREMENT,name varchar(50) NOT NULL,email varchar(50) NOT NULL,password varchar(20) NOT NULL,mobileno varchar(10) NOT NULL,d_id int NOT NULL,PRIMARY KEY(t_id),FOREIGN KEY (d_id) REFERENCES department(d_id)) AUTO_INCREMENT=2001");
		tables.put("student",
				"(s_id int NOT NULL AUTO_INCREMENT,name varchar(50) NOT NULL,password varchar(20) NOT NULL,email varchar(50) NOT NULL,mobileno varchar(10) NOT NULL,gender varchar(10) NOT NULL,DOB varchar(10) NOT NULL,tenthpercentage int NOT NULL,twelfthpercentage int NOT NULL,d_id int NOT NULL,totalfee int,submitedfee int,PRIMARY KEY(s_id),FOREIGN KEY (d_id) REFERENCES department(d_id)) AUTO_INCREMENT=3001");
		tables.put("feeadmin", "(f_id int NOT NULL, password varchar(20),name varchar(20) NOT NULL,PRIMARY KEY(f_id))");
		tables.put("exam",
				"(e_id int NOT NULL AUTO_INCREMENT,examName varchar(50) NOt NULL,d_id int NOT NULL,date DATE NOT NULL,time TIME NOT NULL,noOfQues int NOT NULL,pmarks int NOT NULL,nmarks int NOT NULL,duration_time int NOT NULL,PRIMARY KEY(e_id),FOREIGN KEY (d_id) REFERENCES department(d_id)) AUTO_INCREMENT=4001");
		tables.put("result",
				"(s_id int NOT NULL,examName varchar(50) NOt NULL,date DATE NOT NULL,noOfQues int NOT NULL,pmarks int NOT NULL,nmarks int NOT NULL,noOfCorrectQues int NOT NULL,noOfIncorrectQues int NOT NULL,e_id int NOT NULL,d_id int NOT NULL)");
		tables.put("attendance", "(s_id int NOT NULL,date DATE NOT NULL,status BOOLEAN NOT NULL)");
		tables.put("attendance_status", "(d_id int NOT NULL,date DATE NOT NULL)");

		ArrayList<String> dbtables = getDatabaseTables();

		tables.forEach((tablename, tablefields) -> {
			if (!dbtables.contains(tablename)) {
				createTable(tablename, tablefields);
			}
		});
	}

	public void createTable(String name, String fields) {
		try {
			int n = con.prepareStatement("CREATE TABLE " + name + fields).executeUpdate();
			System.out.println("table created " + name);

			if (name.equals("admin")) {
				con.prepareStatement("insert into admin values(1234,'12341234','RD')").executeUpdate();

				System.out.println("admin id inserted");
			}
			if (name.equals("department")) {

				con.prepareStatement("insert into department values(NULL,'CSE')").executeUpdate();
				con.prepareStatement("insert into department values(NULL,'ME')").executeUpdate();
				con.prepareStatement("insert into department values(NULL,'ECE')").executeUpdate();
				con.prepareStatement("insert into department values(NULL,'IT')").executeUpdate();
				con.prepareStatement("insert into department values(NULL,'CIVIL')").executeUpdate();
				con.prepareStatement("insert into department values(NULL,'EE')").executeUpdate();
				System.out.println("department id inserted");
			}
			if (name.equals("feeadmin")) {
				con.prepareStatement("insert into feeadmin values(1234,'12341234','RD')").executeUpdate();

				System.out.println("feeadmin id inserted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean adminlogin(int aid, String pass) {
		try {
			st = con.prepareStatement("select * from admin where a_id= ? and password=?");
			st.setInt(1, aid);
			st.setString(2, pass);
			rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return false;
	}

	public Admin adminDetail() {
		Admin a = new Admin();
		try {
			a.setAid(rs.getInt(1));
			a.setName(rs.getString(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return a;
	}

	public Map<Integer, String> getDepartment() {
		Map<Integer, String> m = new HashMap<Integer, String>();
		try {
			st = con.prepareStatement("select * from department");
			rs = st.executeQuery();
			while (rs.next()) {
				m.put(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}

	public Map<Integer, String> getExamIdName() {
		Map<Integer, String> m = new HashMap<Integer, String>();
		try {
			st = con.prepareStatement("select * from exam");
			rs = st.executeQuery();
			while (rs.next()) {
				m.put(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}

	public int addTeacher(Teacher t) {
		int sta = 0;
		try {
			st = con.prepareStatement("select t_id from teacher where email=?");
			st.setString(1, t.getEmail());
			rs = st.executeQuery();
			if (rs.next())
				return 2;

			st = con.prepareStatement("insert into teacher values(?,?,?,?,?,?)");
			st.setInt(1, NULL);
			st.setString(2, t.getName());
			st.setString(3, t.getEmail());
			st.setString(4, t.getPassword());
			st.setString(5, t.getMobileno());
			st.setInt(6, t.getDeptid());
			sta = st.executeUpdate();

			st = con.prepareStatement("select t_id from teacher where email=?");
			st.setString(1, t.getEmail());
			rs = st.executeQuery();
			if (rs.next())
				t.setTid(rs.getInt(1));
			return sta;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public boolean teacherLogin(int tid, String pass) {
		try {
			st = con.prepareStatement("select * from teacher where t_id=? and password=?");
			st.setInt(1, tid);
			st.setString(2, pass);
			rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Teacher teacherDetail() {
		Teacher te = new Teacher();
		try {
			te.setTid(rs.getInt(1));
			te.setName(rs.getString(2));
			te.setEmail(rs.getString(3));
			te.setMobileno(rs.getString(5));
			te.setDeptid(rs.getInt(6));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return te;
	}

	public int addStudent(Student stu) {
		// TODO Auto-generated method stub
		int sta = 0;
		try {
			st = con.prepareStatement("select s_id from student where email=?");
			st.setString(1, stu.getEmail());
			rs = st.executeQuery();
			if (rs.next())
				return 2;

			st = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setInt(1, NULL);
			st.setString(2, stu.getName());
			st.setString(3, stu.getPassword());
			st.setString(4, stu.getEmail());
			st.setString(5, stu.getMobno());
			st.setString(6, stu.getGender());
			st.setString(7, stu.getDob());
			st.setInt(8, stu.getTenth());
			st.setInt(9, stu.getTwelfth());
			st.setInt(10, stu.getDeptid());
			st.setInt(11, 100000);
			st.setInt(12, 0);
			sta = st.executeUpdate();

			st = con.prepareStatement("select s_id from student where email=?");
			st.setString(1, stu.getEmail());
			rs = st.executeQuery();
			if (rs.next())
				stu.setSid(rs.getInt(1));
			return sta;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int studentlogin(int sid, String pass) {
		// TODO Auto-generated method stub
		try {
			st = con.prepareStatement("select * from student where s_id=? and password=?");
			st.setInt(1, sid);
			st.setString(2, pass);
			rs = st.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Student studentDetail(int sid) {
		// TODO Auto-generated method stub

		Student stu = new Student();
		try {
			st = con.prepareStatement(
					"select * from student s inner join department d on s.d_id = d.d_id where s.s_id=?");
			st.setInt(1, sid);
			rs = st.executeQuery();
			rs.next();
			stu.setSid(rs.getInt(1));
			stu.setName(rs.getString(2));
			stu.setEmail(rs.getString(4));
			stu.setMobno(rs.getString(5));
			stu.setGender(rs.getString(6));
			stu.setDob(rs.getString(7));
			stu.setTenth(rs.getInt(8));
			stu.setTwelfth(rs.getInt(9));
			stu.setDeptid(rs.getInt(10));
			stu.setTotalfees(rs.getInt(11));
			stu.setSubmitedfees(rs.getInt(12));
			stu.setDeptname(rs.getString(14));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stu;
	}

	public boolean feeadminlogin(int fid, String pass) {
		// TODO Auto-generated method stub
		try {
			st = con.prepareStatement("select * from feeadmin where f_id= ? and password=?");
			st.setInt(1, fid);
			st.setString(2, pass);
			rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
		return false;

	}

	public Fee feeadminDetail() {
		Fee fe = new Fee();
		try {
			fe.setFid(rs.getInt(1));
			fe.setName(rs.getString(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return fe;
	}

	public boolean addExam(Exam ex) {
		try {
			st = con.prepareStatement("insert into exam values(?,?,?,?,?,?,?,?,?)");
			st.setInt(1, NULL);
			st.setString(2, ex.getExamName());
			st.setInt(3, ex.getDeptid());
			st.setDate(4, ex.getDate());
			st.setTime(5, ex.getTime());
			st.setInt(6, ex.getNoOfQues());
			st.setInt(7, ex.getPmarks());
			st.setInt(8, ex.getNmarks());
			st.setInt(9, ex.getDtime());
			st.executeUpdate();
			System.out.println("exam data entered");
			st = con.prepareStatement("select max(e_id) from exam");
			rs = st.executeQuery();
			rs.next();
			createTable("exques" + rs.getInt(1),
					"(id int AUTO_INCREMENT NOT NULL,ques varchar(1000),op1 varchar(100),op2 varchar(100),op3 varchar(100),op4 varchar(100),coption int,PRIMARY KEY(id))");
			System.out.println("exam question table created");
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean addQues(int exid, Question q) {
		try {
			st = con.prepareStatement("insert into exques" + exid + " values(?,?,?,?,?,?,?)");
			st.setInt(1, NULL);
			st.setString(2, q.getQues());
			st.setString(3, q.getOp1());
			st.setString(4, q.getOp2());
			st.setString(5, q.getOp3());
			st.setString(6, q.getOp4());
			st.setInt(7, q.getCoption());

			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public ArrayList<Exam> getOnlineExamLinks(int did, int sid) {
		ArrayList<Exam> lx = new ArrayList<Exam>();
		Date dt = null;
		Time tt = null;
		java.sql.Date ds = null;
		try {
			ArrayList<Integer> stexam = new ArrayList<Integer>();
			st = con.prepareStatement("select e_id from result where s_id=?");
			st.setInt(1, sid);
			rs = st.executeQuery();
			while (rs.next())
				stexam.add(rs.getInt(1));

			dt = new Date();
			ds = new java.sql.Date(dt.getTime());
			tt = new Time(dt.getTime());
			st = con.prepareStatement("select * from exam where date=? and time<=? and d_id=?");
			st.setDate(1, ds);
			st.setTime(2, tt);
			st.setInt(3, did);
			rs = st.executeQuery();
			while (rs.next()) {
				Exam ex = new Exam();
				ex.setExamName(rs.getString(2));
				ex.setDtime(rs.getInt(9));
				ex.setNoOfQues(rs.getInt(6));
				ex.setExamid(rs.getInt(1));
				ex.setStudentStatus(stexam.contains(rs.getInt(1)));
				lx.add(ex);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lx;
	}

	public boolean getOnlineExamStatus(int eid, int sid) {
		try {
			st = con.prepareStatement("select * from result where s_id=? and e_id=?");
			st.setInt(1, sid);
			st.setInt(2, eid);
			rs = st.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<Exam> getUpcomingOnlineExams() {
		ArrayList<Exam> lx = new ArrayList<Exam>();
		Date dt = null;
		java.sql.Date ds = null;
		try {
			dt = new Date();
			ds = new java.sql.Date(dt.getTime());
			st = con.prepareStatement("select * from exam where date>=?");
			st.setDate(1, ds);
			rs = st.executeQuery();
			while (rs.next()) {
				Exam e = new Exam();
				e.setExamid(rs.getInt(1));
				e.setExamName(rs.getString(2));
				e.setDeptid(rs.getInt(3));
				e.setDate(rs.getDate(4));
				e.setTime(rs.getTime(5));
				e.setNoOfQues(rs.getInt(6));
				e.setPmarks(rs.getInt(7));
				e.setNmarks(rs.getInt(8));
				e.setDtime(rs.getInt(9));
				lx.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lx;
	}

	public Exam getOnlineExamDetails(int eid) {
		Exam e = new Exam();
		try {

			st = con.prepareStatement("select * from exam where e_id=?");
			st.setInt(1, eid);
			rs = st.executeQuery();
			rs.next();
			e.setExamid(rs.getInt(1));
			e.setExamName(rs.getString(2));
			e.setDeptid(rs.getInt(3));
			e.setDate(rs.getDate(4));
			e.setTime(rs.getTime(5));
			e.setNoOfQues(rs.getInt(6));
			e.setPmarks(rs.getInt(7));
			e.setNmarks(rs.getInt(8));
			e.setDtime(rs.getInt(9));
		} catch (SQLException l) {
			// TODO Auto-generated catch block
			l.printStackTrace();
		}
		return e;

	}

	// it gets all the question from database
	public ArrayList<Question> getAllQuestion(int eid) {
		ArrayList<Question> aq = new ArrayList<Question>();
		try {
			rs = con.prepareStatement("select * from exques" + eid).executeQuery();
			while (rs.next()) {
				Question q = new Question();
				q.setQid(rs.getInt(1));
				q.setQues(rs.getString(2));
				q.setCoption(rs.getInt(7));
				q.setOp1(rs.getString(3));
				q.setOp2(rs.getString(4));
				q.setOp3(rs.getString(5));
				q.setOp4(rs.getString(6));
				aq.add(q);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return aq;

	}

	// it fetch the question from database for online exam and return a arraylist
	public ArrayList<Question> getExamQuestion(Exam e) {
		ArrayList<Question> dbques = getAllQuestion(e.getExamid());
		ArrayList<Question> examques = new ArrayList<Question>();
		for (int i = 0; i < e.getNoOfQues(); i++) {
			int rno = (int) (dbques.size() * Math.random());
			examques.add(dbques.get(rno));
			dbques.remove(rno);

		}
		return examques;
	}

	public boolean saveResult(int s_id, int did, int crrans, int incrrans, Exam ex) {
		try {
			st = con.prepareStatement("insert into result values(?,?,?,?,?,?,?,?,?,?)");
			st.setInt(1, s_id);
			st.setString(2, ex.getExamName());
			st.setDate(3, ex.getDate());
			st.setInt(4, ex.getNoOfQues());
			st.setInt(5, ex.getPmarks());
			st.setInt(6, ex.getNmarks());
			st.setInt(7, crrans);
			st.setInt(8, incrrans);
			st.setInt(9, ex.getExamid());
			st.setInt(10, did);

			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<Result> getStudentResult(int sid) {
		ArrayList<Result> ar = new ArrayList<Result>();
		try {
			st = con.prepareStatement("select * from result where s_id=?");
			st.setInt(1, sid);
			rs = st.executeQuery();

			while (rs.next()) {
				Result r = new Result();
				r.setExamName(rs.getString(2));
				r.setDate(rs.getDate(3));
				r.setNoOfQues(rs.getInt(4));
				r.setPmarks(rs.getInt(5));
				r.setNmarks(rs.getInt(6));
				r.setCorrectans(rs.getInt(7));
				r.setIncorrectans(rs.getInt(8));
				r.setExamid(rs.getInt(9));
				ar.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	public ResultSet selectExam() {
		try {
			st = con.prepareStatement("select * from exam");
			rs = st.executeQuery();
			// return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public boolean deleteExamWithTable(int examid) {
		try {
			st = con.prepareStatement("DROP TABLE from exques" + examid);
			st.executeUpdate();
			st = con.prepareStatement("delete from exam where e_id=?");
			st.setInt(1, examid);
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateExam(Exam ex) {
		try {
			st = con.prepareStatement("delete from exam where e_id=?");
			st.setInt(1, ex.getExamid());
			st.executeUpdate();

			st = con.prepareStatement("insert into exam values(?,?,?,?,?,?,?,?,?)");
			st.setInt(1, NULL);
			st.setString(2, ex.getExamName());
			st.setInt(3, ex.getDeptid());
			st.setDate(4, ex.getDate());
			st.setTime(5, ex.getTime());
			st.setInt(6, ex.getNoOfQues());
			st.setInt(7, ex.getPmarks());
			st.setInt(8, ex.getNmarks());
			st.setInt(9, ex.getDtime());
			st.executeUpdate();

			st = con.prepareStatement("select max(e_id) from exam");
			rs = st.executeQuery();
			rs.next();

			st = con.prepareStatement("ALTER TABLE exques" + ex.getExamid() + " RENAME TO exques" + rs.getInt(1));
			st.executeUpdate();
			ex.setExamid(rs.getInt(1));

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateQues(int examId, Question q) {
		try {
			st = con.prepareStatement(
					"update exques" + examId + " set ques=?,op1=?,op2=?,op3=?,op4=?,coption=? where id=? ");
			// st.setInt(1,NULL);
			st.setString(1, q.getQues());
			st.setString(2, q.getOp1());
			st.setString(3, q.getOp2());
			st.setString(4, q.getOp3());
			st.setString(5, q.getOp4());
			st.setInt(6, q.getCoption());
			st.setInt(7, q.getQid());

			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteQuestion(int examid, int qid) {
		try {
			st = con.prepareStatement("delete from exques" + examid + " where id=" + qid);
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean feesubmit(int amount, int sid) {
		try {
			st = con.prepareStatement("update student set submitedfee=? where s_id=?");
			st.setInt(1, amount);
			st.setInt(2, sid);
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<Student> getRemainingFeeStudentsByDepartment(int dId) {
		ArrayList<Student> as = new ArrayList<Student>();
		try {
			st = con.prepareStatement("select * from student where totalfee!=submitedfee and d_id=?");
			st.setInt(1, dId);
			rs = st.executeQuery();
			while (rs.next()) {
				Student stu = new Student();
				stu.setSid(rs.getInt(1));
				stu.setName(rs.getString(2));
				stu.setEmail(rs.getString(4));
				stu.setMobno(rs.getString(5));
				stu.setTotalfees(rs.getInt(11));
				stu.setSubmitedfees(rs.getInt(12));

				as.add(stu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return as;
	}

	public Map<Integer, String> getStudentIdNameByDepartment(int dId) {
		Map<Integer, String> m = new HashMap<Integer, String>();
		try {
			st = con.prepareStatement("select s_id, name from student where d_id=?");
			st.setInt(1, dId);
			rs = st.executeQuery();
			while (rs.next()) {
				m.put(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}

	public boolean checkTodayAttendanceStatus(int did) {
		Date dt = null;
		java.sql.Date ds = null;
		try {
			dt = new Date();
			ds = new java.sql.Date(dt.getTime());
			st = con.prepareStatement("select * from attendance_status where d_id=? and date=?");
			st.setInt(1, did);
			st.setDate(2, ds);
			rs = st.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean saveAttendance(Map<Integer, Boolean> att, int did) {
		Date dt = null;
		java.sql.Date ds = null;
		try {
			dt = new Date();
			ds = new java.sql.Date(dt.getTime());
			for (Map.Entry<Integer, Boolean> mp : att.entrySet()) {
				st = con.prepareStatement("insert into attendance values(?,?,?)");
				st.setInt(1, mp.getKey());
				st.setDate(2, ds);
				st.setBoolean(3, mp.getValue());
				st.executeUpdate();
			}
			st = con.prepareStatement("insert into attendance_status values(?,?)");
			st.setInt(1, did);
			st.setDate(2, ds);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public ArrayList<Integer> getStudentAttendance(int sid) {
		ArrayList<Integer> at = new ArrayList<Integer>();
		try {
			st = con.prepareStatement("select count(*) from attendance where s_id=? and status=1");
			st.setInt(1, sid);
			rs = st.executeQuery();
			if (rs.next()) {
				at.add(rs.getInt(1));
			}
			st = con.prepareStatement("select count(*) from attendance where s_id=?");
			st.setInt(1, sid);
			rs = st.executeQuery();
			if (rs.next()) {
				at.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return at;
	}

}
