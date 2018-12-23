package models;

import java.sql.Timestamp;

public class Notification {
	private int id;
	private String title;
	private String content;
	private String priority;
	private Timestamp date;
	public Notification(int id, String title, String content, String priority, Timestamp date) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.priority = priority;
		this.date = date;
	}
	public Notification(String title, String content, String priority, Timestamp date) {
		this.title = title;
		this.content = content;
		this.priority = priority;
		this.date = date;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
