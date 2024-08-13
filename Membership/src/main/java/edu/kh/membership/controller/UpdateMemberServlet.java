package edu.kh.membership.controller;

import java.io.IOException;
import java.util.List;

import edu.kh.membership.dto.Member;
import edu.kh.membership.service.MemberService;
import edu.kh.membership.service.MemberServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update/member")
public class UpdateMemberServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index = Integer.parseInt(req.getParameter("index"));
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> memberList = service.getMemberList();
			
			req.setAttribute("index", index);
			req.setAttribute("name", memberList.get(index).getName());
			req.setAttribute("phone", memberList.get(index).getPhone());
			
			String path = "/WEB-INF/views/updateMember.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
