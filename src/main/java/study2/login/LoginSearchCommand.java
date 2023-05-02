package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginSearchCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getMidCheck(mid);
		
		if(vo.getMid() != null) {
			request.setAttribute("msg", "NO");
			request.setAttribute("url", request.getContextPath()+"/MemberSearch.re?mid="+mid); //컨트롤러 갔다가 MemberSearchCommand로 가면 아이디가 사라지기 때문에 값을 가지고 가는 것
		}
		else {
			request.setAttribute("msg", "검색한 회원이 존재하지 않습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
		}

	}

}
