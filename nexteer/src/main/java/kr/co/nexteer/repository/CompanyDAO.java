package kr.co.nexteer.repository;

import java.util.List;

import kr.co.nexteer.domain.CompanyVO;

public interface CompanyDAO {
	public Integer getCompanyIndex();
	public void registerCompany(CompanyVO companyVO);
	public List<CompanyVO> getCompanyList();
	public CompanyVO getCompany(Integer company_index);
	public void updateCompany(CompanyVO companyVO);
	public void deleteCompany(Integer company_index);
}
