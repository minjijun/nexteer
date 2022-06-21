package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nexteer.domain.CompanyVO;
import kr.co.nexteer.service.CompanyService;

@Controller
public class CompanyController {

	@Inject
	CompanyService companyService;

	/**
	 * 
	 */
	@RequestMapping(value="/registerCompany", method=RequestMethod.GET)
	public ModelAndView registerCompany(@ModelAttribute CompanyVO companyVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("main", "company/registerCompany.jsp");
		return mav;
	}
	
	/**
	 * registerForm.jsp에서 회원 등록 버튼 클릭
	 */
	@RequestMapping(value="/registerCompany", method=RequestMethod.POST)
	public ModelAndView registerCompany(CompanyVO companyVO, HttpSession session) {
		companyVO.setCompany_index(companyService.getCompanyIndex());
		companyService.registerCompany(companyVO); //DB에 삽입
		return new ModelAndView("redirect:/index");
	}
	
	@RequestMapping(value="/getCompanyList", method=RequestMethod.GET)
	public ModelAndView getCompanyList(@ModelAttribute CompanyVO companyVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listCompanyVO", companyService.getCompanyList());
		mav.addObject("main", "company/companyList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/getCompany", method=RequestMethod.GET)
	public ModelAndView getCompany(@ModelAttribute CompanyVO companyVO, Integer company_index) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("companyVO", companyService.getCompany(company_index));
		mav.addObject("main", "company/companyView.jsp");
		return mav;
	}
	
	/**
	 * showMember.jsp에서 수정 버튼 클릭
	 */
	@RequestMapping(value="/company/updateCompany", method = RequestMethod.POST)
	public ModelAndView updateCompany(CompanyVO companyVO) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		companyService.updateCompany(companyVO); //DB에 삽입
		mav.addObject("listCompanyVO", companyService.getCompanyList());
		mav.addObject("main", "company/companyList.jsp");
		return mav;
	}
	
	/**
	 * showMember.jsp에서 삭제 버튼 클릭
	 */
	@RequestMapping(value="/company/deleteCompany", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCompany(CompanyVO companyVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			companyService.deleteCompany(companyVO.getCompany_index());//DB에서 삭제
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
}
