package net.daum.byb.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Component
public class Member {
	private int seq;
	private String email;
	private String password;
	private String nickname;
	private String joindate;
	private int point;
	private String memberlevel;
	private String name;
	private String phone;
	private String newpassword;
	
}