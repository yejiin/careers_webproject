package com.multi.webproject.user;

public class UserVO {
	private String userid;
	private String username;
	private String userpw;
	private String userbirth;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", username=" + username + ", userpw=" + userpw + ", userbirth=" + userbirth
				+ "]";
	}
	
	
}
