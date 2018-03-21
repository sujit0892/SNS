package com.db;

public class Comment {
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public Comment(int cid, int pid, int userid, String comments) {
		super();
		this.cid = cid;
		this.pid = pid;
		this.userid = userid;
		this.comments = comments;
	}
	int cid;
	int pid;
	int userid;
	String comments;
	

}
