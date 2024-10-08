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
			
			if(memberList.get(index).getAmount() < 0) {
				memberList.get(index).setAmount(0);
				memberList.get(index).setGrade(0);
			}
			
			if(memberList.get(index).getAmount() >= 1000000) {
				memberList.get(index).setGrade(2);
			} else if (memberList.get(index).getAmount() >= 100000) {
				memberList.get(index).setGrade(1);
			} else {
				memberList.get(index).setGrade(0);
			}
			
			service.getMemberList();
			
			resp.sendRedirect("/selectList");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
