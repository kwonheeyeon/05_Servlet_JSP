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

@WebServlet("/update/plusAmount")
public class UpdatePlusAmountServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int index = Integer.parseInt(req.getParameter("index"));
		int plusAmount = Integer.parseInt(req.getParameter("plusAmount"));
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> memberList = service.getMemberList();
			
			int amount = memberList.get(index).getAmount();
			amount += plusAmount;
			memberList.get(index).setAmount(amount);
			
			service.getMemberList();
			
			resp.sendRedirect("/selectList");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
