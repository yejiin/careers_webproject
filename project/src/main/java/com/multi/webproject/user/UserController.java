package com.multi.webproject.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Autowired
	UserDAO dao;

	@RequestMapping(value = "usersignup", method = RequestMethod.GET)
	public String signupform() {
		return "user/signupform";
	}

	@RequestMapping(value = "usersignup", method = RequestMethod.POST)
	public ModelAndView signupprocess(@ModelAttribute("vo") UserVO vo) {
		String result = dao.insertUser(vo);

		ModelAndView mv = new ModelAndView();
		if (result.indexOf("성공") < 0) {
			mv.addObject("result", result);
		}
		mv.setViewName("redirect:/login");
		/* mv.setViewName("user/signupprocess"); */
		return mv;
	}

	
	  // 로그인 폼을 띄우는 부분
	  
	  @RequestMapping(value = "login", method = RequestMethod.GET) 
	  public String loginform() { 
		  return "user/loginform"; 
	  }
	  
	  
	  // 로그인 처리하는 부분
	  
	  @RequestMapping(value = "login", method = RequestMethod.POST)
	  public ModelAndView loginprocess(@RequestParam(value = "userid") String id, @RequestParam(value = "userpw") String pw, 
			  @ModelAttribute("vo") UserVO vo, HttpSession session, Model model)
	  { 
		  int result = dao.loginCheck(vo,id,pw,session); 
		  if ( session.getAttribute("login") != null ) { // 기존에 login이란
			  session.removeAttribute("login"); // 기존값을 제거해 준다. 
		  }
	  
		  ModelAndView mv = new ModelAndView(); 
	 
		  if (result == 1) {
			  mv.addObject("result", result); 
			  model.addAttribute("user", vo);
			  session.setAttribute("login", vo); 
		  } else if (result == 0) {
			  mv.addObject("result", result); 
		  } else if (result == -1) {
			  mv.addObject("result", result); 
		  } 
		  mv.setViewName("redirect:/login");
		  //mv.setViewName("user/loginprocess"); 
		  return mv;
	  
	  }
	  
	  
	  //로그아웃 하는 부분
	  
	  @RequestMapping(value="logout") 
	  public String logout(HttpSession session) {
		  session.invalidate(); 
		  return "redirect:/";
	  }
	 

}
