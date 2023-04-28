package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/database/UpdateOk")
public class UpdateOk extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setUpdateOk(vo);
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			session.setAttribute("sName",name);
			// 1이 정상
			out.print("<script>");
			out.print("alert('개인정보가 수정되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
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
