package kr.co.nexteer.domain;

import java.util.List;

public class ExcelVO {
	private List<CompanyVO> companyVO;
	private List<CompanyCustomerVO> companyCustomerVO;
	private List<CalllogVO> calllogVO;
	private List<ProposalHistoryVO> proposalHistoryVO;
	public List<CompanyVO> getCompanyVO() {
		return companyVO;
	}
	public void setCompanyVO(List<CompanyVO> companyVO) {
		this.companyVO = companyVO;
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
}
