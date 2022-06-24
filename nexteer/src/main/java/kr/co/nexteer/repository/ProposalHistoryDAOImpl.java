package kr.co.nexteer.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.ProposalHistoryVO;

@Repository
public class ProposalHistoryDAOImpl implements ProposalHistoryDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.proposalHistory.";

	@Override
	public Integer getProposalHistoryIndex() {
		return sqlSession.selectOne(nameSpace+"getProposalHistoryIndex");
	}

	@Override
	public void registerProposalHistory(ProposalHistoryVO proposalHistoryVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerProposalHistories(List<ProposalHistoryVO> listProposalHistoryVO) {
		sqlSession.insert(nameSpace+"registerProposalHistories", listProposalHistoryVO);
	}

	@Override
	public List<ProposalHistoryVO> getProposalHistoryList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProposalHistoryVO> getProposalHistoryListByMemberIndex() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProposalHistoryVO getProposalHistory(Integer proposal_history_index) {
		// TODO Auto-generated method stub
		return null;
	}

}
