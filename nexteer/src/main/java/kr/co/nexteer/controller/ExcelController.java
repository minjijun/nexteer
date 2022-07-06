package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nexteer.domain.CompanyVO;
import kr.co.nexteer.domain.ExcelVO;
import kr.co.nexteer.domain.MemberVO;
import kr.co.nexteer.service.CalllogService;
import kr.co.nexteer.service.CompanyCustomerService;
import kr.co.nexteer.service.CompanyService;
import kr.co.nexteer.service.ExcelService;
import kr.co.nexteer.service.ProposalHistoryService;

@Controller
public class ExcelController {
	
	@Inject
	ExcelService service;
	
	@Inject
	CompanyService companyService;
	
	@Inject
	CompanyCustomerService companyCustomerService;
	
	@Inject

	ProposalHistoryService proposalHistoryService;
	
	@Inject
	CalllogService calllogService;
	
	/**
	 * index.jsp의 navbar에서 엑셀업로드다운로드 클릭
	 */
	@RequestMapping(value="/excel/excelProcess", method=RequestMethod.GET)
	public ModelAndView excelProcess() throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("main", "excel/excelDownloadView.jsp");
		return mav;
	}
	
	/**
	 * excelDownloadView.jsp에서 업로드 버튼 클릭
	 */
	@RequestMapping(value = "/excel/uploadExcelFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadExcelFile(MultipartHttpServletRequest request, Model model) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		MultipartFile file = null;
        Iterator<String> iterator = request.getFileNames();
        if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
        ExcelVO excelVO = service.uploadExcelFile(file);
        
        try {
        	// 파일에 사업자번호 중복된 것이 없는 경우
            if(excelVO.getListOfDuplication().isEmpty()) {
            	List<CompanyVO> listCompanyVO = excelVO.getListCompanyVO();
    	        companyService.registerCompanies(listCompanyVO);
    	        companyCustomerService.registerCompanyCustomers(excelVO.getCompanyCustomerVO());
    	        proposalHistoryService.registerProposalHistories(excelVO.getProposalHistoryVO());
    	        calllogService.registerCalllogs(excelVO.getCalllogVO());
    	        
    	        result.put("rows", listCompanyVO);
            }
            // 파일에 사업자번호 중복된 것이 있는 경우
            else {
            	result.put("rows", excelVO.getListOfDuplication());
            }
            result.put("status", "True");
            System.out.println("성공");
        } catch(Exception e) {
			result.put("status", "False");
		}
        
        return result;
    }
	
	/**
	 * excelDownloadView.jsp에서 다운로드 버튼 클릭
	 */
	@RequestMapping(value = "/excel/downloadExcelFile", method=RequestMethod.POST)
	public String downloadExcelFile(Model model) {
		List<CompanyVO> list = companyService.getCompanyList();        
        SXSSFWorkbook workbook = service.makeSimpleFruitExcelWorkbook(list);        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "거래처DB");
        
        return "excelDownloadView";
    }
}
