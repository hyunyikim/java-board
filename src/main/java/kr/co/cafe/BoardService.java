package kr.co.cafe;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void boardList() {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		BoardVo vo = dao.boardList();
		System.out.println("vo : " + vo);
	}

}
