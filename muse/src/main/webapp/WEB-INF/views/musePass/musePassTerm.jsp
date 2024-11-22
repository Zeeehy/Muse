<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSEPASS</title>
<link rel="stylesheet" type="text/css" href="resources/css/Jinu.css">
</head>
<body>
<%@include file="../header.jsp" %>
	<div class="content">
		<article class="musepass">
			<h2>MUSEPASS 가입하기</h2>
			
			<div>
				<ul class="next">
					<li>
						<h5>step1.</h5>
						<h3>이용약관 동의 및 신청</h3>
					</li>
					<li>
						<h5>step2.</h5>
						<h3>결제하기</h3>
					</li>
					
					<li>
						<h5>step3.</h5>
						<h3>가입완료</h3>
					</li>
				</ul>
				
				<div class="contents">
					
					<div class="notification">
						<h2>가입하시기 전&nbsp; <b style="color:#ff3e32;"> 반드시&nbsp; </b> 읽어주세요</h2>
						
						<div class="p_box">
							<p>가입일 포함 7일 이내 서비스 취소 시, 기간 내 TOPING 서비스 이용 내역이 없을 경우 전액 환불됩니다. 서비스 이용 내역이 있을 경우 이용금액 공제 후 환불됩니다. (TOPING 클럽 내 FAQ 참조)<br><br>
							가입일 포함 7일 이후 서비스 취소 시, 서비스 이용 내역이 없을 경우 위약금 공제 후 환불됩니다. 서비스 이용 내역이 있을 경우 이용금액과 위약금 공제 후 환불됩니다. (1만원/2만원/Original: 가입비의 10%, Prime: 가입비의 15%)<br><br>
							Prime등급 가입 시 Welcome Kit는 연회비 납부일로부터 7일 이후 가입 시 입력하신 회원 정보상의 주소로 배송됩니다. (배송기간은 발송 후 영업일 기준 최대 3일 정도 소요됩니다) 서비스 취소 시 별도의 반환 절차 없이 상기위약금(가입비의 15%)공제로 갈음합니다.<br><br>
							I-Point는 연회비 납부일로부터 7일 이후 적립되며, 적립일로부터 6개월(180일)간 유효합니다. 서비스 취소 시 포인트 사용여부와 무관하게 회원가입비에서 100% 공제 후 환불(지급된 I-Point는 회수하지 않음)처리됩니다. (단, Prime등급의 경우 제공된 I-Point를 회수하며, I-Point 부족분 발생 시 부족분만큼만 공제 후 환불)<br>
							TOPING 쿠폰은 등급에 따라 금액, 발급 방식, 유효기간의 차이가 있습니다. (TOPING클럽 내 FAQ 참조)<br>
							TOPING 이용기간 중 인터파크 회원 탈퇴 시 TOPING 서비스 이용 및 환불이 불가하며, 재가입 시 신규 계정으로 복원되지 않습니다.<br><br>
							 인터파크 회원 탈퇴 시 사용하지 않은 I-Point 및 할인쿠폰 등은 복원 및 환불이 불가합니다.<br>
							TOPING 서비스 취소 접수는 고객센터 1577-7722를 이용하시기 바랍니다.<br><br>
							TOPING 서비스 재가입은 유효기간이 종료된 이후 가능합니다. (단, 1만원권은 공연할인 2회 소진 이후 재가입 가능합니다.)<br><br>
							자세한 서비스 내용은 TOPING 클럽 내 FAQ 참조하시거나 아래의 이용약관을 확인해 주시기 바랍니다.</p>
						</div>
						<div class="joinClause">
							<ul>
								<li>
									<input type="checkbox" id="selectAllCheck" name="seatCheck" class="checkAll">
									<label for="selectAllCheck">전체 동의하기</label>
								</li>
								<li>
									<input type="checkbox" id="termsService" name="seatCheck" class="checkSet">
									<label for="termsService">Toping 이용약관에 동의 합니다.</label>
								</li>
								<li>
									<input type="checkbox" id="Privacy" name="seatCheck" class="checkSet">
									<label for="Privacy">개인정보 수집에 동의합니다.</label>
								</li>
							</ul>
							<div class="joinBt"><a href="javascript:;"  id="join">가입하기</a></div>
						</div>
					</div>
					
					
					
				</div>
			</div>
		</article>
	</div>
<%@include file="../footer.jsp" %>
</body>
<script type="text/javascript">


	
var selectAll = document.querySelector('#selectAllCheck');
var checkboxes = document.querySelectorAll('.checkSet');

// 전체 선택 체크박스 이벤트 리스너
selectAll.addEventListener('change', function() {
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = selectAll.checked;
    });
});

// 개별 체크박스 이벤트 리스너
checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
        // 모든 체크박스가 체크되었는지 확인
        let allChecked = true;
        checkboxes.forEach(function(cb) {
            if (!cb.checked) {
                allChecked = false;
            }
        });
        
        // 전체 선택 체크박스 상태 업데이트
       selectAll.checked = allChecked;
    });
});

var join = document.querySelector('#join');

join.addEventListener("click", function(){
	
	if(selectAll.checked){
		
		window.location.href='musePassPayment.do';
		
	} else {
		alert("이용약관 및 개인정보수집 동의를 체크해주시기 바랍니다.");
	}
	
});
		
	
</script>
</html>