package com.nakwon.web;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import com.nakwon.service.IntroduceService;
import com.nakwon.domain.IntroduceVO;

@Controller
@RequestMapping("/project/manager/Introduce/*")
public class IntroduceController {
	@Inject
	private IntroduceService introduceservice;
	
	
	@RequestMapping(value="/IntroduceAdd", method=RequestMethod.GET)
	public void introduceAddGET(IntroduceVO vo, Model model) throws Exception{
		System.out.println("IntroduceAdd GET Called");
	}	
	
	@RequestMapping(value="/IntroduceAdd", method=RequestMethod.POST)
	public void introduceAddPOST(IntroduceVO vo, Model model) throws Exception {
		System.out.println("IntroduceAdd POST Called");
		introduceservice.introduceinsert(vo);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(Model model) throws Exception{
		System.out.println("Read Called");
		model.addAttribute("list", introduceservice.introduceListAll());
	}
	
	//家俺 格废
	@RequestMapping(value="/IntroduceList", method=RequestMethod.GET)
	public void introduceList(IntroduceVO vo, Model model) throws Exception{
		System.out.println("Introduce GET Called");
		model.addAttribute("list", introduceservice.introduceListAll());
	}
		
	@RequestMapping(value="/IntroduceList", method=RequestMethod.POST)
	public void introduceListPOST(IntroduceVO vo, Model model) throws Exception{
		System.out.println("Introduce GET Called");
		introduceservice.introduceinsert(vo);
		model.addAttribute("list", introduceservice.introduceListAll());
	}

	//家俺 格废
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home(IntroduceVO vo, Model model) throws Exception{
		System.out.println("Introduce GET Called");
		model.addAttribute("list", introduceservice.introduceListAll());
		return "home";
		}
	} 
