package com.nakwon.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import com.nakwon.service.MenuService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nakwon.domain.MenuVO;
import com.nakwon.domain.PageMaker;
import com.nakwon.domain.Criteria;

@Controller
@RequestMapping("/project/manager/menu/*")
public class MenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	@Inject
	private MenuService menuservice;
	
	//�޴� ��� GET
	@RequestMapping(value="/menuAdd", method=RequestMethod.GET)
	public void menuAddGET(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		model.addAttribute("list", menuservice.distinctMenuCode());
		
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
	public void menuList(@ModelAttribute("cri") Criteria cri,MenuVO vo, Model model) throws Exception{
		System.out.println(cri.toString());
		
		model.addAttribute("list", menuservice.listCriteria(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    // pageMaker.setTotalCount(131);
	    pageMaker.setTotalCount(menuservice.listCountCriteria(cri));
	    model.addAttribute("pageMaker", pageMaker);
			
	}
	@RequestMapping(value="/menuList", method=RequestMethod.POST)
	public void menuListPOST(MenuVO vo, Model model) throws Exception{
		System.out.println("MenuVO GET Called");
		menuservice.insert(vo);
		model.addAttribute("list", menuservice.menuListAll());
			
	}
	
	@RequestMapping(value="/viewMenu", method=RequestMethod.GET)
	public void viewMenu(@RequestParam("MenuDetailCode") String MenuDetailCode,Model model) throws Exception{
		System.out.println("ss GET Called");
		model.addAttribute("menu", menuservice.read(MenuDetailCode));
		model.addAttribute("list", menuservice.distinctMenuCode());
			
	}
	
	// 메뉴수정
		@RequestMapping(value = "/menumodify", method = RequestMethod.POST)
		public String menumodify(@RequestParam("MenuDetailCode") String MenuDetailCode, MenuVO vo, Model model) throws Exception {
			System.out.println("ss GET Called");
			/*
			 * for(MultipartFile multipartFile : uploadFile) { logger.info("------------");
			 * logger.info("Upload File Name: "+multipartFile.getOriginalFilename());
			 * logger.info("Upload File Size: "+multipartFile.getSize()); }
			 */
			menuservice.update(vo);
			/* model.addAttribute("list", menuservice.menuListAll()); */
			return "project/manager/menu/menuAdd";
		}

	//test
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test(MenuVO vo, Model model) throws Exception{
		ObjectMapper objm = new ObjectMapper();
		
		List list=menuservice.courseCode();
		String codeList = objm.writeValueAsString(list);
		model.addAttribute("codeList",codeList);
		
		logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + codeList); 
		
		System.out.println("ss GET Called");
		model.addAttribute("list", menuservice.menuListAll());
		model.addAttribute("courseCode",menuservice.courseCode());
	
		System.out.println(menuservice.courseCode());
	}
	
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public void test2(@RequestParam("MenuDetailCode") String MenuDetailCode,Model model) throws Exception{
		System.out.println("ss GET Called");
		model.addAttribute("menu",menuservice.read(MenuDetailCode));
			
	}

}