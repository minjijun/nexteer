package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.CalllogVO;

public interface CalllogService {
	public Integer getCalllogIndex();
	public void registerCalllog(CalllogVO callogVO);
	public void registerCalllogs(List<CalllogVO> listCalllogVO);
	public List<CalllogVO> getCalllogList(Integer company_index);
	public CalllogVO getCalllog(Integer calllog_index);
	public void updateCalllog(CalllogVO callogVO);
}
