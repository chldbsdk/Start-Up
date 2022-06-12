package com.nakwon.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.nakwon.domain.Criteria;
import com.nakwon.domain.PageMaker;
import com.nakwon.domain.ReservationHoldVO;
import com.nakwon.service.ReservationHoldService;

@Controller
@RequestMapping("/project/manager/reservation/*")
public class ReservationController {
	@Inject
	private ReservationHoldService reservationholdservice;
	
	//예약 목록
	@RequestMapping(value="/reservationList", method=RequestMethod.GET)
	public void menuList(@ModelAttribute("cri") Criteria cri, ReservationHoldVO vo, Model model) throws Exception{
		 System.out.println(cri.toString());
		 
		 model.addAttribute("list", reservationholdservice.listCriteria(cri));
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(reservationholdservice.listCountCriteria(cri));
		 model.addAttribute("pageMaker", pageMaker);
		 //model.addAttribute("list", reservationholdservice.rsrvHoldListAll());		
	}
	
	@RequestMapping(value="/reservationList", method=RequestMethod.POST)
	public void menuListPOST(ReservationHoldVO vo, Model model) throws Exception{
		reservationholdservice.insertReservationHold(vo);
		model.addAttribute("list", reservationholdservice.rsrvHoldListAll());
				
	}
	
	@RequestMapping(value="/ReservationAdd", method=RequestMethod.GET)
	public void reservationAddGET(ReservationHoldVO vo, Model model) throws Exception{
		System.out.println("ReservationAdd GET Called");
	}	
	
	@RequestMapping(value="/ReservationAdd", method=RequestMethod.POST)
	public void introduceAddPOST(ReservationHoldVO vo, Model model) throws Exception {
		System.out.println("ReservationAdd POST Called");
		//introduceservice.introduceinsert(vo);
	}
}
