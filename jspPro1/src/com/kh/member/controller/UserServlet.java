package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.errorCheck.ErrorCheck;
import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.UserVO;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us;
	ErrorCheck er;
	public UserServlet() {
		super();
		us = new UserService();
		er = new ErrorCheck();
	}

	protected void processing(HttpServletRequest request, HttpServletResponse response  )
			throws ServletException, IOException {
	
		if (request.getParameter("command").equals("join")) {
			join(request, response );
		}else if(request.getParameter("command").equals("login")){
			login(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response  )
			throws ServletException, IOException {
		processing(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response  )
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

		String msg = er.errorMsg(vo);
		
		if(!msg.equals("")){
				request.setAttribute("msg", msg);
				RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
				view.forward(request, response);					
		 }else{
			int result = us.join(vo);
			if(result == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", user_id);
				RequestDispatcher view = request.getRequestDispatcher("index.jsp");
				view.forward(request, response);
			}else{
				request.setAttribute("msg", "오류발생 ");
				RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
				view.forward(request, response);			
			}
		}
	}
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id"); //1로그인화면에서 사용자에게 받은 아이디와 비밀번호
		String user_pw = request.getParameter("user_pw");

		String pw = us.loginCheck(user_id);  //2사용자에게 받은 아이디 유무와 비밀번호 일치를  확인하기 위해 유저서비스 로그인 체크로 값을 담아서 보내준다 
		
		if(pw.equals("")) {          //10 만약 아이디가 존재하지 않을경우 반환된 result(비밀번호)는 ""공백이다 = 존재하지 않는 회원이다
			request.setAttribute("msg", "존재하지 않는 아이디 입니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		}else if(!user_pw.equals(pw)) { // 11 만약 받아온 result(비밀번호가) 일치하지 않다면 아이디는 있고 비밀번호가 틀린것이다
			request.setAttribute("msg", "비밀번호가 틀렸습니다 ");
			RequestDispatcher view = request.getRequestDispatcher("views/member/error.jsp");
			view.forward(request, response);
		}else {  //12 위에 조건을 타지 않은경우 로그인에 성공한 것이다 메인으로 보낸다
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}
	
		
	}

}
