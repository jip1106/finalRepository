package com.ezen.jobsearch.common;

public class Utility {
	//?éò?ù¥Ïß? Ï≤òÎ¶¨ Í¥??†® ?ÉÅ?àò
	public static final int BLOCK_SIZE=10;
	public static final int RECORD_COUNT=10;
	public static final int ZIPCODE_RECORD_COUNT=15;
	
	public static String getFileInfo(String originalFileName,
			long fileSize) {
		//?åå?ùº?†ïÎ≥? Î¶¨ÌÑ¥?ï¥Ï£ºÎäî Î©îÏÑú?ìú
		String fileInfo="";
		
		if(originalFileName!=null && !originalFileName.isEmpty()) {
			float fSize=fileSize/1024f;
			fSize=Math.round(fSize*100)/100f;
			
			fileInfo=originalFileName+" ( "+ fSize+"KB )";
		}
		
		return fileInfo;
	}
	
	
}
