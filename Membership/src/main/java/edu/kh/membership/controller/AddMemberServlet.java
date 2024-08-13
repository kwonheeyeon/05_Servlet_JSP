package edu.kh.membership.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import edu.kh.membership.dto.Member;
import edu.kh.membership.service.MemberService;
import edu.kh.membership.service.MemberServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addMember")
public class addMemberServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("inputName");
		String phone = req.getParameter("inputPhone");
		
		try {
			List<Member> memberList = new ArrayList<Member>();
			MemberService service = new MemberServiceImpl();
			
			memberList = service.getMemberList();
			
			HttpSession session = req.getSession();
			String message = null;
			
			for(Member member : memberList) {
				if(member.getPhone().equals(phone)) {
					message = "중복된 휴대폰 번호가 존재합니다";
				}
			}
			
			if(message == null) {
				message = name + " 회원님이 가입되었습니다";
				
				service.addMember(name, phone);
			}
			
			session.setAttribute("message", message);
			
			resp.sendRedirect("/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
