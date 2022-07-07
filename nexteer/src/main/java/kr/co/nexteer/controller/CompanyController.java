package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataIntegrityViolationException;
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
	 * index.jsp의 sidebar에서 회사등록 메뉴를 클릭
	 */
	@RequestMapping(value="/company/registerCompany", method=RequestMethod.GET)
	public ModelAndView registerCompany(@ModelAttribute CompanyVO companyVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("main", "company/registerCompany.jsp");
		return mav;
	}
	
	/**
	 * registerCompany.jsp에서 사업자등록번호 중복검사 버튼 클릭
	 */
	@RequestMapping(value="/company/checkBusinessNumber", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkBusinessNumber(String company_business_number) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Integer cnt = companyService.getCompanyCount(company_business_number); //DB에서 사업자등록번호 검색
			if(cnt == 0) {
				result.put("dup", "NO");//사업자등록번호 등록 가능
				result.put("status", "Ture");
			}
			else {
				result.put("dup","YES");//사업자등록번호 중복
				result.put("status", "False");
			}				
		} catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	/**
	 * registerCompany.jsp에서 회원등록 버튼 클릭
	 */
	@RequestMapping(value="/company/registerCompany", method=RequestMethod.POST)
	public ModelAndView registerCompany(CompanyVO companyVO, HttpSession session) {
		companyVO.setCompany_index(companyService.getCompanyIndex());
		companyService.registerCompany(companyVO); //DB에 삽입
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listCompanyVO", companyService.getCompanyList());
		mav.addObject("main", "company/companyList.jsp");
		return mav;
	}
	
	/**
	 * index.jsp의 sidebar에서 회사목록조회 메뉴를 클릭
	 */
	@RequestMapping(value="/company/getCompanyList", method=RequestMethod.GET)
	public ModelAndView getCompanyList(@ModelAttribute CompanyVO companyVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listCompanyVO", companyService.getCompanyList());
		mav.addObject("main", "company/companyList.jsp");
		return mav;
	}
	
	/**
	 * companyList.jsp에서 회사명을 클릭
	 */
	@RequestMapping(value="/company/getCompany", method=RequestMethod.GET)
	public ModelAndView getCompany(@ModelAttribute CompanyVO companyVO, Integer company_index) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("companyVO", companyService.getCompany(company_index));
		//mav.addObject("main", "company/companyView.jsp");
		mav.addObject("main", "company/modifyCompany.jsp");
		return mav;
	}
	
	/**
	 * modifyCompany.jsp에서 수정 버튼 클릭
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
	 * modifyCompany.jsp에서 삭제 버튼 클릭
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
