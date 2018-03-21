package com.db;

public class Like {

	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	int userid;
	public Like(int userid, int lid, int pid) {
		super();
		this.userid = userid;
		this.lid = lid;
		this.pid = pid;
	}
	int lid;
	int pid;
}
