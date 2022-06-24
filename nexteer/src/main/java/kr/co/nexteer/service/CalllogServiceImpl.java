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
	public void registerCalllogs(List<CalllogVO> listCalllogVO) {
		calllogDAO.registerCalllogs(listCalllogVO);		
	}
}
