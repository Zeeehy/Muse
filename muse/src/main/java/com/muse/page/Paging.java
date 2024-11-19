package com.muse.page;

public class Paging {

	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int crpage) {
		StringBuffer sb=new StringBuffer();
		
		int totalPage=((totalCnt-1)/listSize)+1;
		int startPageNum=((crpage-1)/pageSize)*pageSize+1;
		int endPageNum=Math.min(startPageNum+pageSize-1, totalPage);
		
		if(startPageNum>1) {
			sb.append("<a href='");
			sb.append("javascript:showNotice(");
			//sb.append("?crpage=");
			int temp=startPageNum-1;
			sb.append(temp);
			sb.append(")'>&lt;&lt;</a>&nbsp;&nbsp;");
		}
		
		for(int i=startPageNum;i<=endPageNum;i++) {
			if(i==crpage) {
				sb.append("<span>");
				sb.append(i);
				sb.append("</span>");
			}else {
				sb.append("&nbsp;<a href='");
				sb.append("javascript:showNotice(");
				//sb.append("?crpage=");
				sb.append(i);
				sb.append(")'>");
				sb.append(i);
				sb.append("</a>&nbsp;");
			}
		}
		
		if(endPageNum<totalPage) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append("javascript:showNotice(");
			//sb.append("?crpage=");
			int temp=endPageNum+1;
			sb.append(temp);
			sb.append(")'>&gt;&gt;</a>");
		}
		
		return sb.toString();
	}
}
