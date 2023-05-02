package study2.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		
		
		// 1. 현재 페이지 번호 구하기
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한 페이지의 분량을 결정한다.
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 page수를 구한다.
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1;
		
		// 5. 현재 페이지의 시작 index 번호를 구한다.
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시할 시작번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록 페이징 처리! 블록의 시작 번호는 0
		// 1. 블록의 크기 결정
		int blockSize = 3;
		
		// 2. 현재 페이지가 속한 블록번호 구하기
		int curBlock = (pag-1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage -1) / blockSize;
		
		ArrayList<LoginVO> vos = dao.getLoginList(startIndexNo, pageSize);  

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
