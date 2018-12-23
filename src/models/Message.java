package models;

public class Message {
	private int id;
	private String emailOrPhone;
	private String senderName;
	private String subject;
	private String content;
	private int isRead;
	public Message(int id, String emailOrPhone, String senderName, String subject, String content, int isRead) {
		this.id = id;
		this.emailOrPhone = emailOrPhone;
		this.senderName = senderName;
		this.subject = subject;
		this.content = content;
		this.isRead = isRead;
	}
	public Message(String emailOrPhone, String senderName, String subject, String content, int isRead) {
		this.emailOrPhone = emailOrPhone;
		this.senderName = senderName;
		this.subject = subject;
		this.content = content;
		this.isRead = isRead;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmailOrPhone() {
		return emailOrPhone;
	}
	public void setEmailOrPhone(String emailOrPhone) {
		this.emailOrPhone = emailOrPhone;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	
}
