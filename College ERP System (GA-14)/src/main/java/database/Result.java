package database;

import java.sql.Date;

public class Result {
	private int deptid, noOfQues, pmarks, nmarks, examid, correctans, incorrectans, s_id;
	private String examName;
	private Date date;
	
	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public int getExamid() {
		return examid;
	}

	public void setExamid(int examid) {
		this.examid = examid;
	}

	public int getCorrectans() {
		return correctans;
	}

	public void setCorrectans(int correctans) {
		this.correctans = correctans;
	}

	public int getIncorrectans() {
		return incorrectans;
	}

	public void setIncorrectans(int incorrectans) {
		this.incorrectans = incorrectans;
	}
}
