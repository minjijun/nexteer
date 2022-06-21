package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.CompanyVO;

public interface CompanyService {
	public Integer getCompanyIndex();
	public void registerCompany(CompanyVO companyVO);
	public List<CompanyVO> getCompanyList();
	public CompanyVO getCompany(Integer company_index);
	public void updateCompany(CompanyVO companyVO);
	public void deleteCompany(Integer company_index);
}
