package com.nakwon.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String menuAddPOST(MenuVO vo, Model model) throws Exception {
		System.out.println("MenuVO POST Called");
		menuservice.insert(vo);
		return "project/manager/menu/menuAdd";
		
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(Model model) 
			throws Exception{
		System.out.println("Read Called");
		model.addAttribute("list", menuservice.menuListAll());
		/* menuservice.menuListAll(); */
	}
	
	//메뉴 목록
	@RequestMapping(value="/menuList", method=RequestMethod.GET)
	public void menuList(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		model.addAttribute("list", menuservice.menuListAll());
			
	}
	@RequestMapping(value="/menuList", method=RequestMethod.POST)
	public void menuListPOST(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		menuservice.insert(vo);
		model.addAttribute("list", menuservice.menuListAll());
			
	}
	
	//메뉴 목록
		@RequestMapping(value="/home", method=RequestMethod.GET)
		public String home(MenuVO vo, Model model) throws Exception{
			System.out.println("MenuVO GET Called");
			model.addAttribute("list", menuservice.menuListAll());
			return "home";
		}
		
//		//메뉴 목록
//				@RequestMapping(value="/test", method=RequestMethod.GET)
//				public String test(MenuVO vo, Model model) throws Exception{
//					System.out.println("MenuVO GET Called");
//					model.addAttribute("list", menuservice.menuListAll());
//					return "test";
//				}
//				
//				@RequestMapping(value="/test2", method=RequestMethod.GET)
//				public String test2(MenuVO vo, Model model) throws Exception{
//					System.out.println("MenuVO GET Called");
//					model.addAttribute("list", menuservice.menuListAll());
//					return "test2";
//				}

}