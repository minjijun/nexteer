package kr.co.nexteer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.nexteer.domain.Criteria;
import kr.co.nexteer.domain.CustomerVO;
import kr.co.nexteer.repository.CustomerDAO;

@Service
public class CriteriaService {
	
	@Inject
	CustomerDAO customerDAO;
	
	public List<CustomerVO> getCustomerListByCriteria(Criteria criteria) {
		return customerDAO.getCustomerListByCriteria(criteria);
	}
}
