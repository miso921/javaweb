package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class LoginJoinOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();  
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name); // 입력받은 값을 vo에 저장
		
		LoginDAO dao = new LoginDAO();
		
		// 중복 아이디 체크
		LoginVO vo2 = dao.getMidCheck(mid); // 받아오는 타입은 무엇이든 상관없다. / vo 타입으로 가져오면 나중에 또 써먹을 수 있음
		
		
		String msg = "", url = "";
		if(vo2.getMid() != null) {
			// 아이디 중복
			msg = "아이디가 중복되었습니다!";
			url = "/Join.re";
		}
		else {
			// 아이디 중복이 아니므로 DB에 정보를 저장
			dao.setJoinOk(vo);
			msg = "회원가입 성공~ ^_^";
			url = "/Login.re";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", request.getContextPath()+url);
	}

}
