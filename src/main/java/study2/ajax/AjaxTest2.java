package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxTest2")
public class AjaxTest2 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		String str = "";
		if(vo.getName() == null) {
			str = "찾는 자료가 없습니다.";
		}
		else {
			// 문자만 전송가능하기 때문에 문자로 변형
			str = vo.getMid() + "/" + vo.getName() + "/" + vo.getNickName() + "/" + vo.getGender() + "/" + vo.getPoint();
		}
		
		response.getWriter().write(str);   // 화면에 출력(.print)하는게 아니라 Http 헤더에 저장(.write)만 해놓겠다! (★무조건 문자)
	}
}
