package edu.kh.membership.dao;

import java.io.IOException;
import java.util.List;

import edu.kh.membership.dto.Member;

public interface MemberDao {

	List<Member> getMemberList();

	boolean addMember(Member member) throws IOException;

}