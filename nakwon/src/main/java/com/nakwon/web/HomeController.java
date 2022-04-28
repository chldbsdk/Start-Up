package com.nakwon.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nakwon.domain.ManagerVO;
import com.nakwon.service.ManagerService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ManagerService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "project/main/main";
	}
	
	//로그인 페이지 진입
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "project/manager/login";
	}
	
	//로그인 체크
	@RequestMapping(value="/logincheck",method=RequestMethod.POST)
	public String logincheck(HttpServletRequest request, ManagerVO vo, RedirectAttributes rttr) throws Exception {
//		System.out.println("login 메서드 진입");
//		System.out.println("전달된 데이터 : "+vo);
		
		HttpSession session = request.getSession();
		ManagerVO lvo = service.login(vo);
		
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result",result);
			return "redirect:/login";
		}
		
		session.setAttribute("member", lvo); //임시코드 신경 ㄴㄴ
		
		return "redirect:/managerMain"; //성공 시 관리자 메인으로 이동
	}
	//관리자페이지 메인
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		
		return "project/manager/managerMain";
	}
	
	//로그인 페이지 진입
		@RequestMapping(value = "/location", method = RequestMethod.GET)
		public String location() {
			return "project/location/location";
		}
	
}