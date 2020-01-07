package com.ezen.jobsearch.common;

public class Utility {
	//??΄μ§? μ²λ¦¬ κ΄?? ¨ ??
	public static final int BLOCK_SIZE=10;
	public static final int RECORD_COUNT=10;
	public static final int ZIPCODE_RECORD_COUNT=15;
	
	public static String getFileInfo(String originalFileName,
			long fileSize) {
		//??Ό? λ³? λ¦¬ν΄?΄μ£Όλ λ©μ?
		String fileInfo="";
		
		if(originalFileName!=null && !originalFileName.isEmpty()) {
			float fSize=fileSize/1024f;
			fSize=Math.round(fSize*100)/100f;
			
			fileInfo=originalFileName+" ( "+ fSize+"KB )";
		}
		
		return fileInfo;
	}
	
	
}
