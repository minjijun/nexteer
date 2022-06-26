package kr.co.nexteer.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.CalllogVO;

@Repository
public class CalllogDAOImpl implements CalllogDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.calllog.";
	
	@Override
	public Integer getCalllogIndex() {
		return sqlSession.selectOne(nameSpace+"getCalllogIndex");
	}

	@Override
	public void registerCalllog(CalllogVO callogVO) {
		sqlSession.insert(nameSpace+"registerCalllog", callogVO);
		
	}
	
	@Override
	public void registerCalllogs(List<CalllogVO> listCalllogVO) {
		sqlSession.insert(nameSpace+"registerCalllogs", listCalllogVO);
	}

	@Override
	public List<CalllogVO> getCalllogList(Integer company_index) {
		return sqlSession.selectList(nameSpace+"getCalllogList", company_index);
	}

	@Override
	public CalllogVO getCalllog(Integer calllog_index) {
		return sqlSession.selectOne(nameSpace+"getCalllog", calllog_index);
	}

	@Override
	public void updateCalllog(CalllogVO callogVO) {
		sqlSession.update(nameSpace+"updateCalllog", callogVO);
	}
}