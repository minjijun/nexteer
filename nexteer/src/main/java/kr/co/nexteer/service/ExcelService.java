package kr.co.nexteer.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nexteer.domain.CalllogVO;
import kr.co.nexteer.domain.CompanyCustomerVO;
import kr.co.nexteer.domain.CompanyVO;
import kr.co.nexteer.domain.ExcelVO;
import kr.co.nexteer.domain.Fruit;
import kr.co.nexteer.domain.ProposalHistoryVO;

@Service
public class ExcelService {
	
	@Inject
	MemberService memberService;
	
	@Inject
	CompanyService companyService;
	
	@Inject
	CompanyCustomerService companyCustomerService;
	
	@Inject
	ProposalHistoryService proposalHistoryService;
	
	@Inject
	CalllogService calllogService;
	
    /**
     * 엑셀파일로 만들 리스트 생성
     * @param names
     * @param prices
     * @param quantities
     * @return 엑셀파일 리스트
     */
    public ArrayList<Fruit> makeFruitList(String[] names, long[] prices, int[] quantities){
        ArrayList<Fruit> list = new ArrayList<Fruit>();
        for(int i=0; i< names.length; i++) {
            Fruit fruit = new Fruit(names[i], prices[i], quantities[i]);
            list.add(fruit);
        }
        return list;
    }
    
    /**
     * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
     * @param list
     * @return 생성된 워크북
     */
    public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<CompanyVO> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("거래처");
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        sheet.setColumnWidth(0, 10000);
        
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("인덱스");
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("회사명");
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("대표자명");
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("사업자등록번호");
        
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("지역");
        
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("사업장소재지");
        
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("홈페이지");
        
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("대표번호");
        
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("팩스번호");
        
        headerCell = headerRow.createCell(9);
        headerCell.setCellValue("대표이메일");
        
        // 거래처 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
        	CompanyVO companyVO = list.get(i);
        	
        	// 행 생성
            bodyRow = sheet.createRow(i+1);
            
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(companyVO.getCompany_index());
            
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(companyVO.getCompany_name());
            
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(companyVO.getCompany_president());
            
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(companyVO.getCompany_business_number());
            
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(companyVO.getCompany_region());
            
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(companyVO.getCompany_location());
            
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(companyVO.getCompany_website());
            
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(companyVO.getCompany_phone());
            
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(companyVO.getCompany_fax());
            
            bodyCell = bodyRow.createCell(9);
            bodyCell.setCellValue(companyVO.getCompany_email());
            
        	/*
            Fruit fruit = list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            // 데이터 번호 표시
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(i + 1);
            // 데이터 이름 표시
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(fruit.getName());
            // 데이터 가격 표시
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(fruit.getPrice());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(fruit.getQuantity());*/
        }
        
        return workbook;
    }
    
    /**
     * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소
     * @param list
     * @return
     */

    /**
     *업로드한 엑셀파일을 과일 리스트로 만들기
     * @param excelFile
     * @return 생성한 과일 리스트
     */
    public List<CompanyVO> uploadExcelFile0(MultipartFile excelFile){
        List<CompanyVO> list = new ArrayList<CompanyVO>();
        
        try {
            OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            
            // 첫번째 시트 불러오기
            XSSFSheet sheet = workbook.getSheetAt(0);
            Integer maxIndex = companyService.getCompanyIndex();
            
            for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
            	CompanyVO companyVO = new CompanyVO();
                XSSFRow row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }
                
                // 행의 두번째 열(이름부터 받아오기) 
                XSSFCell cell = row.getCell(0);
                if(null != cell) companyVO.setCompany_name(cell.getStringCellValue());
                
                // 행의 세번째 열 받아오기
                cell = row.getCell(1);
                if(null != cell) companyVO.setCompany_phone(cell.getStringCellValue());
                // 행의 네번째 열 받아오기
                cell = row.getCell(2);
                if(null != cell) companyVO.setCompany_email(cell.getStringCellValue());
                
                cell = row.getCell(3);
                if(null != cell) companyVO.setCompany_business_number(cell.getStringCellValue());
                
                cell = row.getCell(4);
                if(null != cell) companyVO.setCompany_region(cell.getStringCellValue());
                
                cell = row.getCell(5);
                if(null != cell) companyVO.setCompany_location(cell.getStringCellValue());
                
                String company_business_number = companyVO.getCompany_business_number();
                Integer count = companyService.getCompanyCount(company_business_number);
                if(count > 0) {
                	companyVO.setCompany_index(companyService.getCompanytIndexByBusinessNumber(company_business_number));
                } else {
                	companyVO.setCompany_index(maxIndex);
                	maxIndex = maxIndex + 1;
                }
                
                list.add(companyVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ExcelVO uploadExcelFile(MultipartFile excelFile){
    	//
    	//
    	//List<CalllogVO> listCalllogVO = new ArrayList<CalllogVO>();
    	//List<ProposalHistoryVO> listProposalHistoryVO = new ArrayList<ProposalHistoryVO>();
    	ExcelVO excelVO = new ExcelVO();
    	DataFormatter formatter = new DataFormatter();
    	List<CompanyVO> listOfDuplication = new ArrayList<CompanyVO>();

        try {
            OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            
            // 첫번째 시트 불러오기
            XSSFSheet sheet = workbook.getSheetAt(0);
            Integer maxCompanyIndex = companyService.getCompanyIndex();
            Integer maxCompanyCustomerIndex = companyCustomerService.getCompanyCustomerIndex();
            Integer maxProposalHistoryIndex = proposalHistoryService.getProposalHistoryIndex();
            Integer maxCalllogIndex = calllogService.getCalllogIndex();
            List<CompanyVO> listCompanyVO = new ArrayList<CompanyVO>();
            List<CompanyCustomerVO> listCompanyCustomerVO = new ArrayList<CompanyCustomerVO>();
            List<CalllogVO> listCalllogVO = new ArrayList<CalllogVO>();
            List<ProposalHistoryVO> listProposalHistoryVO = new ArrayList<ProposalHistoryVO>();
            
            for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
            	Integer memberIndex = 0;
            	Integer companyIndex;
            	Integer companyCustomerIndex;
            	CompanyVO companyVO = new CompanyVO();
            	Map<Integer,CompanyVO> mapOfcompanyVO = new HashMap<Integer,CompanyVO>();         	
            	CompanyCustomerVO companyCustomerVO = new CompanyCustomerVO();
            	
            	String proposal_history_suggested_product = null;
            	
                XSSFRow row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }
                
                // B열(우리담당자)
                XSSFCell cell = row.getCell(1);
                if(null != cell) {
                	memberIndex = memberService.getMemberIndexByMemberName(formatter.formatCellValue(cell)); //우리담당자 index
                }
                
                // C열(연락중 DB)
                cell = row.getCell(2);
                if(null != cell) {
                	proposal_history_suggested_product = formatter.formatCellValue(cell);
                }
                
                // H열(고객사)
                cell = row.getCell(7);
                if(null != cell) companyVO.setCompany_name(formatter.formatCellValue(cell));
                
                // N열(담당자)
                cell = row.getCell(13);
                if(null != cell) {
                	companyCustomerVO.setCompany_customer_index(maxCompanyCustomerIndex);
                	companyCustomerVO.setCompany_customer_name(formatter.formatCellValue(cell));
                	maxCompanyCustomerIndex = maxCompanyCustomerIndex + 1;
                }
                
                //O열(직급)                
                cell = row.getCell(14);
                if(null != cell) companyCustomerVO.setCompany_customer_position(formatter.formatCellValue(cell));
                
                //P열(전화번호)         
                cell = row.getCell(15);
                if(null != cell) {
                	companyVO.setCompany_phone(cell.getStringCellValue());
                	companyCustomerVO.setCompany_customer_phone(formatter.formatCellValue(cell));                	
                }
                
                //Q열(확인된핸드폰)         
                cell = row.getCell(16);
                if(null != cell) {
                	companyCustomerVO.setCompany_customer_phone(companyCustomerVO.getCompany_customer_phone() + "/"+ formatter.formatCellValue(cell));
                }
                
                //R열(e-mail)         
                cell = row.getCell(17);
                if(null != cell) {
                	companyVO.setCompany_email(formatter.formatCellValue(cell));
                	companyCustomerVO.setCompany_customer_email(formatter.formatCellValue(cell));
                }
                
                //S열(사업자등록번호)
                cell = row.getCell(18);
                if(null != cell) companyVO.setCompany_business_number(formatter.formatCellValue(cell));
                
                String company_business_number = companyVO.getCompany_business_number();
                Integer count = companyService.getCompanyCount(company_business_number);
                boolean flag = true;
                if(count > 0) {
                	//System.out.println("DB에 사업자등록번호가 중복된 것이 있는 경우");
            		//mapOfDuplication.put(i, companyVO);
                	companyVO.setExcel_row(i+1);
                	listOfDuplication.add(companyVO);
            		continue;
                } else {
	            	if(listOfDuplication.contains((Object)company_business_number)) {
	            		//System.out.println("중복리스트에 사업자등록번호가 중복된 것이 있는 경우");
	            		//mapOfDuplication.put(i, companyVO);
	            		companyVO.setExcel_row(i+1);
	                	listOfDuplication.add(companyVO);
	            		continue;
	            	} else {
	            		Iterator<CompanyVO> iterator = listCompanyVO.iterator();
	            		while(iterator.hasNext()) {
	            			if(iterator.next().getCompany_business_number().equals(company_business_number)) {
	                			//System.out.println("리스트에 사업자등록번호가 중복된 것이 있는 경우");
	                			//mapOfDuplication.put(i, companyVO);
	            				companyVO.setExcel_row(i+1);
	    	                	listOfDuplication.add(companyVO);
	                			flag = false;
	                			break;
	                		}
	            		}
	            		
	            		if(flag == false) continue;
	            		else {
	            			//System.out.println("리스트에 사업자등록번호가 중복된 것이 없는 경우");
		                	companyVO.setCompany_index(maxCompanyIndex);
		                	maxCompanyIndex = maxCompanyIndex + 1;
	            		}
	            	}	            	
                }                
                
                //T열(지역)
                cell = row.getCell(19);
                if(null != cell) companyVO.setCompany_region(formatter.formatCellValue(cell));
                
                //U열(주소)
                cell = row.getCell(20);
                if(null != cell) companyVO.setCompany_location(formatter.formatCellValue(cell));
                
                //Z열(자료전달일자)
                cell = row.getCell(25);
                String proposal_history_job_date = formatter.formatCellValue(cell).trim();
                Integer company_customer_index = companyCustomerVO.getCompany_customer_index();
                if(!proposal_history_job_date.equals("")) {
                	ProposalHistoryVO proposalHistoryVO = new ProposalHistoryVO();
                	proposalHistoryVO.setProposal_history_index(maxProposalHistoryIndex);
                	proposalHistoryVO.setProposal_history_suggested_product(proposal_history_suggested_product);
                	proposalHistoryVO.setCompany_customer_index(company_customer_index);
                	proposalHistoryVO.setMember_index(memberIndex);
                	proposalHistoryVO.setProposal_history_job("제안서 메일 전송");
                	proposalHistoryVO.setProposal_history_job_date(formatter.formatCellValue(cell));
                	maxProposalHistoryIndex = maxProposalHistoryIndex + 1;
                	listProposalHistoryVO.add(proposalHistoryVO);
                }
                
                //AB열(견적서발송일자)
                cell = row.getCell(27);
                proposal_history_job_date = formatter.formatCellValue(cell).trim();
                if(!proposal_history_job_date.equals("")) {
                	ProposalHistoryVO proposalHistoryVO = new ProposalHistoryVO();
                	proposalHistoryVO.setProposal_history_index(maxProposalHistoryIndex);
                	proposalHistoryVO.setProposal_history_suggested_product(proposal_history_suggested_product);
                	proposalHistoryVO.setCompany_customer_index(company_customer_index);
                	proposalHistoryVO.setMember_index(memberIndex);
                	proposalHistoryVO.setProposal_history_job("견적서 메일 전송");
                	proposalHistoryVO.setProposal_history_job_date(formatter.formatCellValue(cell));
                	maxProposalHistoryIndex = maxProposalHistoryIndex + 1;
                	listProposalHistoryVO.add(proposalHistoryVO);
                }
                
                companyIndex = companyVO.getCompany_index();
                companyCustomerIndex = companyCustomerVO.getCompany_customer_index();
                companyCustomerVO.setCompany_index(companyIndex);
                
                //AG열(4월 5일)~DO열(6월 30일)
                LocalDate ofDate = LocalDate.of(2022, 4, 5);
                for(int j=32; j<=118; j++) {
	                cell = row.getCell(j);
	                String calllog_call_contents = formatter.formatCellValue(cell).trim();
	                if(!calllog_call_contents.equals("")) {
	                	CalllogVO calllogVO = new CalllogVO();
	                	calllogVO.setCalllog_index(maxCalllogIndex);
	                	calllogVO.setCompany_index(companyIndex);
	                	calllogVO.setMember_index(memberIndex);
	                	calllogVO.setCompany_customer_index(companyCustomerIndex);	                	
	                	calllogVO.setCalllog_call_date(ofDate.format(DateTimeFormatter.ISO_DATE)); // LocalDate To String	                	
	                	calllogVO.setCalllog_call_contents(calllog_call_contents);
	                	
	                	ProposalHistoryVO proposalHistoryVO = new ProposalHistoryVO();
	                	proposalHistoryVO.setProposal_history_index(maxProposalHistoryIndex);
	                	proposalHistoryVO.setProposal_history_suggested_product(proposal_history_suggested_product);
	                	proposalHistoryVO.setCompany_customer_index(company_customer_index);
	                	proposalHistoryVO.setMember_index(memberIndex);
	                	proposalHistoryVO.setProposal_history_job("통화");
	                	proposalHistoryVO.setProposal_history_job_date(ofDate.format(DateTimeFormatter.ISO_DATE));
	                	
	                	listCalllogVO.add(calllogVO);
	                	listProposalHistoryVO.add(proposalHistoryVO);
	                	
	                	maxCalllogIndex = maxCalllogIndex + 1;
	                	ofDate = ofDate.plusDays(1); // LocalDate + 1(내일)
	                	maxProposalHistoryIndex = maxProposalHistoryIndex + 1;
	                }
                }
                
                listCompanyVO.add(companyVO);
                listCompanyCustomerVO.add(companyCustomerVO);
            }
            
            excelVO.setListCompanyVO(listCompanyVO);
            excelVO.setCompanyCustomerVO(listCompanyCustomerVO);
            excelVO.setProposalHistoryVO(listProposalHistoryVO);
            excelVO.setCalllogVO(listCalllogVO);
            excelVO.setListOfDuplication(listOfDuplication);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return excelVO;    	
    }
}
