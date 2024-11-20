package com.muse.admin.model;

public class Paging {

	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int crpage) {
		StringBuffer sb=new StringBuffer();
		
		int totalPage=((totalCnt-1)/listSize)+1;
		int startPageNum=((crpage-1)/pageSize)*pageSize+1;
		int endPageNum=Math.min(startPageNum+pageSize-1, totalPage);
		
		if(startPageNum>1) {
			sb.append("<a href='");
			//sb.append("javascript:");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=startPageNum-1;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>&nbsp;&nbsp;");
		}
		
		for(int i=startPageNum;i<=endPageNum;i++) {
			if(i==crpage) {
				sb.append("<span style='font-weight: 700;'>");
				sb.append(i);
				sb.append("</span>");
			}else {
				sb.append("&nbsp;<a href='");
				//sb.append("javascript:");
				sb.append(pageName);
				sb.append("?cp=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;");
			}
		}
		
		if(endPageNum<totalPage) {
			sb.append("&nbsp;&nbsp;<a href='");
			//sb.append("javascript:");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=endPageNum+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		
		return sb.toString();
	}
}
