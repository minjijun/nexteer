package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.CompanyCustomerVO;
import kr.co.nexteer.repository.CompanyCustomerDAO;

@Service
public class CompanyCustomerServiceImpl implements CompanyCustomerService {

	@Inject
	private CompanyCustomerDAO companyCustomerDAO;
	
	@Override
	public Integer getCompanyCustomerIndex() {
		return companyCustomerDAO.getCompanyCustomerIndex();
	}

	@Override
	public Integer getCompanyCustomerCount(Integer company_customer_index, String company_customer_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerCompanyCustomer(CompanyCustomerVO companyCustomerVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerCompanyCustomers(List<CompanyCustomerVO> companyCustomerVO) {
		companyCustomerDAO.registerCompanyCustomers(companyCustomerVO);		
	}

	@Override
	public List<CompanyCustomerVO> getCompanyCustomerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CompanyCustomerVO getCompanyCustomer(Integer company_customer_index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCompanyCustomer(CompanyCustomerVO companyCustomerVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCompanyCustomer(Integer company_customer_index) {
		// TODO Auto-generated method stub

	}

}
