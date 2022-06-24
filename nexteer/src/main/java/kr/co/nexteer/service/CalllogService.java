package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.CalllogVO;

public interface CalllogService {
	public Integer getCalllogIndex();
	public void registerCalllogs(List<CalllogVO> listCalllogVO);
}
