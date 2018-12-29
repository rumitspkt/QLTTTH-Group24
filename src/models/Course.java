package models;

import java.sql.Timestamp;

public class Course {
	private int id;
	private String title;
	private String shortDescription;
	private String objective;
	private String eligibility;
	private String outline;
	private String schedules;
	private int totalSeat;
	private int availableSeat;
	private float fee;
	private int lecturer;
	private Timestamp date;
	private String lecturerName;
	private String category;
	private int categoryId;
	public Course(int id, String title, String shortDescription, String objective, String eligibility, String outline,
			String schedules, int totalSeat, int availableSeat, float fee, int lecturer, Timestamp date) {
		this.id = id;
		this.title = title;
		this.shortDescription = shortDescription;
		this.objective = objective;
		this.eligibility = eligibility;
		this.outline = outline;
		this.schedules = schedules;
		this.totalSeat = totalSeat;
		this.availableSeat = availableSeat;
		this.fee = fee;
		this.lecturer = lecturer;
		this.date = date;
	}
	
	public Course(int id, String title, String shortDescription, String objective, String eligibility, String outline,
			String schedules, int totalSeat, int availableSeat, float fee, int lecturer, Timestamp date,
			String lecturerName, String category, int categoryId) {
		this.id = id;
		this.title = title;
		this.shortDescription = shortDescription;
		this.objective = objective;
		this.eligibility = eligibility;
		this.outline = outline;
		this.schedules = schedules;
		this.totalSeat = totalSeat;
		this.availableSeat = availableSeat;
		this.fee = fee;
		this.lecturer = lecturer;
		this.date = date;
		this.lecturerName = lecturerName;
		this.category = category;
		this.categoryId = categoryId;
	}
	
	public Course(String title, String shortDescription, String objective, String eligibility, String outline,
			String schedules, int totalSeat, float fee, int lecturer) {
		this.title = title;
		this.shortDescription = shortDescription;
		this.objective = objective;
		this.eligibility = eligibility;
		this.outline = outline;
		this.schedules = schedules;
		this.totalSeat = totalSeat;
		this.fee = fee;
		this.lecturer = lecturer;
	}
	
	public Course(int id, String title, String shortDescription, String objective, String eligibility, String outline,
			String schedules, int totalSeat, float fee, int lecturer) {
		this.id = id;
		this.title = title;
		this.shortDescription = shortDescription;
		this.objective = objective;
		this.eligibility = eligibility;
		this.outline = outline;
		this.schedules = schedules;
		this.totalSeat = totalSeat;
		this.fee = fee;
		this.lecturer = lecturer;
	}
	
	

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public String getObjective() {
		return objective;
	}
	public void setObjective(String objective) {
		this.objective = objective;
	}
	public String getEligibility() {
		return eligibility;
	}
	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}
	public String getOutline() {
		return outline;
	}
	public void setOutline(String outline) {
		this.outline = outline;
	}
	public String getSchedules() {
		return schedules;
	}
	public void setSchedules(String schedules) {
		this.schedules = schedules;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	public int getAvailableSeat() {
		return availableSeat;
	}
	public void setAvailableSeat(int availableSeat) {
		this.availableSeat = availableSeat;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public int getLecturer() {
		return lecturer;
	}
	public void setLecturer(int lecturer) {
		this.lecturer = lecturer;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
