package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// 페이징 처리..
		// 1. 현재 페이지 번호를 구한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); // page는 예약어 / 처음에는 페이지 번호가 안 주어지기 때문에 null이 오면 1페이지를 보여준다. 
				
		// 2. 한 페이지의 분량을 결정한다. 
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));;
		
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt =  dao.getTotRecCnt();  // 아직 몇 건인지 모르기 때문에 count 함수를 이용해 총 레코드 건수 구하기
		
		// 4. 총 page 건수를 구한다. 
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1;
		
		// 5. 현재 페이지의 시작 index 번호를 구한다.
		int startIndexNo = (pag -1) * pageSize;  // (현재 페이지 -1) * 한페이지 분량 
		
		// 6. 현재 화면에 표시할 시작번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		
		// 블록 페이징 처리...
		// 1. 블록의 크기 결정 (여기선 3!)
		int blockSize = 3;
		
		// 2. 현재 페이지가 속한 블록 번호를 구한다.(예: 1~2page는 0block, 4~6page는 1block)
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		// 지정된 페이지의 자료를 요청한 한 페이지 분량만큼 가져온다.
		ArrayList<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}
}
