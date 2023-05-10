package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		
		BoardDAO dao = new BoardDAO();
		
		// 글 조회수 +1 처리하기(조회수 중복방지 처리 - session 사용 : "'board'+고유번호" 값을 객체 배열(ArrayList)에 추가한다.)
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList<String>) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<>();
		}
		String imsicontentIdx = "board" + idx;
		if(!contentIdx.contains(imsicontentIdx)) {
			dao.setReadNumUpdate(idx);   // DB에 조회수 증가 처리
			contentIdx.add(imsicontentIdx); // Session에 저장 처리
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		// 현재 부모글에 딸려있는 댓글 가져오기
		ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
		
		
		// 현재 선택된 게시글(idx)의 전체 내용물을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 이전글과 다음글 처리 (메소드는 하나지만 sql이 2개로 따로 처리하기 때문에 저장하는 vo도 각각 따로 만듬)
		BoardVO preVO = dao.getPreNextSearch(idx, "preVO"); // 현재글의 idx, 이전글VO
		BoardVO nextVO = dao.getPreNextSearch(idx, "nextVO"); // 현재글의 idx, 다음글VO
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);
	}	
}
