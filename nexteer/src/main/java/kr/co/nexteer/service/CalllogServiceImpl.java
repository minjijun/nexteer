package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.repository.CalllogDAO;

@Service
public class CalllogServiceImpl implements CalllogService {

	@Inject
	private CalllogDAO calllogDAO;
	
	@Override
	public Integer getCalllogIndex() {
		return calllogDAO.getCalllogIndex();
	}

	@Override
	public void registerCalllog(CalllogVO callogVO) {
		calllogDAO.registerCalllog(callogVO);
	}
	
	@Override
	public void registerCalllogs(List<CalllogVO> listCalllogVO) {
		calllogDAO.registerCalllogs(listCalllogVO);
	}

	@Override
	public List<CalllogVO> getCalllogList(Integer company_index) {
		return calllogDAO.getCalllogList(company_index);
	}

	@Override
	public CalllogVO getCalllog(Integer calllog_index) {
		return calllogDAO.getCalllog(calllog_index);
	}

	@Override
	public void updateCalllog(CalllogVO callogVO) {
		calllogDAO.updateCalllog(callogVO);
	}	
}
