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
		
		LoginVO vo2 = dao.getMidCheck(mid);
	}

}
