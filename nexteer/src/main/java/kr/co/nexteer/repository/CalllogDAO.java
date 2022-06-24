package kr.co.nexteer.repository;

import java.util.List;

import kr.co.nexteer.domain.CalllogVO;

public interface CalllogDAO {
	public Integer getCalllogIndex();
	public void registerCalllogs(List<CalllogVO> listCalllogVO);
}
