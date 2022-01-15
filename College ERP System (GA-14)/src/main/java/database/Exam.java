package database;

import java.sql.Date;
import java.sql.Time;

public class Exam {
	private String examName;
	Date date;
	boolean studentStatus;

	public boolean isStudentStatus() {
		return studentStatus;
	}

	public void setStudentStatus(boolean studentStatus) {
		this.studentStatus = studentStatus;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	Time time;
	private int deptid, noOfQues, pmarks, nmarks, examid, dtime;

	public int getExamid() {
		return examid;
	}

	public void setExamid(int examid) {
		this.examid = examid;
	}

	public int getDtime() {
		return dtime;
	}

	public void setDtime(int dtime) {
		this.dtime = dtime;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public int getNoOfQues() {
		return noOfQues;
	}

	public void setNoOfQues(int noOfQues) {
		this.noOfQues = noOfQues;
	}

	public int getPmarks() {
		return pmarks;
	}

	public void setPmarks(int pmarks) {
		this.pmarks = pmarks;
	}

	public int getNmarks() {
		return nmarks;
	}

	public void setNmarks(int nmarks) {
		this.nmarks = nmarks;
	}

}
