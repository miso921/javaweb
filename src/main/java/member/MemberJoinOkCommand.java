package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 사진이 업로드 여부 처리
		String photo = "noimage.jpg";
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String job = request.getParameter("job") == null ? "" : request.getParameter("job");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String userInfor = request.getParameter("userInfor") == null ? "" : request.getParameter("userInfor");
		
		// 취미 전송에 대한 처리
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbys.length != 0) {
			for(String strHobby : hobbys) {
				hobby += strHobby + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/")); // '/' 제거
		
		// Back End  체크 ... (DB에 저장되는 자료들의 Null 값과 길이 체크, 중복여부(아이디,닉네임)체크)
		
		// 아이디와 닉네임 중복 체크
		MemberDAO dao = new MemberDAO();
		
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("msg", "이미 사용중인 아이디입니다");
			request.setAttribute("url", request.getContextPath()+"MemberJoin.mem");
			return;
		}
		
		vo = dao.getMemberNickCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("msg", "이미 사용중인 닉네임입니다");
			request.setAttribute("url", request.getContextPath()+"MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화처리 (sha256)
		
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8); // toString()으로 문자화 후 substring해주기
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		
		// 모든 검사가 완료됐다면 회원정보를 VO에 담아 DB(DAO객체)로 넘겨준다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		vo.setSalt(salt);
		
		
		System.out.println("vo:" + vo);
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "성공적으로 회원가입 되었습니다! \\n다시 로그인해 주세요~");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
		}
	}
}
