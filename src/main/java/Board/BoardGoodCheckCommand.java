package Board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 글 좋아요 수 +1 처리하기
		dao.setGoodUpdate(idx);
		
		BoardVO vo = dao.getBoardContent(idx);
		
		
		request.setAttribute("vo", vo);
	}
}
