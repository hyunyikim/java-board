package kr.co.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	/*
	 * 전체글 보기 board.do
	 * 선택한 게시판 글 보기 boardList.do 
	*/
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println("컨트롤러 진입");
		service.boardList();
		return "index.boardList";
	}
	
}
