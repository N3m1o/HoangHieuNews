package com.laptrinhjavaweb.entity;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UserEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int userID;
	
	@Column(name = "username", columnDefinition = "nvarchar(20) not null")
	private String username;
	
	@Column(name = "password", columnDefinition = "nvarchar(20) not null")
	private String password;
	
	@Column(name = "fullname", columnDefinition = "nvarchar(30) not null")
	private String fullname;
	
	@Column(name = "date_of_birth")
	private Date dateOfBirth;
	
	@Column(nullable = false)
	private int gender;
	
	@Column(name = "is_author", nullable = false)
	private int isAuthor;
	
	@Column(name = "is_admin", nullable = false)
	private int isAdmin;
	
	@Column(columnDefinition = "nvarchar(500)")
	private String short_description;
	
	@Column(name = "user_img", columnDefinition = "nvarchar(500) default 'https://pdp.edu.vn/wp-content/uploads/2021/05/hinh-anh-mat-cuoi-dep-cute-cam-xuc.jpg'")
	private String user_img;
	
	public UserEntity() {
	}
	
	

	public UserEntity(int userID, String username, String password, String fullname, Date dateOfBirth, int gender,
			int isAuthor, int isAdmin) {
		super();
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.isAuthor = isAuthor;
		this.isAdmin = isAdmin;
	}



	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getIsAuthor() {
		return isAuthor;
	}

	public void setIsAuthor(int isAuthor) {
		this.isAuthor = isAuthor;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getShort_description() {
		return short_description;
	}
	
	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getUser_img() {
		return user_img;
	}
	
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	@Override
	public String toString() {
		return "UserEntity [userID=" + userID + ", username=" + username + ", password=" + password + ", fullname="
				+ fullname + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender + ", isAuthor=" + isAuthor
				+ ", isAdmin=" + isAdmin + ", short_description=" + short_description + ", user_img=" + user_img + "]";
	}

}
