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

@WebServlet("/search")
public class SelectNameServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("searchName");
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> memberList = service.getMemberList();
			List<Member> selectList = new ArrayList<Member>();
			
			
			for(Member member : memberList) {
				if(member.getName().equals(name)) {
					selectList.add(member);
				}
			}
			
			if(selectList.isEmpty()) {
				req.setAttribute("message", "조회 결과가 없습니다");
			}
			
			req.setAttribute("selectList", selectList);
			
			String path="/WEB-INF/views/searchName.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
