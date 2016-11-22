package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Member;



public interface MemberDao {
	public Member selectOne( String email );
	public int selectCount( String email );
	public int insertRow( Member member );
	public ArrayList<Member> selectAll();
	public int updateRow(Member member);
	public int deleteRow(String email);
	public Member selectLogin(Member member);
}
