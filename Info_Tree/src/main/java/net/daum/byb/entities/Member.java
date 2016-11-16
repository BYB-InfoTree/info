package net.daum.byb.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Component
public class Member {
	private String email;
	private String password;
	private String name;	
	private String nickname;
	private int point;
	private String phone;
	private String memberlevel;
	private String addr1;
	private int seq;
	private String joindate;
	
}