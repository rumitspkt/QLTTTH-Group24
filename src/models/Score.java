package models;

import java.sql.Timestamp;

public class Score {
	private int id;
	private String firstName;
	private String lastName;
	private Timestamp birthDay;
	private String address;
	private Float firstScore;
	private Float secondScore;
	private int enrollment;
	public Score(int id, String firstName, String lastName, Timestamp birthDay, String address, Float firstScore,
			Float secondScore) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDay = birthDay;
		this.address = address;
		this.firstScore = firstScore;
		this.secondScore = secondScore;
	}
	
	
	public Score(Float firstScore, Float secondScore, int enrollment) {
		this.firstScore = firstScore;
		this.secondScore = secondScore;
		this.enrollment = enrollment;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Float getFirstScore() {
		return firstScore;
	}
	public void setFirstScore(Float firstScore) {
		this.firstScore = firstScore;
	}
	public Float getSecondScore() {
		return secondScore;
	}
	public void setSecondScore(Float secondScore) {
		this.secondScore = secondScore;
	}

	public int getEnrollment() {
		return enrollment;
	}

	public void setEnrollment(int enrollment) {
		this.enrollment = enrollment;
	}
	
	
}
