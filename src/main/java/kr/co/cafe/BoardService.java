package kr.co.cafe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<BoardVo> boardList() {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		return dao.boardList();
	}
	
	public List<Board_cateVo> boardCate(){	
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		return dao.boardCate();
	}

	public void boardWrite(BoardVo vo) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);

		// 트랜잭션 처리하기 
		int result1 = dao.boardWrite(vo);  
		int b_num = vo.getB_num();
		int result2 = dao.boardUpdateGrp_new(b_num);
	}
	
	public BoardVo boardDetail(int b_num) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		return dao.boardDetail(b_num);
	}
	
	public Board_cateVo aBoardCate(int b_num) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		return dao.aBoardCate(b_num);
	}
	
	public void boardReplyWrite(BoardVo vo) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result1 = dao.boardWrite(vo);		// 기본 글내용 insert 
		int newSeq = vo.getB_num();
		
		BoardVo originVo = dao.boardDetail(vo.getB_grp());	// 원글의  답글 정보 
		originVo.setB_num(newSeq);
		int minSeq = dao.selectMinSeq(originVo);	//	selectMinSeq
		if(minSeq == 0) {
			int maxSeq = dao.maxSeq(originVo.getB_grp());		//	selectKey BEFORE 에러, service에서 처리
			originVo.setB_seq(maxSeq);
			int result2 = dao.seqZero(originVo);
		} else if (minSeq != 0) {
			originVo.setB_seq(minSeq);
			int resultOrign = dao.seqNotZeroOrigin(originVo);
			int resultNew = dao.seqNotZeroNew(originVo);
		}
	}
	
	public void addCate(Board_cateVo cateVo) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.addCate(cateVo);
	}
	
	public String addHit(int b_num) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.addHit(b_num);
		String hitResult = "";
		if(result == 1) {
			hitResult = "addHitSuccess";
		} else if (result == 0) {
			hitResult = "addHitFail";
		}
		return hitResult;
	}
	
}
