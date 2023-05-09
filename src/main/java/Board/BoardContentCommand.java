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
		
		
		
		
		// 현재 선택된 게시글(idx)의 전체 내용물을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
	}
}
