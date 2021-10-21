package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cmm.vo.BoardPagingVO;
import kr.or.ddit.edu.vo.EduVO;

public class BoardServiceImpl implements IBoardService{

	private IBoardDao dao;
	private static IBoardService service;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	public static IBoardService getInstance() {
		if(service == null) {
			service = new BoardServiceImpl();
		}
		return service;
	}
	@Override
	public int getTotalBoardCount() {
		int cnt = 0;
		try {
			cnt = dao.getTotalBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<BoardVO> boardPagingList(BoardPagingVO boardPagingVO) {
		List<BoardVO> list = null;
		try {
			list = dao.boardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Map<String, Object>> selectAll() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int boardInsert(BoardVO vo) {
		int cnt = 0;
		try {
			cnt = dao.boardInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<Map<String, Object>> QuestionBoardPagingList(BoardPagingVO boardPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.QuestionBoardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countQuestionBoard() {
		int cnt = 0;
		try {
			cnt = dao.countQuestionBoard();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<Map<String, Object>> LifeBoardPagingList(BoardPagingVO boardPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.LifeBoardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countLifeBoard() {
		int cnt = 0;
		try {
			cnt = dao.countLifeBoard();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<Map<String, Object>> blahBoardPagingList(BoardPagingVO boardPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.blahBoardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countBlahBoard() {
		int cnt = 0;
		try {
			cnt = dao.countBlahBoard();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<Map<String, Object>> MeetUpBoardPagingList(BoardPagingVO boardPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.MeetUpBoardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countMeetUpBoard() {
		int cnt = 0;
		try {
			cnt = dao.countMeetUpBoard();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<Map<String, Object>> CareerBoardPagingList(BoardPagingVO boardPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.CareerBoardPagingList(boardPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countCareerBoard() {
		int cnt = 0;
		try {
			cnt = dao.countCareerBoard();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
}
