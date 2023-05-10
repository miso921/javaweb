package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString").trim();
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize")); // hidden으로 넘겨준 pag와 pageSize
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> vos = dao.getBoardContentSearch(search, searchString);  // 검색된 글이 여러개 일수 있기때문에 Arraylist에 저장
		
		// 검색결과에 한글로 안내해주기 위한 처리
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "제목";
		else if(search.equals("nickName")) searchTitle = "글쓴이";
		else searchTitle = "내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchString", searchString); 	
		request.setAttribute("searchCount", vos.size());  // 전체 개수
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
