package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.MemberVO;
import kr.co.nexteer.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	
	@Override
	public Integer getMemberIndex() {
		return memberDAO.getMemberIndex();
	}

	@Override
	public void registerMember(MemberVO memberVO) {
		memberDAO.registerMember(memberVO);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public MemberVO getMember(Integer member_index) {
		return memberDAO.getMember(member_index);
	}

	@Override
	public MemberVO getMemberById(String member_id) {
		return memberDAO.getMemberById(member_id);
	}

	@Override
	public MemberVO getMemberByIdPwd(MemberVO memberVO) {
		return memberDAO.getMemberByIdPwd(memberVO);
	}

	@Override
	public Integer selectIdCount(String id) {
		return memberDAO.selectIdCount(id);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void deleteMember(Integer member_index) {
		memberDAO.deleteMember(member_index);
	}

}
