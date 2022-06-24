package kr.co.nexteer.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/excel/downloadExcelFile1", method=RequestMethod.GET)
	public ModelAndView registerMember(@ModelAttribute MemberVO memberVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("main", "excel/excelDownloadView.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/excel/downloadExcelFile", method=RequestMethod.POST)
	public String downloadExcelFile(Model model) {
        /*String[] names = {"자몽", "애플망고", "멜론", "오렌지"};
        long[] prices = {5000, 10000, 7000, 6000};
        int[] quantities = {50, 50, 40, 40};
        List<Fruit> list = service.makeFruitList(names, prices, quantities);*/
		List<CompanyVO> list = companyService.getCompanyList();
        
        SXSSFWorkbook workbook = service.makeSimpleFruitExcelWorkbook(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "거래처");
        
        System.out.println("실행완료");
        
        return "excelDownloadView";
    }
	
	@RequestMapping(value = "/excel/uploadExcelFile", method = RequestMethod.POST)
    public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
        MultipartFile file = null;
        Iterator<String> iterator = request.getFileNames();
        if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
        ExcelVO excelVO = service.uploadExcelFile(file);
        companyService.registerCompanies(excelVO.getCompanyVO());        
        companyCustomerService.registerCompanyCustomers(excelVO.getCompanyCustomerVO());
        proposalHistoryService.registerProposalHistories(excelVO.getProposalHistoryVO());
        calllogService.registerCalllogs(excelVO.getCalllogVO());        
        
        model.addAttribute("list", excelVO.getCompanyVO());
        return "jsonView";
    }
}