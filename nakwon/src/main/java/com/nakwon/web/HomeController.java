package com.nakwon.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.List;
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
import com.nakwon.domain.MenuVO;
import com.nakwon.domain.ReservationVO;
import com.nakwon.service.ManagerService;
import com.nakwon.service.MenuService;
import com.nakwon.service.ReservationService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ManagerService service;
	
	@Inject
	private MenuService menuservice;
	
	@Inject
	private ReservationService reservationservice;

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
		
		return "home";
	}
	
	//관리자 로그인 mapping
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "project/manager/login";
	}
	
	//로그인 체크
	@RequestMapping(value="/logincheck",method=RequestMethod.POST)
	public String logincheck(HttpServletRequest request, ManagerVO vo, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		ManagerVO lvo = service.login(vo);
		
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result",result);
			return "redirect:/login";
		}
		
		session.setAttribute("member", lvo); //임시코드 신경 ㄴㄴ
		
		return "redirect:/managerMain"; //성공 시 관리자 페이지로 이동
	}
	
	
	
	//예약 등록
	@RequestMapping(value="/registerResv",method=RequestMethod.POST)
	public String registerResv(HttpServletRequest request, ReservationVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("registerResv 진입");
		
		//예약등록 서비스 실행
		reservationservice.insertReservation(vo);
		
		/*
		 * if(lvo == null) { //예약 등록 실패 int result = 0;
		 * rttr.addFlashAttribute("result",result); logger.info("예약 실패"); return
		 * "redirect:/reservationFail"; //실패 시 예약 실패 페이지로 이동 }
		 */
		logger.info("예약 성공");
		return "redirect:/reservationSuccess"; //성공 시 예약 성공 페이지로 이동
	}
	
	//메인 페이지 mapping
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "project/main/main";
	}
	
	//관리자 페이지 mapping
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		
		return "project/manager/managerMain";
	}
	
	//오시는길 mapping
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location() {
		return "project/location/location";
	}
	
	//예약 메인 mapping
	@RequestMapping(value = "/reservationMain", method = RequestMethod.GET)
	public String reservationMain() {
		return "project/reservation/reservationMain";
	}
	
	//예약 페이지 select박스 만들기
		/*
		 * @RequestMapping(value="/menuListAll", method=RequestMethod.GET) public void
		 * menuListAll(Model model) throws Exception {
		 * System.out.println("MenuVO POST Called"); List<MenuVO> menuList = null;
		 * menuList = menuservice.menuListAll();
		 * 
		 * model.addAttribute("menuList", menuList); }
		 */
	
	 //예약 페이지 mapping
	 @RequestMapping(value = "/reservation", method = RequestMethod.GET) 
	 public String reservation(Model model) throws Exception{ 
		 
			
		 model.addAttribute("menuList", menuservice.menuListAll());
		 System.out.println("MenuVO POST Called");
		 return "project/reservation/reservation"; 
	}
	 
	
	//메인1 페이지 mapping
	@RequestMapping(value = "/Main1", method = RequestMethod.GET)
	public String Main1() {
		return "project/main/Main1";
	}
	
	//예약 등록 성공 페이지 mapping
	@RequestMapping(value = "/reservationSuccess", method = RequestMethod.GET)
	public String reservationSuccess(Locale locale, Model model) {	
		return "project/manager/reservationSuccess";
	}
	
	//예약 등록 실패 페이지 mapping
	@RequestMapping(value = "/reservationFail", method = RequestMethod.GET)
	public String reservationFail(Locale locale, Model model) {	
		return "project/manager/reservationFail";
	}
	
}