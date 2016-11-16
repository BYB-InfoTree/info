package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Member;


public interface MemberDao {
	public Member selectOne( String id );
	public int selectCount (String id);
	public int insert_Row(Member member);
	public ArrayList<Member> selectAll ();
	public int update_Row(Member member);
	public int delete_Row(String id);
	public Member selectLogin( Member member );
}
