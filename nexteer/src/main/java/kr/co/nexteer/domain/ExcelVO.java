package kr.co.nexteer.domain;

import java.util.List;
import java.util.Map;

public class ExcelVO {
	private List<CompanyVO> listCompanyVO;
	private List<CompanyCustomerVO> companyCustomerVO;
	private List<CalllogVO> calllogVO;
	private List<ProposalHistoryVO> proposalHistoryVO;
	private Map<Integer, CompanyVO> mapOfDuplication;
	private List<CompanyVO> listOfDuplication;
	
	public List<CompanyVO> getListCompanyVO() {
		return listCompanyVO;
	}
	public void setListCompanyVO(List<CompanyVO> listCompanyVO) {
		this.listCompanyVO = listCompanyVO;
	}
	public List<CompanyCustomerVO> getCompanyCustomerVO() {
		return companyCustomerVO;
	}
	public void setCompanyCustomerVO(List<CompanyCustomerVO> companyCustomerVO) {
		this.companyCustomerVO = companyCustomerVO;
	}
	public List<CalllogVO> getCalllogVO() {
		return calllogVO;
	}
	public void setCalllogVO(List<CalllogVO> calllogVO) {
		this.calllogVO = calllogVO;
	}
	public List<ProposalHistoryVO> getProposalHistoryVO() {
		return proposalHistoryVO;
	}
	public void setProposalHistoryVO(List<ProposalHistoryVO> proposalHistoryVO) {
		this.proposalHistoryVO = proposalHistoryVO;
	}
	public Map<Integer, CompanyVO> getMapOfDuplication() {
		return mapOfDuplication;
	}
	public void setMapOfDuplication(Map<Integer, CompanyVO> mapOfDuplication) {
		this.mapOfDuplication = mapOfDuplication;
	}
	public List<CompanyVO> getListOfDuplication() {
		return listOfDuplication;
	}
	public void setListOfDuplication(List<CompanyVO> listOfDuplication) {
		this.listOfDuplication = listOfDuplication;
	}
	
}
