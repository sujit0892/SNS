package com.db;

public class notify {
	
	public notify(int userid, String noti, int status) {
		super();
		this.userid = userid;
		this.noti = noti;
		this.status = status;
	}
	int userid;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getNoti() {
		return noti;
	}
	public void setNoti(String noti) {
		this.noti = noti;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	String noti;
	int status;

}
