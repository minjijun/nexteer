package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.domain.CustomerVO;
import kr.co.nexteer.service.CalllogService;
import kr.co.nexteer.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	CustomerService customerService;
	
	@Inject
	CalllogService calllogService;
	
	/**
	 * index.jsp의 sidebar에서 고객목록조회(전체) 메뉴를 클릭
	 */
	@RequestMapping(value="/customer/getCustomerList", method=RequestMethod.GET)
	public ModelAndView getCompanyList(@ModelAttribute CustomerVO customerVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		List<Map<String, Object>> listCustomerVO = (List<Map<String, Object>>) (List<?>) customerService.getCustomerList();
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
}
