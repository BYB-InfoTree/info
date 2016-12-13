package net.daum.byb.service;

import java.util.ArrayList;



import net.daum.byb.entities.TBoard;

public interface TBoardDao {
	
	public ArrayList<TBoard> selectAll();	
	public TBoard selectOne(int t_seq);
	public int insertRow( TBoard tboard);
	public int updateRow( TBoard board );

}
