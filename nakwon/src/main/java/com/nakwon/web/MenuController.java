package com.nakwon.web;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import com.nakwon.service.MenuService;
import com.nakwon.domain.MenuVO;

@Controller
@RequestMapping("/project/manager/menu/*")
public class MenuController {
	@Inject
	private MenuService menuservice;
	
	//�޴� ��� GET
	@RequestMapping(value="/menuAdd", method=RequestMethod.GET)
	public void menuAddGET(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		model.addAttribute("list", menuservice.menuListAll());
		
	}
	
	//�޴� ��� POST
	@RequestMapping(value="/menuAdd", method=RequestMethod.POST)
	public void menuAddPOST(MenuVO vo, Model model) throws Exception {
		System.out.println("MenuVO POST Called");
		menuservice.insert(vo);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(Model model) 
			throws Exception{
		System.out.println("Read Called");
		model.addAttribute("list", menuservice.menuListAll());
		/* menuservice.menuListAll(); */
	}
	
}