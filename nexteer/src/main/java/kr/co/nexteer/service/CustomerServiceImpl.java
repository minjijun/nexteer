package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.domain.CustomerVO;
import kr.co.nexteer.repository.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Inject
	CustomerDAO customerDAO;
	
	@Override
	public List<CustomerVO> getCustomerList() {
		return customerDAO.getCustomerList();
	}

	@Override
	public List<CustomerVO> getCustomerListOfJob1() {
		return customerDAO.getCustomerListOfJob1();
	}

	@Override
	public List<CustomerVO> getCustomerListOfJob2() {
		return customerDAO.getCustomerListOfJob2();
	}

	@Override
	public List<CustomerVO> getCustomerListByMemberIndex(Integer member_index) {
		return customerDAO.getCustomerListByMemberIndex(member_index);
	}

	@Override
	public List<CustomerVO> getCustomer(CalllogVO calllogVO) {
		return customerDAO.getCustomer(calllogVO);
	}
	
}
