package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 글 좋아요 수 +1 처리하기
//		dao.setGoodUpdate(idx);
		// 글 좋아요 +1 처리하기(좋아요 중복방지 처리 - session 사용 : "'boardgood'+고유번호" 값을 객체 배열(ArrayList)에 추가한다.)
		HttpSession session = request.getSession();
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		String res = "";
		if(goodIdx == null) {
			goodIdx = new ArrayList<>();
		}
		String imsiGoodIdx = "board" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			dao.setGoodUpdate(idx);   // DB에 좋아요 증가 처리
			goodIdx.add(imsiGoodIdx); // Session에 저장 처리
			res="1";
		}
		else if() {
		dao.setGoodMiunsUpdate(idx);
		}
//		session.setAttribute("sGoodIdx", goodIdx);
		
		// 현재 게시글의 전체 내용 보기
		BoardVO vo = dao.getBoardContent(idx);
		
		
		request.setAttribute("vo", vo);
	}
}
