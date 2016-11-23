package net.daum.byb.entities;



import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Member {
	
	private String email;
	private String password;
	private String name;
	private String nickname;
	private int    point;
	private String phone;
	private String memberlevel;
	private int    seq;
	private String joindate;
	private String newpassword;
	
}
