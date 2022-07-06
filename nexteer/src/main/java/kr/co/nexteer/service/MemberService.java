package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.MemberVO;

public interface MemberService {
	public Integer getMemberIndex();
	public Integer getIdCount(String id);
	public Integer getMemberIndexByMemberName(String member_name);
	public void registerMember(MemberVO memberVO);
	public List<MemberVO> getMemberList();
	public MemberVO getMember(Integer member_index);
	public MemberVO getMemberById(String member_id);
	public MemberVO getMemberByIdPwd(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	public void deleteMember(Integer member_index);
	public void updateScript(MemberVO memberVO);
}
