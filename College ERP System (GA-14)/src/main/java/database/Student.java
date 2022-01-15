package database;

public class Student {
	String name, password, email, gender, dob, mobno, deptname;
	int sid, deptid, tenth, twelfth, totalfees, submitedfees;
	
	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getName() {
		return name;
	}

	public int getTotalfees() {
		return totalfees;
	}

	public void setTotalfees(int totalfees) {
		this.totalfees = totalfees;
	}

	public int getSubmitedfees() {
		return submitedfees;
	}

	public void setSubmitedfees(int submitedfees) {
		this.submitedfees = submitedfees;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public int getTenth() {
		return tenth;
	}

	public void setTenth(int tenth) {
		this.tenth = tenth;
	}

	public int getTwelfth() {
		return twelfth;
	}

	public void setTwelfth(int twelfth) {
		this.twelfth = twelfth;
	}
}
