package entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Member {
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String memberlevel;
	private String joindate;
	private int point;
	private int seq;
}
