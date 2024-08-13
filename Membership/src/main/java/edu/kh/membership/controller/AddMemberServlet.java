package edu.kh.membership.controller;

import java.io.IOException;

import edu.kh.membership.service.MemberService;
import edu.kh.membership.service.MemberServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/add")
public class AddMemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("inputName");
		String phone = req.getParameter("inputPhone");
		
		try {
			
			MemberService service = new MemberServiceImpl();
			boolean result = service.addMember(name, phone);
			
			HttpSession session = req.getSession(); 
			String message = null;
			
			if(result) {
				message = name + " 회원이 추가되었습니다";
				session.setAttribute("message", message);
			} else {
				message = "같은 휴대폰 번호가 이미 존재합니다 다시 시도해주세요";
				session.setAttribute("message", message);
			}
			
			resp.sendRedirect("/");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
