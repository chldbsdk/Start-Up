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

	// ????????? ????????? mapping
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "project/manager/login";
	}

	// ????????? ??????
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String logincheck(HttpServletRequest request, ManagerVO vo, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		ManagerVO lvo = service.login(vo);
		if (lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login";
		}
		session.setAttribute("member", lvo); // ???????????? ?????? ??????
		return "redirect:/managerMain"; // ?????? ??? ????????? ???????????? ??????
	}
	
	// ????????? ????????? mapping
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		return "project/manager/managerMain";
	}
	
	// ?????? ??????
	@RequestMapping(value = "/introducecheck", method = RequestMethod.POST)
	public String managerMainIntroduceAddPOSTintroducecheck(IntroduceVO vo, Model model) throws Exception {
		System.out.println("IntroduceInsert GET Called");
		introduceservice.introduceinsert(vo);
	    model.addAttribute("list", introduceservice.introduceListAll());
	    return "redirect:/managerMain";
	}
	   
	// ????????????
	@RequestMapping(value = "/menucheck", method = RequestMethod.POST)
	public String managerMainMenuAddPOSTmenucheck(MenuVO vo, Model model) throws Exception {
		System.out.println("ss GET Called");
	    menuservice.insert(vo);
	    model.addAttribute("list", menuservice.menuListAll());
	    return "redirect:/managerMain";
	}

	// ?????? ????????? mapping
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "project/main/main";
	}
	// ?????? ????????? mapping
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce(IntroduceVO vo, Model model, HttpServletRequest request) throws Exception {

		ObjectMapper objm = new ObjectMapper();
					
		List<IntroduceVO> introducelistAll = introduceservice.introduceListAll();
		String introduceListAll = objm.writeValueAsString(introducelistAll);
		model.addAttribute("introduceListAll",introduceListAll);
				
		return "project/Introduce/introduce";
	}
	
	// ?????????????????? ????????? mapping
		@RequestMapping(value = "/courseMenu", method = RequestMethod.GET)
		public String menu(MenuVO vo, Model model, HttpServletRequest request) throws Exception {

			ObjectMapper objm = new ObjectMapper();
				
			List<MenuVO> courselist=menuservice.courseCode();
			String codeList = objm.writeValueAsString(courselist);
			model.addAttribute("codeList",codeList);
				
			return "project/menu/courseMenu";
		}
			
		// ?????????????????? ????????? mapping
		@RequestMapping(value = "/setMenu", method = RequestMethod.GET)
		public String menuSet(MenuVO vo, Model model, HttpServletRequest request) throws Exception {
			ObjectMapper objm = new ObjectMapper();
				
			List<MenuVO> setlist=menuservice.setCode();
			String codeList = objm.writeValueAsString(setlist);
			model.addAttribute("codeList",codeList);
				
			return "project/menu/setMenu";
		}

	// ???????????? mapping
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location() {
		return "project/location/location";
	}

	// ?????? ?????? mapping
	@RequestMapping(value = "/reservationMain", method = RequestMethod.GET)
	public String reservationMain() {
		return "project/reservation/reservationMain";
	}
	
	// ?????? ?????? ????????? mapping
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.GET)
	public String reservationCheck() {
		return "project/reservation/reservationCheck";
	}
	
	// ????????? ?????? ?????? 
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.POST)
	public String ReservationCheckPOST(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		Map<String,String> ConfirmCheck = new HashMap<String, String>(); //?????? ?????? ???????????? ?????? map
		ConfirmCheck.put("RsrvCode", request.getParameter("rsrvCode")); 
		ConfirmCheck.put("Name", request.getParameter("Name")); 
		ConfirmCheck.put("Phone", request.getParameter("Phone"));
		
		Map<String,String> Check = new HashMap<String, String>(); //?????? ?????? ???????????? ?????? map
		Check.put("RsrvCode", request.getParameter("rsrvCode")); 
		Check.put("Name", request.getParameter("Name")); 
		Check.put("Phone", request.getParameter("Phone"));
		
		int result;
		try {
			//?????? ?????? ??????(?????? ?????????)
			ReservationConfirmVO confirmvo = reservationconfirmservice.userReservationCheck(ConfirmCheck);
			if (confirmvo == null) { //?????????????????? ????????? ?????? ??????
				//?????? ?????? ??????(?????? ?????????)
				ReservationHoldVO holdvo = reservationholdservice.userReservationCheck(Check);
				if (holdvo == null) { //?????????????????? ????????? ?????? ??????
					result = 0; //?????? ??????
					rttr.addFlashAttribute("result", result);
					return "redirect:/reservationCheck";
				}
				else { //????????? ????????? ?????? ???????????? ????????? ?????????????????? ??????.
					result = 1; //?????? ??????(?????? ?????????)
					rttr.addAttribute("Name", holdvo.getName()); 
					rttr.addAttribute("Phone", holdvo.getPhone());
					rttr.addAttribute("RsrvCode", holdvo.getRsrvCode());
					rttr.addAttribute("Pnum", holdvo.getPnum());
					rttr.addAttribute("RsrvDate", holdvo.getRsrvDate()); 
					rttr.addAttribute("Message", holdvo.getMessage());
					rttr.addAttribute("Code", holdvo.getCode()); //??????/??????
					rttr.addAttribute("MenuCode", holdvo.getMenuCode()); //??????
					rttr.addAttribute("MenuCodeName", holdvo.getMenuCodeName());
					rttr.addAttribute("result", result); //?????? ??????
				}
			}
			else { //????????? ????????? ?????? ???????????? ????????? ?????????????????? ??????.
				result = 2; //?????? ??????(?????? ?????????)
				rttr.addAttribute("Name", confirmvo.getName()); 
				rttr.addAttribute("Phone", confirmvo.getPhone());
				rttr.addAttribute("RsrvCode", confirmvo.getRsrvCode());
				rttr.addAttribute("Pnum", confirmvo.getPnum());
				rttr.addAttribute("RsrvDate", confirmvo.getRsrvDate()); 
				rttr.addAttribute("Message", confirmvo.getMessage());
				rttr.addAttribute("Code", confirmvo.getCode()); //??????/??????
				rttr.addAttribute("MenuCode", confirmvo.getMenuCode()); //??????
				rttr.addAttribute("MenuCodeName",confirmvo.getMenuCodeName());
				rttr.addAttribute("result", result); //?????? ??????
			}
		} catch(Exception e) {
			e.printStackTrace(); //????????? ?????? ?????? ?????? ?????? 400 
			System.out.println("error"); 
		}
		return "redirect:/userReservationCheck"; //????????? ?????? ???????????? ??????
	}
	
	// ????????? ?????? ?????? ?????? ????????? mapping
	@RequestMapping(value = "/userReservationCheck", method = RequestMethod.GET)
	public String userReservationCheck(@RequestParam("Name") String Name, @RequestParam("Phone") String Phone, 
				@RequestParam("Pnum") int Pnum, @RequestParam("Code") String Code, @RequestParam("RsrvDate") Timestamp RsrvDate,
				@RequestParam("MenuCode") String MenuCode, @RequestParam("Message") String Message, @RequestParam("MenuCodeName") String MenuCodeName,
				@RequestParam("RsrvCode") String RsrvCode, @RequestParam("result") int result, Locale locale, Model model) { 
		String CodeName = "";
		if(Code.equals("course")) {
			CodeName = "??????(?????????)";
		}
		else if(Code.equals("set")) {
			CodeName = "??????(????????????)";
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
			e.printStackTrace(); //????????? ?????? ?????? ?????? ?????? 400 
			System.out.println("error");
		}
		return "project/reservation/userReservationCheck";
	}

	// ?????? ????????? mapping
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Model model) throws Exception {
		//model.addAttribute("rsrvList", reservationholdservice.rsrvHoldListAll()); //????????????????????? ????????????
		return "project/reservation/reservation";
	}

	// ?????? ????????? ??? ?????? select?????? ?????????
	@RequestMapping(value = "/selectMenuCodeName", method = RequestMethod.POST)
	@ResponseBody //???????????? ????????? ??? JSON????????? ????????? ?????? ????????? ???. 
	public ResponseEntity<List<MenuVO>> select_ajax(String Code) throws Exception{
		ResponseEntity<List<MenuVO>> entity = null;
		//System.out.println(Code); //jsp?????? ?????? ???????????? ??? ?????? 
		try { 
			List<MenuVO> list = menuservice.menuCodeListAll(Code);//select??? ?????? 
			//System.out.println(list); //select??? ?????? ??????(list???) ?????? 
			entity = new ResponseEntity<List<MenuVO>>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace(); //????????? ?????? ?????? ?????? ?????? 400 
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
			System.out.println("error"); 
		}
		return entity; 
	}
	
	// ?????? ??????
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
			
		//????????? -> ???????????? ??????
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //?????? format
		Date date = format.parse(request.getParameter("rsrvDate")); //????????? -> Date???????????? ??????
		//System.out.println(date.getClass().getSimpleName()); //????????? ?????? ??????
		Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp???????????? ??????
		rsrv.setRsrvDate(timestamp);
			
		//???????????? ??????
		reservationholdservice.insertReservationHold(rsrv);
	
		try {
			redirectAttributes.addAttribute("Name", rsrv.getName()); //redirecet??? ?????? ???????????? ?????????, return??? ??? ???? ?????? ????????? "--?--"??? mapping??? ?????? ????????? ???. 
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
		return "redirect:/reservationSuccess"; // ?????? ??? ?????? ?????? ???????????? ??????
	}
	
	// ?????? ?????? ?????? ????????? mapping
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
	
	// ?????? ??????
	@RequestMapping(value = "/removeReservation", method = RequestMethod.POST)
	public String removeReservation(@RequestParam("RsrvCode") String RsrvCode, @RequestParam("Phone") String Phone,
									@RequestParam("result") int result, RedirectAttributes rttr) throws Exception {
		Map<String,String> DeleteInfo = new HashMap<String, String>(); //?????? ?????? ???????????? ?????? map
		DeleteInfo.put("RsrvCode", RsrvCode);
		DeleteInfo.put("Phone", Phone);
		
		int deleteResult = 0;
		try { 
			if(result == 2) { //?????? ???????????? ?????? ?????? //?????? ??????????????? ?????? ??????
				reservationconfirmservice.deleteReservationConfirm(DeleteInfo); 
				reservationholdservice.deleteReservationHold(DeleteInfo); //?????? ??????????????? ?????? ?????? 
				deleteResult = 1; 
			} else if(result == 1){ //?????? ??????????????? ?????? ?????? //?????? ??????????????? ?????? ??????
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
	
	// ?????? ?????? ?????? ????????? mapping
	@RequestMapping(value = "/rsrvDeleteSuccess", method = RequestMethod.GET)
	public String rsrvDeleteSuccess() throws Exception {
		System.out.println("success");
		return "project/reservation/rsrvDeleteSuccess";
	}
	
	//?????? ?????? ????????? mapping
	@RequestMapping(value="/modifyReservation", method=RequestMethod.GET) 
	public String rsrvModifyGet(@RequestParam("RsrvCode") String RsrvCode, @RequestParam("Phone") String Phone, @RequestParam("Name") String Name,
			@RequestParam("result") int result, RedirectAttributes rttr, Model model) throws Exception{
		Map<String,String> ModifyInfo = new HashMap<String, String>(); //?????? ?????? ???????????? ?????? map
		ModifyInfo.put("RsrvCode", RsrvCode);
		ModifyInfo.put("Name", Name);
		ModifyInfo.put("Phone", Phone);
		ReservationHoldVO holdvo;
		ReservationConfirmVO confirmvo;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int modifyResult = 0;
		
		try { 
			if(result == 2) { //?????? ???????????? ?????? ?????? //?????? ??????????????? ?????? ??????, select
				confirmvo = reservationconfirmservice.userReservationCheck(ModifyInfo);
				String datetime = sdf.format(confirmvo.getRsrvDate());
				modifyResult = 1; 
				model.addAttribute("vo", confirmvo);
				model.addAttribute("datetime", datetime);
				model.addAttribute("result", result);
				model.addAttribute("modifyResult", modifyResult);
				System.out.println("confirm");
			} else if(result == 1){ //?????? ??????????????? ?????? ?????? //?????? ??????????????? ?????? ??????, select
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
	
	// ?????? ??????
	@RequestMapping(value = "/modifyReservation", method = RequestMethod.POST)
	public String rsrvModifyPOST(@RequestParam("result") int result, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		int modifyResult = 0;
		try {
			if(result == 2) { //?????? ???????????? ??????, ?????? ????????? ??????
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
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //?????? format
				Date date = format.parse(request.getParameter("rsrvDate")); //????????? -> Date???????????? ??????
				Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp???????????? ??????
				rsrv.setRsrvDate(timestamp);
				reservationconfirmservice.modifyReservationConfirm(rsrv); //?????? ??????
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
				
			} else if(result == 1){ //?????? ???????????? ??????, ?????? ????????? ??????
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
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //?????? format
				Date date = format.parse(request.getParameter("rsrvDate")); //????????? -> Date???????????? ??????
				Timestamp timestamp = new Timestamp(date.getTime()); //Date -> TimeStamp???????????? ??????
				rsrv.setRsrvDate(timestamp);
				reservationholdservice.modifyReservationHold(rsrv); //?????? ??????
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
		return "redirect:/userReservationCheck"; // ?????? ??? ?????? ?????? ???????????? ??????
	}

	// ??????1 ????????? mapping
	@RequestMapping(value = "/Main1", method = RequestMethod.GET)
	public String Main1() {
		return "project/main/Main1";
	}
	
	//?????? ????????? mapping
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
		//?????? ????????? mapping
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
		//?????? ????????? mapping
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