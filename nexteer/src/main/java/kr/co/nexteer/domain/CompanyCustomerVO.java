package kr.co.nexteer.domain;

import java.time.LocalDateTime;

public class CompanyCustomerVO {
	private Integer company_customer_index;
	private Integer company_index;
	private String company_customer_name;
	private String company_customer_position;
	private String company_customer_phone;
	private String company_customer_email;
	private String company_customer_status = "재직";
	private Integer member_index;
	private LocalDateTime company_customer_register_date;
	private LocalDateTime company_customer_modify_date;
	private LocalDateTime company_customer_delete_date;
	private String company_name;
	private String company_business_number;
	
	public Integer getCompany_customer_index() {
		return company_customer_index;
	}
	public void setCompany_customer_index(Integer company_customer_index) {
		this.company_customer_index = company_customer_index;
	}
	public Integer getCompany_index() {
		return company_index;
	}
	public void setCompany_index(Integer company_index) {
		this.company_index = company_index;
	}
	public String getCompany_customer_name() {
		return company_customer_name;
	}
	public void setCompany_customer_name(String company_customer_name) {
		this.company_customer_name = company_customer_name;
	}
	public String getCompany_customer_position() {
		return company_customer_position;
	}
	public void setCompany_customer_position(String company_customer_position) {
		this.company_customer_position = company_customer_position;
	}
	public String getCompany_customer_phone() {
		return company_customer_phone;
	}
	public void setCompany_customer_phone(String company_customer_phone) {
		this.company_customer_phone = company_customer_phone;
	}
	public String getCompany_customer_email() {
		return company_customer_email;
	}
	public void setCompany_customer_email(String company_customer_email) {
		this.company_customer_email = company_customer_email;
	}
	public String getCompany_customer_status() {
		return company_customer_status;
	}
	public void setCompany_customer_status(String company_customer_status) {
		this.company_customer_status = company_customer_status;
	}
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public LocalDateTime getCompany_customer_register_date() {
		return company_customer_register_date;
	}
	public void setCompany_customer_register_date(LocalDateTime company_customer_register_date) {
		this.company_customer_register_date = company_customer_register_date;
	}
	public LocalDateTime getCompany_customer_modify_date() {
		return company_customer_modify_date;
	}
	public void setCompany_customer_modify_date(LocalDateTime company_customer_modify_date) {
		this.company_customer_modify_date = company_customer_modify_date;
	}
	public LocalDateTime getCompany_customer_delete_date() {
		return company_customer_delete_date;
	}
	public void setCompany_customer_delete_date(LocalDateTime company_customer_delete_date) {
		this.company_customer_delete_date = company_customer_delete_date;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_business_number() {
		return company_business_number;
	}
	public void setCompany_business_number(String company_business_number) {
		this.company_business_number = company_business_number;
	}
}
