package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.Validation.Validation;
import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.UserVO;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us;
	Validation vd;

	public UserServlet() {
		super();
		us = new UserService();
		vd = new Validation();
	}

	protected void processing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("command").equals("join")) {
			join(request, response);
		} else if (request.getParameter("command").equals("login")) {
			login(request, response);
		} else if (request.getParameter("command").equals("logout")) {
			logout(request, response);
		} else if (request.getParameter("command").equals("userUpdate.do")) {
			userUpdate(request, response);
		} else if (request.getParameter("command").equals("findId")) {
			findId(request, response);
		} else if (request.getParameter("command").equals("userDelete")) {
			userDelete(request, response);
		} else if (request.getParameter("command").equals("findPw")) {
			findPw(request, response);
		}else if (request.getParameter("command").equals("pwCheck")) {
			pwCheck(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processing(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processing(request, response);
	}

	protected void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_pwCheck = request.getParameter("user_pwCheck");
		String user_name = request.getParameter("user_name");
		String user_no = request.getParameter("user_no") + "-" + request.getParameter("user_no1");
		String gender = request.getParameter("gender");
		String address = request.getParameter("userPost") + "&" + request.getParameter("userAddress") + "&"
				+ request.getParameter("userAddress1");

		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		UserVO vo = new UserVO(user_id, user_pw, user_pwCheck, user_name, user_no, gender, address, phone, email);

		String msg = vd.validationMsg(vo);

		if (!msg.equals("")) {
			request.setAttribute("msg", msg);
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		} else {
			int result = us.join(vo);
			if (result == 1) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				out.println("<script>alert('로그인페이지로 이동합니다');location.href='views/member/login.jsp';</script>");
				out.flush();
				out.close();

			} else {
				request.setAttribute("msg", "오류발생 ");
				RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
				view.forward(request, response);
			}
		}
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id"); // 1로그인화면에서 사용자에게 받은 아이디와 비밀번호
		String user_pw = request.getParameter("user_pw");

		String pw = us.loginCheck(user_id); // 2사용자에게 받은 아이디 유무와 비밀번호 일치를 확인하기 위해 유저서비스 로그인 체크로 값을 담아서 보내준다

		if (pw.equals("")) { // 10 만약 아이디가 존재하지 않을경우 반환된 result(비밀번호)는 ""공백이다 = 존재하지 않는 회원이다
			request.setAttribute("msg", "존재하지 않는 아이디 입니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		} else if (!user_pw.equals(pw)) { // 11 만약 받아온 result(비밀번호가) 일치하지 않다면 아이디는 있고 비밀번호가 틀린것이다
			request.setAttribute("msg", "비밀번호가 틀렸습니다 ");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		} else { // 12 위에 조건을 타지 않은경우 로그인에 성공한 것이다 메인으로 보낸다
			HttpSession session = request.getSession();
			UserVO vo = us.getUser(user_id);
			session.setAttribute("loginUser", vo);

			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);

		}

	}

	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		view.forward(request, response);

	}

	protected void userUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String address = request.getParameter("userPost") + "&" + request.getParameter("userAddress") + "&"
				+ request.getParameter("userAddress1");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		UserVO vo = new UserVO(user_id, user_pw, address, phone, email);
		String pw = us.loginCheck(user_id);

		if (!user_pw.equals(pw)) {
			request.setAttribute("msg", "회원님의 비밀번호가 일치하지 않습니다 ");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		} else {
			String msg = vd.updateValidationMsg(vo);

			if (!msg.equals("")) {
				request.setAttribute("msg", msg);
				RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
				view.forward(request, response);
			} else {
				int result = us.userUpdate(vo);
				if (result == 1) {
					HttpSession session = request.getSession();
					vo = us.getUser(user_id);
					session.setAttribute("loginUser", vo);
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.println("<script>alert('성공적으로 수정되었습니다!');location.href='index.jsp';</script>");
					out.flush();
					out.close();

				} else {
					request.setAttribute("msg", "오류발생 ");
					RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
					view.forward(request, response);
				}
			}

		}

	}

	protected void findId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_name = request.getParameter("user_name");
		String user_no = request.getParameter("user_no") + "-" + request.getParameter("user_no1");
		String findId = us.findId(user_name, user_no);
		if (!findId.equals("")) { // 10 만약 아이디가 존재하지 않을경우 반환된 result(비밀번호)는 ""공백이다 = 존재하지 않는 회원이다
			request.setAttribute("findId", findId);
			RequestDispatcher view = request.getRequestDispatcher("views/member/findIdAction.jsp");
			view.forward(request, response);
		} else { // 11 만약 받아온 result(비밀번호가) 일치하지 않다면 아이디는 있고 비밀번호가 틀린것이다
			request.setAttribute("msg", "아이디와 주민번호가 맞지않습니다 ");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		}

	}

	protected void userDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String pw = us.loginCheck(user_id);
		if (pw.equals("")) {
			out.println("<script>alert('아이디가 존재하지 않습니다');history.back();</script>");
			out.flush();
			out.close();
		} else if (!user_pw.equals(pw)) {
			out.println("<script>alert('비밀번호가 틀렸습니다');history.back();</script>");
			out.flush();
			out.close();
		} else {
			int result = us.userDelete(user_id);
			if (result == 1) {
				HttpSession session = request.getSession();
				session.invalidate();
				out.println("<script>alert('성공적으로 탈퇴 되었습니다');location.href='index.jsp';</script>");
				out.flush();
				out.close();
			} else {
				out.println("<script>alert('오류 발생');history.back();</script>");
				out.flush();
				out.close();
			}

		}

	}

	protected void findPw(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");
		String user_no = request.getParameter("user_no") + "-" + request.getParameter("user_no1");
		String findPw = us.findPw(user_name, user_id, user_no);
		
		if (!findPw.equals("")) {
			
			request.setAttribute("findPw", findPw);
			RequestDispatcher view = request.getRequestDispatcher("views/member/findPwAction.jsp");
			view.forward(request, response);
		} else { 
			request.setAttribute("msg", "아이디와 주민번호가 맞지않습니다 ");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		}
	}
	protected void pwCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id"); 
		String user_pw = request.getParameter("user_pw");

		String PwCheck = us.PwCheck(user_id); 
		System.out.println(PwCheck + " 333");
		if (!PwCheck.equals(user_pw)) { // 10 만약 아이디가 존재하지 않을경우 반환된 result(비밀번호)는 ""공백이다 = 존재하지 않는 회원이다
			request.setAttribute("msg", "비밀번호가 일치하지 않입니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);					
		} else { 
			HttpSession session = request.getSession();
			UserVO vo = us.getUser(user_id);
			session.setAttribute("loginUser", vo);

			RequestDispatcher view = request.getRequestDispatcher("views/member/userUpdate1.jsp");
			view.forward(request, response);

		}
	}

}
