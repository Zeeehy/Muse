<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Jinu.css">
<script src="/muse/resources/js/httpRequest.js"></script>
<Style>

</Style>
</head>
<body>
<%@include file="../header.jsp"%>
<div class="section_notice">
	<div class="board">
 
		<div class="list">
			<div class="top_title">
				<h2>오픈 공지</h2>
			</div>
			<div class="table">
				<table>
					<thead>
						<tr class="title">
							<td style="width:70%;">제목</td>
							<td style="width:15%;">오픈일시</td>
							<td style="width:15%;">조회수</td>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty noticeList  }">
						<tr> <td colspan="3"> 등록된 공지가 없습니다. </tr>
					</c:if>
					
					<c:forEach items="${noticeList }" var="notice">
					
						<tr class="content">
							<td><a href="openNoticeView.do?on_code=${notice.on_code }">${notice.m_title }</a></td>
							<td> ${notice.on_open } </td>
							<td>${notice.on_readnum }</td>						
						</tr>
						
					</c:forEach>
					</tbody>
				</table>
				<div id="pageNav">${pagingStr }</div>
			</div>
			
		</div>
	</div>
</div>

<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">

function showNotice(cr){
    var params = 'crpage='+cr+'&m_code=${mddto.m_code}';
    sendRequest('noticeList.do', params, function(){
        if (XHR.readyState === 4) {
            if (XHR.status === 200) {
                var data = JSON.parse(XHR.responseText);
                var html = '';
                
                if(data.noticeList.length === 0) {
                    html = '<tr><td colspan="3">등록된 공지가 없습니다.</td></tr>';
                } else {
                    data.noticeList.forEach(function(notice) {
                        html += '<tr class="content">';
                        html += '<td><a href="openNoticeView.do?on_code=' + notice.on_code + '">' + notice.m_title + '</a></td>';
                        html += '<td>' + notice.on_open + '</td>';
                        html += '<td>' + notice.on_readnum + '</td>';
                        html += '</tr>';
                    });
                }
                
                // tbody만 선택하여 업데이트
                document.querySelector('.table table tbody').innerHTML = html;
                document.getElementById('pageNav').innerHTML = data.pagingStr;
            }
        }
    }, 'GET');
}

</script>
</html>