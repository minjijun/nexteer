package kr.co.nexteer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.nexteer.domain.MemberVO;
import kr.co.nexteer.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	MemberService mService;

	
	/**
	 * login.jsp에서 로그인 버튼 클릭
	 * (1) 아이디, 비밀번호 오류가 있는 경우
	 *     -> "POST"방식으로 redirect하면서 오류메세지 전송(URL에서 에러 메세지를 감춤)
	 *     -> /로 redirect 하는 이유는 URL 변경을 하지 않기 위해서임
	 * (2) 오류가 없는 경우 : 인덱스 화면으로 이동
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute("memberVO") @Valid MemberVO memberVO, HttpServletRequest request, HttpSession session,
			RedirectAttributes redirect) throws Exception {
		String url = null;
		MemberVO mVO = mService.getMemberById(memberVO.getMember_id()); //DB에서 사용자가 입력한 아이디를 조회
		if(mVO == null) { //로그인 실패 : 아이디가 존재하지 않음
		    redirect.addFlashAttribute("errmsg", "error.login.id"); //오류 메세지 저장
		    url = "redirect:/";
		} else {
			mVO = mService.getMemberByIdPwd(memberVO); //DB에서 사용자가 입력한 아이디와 비밀번호로 조회
			if(mVO == null) { //로그인 실패 : 비밀번호 오류
				redirect.addFlashAttribute("errmsg", "error.login.pwd");// 오류 메세지 저장
				url = "redirect:/";
			} else { //로그인 성공
				session.invalidate();
				HttpSession newsession = request.getSession();
				newsession.setAttribute("MEMBER", mVO); //세션에 MemberVO 저장
				url = "redirect:/index";
			}
		}
		return url;
	}
	
	/**
	 * index.jsp의 nav에서 로그아웃 버튼 클릭
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logoutget(HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate(); //세션 무효화
		HttpSession newsession = request.getSession();
		newsession.setAttribute("LOGOUT", "LOGOUT");
		return "redirect:/";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public ModelAndView registerMember(@ModelAttribute MemberVO memberVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("main", "member/registerForm.jsp");
		return mav;
	}
	
	/**
	 * registerForm.jsp에서 회원 등록 버튼 클릭
	 */
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView registerMember(MemberVO memberVO, HttpSession session) {
		memberVO.setMember_index(mService.getMemberIndex());
		mService.registerMember(memberVO); //DB에 삽입
		session.setAttribute("MEMBER", memberVO);//세션에 멤버 객체 저장
		return new ModelAndView("redirect:/index");
	}
	
	@RequestMapping(value="/getMemberList", method=RequestMethod.GET)
	public ModelAndView getMemberList(@ModelAttribute MemberVO memberVO, String main) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("listMemberVO", mService.getMemberList());
		mav.addObject("main", "member/memberList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/getMember", method=RequestMethod.GET)
	public ModelAndView getMember(@ModelAttribute MemberVO memberVO, Integer member_index) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("memberVO", mService.getMember(member_index));
		mav.addObject("main", "member/memberView.jsp");
		return mav;
	}
	
	/**
	 * showMember.jsp에서 수정 버튼 클릭
	 */
	@RequestMapping(value="/member/updateMember", method = RequestMethod.POST)
	public ModelAndView updateMember(MemberVO memberVO) throws Exception {
		ModelAndView mav = new ModelAndView("index");
		mService.updateMember(memberVO); //DB에 삽입
		mav.addObject("listMemberVO", mService.getMemberList());
		mav.addObject("main", "member/memberList.jsp");
		return mav;
	}
	
	/**
	 * showMember.jsp에서 삭제 버튼 클릭
	 */
	@RequestMapping(value="/member/deleteMember", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMember(MemberVO memberVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			mService.deleteMember(memberVO.getMember_index());//DB에서 삭제
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
}
