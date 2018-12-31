package models;

import java.sql.Timestamp;

public class Post {
	private int id;
	private String posterUrl;
	private int lecturer;
	private Timestamp date;
	private int views;
	private String title;
	private String summary;
	private String content;
	private String status;
	private String category;
	private String lecturerName;
	
	public Post(int id, String posterUrl, int lecturer, Timestamp date, int views, String title, String summary,
			String content, String status) {
		this.id = id;
		this.posterUrl = posterUrl;
		this.lecturer = lecturer;
		this.date = date;
		this.views = views;
		this.title = title;
		this.summary = summary;
		this.content = content;
		this.status = status;
	}
	
	
	
	public Post(int id, String posterUrl, int lecturer, Timestamp date, int views, String title, String summary,
			String content, String status, String category, String lecturerName) {
		super();
		this.id = id;
		this.posterUrl = posterUrl;
		this.lecturer = lecturer;
		this.date = date;
		this.views = views;
		this.title = title;
		this.summary = summary;
		this.content = content;
		this.status = status;
		this.category = category;
		this.lecturerName = lecturerName;
	}

	
	public Post(String posterUrl, int lecturer, String title, String summary, String content) {
		this.posterUrl = posterUrl;
		this.lecturer = lecturer;
		this.title = title;
		this.summary = summary;
		this.content = content;
	}



	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPosterUrl() {
		return posterUrl;
	}
	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
