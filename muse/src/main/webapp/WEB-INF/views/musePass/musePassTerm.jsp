<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSEPASS</title>
<style>

.musepass ul {
	max-width: 800px;
    margin: 0 auto;
   display: flex;
   justify-content: space-between;
   list-style: none;
   padding: 0;
   margin-bottom: 50px;
   position: relative;
}

.musepass ul:after {
   content: '';
   position: absolute;
   top: 25px;
   left: 10%;
   right: 10%;
   height: 2px;
   background: #eee;
   z-index: 1;
}

.musepass ul li {
   text-align: center;
   position: relative;
   z-index: 2;
   background: white;
   padding: 0 20px;
}

.musepass h5 {
   color: #ff3e32;
   margin: 0;
   font-size: 14px;
}

.musepass h3 {
   margin: 10px 0;
   color: #333;
   font-size: 18px;
}

</style>
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
						<h3 >이용약관 동의 및 신청</h3>
					</li>
					<li>
						<h5>step2.</h5>
						<h3 style="color:#b2b2b2;">결제하기</h3>
					</li>
					
					<li>
						<h5>step3.</h5>
						<h3 style="color:#b2b2b2;">가입완료</h3>
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
<div style=" height: 100px; overflow: auto; border: 1px solid #ccc;">
    [인터파크 TOPING 멤버십 이용약관]
    <br><br>
    제 1 조 [목 적]
    <br>
    이 약관은 (주)인터파크트리플(이하 "회사"라 함)가 티켓판매서비스에 관하여 운영하는 TOPING 멤버십 서비스를 이용하는 자와 회사 간 권리∙의무, 이용조건, 관련 절차 및 기타 필요한 사항을 규정함을 목적으로 합니다.
    <br><br>
    제 2 조 [용어의 정의]
    <br>
    ① 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.
    <br>
    1. TOPING 멤버십 서비스(이하 “본 서비스”) : 회사의 인터파크 플랫폼(앱/웹) 내 티켓판매서비스에서 운영되는 멤버십 서비스로, 회사가 TOPING 멤버십 회원에게 제공하는 각종 혜택 및 관련 부가서비스 일체
    <br>
    2. 멤버십 회원 : 본 약관에 동의하고 가입비 결제 등 회사가 정하는 이용 신청 절차를 거쳐 본 서비스를 제공받는 회원
    <br>
    3. 가입비 : 본 서비스에 가입하여 멤버십 회원이 되고자 하는 자가 회사에 납입하는 금액
    <br>
    ② 본 약관에서 사용하는 용어의 정의는 본 약관에 한하여 유효하며, 본 약관에서 정하는 것을 제외하고 관계 법령과 「㈜인터파크 이용약관」(이하 “인터파크 이용약관”), 각 서비스별 이용약관, 개별 안내에서 정하는 바에 의한다.
    <br><br>
    제 3 조 [약관의 개정]
    <br>
    ① 회사는 필요하다고 인정되는 경우, 관계 법령에 위배되지 않는 범위 내에서 이 약관을 개정할 수 있으며, 약관이 개정될 경우 회사는 시행일 7일 이전에 회사가 제공하는 서비스 화면 등을 통해 공지한다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 30일 이상의 기간을 두고 공지 및 통지합니다. 다만, 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우 공지를 개별 통지로 간주합니다.
    <br>
    ② 회사가 전항에 따라 개정 약관에 대해 공지 또는 통지하면서 이용자에게 일정 기한 내에 거부의사를 표시하지 않으면 약관 개정에 동의한 것으로 간주한다고 알렸음에도 멤버십 회원이 명시적으로 개정약관에 대한 거부의사를 표시하지 않으면 이용자가 개정약관에 동의한 것으로 간주합니다.
    <br>
    ③ 회원은 개정된 약관에 동의하지 않을 경우 본 서비스 이용을 중단하고 멤버십 회원 탈퇴(이용계약 해지)를 요청할 수 있습니다.
    <br><br>
    제 4 조 [회원가입 등]
    <br>
    ① 멤버십 회원 가입은 인터파크 회원인 신청자가 본 약관의 내용에 대한 동의 등을 포함하여 회사가 정한 내용과 절차에 따라 신청하고, 회사가 필요한 사항을 확인 후 신청을 승낙함으로써 효력이 발생하며, 회사가 가입을 승낙한 때부터 회원에게 본 서비스가 개시됩니다.
    <br>
    ② 본 약관에 대한 동의는 멤버십 회원 가입 신청 당시 본 서비스 가입 화면 상의 '동의함' 버튼을 누르는 것을 의사표시로 봅니다.
    <br>
    ③ 멤버십 회원 가입비를 결제해야 하는 경우 회사에 이를 납부해야 최종적으로 멤버십 회원 가입이 성립합니다.
    <br>
④ 회사는 다음 각 호에 해당하는 멤버십 회원 가입 신청에 대하여는 그 사유가 해소될 때까지 승낙을 유보하거나 거절할 수 있으며, 승낙 이후에도 본 서비스 이용을 제한하거나 승인을 취소하고 이용계약을 해제∙해지할 수 있습니다.
1. 본 서비스를 이용하고 있는 멤버십 회원이 중복으로 가입 신청하는 경우
2. 본 서비스 가입비를 지급해야 하는 경우에 이를 이행하지 않은 경우
3. 본 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 멤버십 회원으로 수용이 어려운 경우
4. 인터파크 이용약관 상의 회원 가입 유보 및 거절 사유는 멤버십 회원 가입에 관하여 준용되며, 이에 해당하는 사유가 있는 경우
5. 인터파크 회원으로서 인터파크 이용약관 상 금지행위 내지 회원자격 제한, 정지 사유에 해당하는 행위로 제재를 받은 사실이 있는 경우
6. 기타 회사가 정한 신청 요건이 충족되지 않았거나, 위법 또는 사회상규에 반하는 부당한 신청인 경우 또는 회원의 책임 있는 사유로 인하여 회사가 승낙할 수 없는 경우
제 5 조 [회사의 권리와 의무]
① 회사는 본 약관이 정하는 바에 따라 지속적이고 안정적으로 본 서비스를 제공하는데 최선을 다합니다.
② 회사는 멤버십 회원로부터 제기되는 불편사항 및 문제에 대해 정당하다고 판단되는 경우 그 문제를 해결하는데 최선을 다하며, 신속한 해결이 어려울 경우 멤버십 회원에게 사유와 예상되는 일정을 안내합니다.
③ 회사는 멤버십 회원이 서비스를 이용하는 과정에서 행한 활동을 통해 생성된 정보를 통계자료 작성, 본 서비스의 홍보, 개선 및 적용 등의 목적으로 활용할 수 있습니다.
④ 회사는 멤버십 회원의 서비스 이용에 필요하다고 인정되는 다양한 정보를 전자우편 및 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있습니다.
⑤ 회사는 본 서비스 제공에 있어 개인정보보호법, 정보통신망 이용촉진 및 정보보호에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계 법규를 준수합니다.
제 6 조 [회원의 의무]
① 인터파크 이용약관 상의 회원의 금지행위 또는 회원자격 제한 및 정지 사유는 본 서비스에 관하여 준용되며, 멤버십 회원은 위 금지행위 또는 회원자격 제한 및 정지 사유에 해당하는 행위를 해서는 아니 됩니다.
② 멤버십 회원은 본 서비스의 정상적인 운영을 방해하는 행위 및 그러한 시도를 할 수 없으며, 기타 본 서비스에 관한 회원의 의무 또는 준수사항을 위반하는 행위 및 법령에서 규정하는 위법행위를 해서는 안 됩니다.
③ 멤버십 회원은 결제수단, 결제정보를 포함한 회원정보를 최신으로 유지하여야 하며, 적법한 사용권한을 가지고 있는 결제수단을 사용하여야 합니다. 회사는 회원이 입력한 회원정보의 부정확 또는 부적법함으로 인하여 발생하는 불이익에 대하여 책임지지 않습니다.
④ 멤버십 회원은 본 약관에 따른 권리∙의무의 전부 또는 일부를 타인에게 대여, 양도, 위임, 담보제공, 증여할 수 없으며, 또한 질권의 목적으로도 사용할 수 없습니다.
⑤ 회사는 회원이 위 제1항 내지 제4항을 위반하여 발생한 회원이나 제3자의 손해 등에 대해 일체의 책임을 지지 않습니다.
제 7 조 [서비스 제공]
① 본 서비스는 Prime, Original, 2만원권, 1만원권 등의 멤버십 종류가 있으며, 본 서비스의 이용 기간은 본 서비스가 개시된 날로부터 한 1년으로 합니다. 멤버십 회원은 회사의 귀책으로 인한 사유를 제외하고 회원의 사정으로 인하여 이용 기간을 일시정지 하거나 연장할 수 없습니다.
② 회사는 본 서비스에 부수하는 개별 서비스에 대한 세부정책을 별도로 정할 수 있으며, 개별 서비스별 내용, 가입비 등 세부정책은 서비스 소개 페이지, 멤버십 회원 가입 페이지 또는 그로부터 연결된 화면 등에 명시하는 방식으로 안내합니다. 개별 서비스에 대한 세부정책은 본 약관에 우선합니다.
③ 멤버십 회원이 본 서비스를 이용하여 공연∙레저상품을 구입하는 때, 구입할 수 있는 공연물 및 좌석 수량과 할인범위 등은 각 공연마다 기획사의 사정 등에 따라 달라질 수 있습니다.
④ 본 서비스를 제휴 내지 프로모션 등 혜택을 통해 무상 또는 할인된 가격으로 이용하게 되는 경우, 해당 혜택의 내용 및 조건과 그에 따라 제공되는 서비스 내용 등은 별도 페이지에서 안내합니다. 회사는 무상으로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요 상 수정, 중단, 변경할 수 있으며, 이에 대하여 회원에게 별도의 보상을 하지 않습니다.
⑤ 회사는 운영상, 기술상의 필요 또는 제휴사의 사정 내지 정책 변경 등 상당한 이유가 있는 경우에 서비스 내용 및 구성, 혜택 지원 등 본 서비스의 전부 또는 일부를 변경이나 종료할 수 있습니다. 이 경우 회사는 제3조의 약관 개정과 같은 방식으로 변경 사항의 적용 대상이 되는 멤버십 회원에 대하여 변경 사항을 공지 또는 통지합니다.
제 8 조 [쿠폰 및 I-Point]
① 멤버십 회원에게 멤버십 종류별로 아래와 같은 권종과 유효기간의 쿠폰이 제공됩니다. 이 중 2,000원권 쿠폰은 멤버십 회원이 본 서비스 페이지 내에서 별도로 발급받아야 하며, 멤버십 회원이 해당 쿠폰을 발급받은 날부터 유효기간이 기산됩니다. 유효기간이 초과된 쿠폰은 소멸되고 환급 불가합니다.
- 2만원권: 5,000원 쿠폰 1매 (발급일로부터 3개월)
- Original: 5,000원 쿠폰 2매 (발급일로부터 3개월), 2,000원 쿠폰 5매(발급일로부터 1주일)
- Prime: 50,000원 쿠폰 3매 (발급일로부터 6개월), 30,000원 쿠폰 4매 (발급일로부터 6개월)
- 하나카드 제휴: 2,000원 쿠폰 5매 (발급일로부터 1주일)
② 멤버십 회원 중 Prime 또는 Original 멤버십을 이용하는 경우, 아래와 같은 금액, 유효기간의 I-Point가 지급됩니다. 유효기간이 초과된 I-Point는 소멸되고 환급 불가합니다.
- Original: I-Point 10,000P (적립일로부터 180일)
- Prime: VIP석 2매 상당 I-Point 250,000P (적립일로부터 180일)
제 9 조 [청약철회, 해지 및 환불]
① 멤버십 회원이 본 서비스를 단 한 번도 이용하지 않은 경우 가입비 납부일로부터 7일 이내 청약철회가 가능하며, 기지급한 가입비 전액이 환불됩니다. 멤버십 회원이 본 서비스를 이용한 경우 가입비 납부일로부터 7일 이내 본 서비스 이용계약을 중도 해지 시 멤버십 회원의 해당 서비스 이용 금액을 산정하여 공제 후 가입비가 환불됩니다.
② 멤버십 회원이 가입비를 납부한 날로부터 7일 후 본 서비스를 중도 해지하는 경우, 가입비에서 위약금과 본 서비스로 지급된 I-Point 금액을 공제하며, 멤버십 회원이 본 서비스를 이용한 때에는 해당 서비스 이용 금액을 추가로 공제하여 환불됩니다. 이 때, 위약금은, Prime 멤버십의 경우 가입비의 15%, 그 외 멤버십 회원권은 가입비의 10%로 합니다.
③ 위 제1항과 제2항에 있어, 회사로부터 본 서비스를 제공받은 경우도 회원이 서비스를 이용한 것으로 보며, 서비스 이용 금액의 산정 기준은 서비스 화면에서 별도로 게시하여 안내합니다.
④ 청약철회 또는 중도 해지로 환불 금액 산정 시 멤버십 회원에게 지급된 I-Point 금액이 공제되는 경우, 해당 I-Point는 회수하지 않으며, 멤버십 회원은 본 서비스 중도해지 후에도 이를 사용 가능합니다. 그러나 Prime 멤버십 회원 가입 시 VIP석 2매 상당의 I-Point를 지급받은 경우, 해당 I-Point는 청약철회 또는 중도해지 즉시 멤버십 회원으로부터 회수될 수 있으며, 이 때, 환불 대상 금액에서는 해당 금액을 공제하지 않습니다. 다만, 멤버십 회원의 I-Point가 부족하여 이를 회수할 수 없는 경우에는 환불 대상 금액에서 해당 I-Point 금액 상당이 공제됩니다.
⑤ 중도 해지 등으로 인한 환불 금액은 멤버십 회원이 실제 지급한 가입비를 기준으로 해당 금액의 한도 내에서 산정되며, 환불 대상인 기지급 가입비에서 위약금 등을 공제한 뒤 남은 금액이 없는 경우 환불금은 지급되지 아니합니다.
⑥ 멤버십 회원이 제휴 내지 프로모션 등 혜택으로 실제 지급한 금액 없이 본 서비스를 이용하는 경우에는 가입비 등 일체의 환불은 불가합니다.
⑦ 본 서비스 중 I-Point를 지급받는 서비스를 이용하는 경우, 해당 I-Point는 가입비 납부일로부터 7일 후에 멤버십 회원에게 지급되는 것을 원칙으로 합니다. 본 서비스 청약철회 또는 중도 해지로 인한 환불 시점 기준으로 본 서비스에 따른 쿠폰 또는 I-Point가 아직 지급되지 아니한 경우, 해당 쿠폰 또는 I-Point는 지급되지 않습니다.
제 10 조 [서비스의 중단]
① 회사는 다음 각 호의 경우로 인하여 본 서비스를 제공할 수 없는 경우 사전 안내 후 본 서비스의 제공을 중단할 수 있고, 본 서비스 제공에 관한 책임이 면제됩니다. 사전 안내를 하기 어려운 부득이한 경우 회사는 본 서비스 중단 후에 해당 사실을 안내할 수 있습니다.
1. 통제할 수 없는 기술적 장애
2. 기간통신사업자, 본 서비스와 연관된 대행사, 제휴사에 불가피한 서비스 제공 제한 사항이 발생하는 경우 등 제3자의 귀책사유
3. 본 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
4. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
5. 국가비상사태, 천재지변, 전염병의 창궐 또는 이에 준하는 불가항력적 사유
② 회사는 멤버십 회원의 귀책사유로 인한 본 서비스 이용의 장애에 대하여는 회사의 귀책사유가 없는 한 책임지지 않습니다.
제 11 조 [서비스의 이용 제한, 해지]
① 멤버십 회원이 본 서비스에 관한 의무 또는 준수사항을 위반하거나 위법 행위를 하였을 경우, 회사는 해당 멤버십 회원의 서비스 이용을 제한할 수 있으며, 14일 이상의 기간을 정하여 시정 요구 후 기간 내에 시정이 이루어지지 않거나 3회 이상 동일 행위 반복 시 본 이용계약을 해지할 수 있습니다. 멤버십 회원의 본 서비스에 관한 의무 또는 준수사항 위반 정도가 현저하거나 회복하기 어려운 피해가 발생 또는 예상되는 경우, 혹은 위법 행위를 한 경우, 회사는 즉시 본 이용계약을 해지할 수 있습니다.
② 본 약관에 의해 멤버십 회원의 서비스 이용이 제한되거나 본 이용계약이 해지된 경우, 해당 멤버십 회원의 본 서비스 재가입 및 이용 신청이 제한될 수 있습니다.
③ 멤버십 회원은 멤버십 이용기간 동안 인터파크 회원 탈퇴가 제한될 수 있으며, 인터파크 또는 멤버십 중도 탈퇴 후 재가입 시 기존의 멤버십은 복원되지 않습니다.
제 12 조 [손해배상]
① 회사 또는 맴버십 회원은 본 약관을 위반하여 상대방 또는 제3자에게 손해를 입힌 경우에 그 손해를 배상할 책임이 있습니다. 다만, 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
② 회사는 회사의 귀책사유 없이, 멤버십 회원 상호간 또는 멤버십 회원과 제3자간에 본 서비스를 매개로 하여 발생한 분쟁 등에 대하여 책임을 지지 않습니다.
제 13 조 [기타]
① 본 약관과 인터파크 이용약관이 상충하는 경우 본 약관이 우선합니다. 회사와 멤버십 회원 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다
② 본 약관에서 규정되지 않은 사항에 대해서는 정보통신망 이용촉진 및 정보보호에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한 법률, 약관 규제 등에 관한 법률 등 관계 법령 및 인터파크 이용약관, 개별 서비스의 이용약관, 운영정책, 이용안내의 내용에 따릅니다.
③ 본 약관은 대한민국 법률에 따라 규율되고 해석됩니다.
④ 회사와 멤버십 회원 간에 분쟁이 발생할 경우, 회사와 회원은 분쟁의 해결을 위해 성실히 협의하며, 협의로 해결되지 않는 경우 민사소송법 상의 관할법원에 소를 제기할 수 있습니다.
[부칙]
제1조 (시행일자)
본 약관은 2015년 3월 1일부터 시행됩니다.
[부칙]
제1조 (시행일자)
본 약관은 2023년 3월 31일부터 시행됩니다
									</div>
								</li>
								<li>
									<input type="checkbox" id="Privacy" name="seatCheck" class="checkSet">
									<label for="Privacy">개인정보 수집에 동의합니다.</label>
									<div>[개인정보 수집동의]
<br><br>
수집항목 : 핸드폰번호, 이메일, 결제 정보(카드 혹은 무통장)<br>
수집목적 : 인터파크 유료회원제 토핑 가입 및 멤버십 내용 안내<br>
이용기간 : 유료회원제 가입 해제시 까지<br>
※ 개인정보 수집에 동의 거부하실 수 있으나, 동의 거부 시 가입이 불가합니다.</div>
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