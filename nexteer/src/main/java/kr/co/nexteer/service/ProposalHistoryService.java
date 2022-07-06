package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.ProposalHistoryVO;

public interface ProposalHistoryService {
	public Integer getProposalHistoryIndex();
	public void registerProposalHistory(ProposalHistoryVO proposalHistoryVO);
	public void registerProposalHistories(List<ProposalHistoryVO> listProposalHistoryVO);
	public List<ProposalHistoryVO> getProposalHistoryList();
	public List<ProposalHistoryVO> getProposalHistoryListByMemberIndex();
	public ProposalHistoryVO getProposalHistoryByCompanyCustomerIndex(ProposalHistoryVO proposalHistoryVO);
	public ProposalHistoryVO getProposalHistory(Integer proposal_history_index);
}
