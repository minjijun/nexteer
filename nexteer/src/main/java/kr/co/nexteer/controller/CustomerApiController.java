package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nexteer.domain.Criteria;
import kr.co.nexteer.service.CriteriaService;

@Controller
public class CustomerApiController {
	@Inject
	private CriteriaService criteriaService;
	
	@RequestMapping(value="/api/search", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> apisearch(@RequestParam(defaultValue = "") String type, @RequestParam(defaultValue = "") String keyword,
			String filter_type, Integer filter) throws Exception {				
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if(keyword!=null || filter!=null) {
				Criteria criteria = new Criteria();
				criteria.setType(type);
				criteria.setKeyword(keyword);
				criteria.setFilter_type(filter_type);
				criteria.setFilter(filter);
				List<Map<String, Object>> listCustomerVO = (List<Map<String, Object>>) (List<?>) criteriaService.getCustomerListByCriteria(criteria);
				System.out.println(listCustomerVO);
				result.put("status", "True");
				result.put("listCustomerVO", listCustomerVO);
			}
		} catch (Exception e) {
			result.put("status","False");
		}
		return result;
	}	
}
