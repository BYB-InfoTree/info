package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Board;
import net.daum.byb.entities.Tboard;


public interface TBoardDao {
	
	public ArrayList<Tboard> selectAll();
	public int insertRow( Tboard tboard);
	public Tboard selectOne( int t_seq);
	public int updateRow(Tboard tboard);
	public int deleteRow(int t_seq);
}
