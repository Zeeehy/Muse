<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 검색 아이콘 -->
<style>
/* 팝업 스타일 */
.musicalNamePopup {
        
        
        top: 0; 
        left: 110%; 
        margin-left: 10px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0.3rem 0.6rem rgba(0, 0, 0, 0.2);
        z-index: 100;
        display: none;
        width: 280px;
    }

    /* 닫기 버튼 스타일 */
    .MusicalNameClose-btn {
        position: absolute;
        top: 5px;
        right: 5px;
        background: none;
        border: none;
        font-size: 18px;
        cursor: pointer;
    }

    /* 검색 입력 스타일 */
    #searchInputMusicalName {
        width: 85%;
        padding-right: 30px;
    }

    /* 검색 아이콘 */
    #searchIcon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
    #MusicalListTable {
    	width:100%;
    }
.table-content input[value="찾기"] {
    width: 80px;
    height: 40px;
    border-radius: 10px;
    padding: 8px 20px;
    background-color: #60c558;
    color: white;
    border: none;
    cursor: pointer;
}
</style>
</head>

    <div id="musicalNamePopup" class="musicalNamePopup">
    <div class="musicalNameWrap">
       
        <button class="MusicalNameClose-btn" onclick="closeMusicalNamePopup()">X</button>
          <div style="position: relative; width: 100%; max-width: 300px;">
            <input type="text" id="searchInputMusicalName" placeholder="검색어를 입력하세요">
            <i class="fas fa-search" id="searchIcon" onclick="SeachMusicalName()"></i>
        </div>
        <table id="MusicalListTable">
            <thead>
                <tr>
                    <th>뮤지컬 목록</th>
                </tr>
            </thead>
            	<tbody id="MusicalNameTableBody">
            </tbody>
        </table>
    </div>
	</div>
<script>

function SeachMusicalName(){
	var param = 'pr_code=${s_pr_code}';
	var searchInputMusicalName = document.getElementById("searchInputMusicalName").value;

// 입력값이 null이 아닌 경우에만 param 수정
if (searchInputMusicalName) {
    param = param + '&searchMusical=' + encodeURIComponent(searchInputMusicalName);
}


	var searchInputMusicalName = sendRequest('getMusicalList.do',param,ResultSeachMusicalName,'GET');
}
function ResultSeachMusicalName(){
	if(XHR.readyState==4){
		if (XHR.status == 200) {
		    var data = XHR.responseText;
		    var MusicalList = JSON.parse(data);
		    
		    var tableBody = document.getElementById('MusicalNameTableBody');
		    tableBody.innerHTML = '';
		    // 결과가 없을 때
		    if (MusicalList.list.length === 0) {
		        var row = document.createElement('tr');
		        var noResultCell = document.createElement('td');
		        noResultCell.textContent = '검색된 결과가 없습니다.';
		        noResultCell.colSpan = 3;  
		        row.appendChild(noResultCell);
		        tableBody.appendChild(row);
		    } else {
		        // 결과가 있을 때
		        for (var i = 0; i < MusicalList.list.length; i++) {
		            var dto = MusicalList.list[i];
		            var MusicalName = dto.m_title;
		            
		            
		            // 새 행 생성
		            var row = document.createElement('tr');
		            row.innerHTML = '<td style="text-align: center;"><a onclick="inputMusicalName(this)" id = '+dto.m_code +'>' + MusicalName + '</a></td>';
					
		            function inputMusicalName(MusicalName){
		                document.getElementById('m_title').value = MusicalName;
		                
		            }
		            tableBody.appendChild(row);
		        }
		    }
		}
	}
}


function showMusicalNamePopup(button) {
	SeachMusicalName();
    var popup = document.getElementById('musicalNamePopup');
    
    
    var buttonInfo=button.target;
    var rect = buttonInfo.getBoundingClientRect(); 
    
    
    popup.style.left = (rect.left + 100)+ 'px';
    popup.style.top = (rect.top)+ 'px'; 
	
    popup.style.display = "block";
    popup.style.position = "absolute";
    
}

function closeMusicalNamePopup() {
    const popup = document.getElementById('musicalNamePopup');
    popup.style.display = 'none'; 
}
</script>
</html>
