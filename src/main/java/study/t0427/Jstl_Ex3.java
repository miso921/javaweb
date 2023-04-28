package study.t0427;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0427/Jstl_Ex3")
public class Jstl_Ex3 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Jstl_Ex3VO vo = new Jstl_Ex3VO();
		String title = request.getParameter("title");
		
		ArrayList<Jstl_Ex3VO> vos = new ArrayList<>();
		
		vo.setName(title);
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/0427/jstl_ExRes.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
