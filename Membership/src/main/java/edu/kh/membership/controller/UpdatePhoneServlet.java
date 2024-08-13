package edu.kh.membership.controller;

import java.io.IOException;
import java.util.List;

import edu.kh.membership.dao.MemberDao;
import edu.kh.membership.dao.MemberDaoImpl;
import edu.kh.membership.dto.Member;
import edu.kh.membership.service.MemberService;
import edu.kh.membership.service.MemberServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update/phone")
public class UpdatePhoneServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int index = Integer.parseInt(req.getParameter("index"));
		String newPhone = req.getParameter("newPhone");
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> memberList = service.getMemberList();
			
			memberList.get(index).setPhone(newPhone);
			
			service.getMemberList();
			
			resp.sendRedirect("/selectList");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
