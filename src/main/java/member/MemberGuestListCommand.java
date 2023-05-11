package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.GuestDAO;
import guest.GuestVO;

public class MemberGuestListCommand implements MemberInterface {

	@SuppressWarnings("unused")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid); // memberGuestList.jsp에서 방명록 출력을 위한 vo 생성!
	
		// 특정 회원의 방명록 글 쓴 개수 (아이디, 성명, 닉네임이 같으면 내가 쓴 글 보여주기) 
		GuestDAO dao2 = new GuestDAO();
		int res = dao2.getList(vo.getMid(),vo.getName(),vo.getNickName());
		request.setAttribute("res", res);
		
		// 페이징 처리
		// 1. 현재 페이지 번호를 구한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); // page는 예약어 / 처음에는 페이지 번호가 안 주어지기 때문에 null이 오면 1페이지를 보여준다. 
				
		// 2. 한 페이지의 분량을 결정한다. 
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));;
		
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt =  dao2.getTotRecCnt();  // 아직 몇 건인지 모르기 때문에 count 함수를 이용해 총 레코드 건수 구하기
		
		// 4. 총 page 건수를 구한다. 
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1;
		
		// 5. 현재 페이지의 시작 index 번호를 구한다.
		int startIndexNo = (pag -1) * pageSize;  // (현재 페이지 -1) * 한페이지 분량 
		
		// 6. 현재 화면에 표시할 시작번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		
		// 블록 페이징 처리!!! 블록의 시작 번호를 0부터 처리했다.
		// 1. 블록의 크기 결정 (여기선 3!)
		int blockSize = 3;
		
		// 2. 현재 페이지가 속한 블록 번호를 구한다.(예: 1~2page는 0block, 4~6page는 1block)
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		
		// 지정된 페이지의 자료를 요청한 한 페이지 분량만큼 가져온다. (이미 DB에 있는 것을 가져오기 때문에 vo.getMid / vo.getName / vo.getNickName 사용)
		ArrayList<GuestVO> vos = dao2.getMemberGuestList(startIndexNo, pageSize, vo.getMid(), vo.getName(), vo.getNickName());
		
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
