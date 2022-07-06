package kr.co.nexteer.repository;

import java.util.List;
import java.util.Map;

import kr.co.nexteer.domain.CompanyVO;

public interface CompanyDAO {
	public Integer getCompanyIndex();
	public Integer getCompanyCount(String company_business_number);
	public Integer getCompanytIndexByBusinessNumber(String company_business_number);
	public void registerCompany(CompanyVO companyVO);
	public void registerCompanies(List<CompanyVO> listCompanyVO);
	public List<CompanyVO> getCompanyList();
	public CompanyVO getCompany(Integer company_index);
	public void updateCompany(CompanyVO companyVO);
	public void deleteCompany(Integer company_index);
}
