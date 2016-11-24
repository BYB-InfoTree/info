package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Member;

public interface MemberDao {
	
	public int insertRow( Member member);
	public int selectCount( String email);
	public Member selectLogin(Member member);
	public Member selectOne( String email);
	public int updateData( Member email);
	public int memberDelete( String email );
	public ArrayList<Member> selectAll();
	public int deleteRow(String emails);
	public int memberlistupdate(Member member);

}
