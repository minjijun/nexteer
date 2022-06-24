package kr.co.nexteer.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.CompanyCustomerVO;

@Repository
public class CompanyCustomerDAOImpl implements CompanyCustomerDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.companyCustomer.";
	
	@Override
	public Integer getCompanyCustomerIndex() {
		return sqlSession.selectOne(nameSpace+"getCompanyCustomerIndex");
	}

	@Override
	public Integer getCompanyCustomerCount(Integer company_customer_index, String company_customer_name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void registerCompanyCustomer(CompanyCustomerVO companyCustomerVO) {
		sqlSession.insert(nameSpace+"registerCompanyCustomer", companyCustomerVO);
	}

	@Override
	public void registerCompanyCustomers(List<CompanyCustomerVO> listCompanyCustomerVO) {
		sqlSession.insert(nameSpace+"registerCompanyCustomers", listCompanyCustomerVO);
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
