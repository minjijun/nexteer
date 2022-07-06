package kr.co.nexteer.repository;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.CompanyVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.company.";

	@Override
	public Integer getCompanyIndex() {
		return sqlSession.selectOne(nameSpace+"getCompanyIndex");
	}

	@Override
	public Integer getCompanyCount(String company_business_number) {
		return sqlSession.selectOne(nameSpace+"getCompanyCount", company_business_number);
	}

	@Override
	public Integer getCompanytIndexByBusinessNumber(String company_business_number) {
		return sqlSession.selectOne(nameSpace+"getCompanytIndexByBusinessNumber", company_business_number);
	}

	@Override
	public void registerCompany(CompanyVO companyVO) {
		sqlSession.insert(nameSpace+"registerCompany", companyVO);
	}
	
	@Override
	public void registerCompanies(List<CompanyVO> listCompanyVO) {
		sqlSession.insert(nameSpace+"registerCompanies", listCompanyVO);
	}

	@Override
	public List<CompanyVO> getCompanyList() {
		return sqlSession.selectList(nameSpace+"getCompanyList");
	}

	@Override
	public CompanyVO getCompany(Integer company_index) {
		return sqlSession.selectOne(nameSpace+"getCompany", company_index);
	}

	@Override
	public void updateCompany(CompanyVO companyVO) {
		sqlSession.update(nameSpace+"updateCompany", companyVO);
	}

	@Override
	public void deleteCompany(Integer company_index) {
		sqlSession.update(nameSpace+"deleteCompany", company_index);
	}
}
