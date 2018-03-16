package com.db;

public class UserInfo {
	
	private int userid;
	private String emailid;
	private String status;
	private String name;
	private String dob;
	private String interestedIn;
	private String about;
	private String gender;
	private String dateOfjoin;
	private String picurl;
	
	
	public UserInfo(int userid, String emailid,String status,String name,
			String dob, String interestIn, String about,
			String gender, String dateOfJoin,String picurl)
	{
		this.userid =userid;
		this.emailid = emailid;
		this.status = status;
		this.name = name;
		this.dob = dob;
		this.interestedIn = interestIn;
		this.about = about;
		this.gender = gender;
		this.dateOfjoin = dateOfJoin;
		this.picurl = picurl; 
	}

	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}


	


	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getInterestedIn() {
		return interestedIn;
	}
	public void setInterestedIn(String interestedIn) {
		this.interestedIn = interestedIn;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateOfjoin() {
		return dateOfjoin;
	}
	public void setDateOfjoin(String dateOfjoin) {
		this.dateOfjoin = dateOfjoin;
	}


	public String getPicurl() {
		return picurl;
	}


	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}


}
