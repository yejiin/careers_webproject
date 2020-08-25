package reviewboard;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class rvBoardController {
	@Autowired
	rvBoardDAO dao;
	
	@RequestMapping(value="/rvboardwrite", method=RequestMethod.GET)
	String writeform() {
		return "rvboard/writeform";
	}
	@RequestMapping(value="/rvboardwrite", method=RequestMethod.POST)
	ModelAndView writeprocess(@ModelAttribute("vo") rvBoardVO vo) {
		String result = dao.insertBoard(vo);
		ModelAndView mv = new ModelAndView();
		if(result.indexOf("완료")<0) {
			mv.addObject("result", result);
		}
		mv.setViewName("redirect:/rvboardlist");
		return mv;
	}
	@RequestMapping("/rvboardlist")
	public ModelAndView getBoardList() {
		ArrayList<rvBoardVO> boardlist = dao.getBoardList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("rvboardlist", boardlist);
		mv.setViewName("rvboard/list");
		return mv;
	}
	@RequestMapping("/rvboarddetail")
	public ModelAndView getBoard(int rseq) {
		rvBoardVO vo = dao.getBoard(rseq);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rv_board", vo);
		mv.setViewName("rvboard/detail");
		return mv;	
	}
}
