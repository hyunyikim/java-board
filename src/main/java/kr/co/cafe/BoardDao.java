package kr.co.cafe;

import java.util.List;

import kr.co.cafe.vo.BoardVo;
import kr.co.cafe.vo.Board_cateVo;
import kr.co.cafe.vo.CommentVo;

public interface BoardDao {
	public List<BoardVo> boardList(BoardVo vo);
	public List<Board_cateVo> boardCate();
	public int boardWrite(BoardVo vo);
	public int boardUpdateGrp_new(int b_num);
	public BoardVo boardDetail(int b_num);
	public Board_cateVo aBoardCate(int b_num);
	
	// 답글 처리 
	public int selectMinSeq(BoardVo originVo);
	public int seqZero(BoardVo originVo);
	public int maxSeq(int b_grp);
	public int seqNotZeroOrigin(BoardVo originVo);
	public int seqNotZeroNew(BoardVo originVo);
	
	public int addCate(Board_cateVo cateVo);
	public int addHit(int b_num);
	public int commentWrite(CommentVo comVo);
	public CommentVo commentDetail(int c_num);
	public List<CommentVo> commentList(int b_num);
	
	public int listCount();
}
