package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindMidOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberFindMid(name, tel);
		
		if(name.equals(vo.getName()) && tel.equals(vo.getTel())) {
			request.setAttribute("mid", vo.getMid());
		}
		else {
			request.setAttribute("msg", "회원정보를 다시 한번 확인해주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberFindMid.mem");
		}
	}
}
