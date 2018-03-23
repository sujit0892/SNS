package com.db;

public class Message {
	
	private int mid;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private int sid;
	private int rid;
	private String msg;
	private int status;
	
	public Message(int sid,int rid,String msg,int status,int mid)
	{
		this.sid=sid;
		this.rid=rid;
		this.msg = msg;
		this.status = status;
		this.mid=mid;
	}

}
