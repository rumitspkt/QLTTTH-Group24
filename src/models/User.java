package models;

import java.sql.Timestamp;

public class User {
	private int id;
	private String type;
	private String username;
	private String hashPassword;
	private String firstName;
	private String lastName;
	private Timestamp birthDay;
	private String address;
	private String urlAvatar;
	private String email;
	private String maxim;
	public User(int id, String type, String username, String hashPassword, String firstName, String lastName,
			Timestamp birthDay, String address, String urlAvatar, String email, String maxim) {
		super();
		this.id = id;
		this.type = type;
		this.username = username;
		this.hashPassword = hashPassword;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDay = birthDay;
		this.address = address;
		this.urlAvatar = urlAvatar;
		this.email = email;
		this.maxim = maxim;
	}
	
	public User(String type, String username, String hashPassword, String email) {
		super();
		this.type = type;
		this.username = username;
		this.hashPassword = hashPassword;
		this.email = email;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUserName(String userName) {
		this.username = userName;
	}
	public String getHashPassword() {
		return hashPassword;
	}
	public void setHashPassword(String hashPassword) {
		this.hashPassword = hashPassword;
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
	public String getUrlAvatar() {
		return urlAvatar;
	}
	public void setUrlAvatar(String urlAvatar) {
		this.urlAvatar = urlAvatar;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMaxim() {
		return maxim;
	}
	public void setMaxim(String maxim) {
		this.maxim = maxim;
	}
	
}
