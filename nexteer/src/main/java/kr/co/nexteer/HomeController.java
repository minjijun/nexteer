package kr.co.nexteer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.nexteer.domain.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * 프로그램 시작
	 * 로그인 안 한 경우 : 홈 화면에서 로그인 화면으로 이동(url 변경없음)
	 * 로그인 한 경우 : 홈 화면에서 인덱스 화면으로 이동(url 변경)
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(@ModelAttribute MemberVO memberVO, BindingResult br,
			HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("MEMBER") == null) { //로그인 하지 않은 경우
			/**
			 * member/login.jsp에서 로그인 버튼 클릭
			 * -> 아이디, 비밀번호 오류로 BindingResult 사용해서 메세지 출력
			 * -> "POST"방식으로 redirect해서 오류 메세지 전송 {s} **/
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String errmsg = null;
		    if(flashMap != null){
		    	errmsg = (String) flashMap.get("errmsg");
		    }
		    /** "POST"방식으로 redirect할 때 파라미터 전송 {e} **/
			if(errmsg != null) { //에러메세지가 있는 경우 에러메세지 출력
				br.reject(errmsg);
				mav.getModel().putAll(br.getModel());
			}
			mav.setViewName("member/login"); //로그인 화면으로 이동
		} else { //로그인 한 경우
			mav.setViewName("redirect:/index"); //인덱스 화면으로 이동
		}
		return mav;
	}
	
	/**
	 * 로그인 한 경우에만 인덱스 화면 호출 -> include로 main.jsp를 오픈
	 * 로그인부터 로그아웃까지 인터셉터(kr.co.util.AuthInterceptor)에서 로그인 검사를 하기 때문에 로그인 검사는 하지 않음
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("main", "index_main.jsp");
		return mav;
	}
}
