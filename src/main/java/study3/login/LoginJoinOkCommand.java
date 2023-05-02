package study3.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginJoinOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd"); 
		String name = request.getParameter("name")==null ? "" : request.getParameter("name"); 

		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setMid(pwd);
		vo.setMid(name);
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO fVO = dao.getMidCheck(mid);
		
		String msg = "", url = "";
		if(fVO.getMid() != null ) {
			msg = "아이디가 중복되었습니다!";
			url = "/Join.re";
		}
		else {
			dao.setJoinOk(vo);
			msg = "회원가입 성공~";
			url = "/Login.re";
		}
	}
	
}
