package kr.co.nexteer.service;

import java.util.List;

import kr.co.nexteer.domain.CustomerVO;

public interface CustomerService {
	public List<CustomerVO> getCustomerList();
	public List<CustomerVO> getCustomerListOfJob1();
	public List<CustomerVO> getCustomerListOfJob2();
	public List<CustomerVO> getCustomerListByMemberIndex(Integer member_index);
}
