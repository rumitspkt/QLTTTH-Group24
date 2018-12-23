package models;

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
	public Certification(int id, String title, String description) {
		this.id = id;
		this.title = title;
		this.description = description;
	}
	public Certification(String title, String description) {
		this.title = title;
		this.description = description;
	}
	
	public Certification(int userId, String firstName, String lastName, Timestamp birthDay,
			String address, String title, Timestamp receivedCertificateDate) {
		this.title = title;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDay = birthDay;
		this.address = address;
		this.receivedCertificateDate = receivedCertificateDate;
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
