package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5miCommand implements Test5miInterface {

	@Override
	// interface가 갖고 있는 메소드(추상객체)를 반드시 사용해야함(구현객체)
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = request.getParameter("su1")==null ? 1 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 1 : Integer.parseInt(request.getParameter("su2"));
		String op = request.getParameter("op")==null ? "+" : request.getParameter("op");
		
		int res = 0;
		
		if(op.equals("+")) res = su1 + su2;
		else if(op.equals("-")) res = su1 - su2;
		else if(op.equals("*")) res = su1 * su2;
		else if(op.equals("/")) res = su1 / su2;
		else res = su1 % su2;
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("op", op);
		request.setAttribute("res", res);
	}

}
