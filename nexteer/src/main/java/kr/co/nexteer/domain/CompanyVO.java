package kr.co.nexteer.domain;

import java.sql.Timestamp;

public class CompanyVO {
	private Integer company_index;
	private String company_name;
	private String company_president;
	private String company_business_number;
	private String company_region;
	private String company_location;
	private String company_website;
	private String company_phone;
	private String company_fax;
	private String company_email;
	private Integer member_index;
	private Timestamp company_register_date;
	private Timestamp company_modify_date;
	private Timestamp company_delete_date;
	
	public Integer getCompany_index() {
		return company_index;
	}
	public void setCompany_index(Integer company_index) {
		this.company_index = company_index;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_president() {
		return company_president;
	}
	public void setCompany_president(String company_president) {
		this.company_president = company_president;
	}
	public String getCompany_business_number() {
		return company_business_number;
	}
	public void setCompany_business_number(String company_business_number) {
		this.company_business_number = company_business_number;
	}
	public String getCompany_region() {
		return company_region;
	}
	public void setCompany_region(String company_region) {
		this.company_region = company_region;
	}
	public String getCompany_location() {
		return company_location;
	}
	public void setCompany_location(String company_location) {
		this.company_location = company_location;
	}
	public String getCompany_website() {
		return company_website;
	}
	public void setCompany_website(String company_website) {
		this.company_website = company_website;
	}
	public String getCompany_phone() {
		return company_phone;
	}
	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}
	public String getCompany_fax() {
		return company_fax;
	}
	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public Timestamp getCompany_register_date() {
		return company_register_date;
	}
	public void setCompany_register_date(Timestamp company_register_date) {
		this.company_register_date = company_register_date;
	}
	public Timestamp getCompany_modify_date() {
		return company_modify_date;
	}
	public void setCompany_modify_date(Timestamp company_modify_date) {
		this.company_modify_date = company_modify_date;
	}
	public Timestamp getCompany_delete_date() {
		return company_delete_date;
	}
	public void setCompany_delete_date(Timestamp company_delete_date) {
		this.company_delete_date = company_delete_date;
	}
}
