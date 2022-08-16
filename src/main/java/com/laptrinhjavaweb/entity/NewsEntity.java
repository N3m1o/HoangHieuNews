package com.laptrinhjavaweb.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "news")
public class NewsEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "news_id", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int newsId;
	
	@Column(name = "title", columnDefinition = "nvarchar(MAX) not null")
	private String title;
	
	@Column(name = "short_description", columnDefinition = "nvarchar(MAX) not null")
	private String shortDescription;
	
	@Column(name = "content", columnDefinition = "nvarchar(MAX) not null")
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cate_id")
	private CateEntity cateId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userId;
	
	@Column(nullable = false)
	private boolean status;
	
	@Column(name = "display_img", columnDefinition = "nvarchar(500)")
	private String display_img;
	
	@Column(name = "date_submitted")
	private Timestamp date_submitted; 
	
	
	



	public NewsEntity() {
	}

	

	public NewsEntity(int newsId, String title, String shortDescription, String content, CateEntity cateId,
			UserEntity userId, boolean status) {
		super();
		this.newsId = newsId;
		this.title = title;
		this.shortDescription = shortDescription;
		this.content = content;
		this.cateId = cateId;
		this.userId = userId;
		this.status = status;
	}



	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public CateEntity getCateId() {
		return cateId;
	}

	public void setCateId(CateEntity cateId) {
		this.cateId = cateId;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	

	public String getDisplay_img() {
		return display_img;
	}



	public void setDisplay_img(String display_img) {
		this.display_img = display_img;
	}


	public Timestamp getDate_submitted() {
		return date_submitted;
	}



	public void setDate_submitted(Timestamp date_submitted) {
		this.date_submitted = date_submitted;
	}
	@Override
	public String toString() {
		return "NewsEntity [newsId=" + newsId + ", title=" + title + ", shortDescription=" + shortDescription
				+ ", content=" + content + ", cateId=" + cateId + ", userId=" + userId + ", status=" + status
				+ ", display_img=" + display_img + "]";
	}

	
}
