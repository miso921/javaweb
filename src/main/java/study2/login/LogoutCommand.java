package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid"); // 타입이 맞지 않기 때문에 강제 캐스팅
	
		session.invalidate();  // 세션 끊어도 회원전용방에 들어가진다...
		
		/*
		 * PrintWriter out = response.getWriter();
		 * 
		 * out.print("<script>"); out.print("alert('"+mid+" 님 로그아웃 되었습니다!');");
		 * out.print("location.href='"+request.getContextPath()+
		 * "/study/0428_database/login.jsp';"); out.print("</script>");
		 */
		request.setAttribute("msg", mid+ " 님 로그아웃 되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/Login.re");
	}

}
