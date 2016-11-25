package net.daum.byb.service;

import java.util.ArrayList;

import net.daum.byb.entities.Board;

public interface BoardDao {
	
	
	public ArrayList<Board> selectAll();
}
