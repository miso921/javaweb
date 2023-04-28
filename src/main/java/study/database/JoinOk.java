package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/JoinOk")
public class JoinOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		
		// 중복 아이디 체크
		LoginVO vo2 = dao.getMidCheck(mid); // 받아오는 타입은 무엇이든 상관없다. / vo 타입으로 가져오면 나중에 또 써먹을 수 있음
		
		PrintWriter out = response.getWriter();
		
		if(vo2.getMid() != null) {
			// 아이디 중복
			out.print("<script>");
			out.print("alert('아이디가 중복되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/join.jsp';");
			out.print("</script>");
		}
		else {
			// 아이디 중복이 아니므로 DB에 정보를 저장
			dao.setJoinOk(vo);
			out.print("<script>");
			out.print("alert('회원가입에 성공하셨습니다^_^');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
		}
		
	}
}
