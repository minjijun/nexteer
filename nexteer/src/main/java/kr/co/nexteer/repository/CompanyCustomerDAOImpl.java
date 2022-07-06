package kr.co.nexteer.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	public List<CompanyCustomerVO> getCompanyCustomerList(Integer company_index) {
		return sqlSession.selectList(nameSpace+"getCompanyCustomerList", company_index);
	}

	@Override
	public CompanyCustomerVO getCompanyCustomer(Integer company_customer_index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCompanyCustomer(List<CompanyCustomerVO> listcompanyCustomerVO) {
		sqlSession.update(nameSpace+"deleteCompanyCustomer", listcompanyCustomerVO);
	}

}
