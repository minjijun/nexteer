package kr.co.nexteer.repository;

import java.util.List;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.domain.Criteria;
import kr.co.nexteer.domain.CustomerVO;

public interface CustomerDAO {
	public List<CustomerVO> getCustomerList();
	public List<CustomerVO> getCustomerListByCriteria(Criteria criteria);
	public List<CustomerVO> getCustomerListOfJob1();
	public List<CustomerVO> getCustomerListOfJob2();	
	public List<CustomerVO> getCustomerListByMemberIndex(Integer member_index);
	public List<CustomerVO> getCustomer(CalllogVO calllogVO);
}