package kr.co.college.bean;

public class LectureBean {
	private int lecNo; 			// 강의 번호
	private String lecName; 	// 강의명
	private int lecCredit; 		// 학점 
	private int lecTime;		// 강의 시간
	private String lecClass;	// 강의장
	
	public int getLecNo() {
		return lecNo;
	}
	public void setLecNo(int lecNo) {
		this.lecNo = lecNo;
	}
	public String getLecName() {
		return lecName;
	}
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}
	public int getLecCredit() {
		return lecCredit;
	}
	public void setLecCredit(int lecCredit) {
		this.lecCredit = lecCredit;
	}
	public int getLecTime() {
		return lecTime;
	}
	public void setLecTime(int lecTime) {
		this.lecTime = lecTime;
	}
	public String getLecClass() {
		return lecClass;
	}
	public void setLecClass(String lecClass) {
		this.lecClass = lecClass;
	}
	
	
	
}
