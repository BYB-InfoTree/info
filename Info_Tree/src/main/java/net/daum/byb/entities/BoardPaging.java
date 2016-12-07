package net.daum.byb.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Component
public class BoardPaging {
	private String find;
	private String selectbox;
	private int startrow;
	private int endrow;

}