package studentBean;

public class Student
{
	private String s_name;
	private String s_addr;
	private String s_pwd;
	private String s_college;
	private String s_major;
	
	public Student() {
		s_name = null;
		s_addr = null;
		s_pwd = null;
		s_college = null;
		s_major = null;
	}
	
	public void setName(String s_name) {
		this.s_name = s_name;
	}
	
	public void setAddr(String s_addr) {
		this.s_addr = s_addr;
	}

	public void setPwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}

	public void setCollege(String s_college) {
		this.s_college = s_college;
	}

	public void setMajor(String s_major) {
		this.s_major = s_major;
	}
	
	public String getName() {
		return s_name;
	}
	
	public String getAddr() {
		return s_addr;
	}
	
	public String getPwd() {
		return s_pwd;
	}
	
	public String getCollege() {
		return s_college;
	}
	
	public String getMajor() {
		return s_major;
	}
}

	
	
	