package com.nakwon.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nakwon.domain.ManagerVO;
import com.nakwon.domain.MenuVO;
import com.nakwon.domain.ReservationVO;
import com.nakwon.service.ManagerService;
import com.nakwon.service.MenuService;
import com.nakwon.service.ReservationHoldService;

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
	private ReservationHoldService reservationholdservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "project/main/main";
	}

	// 관리자 로그인 mapping
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "project/manager/login";
	}

	// 로그인 체크
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String logincheck(HttpServletRequest request, ManagerVO vo, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		ManagerVO lvo = service.login(vo);

		if (lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login";
		}

		session.setAttribute("member", lvo); // 임시코드 신경 ㄴㄴ

		return "redirect:/managerMain"; // 성공 시 관리자 페이지로 이동
	}

	// 메인 페이지 mapping
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "project/main/main";
	}

	// 관리자 페이지 mapping
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {

		return "project/manager/managerMain";
	}

	//메뉴등록
	@RequestMapping(value="/managerMain", method=RequestMethod.POST)
	public String managerMainMenuAddPOST(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		menuservice.insert(vo);
		model.addAttribute("list", menuservice.menuListAll());
		return "redirect:/managerMain";
	}
	
	// 오시는길 mapping
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location() {
		return "project/location/location";
	}

	// 예약 메인 mapping
	@RequestMapping(value = "/reservationMain", method = RequestMethod.GET)
	public String reservationMain() {
		return "project/reservation/reservationMain";
	}

	// 예약 페이지 mapping, 첫 번째 select박스 만들 데이터 전송
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Model model) throws Exception {
		model.addAttribute("menuList", menuservice.menuListAll()); // 첫 번째 select박스
		System.out.println("MenuVO1 POST Called");
		
		return "project/reservation/reservation";
	}

	// 예약 페이지 두 번째 select박스 만들기
	@RequestMapping(value = "/selectMenuCodeName", method = RequestMethod.POST)
	@ResponseBody //데이터를 넘겨줄 때 JSON형태로 변경해 주는 역할을 함. 
	public ResponseEntity<List<MenuVO>> select_ajax(String Code) throws Exception{
		ResponseEntity<List<MenuVO>> entity = null;
		//System.out.println("MenuVO2 POST1 Called"); 
		//System.out.println(Code); //jsp에서 받은 파라미터 값 확인 
		try { 
			List<MenuVO> list = menuservice.menuCodeListAll(Code);//select문 실행 
			//System.out.println("MenuVO2 POST2 Called");
			//System.out.println(list); //select문 실행 결과(list값) 확인 
			entity = new ResponseEntity<List<MenuVO>>(list, HttpStatus.OK);
;		} catch(Exception e) {
			e.printStackTrace(); //에러일 경우 에러 코드 전송 400 
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
			System.out.println("error"); 
		}
		return entity; 
	}
	
	// 예약 등록
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public String reservationAddPOST(ReservationVO vo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("ReservationVO POST Called");
		System.out.println(request.getParameter("rsrvDate"));
		
		
		try {
			ReservationVO rsrv = new ReservationVO();
			rsrv.setRsrvCode(request.getParameter("rsrvCode"));
			rsrv.setName(request.getParameter("name"));
			rsrv.setPhone(request.getParameter("phone"));
			rsrv.setEmail(request.getParameter("email"));
			
			//문자열 -> 시간으로 변환
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜 format
			Date date = format.parse(request.getParameter("rsrvDate")); //문자열 -> Date타입으로 변경
			Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp타입으로 변경
			rsrv.setRsvDate(timestamp);
			
			rsrv.setPnum(Integer.parseInt(request.getParameter("Pnum")));
			rsrv.setCode(request.getParameter("courseselect"));
			rsrv.setMenuCode(request.getParameter("menuselect"));
			rsrv.setMessage(request.getParameter("message"));
			// 예약등록 실행
			reservationholdservice.insertReservationHold(vo);
			System.out.println("예약 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("error");
			return "redirect:/reservationFail"; //실패 시 예약 실패 페이지로 이동
		}
		return "redirect:/reservationSuccess"; // 성공 시 예약 성공 페이지로 이동
	}

	// 메인1 페이지 mapping
	@RequestMapping(value = "/Main1", method = RequestMethod.GET)
	public String Main1() {
		return "project/main/Main1";
	}

	// 예약 등록 성공 페이지 mapping
	@RequestMapping(value = "/reservationSuccess", method = RequestMethod.GET)
	public String reservationSuccess(Locale locale, Model model) {
		return "project/reservation/reservationSuccess";
	}

	// 예약 등록 실패 페이지 mapping
	@RequestMapping(value = "/reservationFail", method = RequestMethod.GET)
	public String reservationFail(Locale locale, Model model) {
		return "project/reservation/reservationFail";
	}

}