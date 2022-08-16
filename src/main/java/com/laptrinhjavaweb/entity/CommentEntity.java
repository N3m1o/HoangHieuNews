package com.laptrinhjavaweb.entity;

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
@Table(name = "comment")
public class CommentEntity {
	@Id
	@Column(name = "comment_id", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentId;
	
	@Column(name = "main", columnDefinition = "nvarchar(MAX) not null")
	private String commentMain;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "news_id")
	private NewsEntity newsId;
	
	@Column(name = "comment_date")
	private Timestamp commentDate;
	
	public CommentEntity() {
		// TODO Auto-generated constructor stub
	}

	public CommentEntity(int commentId, String commentMain, UserEntity userId, NewsEntity newsId, Timestamp commentDate) {
		super();
		this.commentId = commentId;
		this.commentMain = commentMain;
		this.userId = userId;
		this.newsId = newsId;
		this.commentDate = commentDate;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCommentMain() {
		return commentMain;
	}

	public void setCommentMain(String commentMain) {
		this.commentMain = commentMain;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public NewsEntity getNewsId() {
		return newsId;
	}

	public void setNewsId(NewsEntity newsId) {
		this.newsId = newsId;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "CommentEntity [commentId=" + commentId + ", commentMain=" + commentMain + ", userId=" + userId
				+ ", newsId=" + newsId + ", commentDate=" + commentDate + "]";
	}
}
