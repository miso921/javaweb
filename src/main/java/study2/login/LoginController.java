package study2.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.re")
public class LoginController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginInterface command = null;  // 선언만하고 인터페이스 생성
		String viewPage = "/WEB-INF/study2/login";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/Login")) {
			viewPage += "/login.jsp";
		}
		else if(com.equals("/Join")) {
			viewPage += "/join.jsp";
		}
		else if(com.equals("/JoinOk")) {
			command = new LoginJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";   // 회원가입 처리 전 정보가 가입 가능하면 login으로 보내지만 아니면 join으로 보내야하기 때문에 일단 message를 먼저 띄워야함! (메세지 컨트롤러/ 공통적으로 사용하는 곳에 만들기-include)
		}
		else if(com.equals("/LoginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMain")) {
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/Logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		else if(com.equals("/LoginSearch")) {
			command = new LoginSearchCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberSearch")) {
			command = new memberSearchCommand(); // mid도 같이 실려옴
			command.execute(request, response);
			viewPage += "/memberSearch.jsp";
		}
		else if(com.equals("/DeleteOk")) {
			command = new DeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/Update")) {
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage += "/update.jsp";
		}
		else if(com.equals("/UpdateOk")) {
			command = new UpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
