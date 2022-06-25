package kr.co.nexteer.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nexteer.domain.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.nexteer.customer.";
	
	@Override
	public List<CustomerVO> getCustomerList() {
		return sqlSession.selectList(nameSpace+"getCustomerList");
	}

	@Override
	public List<CustomerVO> getCustomerListOfJob1() {
		return sqlSession.selectList(nameSpace+"getCustomerListOfJob1");
	}

	@Override
	public List<CustomerVO> getCustomerListOfJob2() {
		return sqlSession.selectList(nameSpace+"getCustomerListOfJob2");
	}

	@Override
	public List<CustomerVO> getCustomerListByMemberIndex(Integer member_index) {
		return sqlSession.selectList(nameSpace+"getCustomerListByMemberIndex", member_index);
	}
}
