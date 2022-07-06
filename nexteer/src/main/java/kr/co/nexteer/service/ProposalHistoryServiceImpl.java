package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.ProposalHistoryVO;
import kr.co.nexteer.repository.ProposalHistoryDAO;

@Service
public class ProposalHistoryServiceImpl implements ProposalHistoryService {

	@Inject
	private ProposalHistoryDAO proposalHistoryDAO;
	
	@Override
	public Integer getProposalHistoryIndex() {
		return proposalHistoryDAO.getProposalHistoryIndex();
	}

	@Override
	public ProposalHistoryVO getProposalHistoryByCompanyCustomerIndex(ProposalHistoryVO proposalHistoryVO) {
		return proposalHistoryDAO.getProposalHistoryByCompanyCustomerIndex(proposalHistoryVO);
	}

	@Override
	public void registerProposalHistory(ProposalHistoryVO proposalHistoryVO) {
		proposalHistoryDAO.registerProposalHistory(proposalHistoryVO);
	}

	@Override
	public void registerProposalHistories(List<ProposalHistoryVO> listProposalHistoryVO) {
		proposalHistoryDAO.registerProposalHistories(listProposalHistoryVO);
	}

	@Override
	public List<ProposalHistoryVO> getProposalHistoryList() {
		return proposalHistoryDAO.getProposalHistoryList();
	}

	@Override
	public List<ProposalHistoryVO> getProposalHistoryListByMemberIndex() {
		return proposalHistoryDAO.getProposalHistoryListByMemberIndex();
	}

	@Override
	public ProposalHistoryVO getProposalHistory(Integer proposal_history_index) {
		return proposalHistoryDAO.getProposalHistory(proposal_history_index);
	}

}
