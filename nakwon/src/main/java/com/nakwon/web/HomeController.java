package com.nakwon.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nakwon.domain.Criteria;
import com.nakwon.domain.IntroduceVO;
import com.nakwon.domain.ManagerVO;
import com.nakwon.domain.MenuVO;
import com.nakwon.domain.PageMaker;
import com.nakwon.domain.ReservationConfirmVO;
import com.nakwon.domain.ReservationHoldVO;
import com.nakwon.service.BoardService;
import com.nakwon.service.IntroduceService;
import com.nakwon.service.ManagerService;
import com.nakwon.service.MenuService;
import com.nakwon.service.ReservationConfirmService;
import com.nakwon.service.ReservationHoldService;
import java.util.Map;

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
	
	@Inject
	private IntroduceService introduceservice;
	
	@Inject
	private ReservationConfirmService reservationconfirmservice;
	
	@Inject
	private BoardService boardservice;

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
	
	// 관리자 페이지 mapping
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		return "project/manager/managerMain";
	}
	
	// 소개 등록
	@RequestMapping(value = "/introducecheck", method = RequestMethod.POST)
	public String managerMainIntroduceAddPOSTintroducecheck(IntroduceVO vo, Model model) throws Exception {
		System.out.println("IntroduceInsert GET Called");
		introduceservice.introduceinsert(vo);
	    model.addAttribute("list", introduceservice.introduceListAll());
	    return "redirect:/managerMain";
	}
	   
	// 메뉴등록
	@RequestMapping(value = "/menucheck", method = RequestMethod.POST)
	public String managerMainMenuAddPOSTmenucheck(MenuVO vo, Model model) throws Exception {
		System.out.println("ss GET Called");
	    menuservice.insert(vo);
	    model.addAttribute("list", menuservice.menuListAll());
	    return "redirect:/managerMain";
	}

	// 메인 페이지 mapping
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "project/main/main";
	}
	// 소개 페이지 mapping
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce(IntroduceVO vo, Model model, HttpServletRequest request) throws Exception {

		ObjectMapper objm = new ObjectMapper();
					
		List<IntroduceVO> introducelistAll = introduceservice.introduceListAll();
		String introduceListAll = objm.writeValueAsString(introducelistAll);
		model.addAttribute("introduceListAll",introduceListAll);
				
		return "project/Introduce/introduce";
	}
	
	// 메뉴코스만찬 페이지 mapping
		@RequestMapping(value = "/courseMenu", method = RequestMethod.GET)
		public String menu(MenuVO vo, Model model, HttpServletRequest request) throws Exception {

			ObjectMapper objm = new ObjectMapper();
				
			List<MenuVO> courselist=menuservice.courseCode();
			String codeList = objm.writeValueAsString(courselist);
			model.addAttribute("codeList",codeList);
				
			return "project/menu/courseMenu";
		}
			
		// 메뉴세트정찬 페이지 mapping
		@RequestMapping(value = "/setMenu", method = RequestMethod.GET)
		public String menuSet(MenuVO vo, Model model, HttpServletRequest request) throws Exception {
			ObjectMapper objm = new ObjectMapper();
				
			List<MenuVO> setlist=menuservice.setCode();
			String codeList = objm.writeValueAsString(setlist);
			model.addAttribute("codeList",codeList);
				
			return "project/menu/setMenu";
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
	
	// 예약 조회 페이지 mapping
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.GET)
	public String reservationCheck() {
		return "project/reservation/reservationCheck";
	}
	
	// 사용자 예약 조회 
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.POST)
	public String ReservationCheckPOST(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		Map<String,String> ConfirmCheck = new HashMap<String, String>(); //예약 확정 테이블로 보낼 map
		ConfirmCheck.put("RsrvCode", request.getParameter("rsrvCode")); 
		ConfirmCheck.put("Name", request.getParameter("Name")); 
		ConfirmCheck.put("Phone", request.getParameter("Phone"));
		
		Map<String,String> Check = new HashMap<String, String>(); //예약 보류 테이블로 보낼 map
		Check.put("RsrvCode", request.getParameter("rsrvCode")); 
		Check.put("Name", request.getParameter("Name")); 
		Check.put("Phone", request.getParameter("Phone"));
		
		int result;
		try {
			//예약 조회 실행(확정 테이블)
			ReservationConfirmVO confirmvo = reservationconfirmservice.userReservationCheck(ConfirmCheck);
			if (confirmvo == null) { //확정테이블에 정보가 없는 경우
				//예약 조회 실행(보류 테이블)
				ReservationHoldVO holdvo = reservationholdservice.userReservationCheck(Check);
				if (holdvo == null) { //보류테이블에 정보가 없는 경우
					result = 0; //조회 실패
					rttr.addFlashAttribute("result", result);
					return "redirect:/reservationCheck";
				}
				else { //정보가 있으면 보류 테이블의 정보를 리다이렉트로 보냄.
					result = 1; //조회 성공(보류 테이블)
					rttr.addAttribute("Name", holdvo.getName()); 
					rttr.addAttribute("Phone", holdvo.getPhone());
					rttr.addAttribute("RsrvCode", holdvo.getRsrvCode());
					rttr.addAttribute("Pnum", holdvo.getPnum());
					rttr.addAttribute("RsrvDate", holdvo.getRsrvDate()); 
					rttr.addAttribute("Message", holdvo.getMessage());
					rttr.addAttribute("Code", holdvo.getCode()); //정찬/만찬
					rttr.addAttribute("MenuCode", holdvo.getMenuCode()); //메뉴
					rttr.addAttribute("MenuCodeName", holdvo.getMenuCodeName());
					rttr.addAttribute("result", result); //조회 결과
				}
			}
			else { //정보가 있으면 확정 테이블의 정보를 리다이렉트로 보냄.
				result = 2; //조회 성공(확정 테이블)
				rttr.addAttribute("Name", confirmvo.getName()); 
				rttr.addAttribute("Phone", confirmvo.getPhone());
				rttr.addAttribute("RsrvCode", confirmvo.getRsrvCode());
				rttr.addAttribute("Pnum", confirmvo.getPnum());
				rttr.addAttribute("RsrvDate", confirmvo.getRsrvDate()); 
				rttr.addAttribute("Message", confirmvo.getMessage());
				rttr.addAttribute("Code", confirmvo.getCode()); //정찬/만찬
				rttr.addAttribute("MenuCode", confirmvo.getMenuCode()); //메뉴
				rttr.addAttribute("MenuCodeName",confirmvo.getMenuCodeName());
				rttr.addAttribute("result", result); //조회 결과
			}
		} catch(Exception e) {
			e.printStackTrace(); //에러일 경우 에러 코드 전송 400 
			System.out.println("error"); 
		}
		return "redirect:/userReservationCheck"; //예약자 조회 페이지로 이동
	}
	
	// 사용자 예약 조회 성공 페이지 mapping
	@RequestMapping(value = "/userReservationCheck", method = RequestMethod.GET)
	public String userReservationCheck(@RequestParam("Name") String Name, @RequestParam("Phone") String Phone, 
				@RequestParam("Pnum") int Pnum, @RequestParam("Code") String Code, @RequestParam("RsrvDate") Timestamp RsrvDate,
				@RequestParam("MenuCode") String MenuCode, @RequestParam("Message") String Message, @RequestParam("MenuCodeName") String MenuCodeName,
				@RequestParam("RsrvCode") String RsrvCode, @RequestParam("result") int result, Locale locale, Model model) { 
		String CodeName = "";
		if(Code.equals("course")) {
			CodeName = "만찬(풀코스)";
		}
		else if(Code.equals("set")) {
			CodeName = "정찬(세트메뉴)";
		}
		try {
			model.addAttribute("Name", Name);
			model.addAttribute("Phone", Phone);
			model.addAttribute("RsrvDate", RsrvDate);
			model.addAttribute("Pnum", Pnum);
			model.addAttribute("CodeName", CodeName);
			model.addAttribute("MenuCode", MenuCode);
			model.addAttribute("MenuCodeName", MenuCodeName);
			model.addAttribute("Message", Message);
			model.addAttribute("RsrvCode", RsrvCode);
			model.addAttribute("result", result);
		}catch(Exception e) {
			e.printStackTrace(); //에러일 경우 에러 코드 전송 400 
			System.out.println("error");
		}
		return "project/reservation/userReservationCheck";
	}

	// 예약 페이지 mapping
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Model model) throws Exception {
		//model.addAttribute("rsrvList", reservationholdservice.rsrvHoldListAll()); //예약보류리스트 불러오기
		return "project/reservation/reservation";
	}

	// 예약 페이지 두 번째 select박스 만들기
	@RequestMapping(value = "/selectMenuCodeName", method = RequestMethod.POST)
	@ResponseBody //데이터를 넘겨줄 때 JSON형태로 변경해 주는 역할을 함. 
	public ResponseEntity<List<MenuVO>> select_ajax(String Code) throws Exception{
		ResponseEntity<List<MenuVO>> entity = null;
		//System.out.println(Code); //jsp에서 받은 파라미터 값 확인 
		try { 
			List<MenuVO> list = menuservice.menuCodeListAll(Code);//select문 실행 
			//System.out.println(list); //select문 실행 결과(list값) 확인 
			entity = new ResponseEntity<List<MenuVO>>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace(); //에러일 경우 에러 코드 전송 400 
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
			System.out.println("error"); 
		}
		return entity; 
	}
	
	// 예약 등록
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public String reservationAddPOST(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		ReservationHoldVO rsrv = new ReservationHoldVO();
		rsrv.setRsrvCode(request.getParameter("rsrvCode"));
		rsrv.setName(request.getParameter("name"));
		rsrv.setPhone(request.getParameter("phone"));
		rsrv.setEmail(request.getParameter("email"));
		rsrv.setPnum(Integer.parseInt(request.getParameter("Pnum")));
		rsrv.setCode(request.getParameter("courseselect"));
		rsrv.setMenuCode(request.getParameter("menuselect"));
		rsrv.setMenuCodeName(request.getParameter("MenuCodeName"));
		rsrv.setMessage(request.getParameter("message"));
			
		//문자열 -> 시간으로 변환
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //날짜 format
		Date date = format.parse(request.getParameter("rsrvDate")); //문자열 -> Date타입으로 변경
		//System.out.println(date.getClass().getSimpleName()); //데이터 타입 확인
		Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp타입으로 변경
		rsrv.setRsrvDate(timestamp);
			
		//예약등록 실행
		reservationholdservice.insertReservationHold(rsrv);
	
		try {
			redirectAttributes.addAttribute("Name", rsrv.getName()); //redirecet할 곳에 파라미터 보내기, return할 때 ?로 같이 보내면 "--?--"로 mapping이 되어 에러가 남. 
			redirectAttributes.addAttribute("RsrvDate", timestamp);
			redirectAttributes.addAttribute("Pnum", rsrv.getPnum());
			redirectAttributes.addAttribute("Code", rsrv.getCode());
			redirectAttributes.addAttribute("MenuCode", rsrv.getMenuCode());
			redirectAttributes.addAttribute("Message", rsrv.getMessage());
			redirectAttributes.addAttribute("RsrvCode", rsrv.getRsrvCode());
			redirectAttributes.addAttribute("CodeName", request.getParameter("CodeName"));
			redirectAttributes.addAttribute("MenuCodeName", rsrv.getMenuCodeName());
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("redirect error");
		}
		return "redirect:/reservationSuccess"; // 성공 시 예약 성공 페이지로 이동
	}
	
	// 예약 등록 성공 페이지 mapping
	@RequestMapping(value = "/reservationSuccess", method = RequestMethod.GET)
	public String reservationSuccess(@RequestParam("Name") String Name, @RequestParam("RsrvDate") Timestamp RsrvDate,
			@RequestParam("Pnum") int Pnum, @RequestParam("Code") String Code,
			@RequestParam("MenuCode") String MenuCode, @RequestParam("Message") String Message,
			@RequestParam("CodeName") String CodeName, @RequestParam("MenuCodeName") String MenuCodeName,
			@RequestParam("RsrvCode") String RsrvCode, Locale locale, Model model) { 
				
		model.addAttribute("Name", Name);
		model.addAttribute("RsrvDate", RsrvDate);
		model.addAttribute("Pnum", Pnum);
		model.addAttribute("Code", Code);
		model.addAttribute("MenuCode", MenuCode);
		model.addAttribute("Message", Message);
		model.addAttribute("RsrvCode", RsrvCode);
		model.addAttribute("CodeName", CodeName);
		model.addAttribute("MenuCodeName", MenuCodeName);
		return "project/reservation/reservationSuccess";
	}
	
	// 예약 삭제
	@RequestMapping(value = "/removeReservation", method = RequestMethod.POST)
	public String removeReservation(@RequestParam("RsrvCode") String RsrvCode, @RequestParam("Phone") String Phone,
									@RequestParam("result") int result, RedirectAttributes rttr) throws Exception {
		Map<String,String> DeleteInfo = new HashMap<String, String>(); //예약 확정 테이블로 보낼 map
		DeleteInfo.put("RsrvCode", RsrvCode);
		DeleteInfo.put("Phone", Phone);
		
		int deleteResult = 0;
		try { 
			if(result == 2) { //확정 테이블에 있는 경우 //확정 테이블에서 예약 삭제
				reservationconfirmservice.deleteReservationConfirm(DeleteInfo); 
				reservationholdservice.deleteReservationHold(DeleteInfo); //보류 테이블에서 예약 삭제 
				deleteResult = 1; 
			} else if(result == 1){ //보류 테이블에만 있는 경우 //보류 테이블에서 예약 삭제
				reservationholdservice.deleteReservationHold(DeleteInfo); 
				deleteResult = 1; 
			}
		}catch(Exception e) { 
			e.printStackTrace();
			System.out.println("delete error"); 
		}
		rttr.addFlashAttribute("deleteResult", deleteResult);
		return "redirect:/rsrvDeleteSuccess";
	}
	
	// 예약 삭제 확인 페이지 mapping
	@RequestMapping(value = "/rsrvDeleteSuccess", method = RequestMethod.GET)
	public String rsrvDeleteSuccess() throws Exception {
		System.out.println("success");
		return "project/reservation/rsrvDeleteSuccess";
	}
	
	//예약 변경 페이지 mapping
	@RequestMapping(value="/modifyReservation", method=RequestMethod.GET) 
	public String rsrvModifyGet(@RequestParam("RsrvCode") String RsrvCode, @RequestParam("Phone") String Phone, @RequestParam("Name") String Name,
			@RequestParam("result") int result, RedirectAttributes rttr, Model model) throws Exception{
		Map<String,String> ModifyInfo = new HashMap<String, String>(); //예약 확정 테이블로 보낼 map
		ModifyInfo.put("RsrvCode", RsrvCode);
		ModifyInfo.put("Name", Name);
		ModifyInfo.put("Phone", Phone);
		ReservationHoldVO holdvo;
		ReservationConfirmVO confirmvo;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int modifyResult = 0;
		
		try { 
			if(result == 2) { //확정 테이블에 있는 경우 //확정 테이블꺼로 예약 수정, select
				confirmvo = reservationconfirmservice.userReservationCheck(ModifyInfo);
				String datetime = sdf.format(confirmvo.getRsrvDate());
				modifyResult = 1; 
				model.addAttribute("vo", confirmvo);
				model.addAttribute("datetime", datetime);
				model.addAttribute("result", result);
				model.addAttribute("modifyResult", modifyResult);
				System.out.println("confirm");
			} else if(result == 1){ //보류 테이블에만 있는 경우 //보류 테이블에서 예약 수정, select
				holdvo = reservationholdservice.userReservationCheck(ModifyInfo); 
				String datetime = sdf.format(holdvo.getRsrvDate());
				modifyResult = 1; 
				model.addAttribute("vo", holdvo);
				model.addAttribute("datetime", datetime);
				model.addAttribute("result", result);
				model.addAttribute("modifyResult", modifyResult);
				System.out.println("hold");
			}
		}catch(Exception e) { 
			e.printStackTrace();
			System.out.println("modifyGET error"); 
		}
		return "project/reservation/reservationModify"; 
	}
	
	// 예약 수정
	@RequestMapping(value = "/modifyReservation", method = RequestMethod.POST)
	public String rsrvModifyPOST(@RequestParam("result") int result, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		int modifyResult = 0;
		try {
			if(result == 2) { //확정 테이블일 경우, 확정 테이블 수정
				ReservationConfirmVO rsrv = new ReservationConfirmVO();
				rsrv.setRsrvCode(request.getParameter("rsrvCode"));
				rsrv.setName(request.getParameter("name"));
				rsrv.setPhone(request.getParameter("phone"));
				rsrv.setEmail(request.getParameter("email"));
				rsrv.setPnum(Integer.parseInt(request.getParameter("Pnum")));
				rsrv.setCode(request.getParameter("courseselect"));
				rsrv.setMenuCode(request.getParameter("menuselect"));
				rsrv.setMenuCodeName(request.getParameter("MenuCodeName"));
				rsrv.setMessage(request.getParameter("message"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //날짜 format
				Date date = format.parse(request.getParameter("rsrvDate")); //문자열 -> Date타입으로 변경
				Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp타입으로 변경
				rsrv.setRsrvDate(timestamp);
				reservationconfirmservice.modifyReservationConfirm(rsrv); //예약 수정
				rttr.addAttribute("Name", rsrv.getName()); 
				rttr.addAttribute("Phone", rsrv.getPhone());
				rttr.addAttribute("RsrvCode", rsrv.getRsrvCode());
				rttr.addAttribute("Pnum", rsrv.getPnum());
				rttr.addAttribute("RsrvDate", rsrv.getRsrvDate()); 
				rttr.addAttribute("Message", rsrv.getMessage());
				rttr.addAttribute("Code", rsrv.getCode()); 
				rttr.addAttribute("MenuCode", rsrv.getMenuCode());
				rttr.addAttribute("MenuCodeName", rsrv.getMenuCodeName());
				modifyResult = 1;
				
			} else if(result == 1){ //보류 테이블일 경우, 보류 테이블 수정
				ReservationHoldVO rsrv = new ReservationHoldVO();
				rsrv.setRsrvCode(request.getParameter("rsrvCode"));
				rsrv.setName(request.getParameter("name"));
				rsrv.setPhone(request.getParameter("phone"));
				rsrv.setEmail(request.getParameter("email"));
				rsrv.setPnum(Integer.parseInt(request.getParameter("Pnum")));
				rsrv.setCode(request.getParameter("courseselect"));
				rsrv.setMenuCode(request.getParameter("menuselect"));
				rsrv.setMenuCodeName(request.getParameter("MenuCodeName"));
				rsrv.setMessage(request.getParameter("message"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //날짜 format
				Date date = format.parse(request.getParameter("rsrvDate")); //문자열 -> Date타입으로 변경
				Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp타입으로 변경
				rsrv.setRsrvDate(timestamp);
				reservationholdservice.modifyReservationHold(rsrv); //예약 수정
				rttr.addAttribute("Name", rsrv.getName()); 
				rttr.addAttribute("Phone", rsrv.getPhone());
				rttr.addAttribute("RsrvCode", rsrv.getRsrvCode());
				rttr.addAttribute("Pnum", rsrv.getPnum());
				rttr.addAttribute("RsrvDate", rsrv.getRsrvDate()); 
				rttr.addAttribute("Message", rsrv.getMessage());
				rttr.addAttribute("Code", rsrv.getCode()); 
				rttr.addAttribute("MenuCode", rsrv.getMenuCode()); 
				rttr.addAttribute("MenuCodeName", rsrv.getMenuCodeName());
				modifyResult = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("modifyPOST error"); 
		}
		rttr.addAttribute("result", result);
		rttr.addFlashAttribute("modifyResult", modifyResult);
		return "redirect:/userReservationCheck"; // 성공 시 예약 수정 페이지로 이동
	}

	// 메인1 페이지 mapping
	@RequestMapping(value = "/Main1", method = RequestMethod.GET)
	public String Main1() {
		return "project/main/Main1";
	}
	
	//공지 페이지 mapping
		@RequestMapping(value = "/notice", method = RequestMethod.GET)
		public String notice(@ModelAttribute("cri") Criteria cri,MenuVO vo, Model model) throws Exception{
			model.addAttribute("list", boardservice.noticeCriteria(cri));
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    // pageMaker.setTotalCount(131);
		    pageMaker.setTotalCount(boardservice.noticeCountPaging(cri));
		    model.addAttribute("pageMaker", pageMaker);
		    
			return "project/board/notice";
		}
		
		@RequestMapping(value="/notice", method=RequestMethod.POST)
		public void noticePOST(ReservationHoldVO vo, Model model) throws Exception{
			
			model.addAttribute("list", boardservice.noticeListAll());
					
		}
		//문의 페이지 mapping
		@RequestMapping(value = "/QnA", method = RequestMethod.GET)
		public String QnA(@ModelAttribute("cri") Criteria cri,MenuVO vo, Model model) throws Exception{
			model.addAttribute("list", boardservice.qnaCriteria(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			// pageMaker.setTotalCount(131);
			pageMaker.setTotalCount(boardservice.qnaCountPaging(cri));
			model.addAttribute("pageMaker", pageMaker);
			    
			return "project/board/QnA";
		}
		//리뷰 페이지 mapping
		@RequestMapping(value = "/review", method = RequestMethod.GET)
		public String review(@ModelAttribute("cri") Criteria cri,MenuVO vo, Model model) throws Exception{
			model.addAttribute("list", boardservice.reviewCriteria(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			// pageMaker.setTotalCount(131);
			pageMaker.setTotalCount(boardservice.reviewCountPaging(cri));
			model.addAttribute("pageMaker", pageMaker);
			    
			return "project/board/review";
		}




}