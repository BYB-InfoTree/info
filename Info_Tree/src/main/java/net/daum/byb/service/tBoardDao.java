package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Board;
import net.daum.byb.entities.BoardPaging;


public interface tBoardDao {
	
	public int selectCount(BoardPaging boardpaging);	
	public int selectCountAll(BoardPaging boardpaging);	
	public Board selectOne( int b_seq);
	public int insertRow( Board board);
	public int insertReply( Board board);
	public ArrayList<Board> selectAll();
	public ArrayList<Board> selectPagelist(BoardPaging boardpaging);
	public int updateRow(Board board);
	public int deleteRow(int b_seq);
	public int updateHit(int b_hit);
	public int selectCountAll();
	
	
}
