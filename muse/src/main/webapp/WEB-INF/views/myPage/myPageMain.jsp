<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage,
.mypage * {
  box-sizing: border-box;
}
.mypage {
  background: #ffffff;
  height: 1080px;
  position: relative;
  overflow: hidden;
}
.main {
  position: absolute;
  inset: 0;
}
.header {
  width: 1928px;
  height: 140px;
  position: static;
}
.navi {
  width: 1920px;
  height: 90px;
  position: static;
}
.bk {
  background: #ffffff;
  width: 1920px;
  height: 90px;
  position: absolute;
  left: -8px;
  top: 50px;
}
._01-1 {
  width: 103px;
  height: 51px;
  position: absolute;
  left: 210px;
  top: 69px;
  object-fit: cover;
}
.div {
  color: #000000;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 20px;
  font-weight: 600;
  position: absolute;
  left: 457px;
  top: 83px;
}
.div2 {
  color: #000000;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 20px;
  font-weight: 600;
  position: absolute;
  left: 647px;
  top: 83px;
}
.div3 {
  color: #000000;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 20px;
  font-weight: 600;
  position: absolute;
  left: 837px;
  top: 83px;
}
.div4 {
  color: #ff3d32;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 20px;
  font-weight: 600;
  position: absolute;
  left: 992px;
  top: 83px;
}
.free-icon-magnifying-glass-search-16492-1 {
  width: 40px;
  height: 40px;
  position: absolute;
  left: 1630px;
  top: 75px;
  object-fit: cover;
}
.line-2 {
  margin-top: -1px;
  border-style: solid;
  border-color: #000000;
  border-width: 1px 0 0 0;
  width: 60px;
  height: 0px;
  position: absolute;
  left: 1320px;
  top: 65px;
  transform-origin: 0 0;
  transform: rotate(90deg) scale(1, 1);
}
.div5 {
  color: rgba(0, 0, 0, 0.5);
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 18px;
  font-weight: 600;
  position: absolute;
  left: 1350px;
  top: 84px;
}
.line-1 {
  margin-top: -1px;
  border-style: solid;
  border-color: #000000;
  border-width: 1px 0 0 0;
  width: 1920px;
  height: 0px;
  position: absolute;
  left: -8px;
  top: 140px;
}
.top-navi {
  width: 1920px;
  height: 50px;
  position: static;
}
.bkbk {
  width: 1920px;
  height: 50px;
  position: absolute;
  left: 0px;
  top: 0px;
  overflow: visible;
}
.join {
  color: #ffffff;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 15px;
  font-weight: 600;
  position: absolute;
  left: 1426px;
  top: 16px;
}
.login {
  color: #ffffff;
  text-align: left;
  font-family: "Pretendard-SemiBold", sans-serif;
  font-size: 15px;
  font-weight: 600;
  position: absolute;
  left: 1575px;
  top: 16px;
}
.mymusepass {
  width: 195px;
  height: 50px;
  position: static;
}
.redbk {
  width: 195px;
  height: 50px;
  position: absolute;
  left: 1116px;
  top: 0px;
  overflow: visible;
}
.my-musepass {
  color: #ffffff;
  text-align: left;
  font-family: "MvBoli-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 1144px;
  top: 13px;
}
._7-1 {
  width: 20px;
  height: 21px;
  position: absolute;
  left: 1263px;
  top: 16px;
  object-fit: cover;
}
.rectangle-32 {
  background: #f0f0f0;
  border-style: solid;
  border-color: var(--color-2, #d9d9d9);
  border-width: 1px;
  width: 247px;
  height: 212px;
  position: absolute;
  left: 232px;
  top: 170px;
}
.rectangle-34 {
  background: #ffffff;
  border-style: solid;
  border-color: #1e1e1e;
  border-width: 3px;
  width: 1112px;
  height: 53px;
  position: absolute;
  left: 558px;
  top: 232px;
}
.rectangle-35 {
  background: #ffffff;
  border-style: solid;
  border-color: #007aff;
  border-width: 2px;
  width: 1112px;
  height: 53px;
  position: absolute;
  left: 558px;
  top: 232px;
}
.rectangle-33 {
  background: rgba(255, 255, 255, 0.7);
  border-style: solid;
  border-color: #d9d9d9;
  border-width: 1px;
  width: 247px;
  height: 471px;
  position: absolute;
  left: 232px;
  top: 410px;
}
.div6 {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 269px;
  top: 446px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div7 {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 268px;
  top: 493px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.musepass {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 269px;
  top: 540px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div8 {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 268px;
  top: 587px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div9 {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 269px;
  top: 634px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
._1-1 {
  color: #000000;
  text-align: left;
  font-family: "IstokWeb-Bold", sans-serif;
  font-size: 15px;
  font-weight: 700;
  position: absolute;
  left: 269px;
  top: 681px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div10 {
  color: #000000;
  text-align: right;
  font-family: "Inter-Bold", sans-serif;
  font-size: 16px;
  font-weight: 700;
  position: absolute;
  left: calc(50% - 347px);
  top: 197px;
  width: 175px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.vector {
  width: 1.03%;
  height: 1.82%;
  position: absolute;
  right: 62.22%;
  left: 36.75%;
  bottom: 79.88%;
  top: 18.3%;
  overflow: visible;
}
.my-musepass2 {
  color: var(--color, #ff3d32);
  text-align: left;
  font-family: "MvBoli-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 585px;
  top: 197px;
}
.my-musepass3 {
  color: var(--color, #ff3d32);
  text-align: left;
  font-family: "MvBoli-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 585px;
  top: 247px;
}
.original {
  color: #000000;
  text-align: center;
  font-family: "LexendExa-SemiBold", sans-serif;
  font-size: 15px;
  font-weight: 600;
  position: absolute;
  left: 717px;
  top: 245px;
  width: 80px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: center;
}
._2025-09-25 {
  color: #000000;
  text-align: center;
  font-family: "LexendExa-SemiBold", sans-serif;
  font-size: 15px;
  font-weight: 600;
  position: absolute;
  left: 992px;
  top: 247px;
  width: 176px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: center;
}
._329 {
  color: #000000;
  text-align: left;
  font-family: "Inter-SemiBold", sans-serif;
  font-size: 15px;
  font-weight: 600;
  position: absolute;
  left: 815px;
  top: 245px;
  width: 167px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div11 {
  color: #000000;
  text-align: left;
  font-family: "Inter-Bold", sans-serif;
  font-size: 16px;
  font-weight: 700;
  position: absolute;
  left: calc(50% - 370px);
  top: 585px;
  width: 175px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.line-4 {
  margin-top: -2px;
  border-style: solid;
  border-color: var(--color, #ff3d32);
  border-width: 2px 0 0 0;
  width: 1112px;
  height: 0px;
  position: absolute;
  left: 558px;
  top: 620px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
.div12 {
  text-align: center;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 318px;
  top: 189px;
  width: 125px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div-12-span {
  color: var(--color, #ff3d32);
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
}
.div-12-span2 {
  color: #000000;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
}
.icon-park-computer {
  width: 50px;
  height: 50px;
  position: absolute;
  left: 268px;
  top: 189px;
}
.group {
  width: 79.17%;
  height: 68.75%;
  position: absolute;
  right: 10.42%;
  left: 10.42%;
  bottom: 14.58%;
  top: 16.67%;
  overflow: visible;
}
.line-7 {
  margin-top: -1px;
  border-style: solid;
  border-color: var(--color-2, #d9d9d9);
  border-width: 1px 0 0 0;
  width: 213px;
  height: 0px;
  position: absolute;
  left: 251px;
  top: 242px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
.div13 {
  color: #000000;
  text-align: center;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 16px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 261px;
  top: 256px;
  width: 189px;
  height: 29px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div14 {
  color: #959595;
  text-align: right;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 261px;
  top: 293px;
  width: 189px;
  height: 29px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.div15 {
  color: #757575;
  text-align: right;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 1559px;
  top: 244px;
  width: 73px;
  height: 29px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.rectangle-44 {
  background: #ffffff;
  width: 189px;
  height: 31px;
  position: absolute;
  left: 261px;
  top: 331px;
}
.m-point {
  color: #000000;
  text-align: left;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 269px;
  top: 342px;
  width: 60px;
  height: 9px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
._0-p {
  text-align: right;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
  position: absolute;
  left: 381px;
  top: 342px;
  width: 60px;
  height: 9px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
._0-p-span {
  color: #ff3d32;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
}
._0-p-span2 {
  color: #000000;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
}
.table {
  width: 1072px;
  height: 192px;
  position: absolute;
  left: 578px;
  top: 655px;
}
.div16 {
  color: #000000;
  text-align: left;
  font-family: "Inter-Bold", sans-serif;
  font-size: 16px;
  font-weight: 700;
  position: absolute;
  left: calc(50% - 367px);
  top: 327px;
  width: 175px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.line-8 {
  margin-top: -2px;
  border-style: solid;
  border-color: var(--color, #ff3d32);
  border-width: 2px 0 0 0;
  width: 1112px;
  height: 0px;
  position: absolute;
  left: 561px;
  top: 362px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
.div17 {
  color: #000000;
  text-align: left;
  font-family: "Inter-Medium", sans-serif;
  font-size: 16px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 39px);
  top: 461px;
  width: 437px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.bkbk2 {
  width: 1920px;
  height: 50px;
  position: absolute;
  left: 0px;
  top: 0px;
  overflow: visible;
}
.redbk2 {
  width: 195px;
  height: 50px;
  position: absolute;
  left: 1116px;
  top: 0px;
  overflow: visible;
}
.rectangle-45 {
  background: #f0f0f0;
  border-style: solid;
  border-color: var(--color-2, #d9d9d9);
  border-width: 1px;
  width: 247px;
  height: 212px;
  position: absolute;
  left: 232px;
  top: 170px;
}
.group2 {
  width: 79.17%;
  height: 68.75%;
  position: absolute;
  right: 10.42%;
  left: 10.42%;
  bottom: 14.58%;
  top: 16.67%;
  overflow: visible;
}
.div-12-span3 {
  color: var(--color, #ff3d32);
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
}
.div-12-span4 {
  color: #000000;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
}
.vector2 {
  width: 1.03%;
  height: 1.82%;
  position: absolute;
  right: 62.22%;
  left: 36.75%;
  bottom: 79.88%;
  top: 18.3%;
  overflow: visible;
}
.rectangle-46 {
  background: #ffffff;
  border-style: solid;
  border-color: #1e1e1e;
  border-width: 3px;
  width: 1112px;
  height: 53px;
  position: absolute;
  left: 558px;
  top: 232px;
}
.rectangle-47 {
  background: #ffffff;
  border-style: solid;
  border-color: #007aff;
  border-width: 2px;
  width: 1112px;
  height: 53px;
  position: absolute;
  left: 558px;
  top: 232px;
}
.line-9 {
  margin-top: -1px;
  border-style: solid;
  border-color: var(--color-2, #d9d9d9);
  border-width: 1px 0 0 0;
  width: 213px;
  height: 0px;
  position: absolute;
  left: 251px;
  top: 242px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
.rectangle-48 {
  background: #ffffff;
  width: 189px;
  height: 31px;
  position: absolute;
  left: 261px;
  top: 331px;
}
._0-p-span3 {
  color: #ff3d32;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
}
._0-p-span4 {
  color: #000000;
  font-family: "JejuGothic-Regular", sans-serif;
  font-size: 14px;
  line-height: 18px;
  font-weight: 400;
}
.line-10 {
  margin-top: -2px;
  border-style: solid;
  border-color: var(--color, #ff3d32);
  border-width: 2px 0 0 0;
  width: 1112px;
  height: 0px;
  position: absolute;
  left: 561px;
  top: 362px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
.rectangle-49 {
  background: rgba(255, 255, 255, 0.7);
  border-style: solid;
  border-color: #d9d9d9;
  border-width: 1px;
  width: 247px;
  height: 471px;
  position: absolute;
  left: 232px;
  top: 410px;
}
.line-11 {
  margin-top: -2px;
  border-style: solid;
  border-color: var(--color, #ff3d32);
  border-width: 2px 0 0 0;
  width: 1112px;
  height: 0px;
  position: absolute;
  left: 558px;
  top: 620px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
}
</style>
</head>
<body>
<div class="mypage">
  <div class="header">
    <div class="navi">
      <div class="bk"></div>
      <img class="_01-1" src="_01-10.png" />
      <div class="div">오픈공지</div>
      <div class="div2">좌석리뷰</div>
      <div class="div3">랭킹</div>
      <div class="div4">뮤즈패스</div>
      <img
        class="free-icon-magnifying-glass-search-16492-1"
        src="free-icon-magnifying-glass-search-16492-10.png"
      />
      <div class="line-2"></div>
      <div class="div5">검색어를 입력해주세요.</div>
      <div class="line-1"></div>
    </div>
    <div class="top-navi">
      <img class="bkbk" src="bkbk0.svg" />
      <div class="join">JOIN</div>
      <div class="login">LOGIN</div>
      <div class="mymusepass">
        <img class="redbk" src="redbk0.svg" />
        <div class="my-musepass">MY MUSEPASS</div>
        <img class="_7-1" src="_7-10.png" />
      </div>
    </div>
  </div>
  <div class="rectangle-32"></div>
  <div class="rectangle-34"></div>
  <div class="rectangle-35"></div>
  <div class="rectangle-33"></div>
  <div class="div6">º 예매 / 취소내역</div>
  <div class="div7">º 나의 뮤즈캐스트</div>
  <div class="musepass">º 나의 MUSEPASS</div>
  <div class="div8">º 나의 후기</div>
  <div class="div9">º 뮤즈캘린더</div>
  <div class="_1-1">º 1 : 1 문의</div>
  <div class="div10">가입현황</div>
  <img class="vector" src="vector0.svg" />
  <div class="my-musepass2">MY MUSEPASS</div>
  <div class="my-musepass3">MY MUSEPASS</div>
  <div class="original">Original</div>
  <div class="_2025-09-25">2025-09-25일 까지</div>
  <div class="_329">&gt; 남은 잔여일수 : 329일</div>
  <div class="div11">최근 예매 내역</div>
  <div class="line-4"></div>
  <div class="div12">
    <span>
      <span class="div-12-span">마이</span>
      <span class="div-12-span2">페이지</span>
    </span>
  </div>
  <div class="icon-park-computer">
    <img class="group" src="group0.svg" />
  </div>
  <div class="line-7"></div>
  <div class="div13">---님 안녕하세요</div>
  <div class="div14">회원정보수정 &gt;</div>
  <div class="div15">혜택보기 &gt;</div>
  <div class="rectangle-44"></div>
  <div class="m-point">m-point</div>
  <div class="_0-p">
    <span>
      <span class="_0-p-span">0</span>
      <span class="_0-p-span2">p</span>
    </span>
  </div>
  <div class="table"></div>
  <div class="div16">새 소식</div>
  <div class="line-8"></div>
  <div class="div17">
    뮤즈캐스트에 등록된 공연/인물의 최근 업데이트 소식이 없습니다
  </div>
  <div class="header">
    <div class="navi">
      <div class="bk"></div>
      <img class="_01-1" src="_01-11.png" />
      <div class="div">오픈공지</div>
      <div class="div2">좌석리뷰</div>
      <div class="div3">랭킹</div>
      <div class="div4">뮤즈패스</div>
      <img
        class="free-icon-magnifying-glass-search-16492-1"
        src="free-icon-magnifying-glass-search-16492-11.png"
      />
      <div class="line-2"></div>
      <div class="div5">검색어를 입력해주세요.</div>
      <div class="line-1"></div>
    </div>
    <div class="top-navi">
      <img class="bkbk2" src="bkbk1.svg" />
      <div class="join">JOIN</div>
      <div class="login">LOGIN</div>
      <div class="mymusepass">
        <img class="redbk2" src="redbk1.svg" />
        <div class="my-musepass">MY MUSEPASS</div>
        <img class="_7-1" src="_7-11.png" />
      </div>
    </div>
  </div>
  <div class="rectangle-45"></div>
  <div class="icon-park-computer">
    <img class="group2" src="group1.svg" />
  </div>
  <div class="div12">
    <span>
      <span class="div-12-span3">마이</span>
      <span class="div-12-span4">페이지</span>
    </span>
  </div>
  <div class="my-musepass2">MY MUSEPASS</div>
  <div class="div10">가입현황</div>
  <img class="vector2" src="vector1.svg" />
  <div class="rectangle-46"></div>
  <div class="rectangle-47"></div>
  <div class="line-9"></div>
  <div class="div15">혜택보기 &gt;</div>
  <div class="original">Original</div>
  <div class="_329">&gt; 남은 잔여일수 : 329일</div>
  <div class="my-musepass3">MY MUSEPASS</div>
  <div class="_2025-09-25">2025-09-25일 까지</div>
  <div class="div13">---님 안녕하세요</div>
  <div class="div14">회원정보수정 &gt;</div>
  <div class="div16">새 소식</div>
  <div class="rectangle-48"></div>
  <div class="m-point">m-point</div>
  <div class="_0-p">
    <span>
      <span class="_0-p-span3">0</span>
      <span class="_0-p-span4">p</span>
    </span>
  </div>
  <div class="line-10"></div>
  <div class="rectangle-49"></div>
  <div class="div6">º 예매 / 취소내역</div>
  <div class="div17">
    뮤즈캐스트에 등록된 공연/인물의 최근 업데이트 소식이 없습니다
  </div>
  <div class="div7">º 나의 뮤즈캐스트</div>
  <div class="musepass">º 나의 MUSEPASS</div>
  <div class="div11">최근 예매 내역</div>
  <div class="div8">º 나의 후기</div>
  <div class="line-11"></div>
  <div class="div9">º 뮤즈캘린더</div>
  <div class="table"></div>
  <div class="_1-1">º 1 : 1 문의</div>
</div>

</body>
</html>