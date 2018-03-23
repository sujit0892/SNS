package com.db;

public class notify {
	int pid;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public notify(int nid,int userid, String noti, int status,int pid) {
		super();
		this.userid = userid;
		this.noti = noti;
		this.status = status;
		this.nid = nid;
		this.pid = pid;
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
	
	int nid;
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	

}
