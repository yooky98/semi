package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ImgFileRenamePolicy implements FileRenamePolicy{

	// 같은 이름의 파일이 존재할 수 있기 때문에 이를 방지하기 위한 목적으로 사용한다.
	@Override
	public File rename(File originFile) {	//originFile : 원본 파일
		
		String originFileName = originFile.getName();
		
		// 원하는 형식으로 이름 바꾸는 과정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String currentTime = sdf.format(new Date());		// 파일 생성 날짜와 시간
		
		//int random = (int)(Math.random()*90000 + 10000);	// 랜덤 숫자 다섯자리 -> 제외
		
		String ext = "";
		int dot = originFileName.lastIndexOf(".");
		ext = originFileName.substring(dot);				// 가져올 파일의 확장자 부분 잘라오기
		
		String newFileName = currentTime + ext;	// = 생성일시 + 랜덤숫자 다섯자리 + 확장자를 합친 새로운 파일명
		
		File renamedFile = new File(originFile.getParent(), newFileName);
		
		
		return renamedFile;
	}

}
