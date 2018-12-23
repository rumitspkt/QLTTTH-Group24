package models;

import java.sql.Timestamp;

public class Enrollment {
	private int id;
	private int course;
	private int student;
	private Timestamp enrolledDate;
	private int certificate;
	private Timestamp receivedCertificateDate;
	public Enrollment(int id, int course, int student, Timestamp enrolledDate, int certificate,
			Timestamp receivedCertificateDate) {
		this.id = id;
		this.course = course;
		this.student = student;
		this.enrolledDate = enrolledDate;
		this.certificate = certificate;
		this.receivedCertificateDate = receivedCertificateDate;
	}
	public Enrollment(int course, int student, Timestamp enrolledDate, int certificate,
			Timestamp receivedCertificateDate) {
		this.course = course;
		this.student = student;
		this.enrolledDate = enrolledDate;
		this.certificate = certificate;
		this.receivedCertificateDate = receivedCertificateDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCourse() {
		return course;
	}
	public void setCourse(int course) {
		this.course = course;
	}
	public int getStudent() {
		return student;
	}
	public void setStudent(int student) {
		this.student = student;
	}
	public Timestamp getEnrolledDate() {
		return enrolledDate;
	}
	public void setEnrolledDate(Timestamp enrolledDate) {
		this.enrolledDate = enrolledDate;
	}
	public int getCertificate() {
		return certificate;
	}
	public void setCertificate(int certificate) {
		this.certificate = certificate;
	}
	public Timestamp getReceivedCertificateDate() {
		return receivedCertificateDate;
	}
	public void setReceivedCertificateDate(Timestamp receivedCertificateDate) {
		this.receivedCertificateDate = receivedCertificateDate;
	}
	
	
}
