package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Member;

public interface MemberDao {
	
	public int insertRow( Member member);
	public ArrayList<Member> selectAll ();
	public int selectCount( String email);
	public Member selectLogin(Member member);
	public Member selectOne( String email);
	public int updateData( Member email);
	public int memberUpdate( Member member);
	public int memberDelete( String email );
	public int delete_Row(String id);
}
