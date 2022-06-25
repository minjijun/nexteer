package kr.co.nexteer.domain;

import java.time.LocalDateTime;

public class MemberVO {
	private Integer member_index;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_phone;
	private String member_mobile;
	private String member_email;
	private String member_position;
	private String member_authority;
	private String[] member_authorities;
	private String member_script1;
	private String member_script2;
	private LocalDateTime member_register_date;
	private LocalDateTime member_modify_date;
	private LocalDateTime member_delete_date;
	
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_mobile() {
		return member_mobile;
	}
	public void setMember_mobile(String member_mobile) {
		this.member_mobile = member_mobile;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_position() {
		return member_position;
	}
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
	public String getMember_authority() {
		return member_authority;
	}
	public void setMember_authority(String member_authority) {
		this.member_authority = member_authority;
	}
	public String[] getMember_authorities() {
		return member_authorities;
	}
	public void setMember_authorities(String[] member_authorities) {
		this.member_authorities = member_authorities;
	}
	public String getMember_script1() {
		return member_script1;
	}
	public void setMember_script1(String member_script1) {
		this.member_script1 = member_script1;
	}
	public String getMember_script2() {
		return member_script2;
	}
	public void setMember_script2(String member_script2) {
		this.member_script2 = member_script2;
	}
	public LocalDateTime getMember_register_date() {
		return member_register_date;
	}
	public void setMember_register_date(LocalDateTime member_register_date) {
		this.member_register_date = member_register_date;
	}
	public LocalDateTime getMember_modify_date() {
		return member_modify_date;
	}
	public void setMember_modify_date(LocalDateTime member_modify_date) {
		this.member_modify_date = member_modify_date;
	}
	public LocalDateTime getMember_delete_date() {
		return member_delete_date;
	}
	public void setMember_delete_date(LocalDateTime member_delete_date) {
		this.member_delete_date = member_delete_date;
	}	
}