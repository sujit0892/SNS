package com.db;

public class post {
	
	private int pid;
	private int userid;
	private String desc;
	private String posturl;
	
	public post(int pid, int userid,String desc, String posturl)
	{
		this.pid = pid;
		this.userid = userid;
		this.posturl = posturl;
		this.desc= desc;
		
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPosturl() {
		return posturl;
	}
	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}
	

}
