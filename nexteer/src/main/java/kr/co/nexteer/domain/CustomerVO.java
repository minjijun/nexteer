package kr.co.nexteer.domain;

public class CustomerVO {
	private MemberVO memberVO;
	private CompanyVO companyVO;
	private CompanyCustomerVO companyCustomerVO;
	private ProposalHistoryVO proposalHistoryvo;
	private CalllogVO calllogVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CompanyVO getCompanyVO() {
		return companyVO;
	}
	public void setCompanyVO(CompanyVO companyVO) {
		this.companyVO = companyVO;
	}
	public CompanyCustomerVO getCompanyCustomerVO() {
		return companyCustomerVO;
	}
	public void setCompanyCustomerVO(CompanyCustomerVO companyCustomerVO) {
		this.companyCustomerVO = companyCustomerVO;
	}
	public ProposalHistoryVO getProposalHistoryvo() {
		return proposalHistoryvo;
	}
	public void setProposalHistoryvo(ProposalHistoryVO proposalHistoryvo) {
		this.proposalHistoryvo = proposalHistoryvo;
	}
	public CalllogVO getCalllogVO() {
		return calllogVO;
	}
	public void setCalllogVO(CalllogVO calllogVO) {
		this.calllogVO = calllogVO;
	}
}
