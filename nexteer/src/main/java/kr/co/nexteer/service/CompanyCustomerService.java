package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.CompanyCustomerVO;

public interface CompanyCustomerService {
	public Integer getCompanyCustomerIndex();
	public Integer getCompanyCustomerCount(Integer company_customer_index, String company_customer_name);
	public void registerCompanyCustomer(CompanyCustomerVO companyCustomerVO);
	public void registerCompanyCustomers(List<CompanyCustomerVO> companyCustomerVO);
	public List<CompanyCustomerVO> getCompanyCustomerList(Integer company_index);
	public CompanyCustomerVO getCompanyCustomer(Integer company_customer_index);
	public void deleteCompanyCustomer(List<CompanyCustomerVO> listcompanyCustomerVO);
}
