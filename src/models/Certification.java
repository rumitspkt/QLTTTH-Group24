package models;

import java.awt.datatransfer.FlavorTable;
import java.sql.Timestamp;

public class Certification {
	private int id;
	private String title;
	private String description;
	private int userId;
	private String firstName;
	private String lastName;
	private Timestamp birthDay;
	private String address;
	private Timestamp receivedCertificateDate;
	private float firstScore;
	private float secondScore;
	private Timestamp enrolledDate;
	private int certificateId;
	private int enrollment;

	public Certification(int id, String title, String description) {
		this.id = id;
		this.title = title;
		this.description = description;
	}

	public Certification(String title, String description) {
		this.title = title;
		this.description = description;
	}

	public Certification(int userId, String firstName, String lastName, Timestamp enrolledDate, String address,
			String title, Timestamp receivedCertificateDate, float firstScore, float secondScore, int certificateId, int enrollment) {
		this.title = title;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.enrolledDate = enrolledDate;
		this.address = address;
		this.receivedCertificateDate = receivedCertificateDate;
		this.firstScore = firstScore;
		this.secondScore = secondScore;
		this.certificateId = certificateId;
		this.enrollment = enrollment;
	}
	
	public int getEnrollment() {
		return enrollment;
	}

	public void setEnrollment(int enrollment) {
		this.enrollment = enrollment;
	}

	public int getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(int certificateId) {
		this.certificateId = certificateId;
	}

	public Timestamp getEnrolledDate() {
		return enrolledDate;
	}

	public void setEnrolledDate(Timestamp enrolledDate) {
		this.enrolledDate = enrolledDate;
	}

	public float getFirstScore() {
		return firstScore;
	}

	public void setFirstScore(float firstScore) {
		this.firstScore = firstScore;
	}

	public float getSecondScore() {
		return secondScore;
	}

	public void setSecondScore(float secondScore) {
		this.secondScore = secondScore;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Timestamp getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Timestamp birthDay) {
		this.birthDay = birthDay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getReceivedCertificateDate() {
		return receivedCertificateDate;
	}

	public void setReceivedCertificateDate(Timestamp receivedCertificateDate) {
		this.receivedCertificateDate = receivedCertificateDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
