package kr.co.nexteer.domain;

import java.sql.Timestamp;

public class Memberlog_index {
	private Integer memberlog_index;
	private Integer member_index;
	private Integer memberlog_sessionid;
	private Timestamp memberlog_login_time;
	private Timestamp memberlog_logout_time;
	public Integer getMemberlog_index() {
		return memberlog_index;
	}
	public void setMemberlog_index(Integer memberlog_index) {
		this.memberlog_index = memberlog_index;
	}
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public Integer getMemberlog_sessionid() {
		return memberlog_sessionid;
	}
	public void setMemberlog_sessionid(Integer memberlog_sessionid) {
		this.memberlog_sessionid = memberlog_sessionid;
	}
	public Timestamp getMemberlog_login_time() {
		return memberlog_login_time;
	}
	public void setMemberlog_login_time(Timestamp memberlog_login_time) {
		this.memberlog_login_time = memberlog_login_time;
	}
	public Timestamp getMemberlog_logout_time() {
		return memberlog_logout_time;
	}
	public void setMemberlog_logout_time(Timestamp memberlog_logout_time) {
		this.memberlog_logout_time = memberlog_logout_time;
	}
}
