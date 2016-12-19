package net.daum.byb.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Component
public class Tboard {
	private int t_seq;
	private String t_id;
	private String t_password;
	private String t_nickname;	
	
	private String t_email;
	private String t_title;
	private String t_content;
	private String t_date;
	private String t_ip;
	private int t_ref;
	private int t_step;
	private int t_hit;
	private int t_level;
	private int t_recommend;
	private String t_attach;
	private int t_r_seq;
	private int t_r_ref;
	private int t_r_r_seq;
	private String t_comment;

}