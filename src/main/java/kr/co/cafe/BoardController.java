package kr.co.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cafe.vo.BoardVo;
import kr.co.cafe.vo.Board_cateVo;
import kr.co.cafe.vo.CommentVo;
import kr.co.cafe.vo.PagingVo;

@Controller
public class BoardController {
	
	/*
	 * 전체글 보기 board.do
	 * 비동기-카테고리 가져오기 boardCate.do
	 * 선택한 게시판 글 전체 보기 boardList.do 
	 * 새글 쓰기 boardWrite.do
	 * 
	 * 글 보기 boardDetail.do
	 * 답글 달기 boardReply.do
	 * 
	 * 게시판 카테고리 추가 addCate.do
	 * 조회수 증가 addHit.do
	*/
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam(defaultValue="1") int curPage, BoardVo boardVo) {
		System.out.println("curPage : " + curPage);
		
		int listCount = service.listCount();
		
		PagingVo pageVo = new PagingVo(curPage, listCount);
		
		boardVo.setStartIndex(pageVo.getStartIndex());
		boardVo.setPageSize(pageVo.getPageSize());
		
		List<BoardVo> boardList = service.boardList(curPage, boardVo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		
		return "index.boardList";
	}
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String boardWriteView() {
		return "index.boardWrite";
	}
	
	@RequestMapping(value = "/boardCate.do", method = RequestMethod.GET)
	public @ResponseBody List<Board_cateVo> boardCategory() {
		return service.boardCate();
	}
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite(BoardVo vo) {
		service.boardWrite(vo);
		return "redirect:/board.do";
	}

	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(Model model, int b_num) {
		BoardVo vo = service.boardDetail(b_num);
		Board_cateVo cateVo = service.aBoardCate(b_num);  
		model.addAttribute("vo", vo);
		model.addAttribute("cateVo", cateVo);
		return "index.boardDetail";
	}
	
	@RequestMapping(value = "/boardReply.do", method = RequestMethod.GET)
	public String boardReplyView(Model model, int b_num) {
		model.addAttribute("b_num", b_num);
		model.addAttribute("cateVo", service.aBoardCate(b_num));
		return "index.boardReply";
	}
	
	@RequestMapping(value = "/boardReply.do", method = RequestMethod.POST)
	public String boardReply(Model model, BoardVo vo) {
		service.boardReplyWrite(vo);
		return "redirect:/board.do";	//	 boardDetail.do? 뒤에 vo.getB_num 붙이기 
	}
	
	@RequestMapping(value = "/addCate.do", method = RequestMethod.POST)
	public String addCate(Board_cateVo cateVo) {
		service.addCate(cateVo);
		return "redirect:/board.do";	//	 boardDetail.do? 뒤에 vo.getB_num 붙이기 
	}
	
	@RequestMapping(value = "/addHit.do", method = RequestMethod.GET)
	public @ResponseBody String addHit(int b_num) {
		return service.addHit(b_num);
	}
	
	@RequestMapping(value = "/commentWrite.do", method = RequestMethod.POST)
	public @ResponseBody List<CommentVo> commentWrite(CommentVo comVo) {
		service.commentWrite(comVo);
		return service.commentList(comVo.getB_num());
	}
	
	
	
}
