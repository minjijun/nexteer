package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.CompanyVO;
import kr.co.nexteer.repository.CompanyDAO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Inject
	private CompanyDAO companyDAO;
	
	@Override
	public Integer getCompanyIndex() {
		return companyDAO.getCompanyIndex();
	}

	@Override
	public void registerCompany(CompanyVO companyVO) {
		companyDAO.registerCompany(companyVO);
	}

	@Override
	public List<CompanyVO> getCompanyList() {
		return companyDAO.getCompanyList();
	}

	@Override
	public CompanyVO getCompany(Integer company_index) {
		return companyDAO.getCompany(company_index);
	}

	@Override
	public void updateCompany(CompanyVO companyVO) {
		companyDAO.updateCompany(companyVO);
	}

	@Override
	public void deleteCompany(Integer company_index) {
		companyDAO.deleteCompany(company_index);
	}

}
