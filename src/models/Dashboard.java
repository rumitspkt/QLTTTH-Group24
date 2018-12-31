package models;

public class Dashboard {
	private int enrolledStudents;
	private int posts;
	private int grantedCertificates;
	private float totalEarnings;
	private int totalPost;
	private int totalTypeCertificate;
	private int totalUser;
	private int totalLecturer;
	public Dashboard(int enrolledStudents, int posts, int grantedCertificates, float totalEarnings) {
		super();
		this.enrolledStudents = enrolledStudents;
		this.posts = posts;
		this.grantedCertificates = grantedCertificates;
		this.totalEarnings = totalEarnings;
	}
	
	public Dashboard(float totalEarnings, int totalPost, int totalTypeCertificate, int totalUser, int totalLecturer) {
		super();
		this.totalEarnings = totalEarnings;
		this.totalPost = totalPost;
		this.totalTypeCertificate = totalTypeCertificate;
		this.totalUser = totalUser;
		this.totalLecturer = totalLecturer;
	}

	public int getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}

	public int getTotalTypeCertificate() {
		return totalTypeCertificate;
	}

	public void setTotalTypeCertificate(int totalTypeCertificate) {
		this.totalTypeCertificate = totalTypeCertificate;
	}

	public int getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}

	public int getTotalLecturer() {
		return totalLecturer;
	}

	public void setTotalLecturer(int totalLecturer) {
		this.totalLecturer = totalLecturer;
	}

	public int getEnrolledStudents() {
		return enrolledStudents;
	}
	public void setEnrolledStudents(int enrolledStudents) {
		this.enrolledStudents = enrolledStudents;
	}
	public int getPosts() {
		return posts;
	}
	public void setPosts(int posts) {
		this.posts = posts;
	}
	public int getGrantedCertificates() {
		return grantedCertificates;
	}
	public void setGrantedCertificates(int grantedCertificates) {
		this.grantedCertificates = grantedCertificates;
	}
	public float getTotalEarnings() {
		return totalEarnings;
	}
	public void setTotalEarnings(float totalEarnings) {
		this.totalEarnings = totalEarnings;
	}
	
	
}
