package kr.co.nexteer.repository;

import java.util.List;

import kr.co.nexteer.domain.MemberVO;

public interface MemberDAO {
	public Integer getMemberIndex();
	public Integer getMemberIndexByMemberName(String member_name);
	public Integer getIdCount(String member_id);
	public void registerMember(MemberVO memberVO);
	public List<MemberVO> getMemberList();
	public MemberVO getMember(Integer member_index);
	public MemberVO getMemberById(String member_id);
	public MemberVO getMemberByIdPwd(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	public void deleteMember(Integer member_index);
	public void updateScript(MemberVO memberVO);
}
