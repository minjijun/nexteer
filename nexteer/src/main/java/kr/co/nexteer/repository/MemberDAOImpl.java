package kr.co.nexteer.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.member.";
	
	
	@Override
	public Integer getMemberIndex() {
		return sqlSession.selectOne(nameSpace+"getMemberIndex");
	}

	@Override
	public void registerMember(MemberVO memberVO) {
		sqlSession.insert(nameSpace+"registerMember", memberVO);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return sqlSession.selectList(nameSpace+"getMemberList");
	}

	@Override
	public MemberVO getMember(Integer member_index) {
		return sqlSession.selectOne(nameSpace+"getMember", member_index);
	}

	@Override
	public MemberVO getMemberById(String member_id) {
		return sqlSession.selectOne(nameSpace+"getMemberById", member_id);
	}

	@Override
	public MemberVO getMemberByIdPwd(MemberVO memberVO) {
		return sqlSession.selectOne(nameSpace+"getMemberByIdPwd", memberVO);
	}

	@Override
	public Integer selectIdCount(String id) {
		return sqlSession.selectOne(nameSpace+"selectIdCount", id);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		sqlSession.update(nameSpace+"updateMember", memberVO);
	}

	@Override
	public void deleteMember(Integer member_index) {
		sqlSession.update(nameSpace+"deleteMember", member_index);
	}

}
