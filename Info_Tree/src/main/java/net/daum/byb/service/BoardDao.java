package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Board;


public interface BoardDao {
	public int selectCountAll ();
	public Board selectOne( int b_seq );
	public ArrayList<Board> selectAll( );
	public int insert_Row( Board board );
	public int insert_Reply( Board board );
	public int update_Row( Board board );
	public int delete_Row( int b_seq );
	public int update_Hit( int b_seq );
}
