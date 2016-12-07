package net.daum.byb.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data
public class FileBean {
	 private String attach_path;
     private MultipartFile upload;
     private String filename;
     private String CKEditorFuncNum;
}
