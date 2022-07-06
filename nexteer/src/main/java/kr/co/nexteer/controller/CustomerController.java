package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.domain.CompanyCustomerVO;
import kr.co.nexteer.domain.Criteria;
import kr.co.nexteer.domain.CustomerVO;
import kr.co.nexteer.domain.MemberVO;
import kr.co.nexteer.domain.ProposalHistoryVO;
import kr.co.nexteer.service.CalllogService;
import kr.co.nexteer.service.CompanyCustomerService;
import kr.co.nexteer.service.CompanyService;
import kr.co.nexteer.service.CriteriaService;
import kr.co.nexteer.service.CustomerService;
import kr.co.nexteer.service.MemberService;
import kr.co.nexteer.service.ProposalHistoryService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CustomerController {
	
	@Inject
	MemberService memberService;
	
	@Inject
	CompanyService companyService;
	
	@Inject
	CompanyCustomerService companyCustomerService;
	
	@Inject
	CustomerService customerService;
	
	@Inject
	CalllogService calllogService;
	
	@Inject
	CriteriaService criteriaService;
	
	@Inject
	ProposalHistoryService proposalHistoryService;
	
	/*
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String search() {
		return "home";
	}*/
	
	/**
	 * index.jsp의 sidebar에서 고객목록조회(전체) 메뉴를 클릭
	 */
	@RequestMapping(value="/customer/getCustomerList", method=RequestMethod.GET)
	public ModelAndView getCompanyList(@ModelAttribute CustomerVO customerVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		List<Map<String, Object>> listCustomerVO = (List<Map<String, Object>>) (List<?>) customerService.getCustomerList();
		mav.addObject("listMemberVO", memberService.getMemberList());
		mav.addObject("listCustomerVO", listCustomerVO);
		mav.addObject("main", "customer/customerList.jsp");
		return mav;
	}
	
	/**
	 * index.jsp의 sidebar에서 고객목록조회(제안서) 메뉴를 클릭
	 */
	@RequestMapping(value="/customer/getCustomerListOfJob1", method=RequestMethod.GET)
	public ModelAndView getCompanyListOfJob1(@ModelAttribute CustomerVO customerVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listCustomerVO", customerService.getCustomerListOfJob1());
		mav.addObject("main", "customer/customerList.jsp");
		return mav;
	}
	
	/**
	 * index.jsp의 sidebar에서 고객목록조회(견적서) 메뉴를 클릭
	 */
	@RequestMapping(value="/customer/getCustomerListOfJob2", method=RequestMethod.GET)
	public ModelAndView getCompanyListOfJob2(@ModelAttribute CustomerVO customerVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listCustomerVO", customerService.getCustomerListOfJob2());
		mav.addObject("main", "customer/customerList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/customer/getCustomer", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCustomer(Integer company_index, Integer member_index) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		CalllogVO calllogVO = new CalllogVO();
		calllogVO.setCompany_index(company_index);
		calllogVO.setMember_index(member_index);
		try {
			result.put("listCompanyCustomerVO", companyCustomerService.getCompanyCustomerList(company_index));
			result.put("customerVO", customerService.getCustomer(calllogVO));
			result.put("listCalllogVO", calllogService.getCalllogList(company_index));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/getCalllogList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCalllogList(Integer company_index) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("listCalllogVO", calllogService.getCalllogList(company_index));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/getCalllog", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCalllog(Integer calllog_index) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("calllogVO", calllogService.getCalllog(calllog_index));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/search", method=RequestMethod.GET)
	public ModelAndView search(String type, String keyword, String filter_type, Integer filter) throws Exception {
		Criteria criteria = new Criteria();
		criteria.setType(type);
		criteria.setKeyword(keyword);
		criteria.setFilter_type("%");
		criteria.setFilter(filter);
		ModelAndView mav = new ModelAndView("index");
		List<Map<String, Object>> listCustomerVO = (List<Map<String, Object>>) (List<?>) criteriaService.getCustomerListByCriteria(criteria);
		mav.addObject("listCustomerVO", listCustomerVO);
		mav.addObject("main", "customer/customerList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/customer/getCompany", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getCompany(Integer company_index) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("companyVO", companyService.getCompany(company_index));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/getCompanyCustomer", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getCompanyCustomer(Integer company_index) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("companyCustomerVO", companyCustomerService.getCompanyCustomer(company_index));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/getCompanyCustomerList", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> getCompanyCustomerList(HttpServletRequest request, Integer company_index) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			result.put("rows", companyCustomerService.getCompanyCustomerList(company_index));
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}

	@RequestMapping(value="/customer/updateCompanyCustomer", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCompanyCustomer(@RequestBody List<CompanyCustomerVO> listCompanyCustomerVO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		Integer max_company_customer_index = companyCustomerService.getCompanyCustomerIndex();
		for (CompanyCustomerVO list : listCompanyCustomerVO) {
		    if(list.getCompany_customer_index() == null) {
		    	list.setCompany_customer_index(max_company_customer_index);
		    	max_company_customer_index = max_company_customer_index + 1;
		    }
		}
		companyCustomerService.registerCompanyCustomers(listCompanyCustomerVO);
		try {
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/deleteCompanyCustomer", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCompanyCustomer(@RequestBody List<CompanyCustomerVO> listCompanyCustomerVO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		companyCustomerService.deleteCompanyCustomer(listCompanyCustomerVO);
		try {
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/registerCalllog1", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerCalllog1(@RequestBody CalllogVO calllogVO) throws Exception {
		System.out.println(calllogVO);
		Map<String, Object> result = new HashMap<>();
		if(calllogVO.getCalllog_index() == null) {
			calllogVO.setCalllog_index(calllogService.getCalllogIndex());
		}
		calllogService.registerCalllog(calllogVO);
		try {
			result.put("listCalllogVO", calllogService.getCalllogList(calllogVO.getCompany_index()));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/getScript", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> getScript(HttpServletRequest request, Integer member_index) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			result.put("memberVO", memberService.getMember(member_index));
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/updateScript", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateScript(@RequestBody MemberVO memberVO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		memberService.updateScript(memberVO);
		try {
			result.put("status", "True");
			result.put("memberVO", memberService.getMember(memberVO.getMember_index()));
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value="/customer/registerProposalHistory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerProposalHistory(@RequestBody ProposalHistoryVO proposalHistoryVO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		proposalHistoryVO.setProposal_history_index(proposalHistoryService.getProposalHistoryIndex());
		proposalHistoryService.registerProposalHistory(proposalHistoryVO);
		try {
			result.put("proposalHistoryVO", proposalHistoryService.getProposalHistoryByCompanyCustomerIndex(proposalHistoryVO));
			result.put("status", "True");
		} catch(Exception e) {
			result.put("status", "False");
		}
		return result;
	}
}