package kr.co.nexteer.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class AuthInterceptor extends WebContentInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
		System.out.println("Intercept : "+ request.getRequestURI());
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		try {
			if(session.getAttribute("MEMBER") == null) { // 로그인 되어 있지 않으면 로그인 화면으로 이동
				if(request.getRequestURI().equals("/nexteer/join")) {
					return true;
				}
				System.out.println("Intercept1");
				mav.setViewName("member/login");
				throw new ModelAndViewDefiningException(mav);
			} else { //로그인 되어 있으면 인덱스 화면으로 이동
				System.out.println("Intercept2");
				mav.setViewName("index");
				mav.addObject("main", "main.jsp");
				return true;
			}
		} catch (Exception e) {
			System.out.println("Intercept3");
			mav.setViewName("redirect:/");
			throw new ModelAndViewDefiningException(mav);
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}