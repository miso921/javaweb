package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;


@SuppressWarnings("serial")
@WebServlet("/database/DeleteOk")
public class DeleteOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setDeletOk(mid);
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			// 1이 정상
			out.print("<script>");
			out.print("alert('개인정보가 삭제되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/database/Logout';");
			out.print("</script>");
		}
		else {
			// 아이디 중복이 아니므로 DB에 정보를 저장
			out.print("<script>");
			out.print("alert('회원정보 수정 실패..');");
			out.print("location.href='"+request.getContextPath()+"/database/Update';");  // 껍데기인 update.jsp로 보내지않고 그 전인 Update servlet으로 보낸다
			out.print("</script>");
		}
		
		
	}
}
