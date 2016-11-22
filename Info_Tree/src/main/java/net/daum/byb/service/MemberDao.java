package net.daum.byb.service;

import net.daum.byb.entities.Member;

public interface MemberDao {
	
	public int insertRow( Member member);
	public int selectCount( String email);
	public Member selectLogin(Member member);
	public Member selectOne( String email);
	public int updateData( Member email);
	public int memberDelete( String email );

}
