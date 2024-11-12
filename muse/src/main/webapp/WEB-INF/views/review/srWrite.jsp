<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* Container styles */
.review-container {
    width: 100%;
    max-width: 700px;
    margin: 55px auto;
    padding: 20px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
    border-radius: 8px;
    
}

.review-container h2 {
    text-align: center;
    margin-top: 10px;
    color: #333;
    font-size: 24px;
    
    
}

/* Form element styles */
.review-container form {
    display: flex;
    flex-direction: column;
    padding-top: 50px;
}

.form-group {
    display: flex;
    flex-direction: row;
    margin-bottom: 15px;
}

.form-group label {
    font-size: 16px;
    color: #555;
    margin-bottom: 35px;
    width: 100px;
}


.form-group input[type="text"],
.form-group input[type="number"],
.form-group textarea {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: none;
    outline: none;
    transition: border-color 0.3s;
    width: 100%;
}

.form-group input[type="text"]:focus,
.form-group input[type="number"]:focus,
.form-group textarea:focus {
    border-color: #2196F3;
}

textarea {
    font-family: inherit;
}

input[type="submit"] {
    padding: 10px;
    font-size: 18px;
    background-color: #000000;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #1976D2;
}


</style>



<style>
/*별점 */

.rating__input {
	display: none; /* 라디오버튼 hide */
}

.rating__label .star-icon {
	width: 24px;
	height: 24px;
	display: block;
	background-image: url("/muse/resources/img/gstar.svg");
	background-repeat: no-repeat;
}

.rating__label {
	width: 12px; /* 원본 사이즈/2 */
	overflow: hidden;
	cursor: pointer;
}
.rating__label .star-icon {
	width: 12px; /* 원본 사이즈/2 */
	height: 24px;
	display: block;
	position: relative;
	left: 0;
	background-image: url("/muse/resources/img/gstar.svg");
	background-repeat: no-repeat;
}


.rating__label .star-icon.filled {
    background-image: url("/muse/resources/img/ystar.svg");
}


.rating__label--full .star-icon {
	background-position: right;
}
.rating__label--half .star-icon {
	background-position: left;
}

.rating.readonly .star-icon {
    opacity: 0.7;
    cursor: default;
}

.rating .rating__label {
    width:12px;
}

</style>

</head>
<body>
<%@include file="../header.jsp" %>

<div class="review-container">
	<h2>좌석 리뷰 작성</h2>
	<form action="srWriteEnd.do" id="form">
	<input type="hidden" name="bd_code" value="${dto.bd_code}">
		<div class="form-group">
			<label for="theater">공연명</label>
			<input type="text" id="m_title" value="${dto.m_title}" readonly>
		</div>
		<div class="form-group">
			<label for="date">공연장</label>
			<input type="text" id="mh_name" value="${dto.mh_name}" readonly>
		</div>
		<div class="form-group">
			<label for="title">좌석</label>
			<input type="text" id="sr_seat" value="${dto.sr_seat}" readonly>
		</div>
		<div class="form-group " >
			<label for="rating">별점</label>
			<div class="rating" style="display:flex;">
			    <label class="rating__label rating__label--half" for="star0.5">
			        <input type="radio" id="star0.5" class="rating__input" name="sr_score" value="0.5" >
			        <span class="star-icon"></span>
			    </label>
			    <label class="rating__label rating__label--full" for="star1">
			        <input type="radio" id="star1" class="rating__input" name="sr_score" value="1" >
			        <span class="star-icon"></span>
			    </label>
			    
			    <label class="rating__label rating__label--half" for="star1.5">
			        <input type="radio" id="star1.5" class="rating__input" name="sr_score" value="1.5" >
			        <span class="star-icon"></span>
			    </label>
			    <label class="rating__label rating__label--full" for="star2">
			        <input type="radio" id="star2" class="rating__input" name="sr_score" value="2" >
			        <span class="star-icon"></span>
			    </label>
			    
			    <label class="rating__label rating__label--half" for="star2.5">
			        <input type="radio" id="star2.5" class="rating__input" name="sr_score" value="2.5" >
			        <span class="star-icon"></span>
			    </label>
			    <label class="rating__label rating__label--full" for="star3">
			        <input type="radio" id="star3" class="rating__input" name="sr_score" value="3" >
			        <span class="star-icon"></span>
			    </label>
			    
			    <label class="rating__label rating__label--half" for="star3.5">
			        <input type="radio" id="star3.5" class="rating__input" name="sr_score" value="3.5" >
			        <span class="star-icon"></span>
			    </label>
			    <label class="rating__label rating__label--full" for="star4">
			        <input type="radio" id="star4" class="rating__input" name="sr_score" value="4" >
			        <span class="star-icon"></span>
			    </label>
			    
			    <label class="rating__label rating__label--half" for="star4.5">
			        <input type="radio" id="star4.5" class="rating__input" name="sr_score" value="4.5" >
			        <span class="star-icon"></span>
			    </label>
			    <label class="rating__label rating__label--full" for="star5">
			        <input type="radio" id="star5" class="rating__input" name="sr_score" value="5" >
			        <span class="star-icon"></span>
			    </label>
			</div>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea id="content" rows="5" cols="30" placeholder="리뷰 내용을 입력하세요." name="sr_content"></textarea>
		</div>
		<input type="submit" value="작성">
	</form>
</div>


<%@include file="../footer.jsp" %>
</body>


<script>
const rateWrap = document.querySelectorAll('.rating'),
label = document.querySelectorAll('.rating .rating__label'),
input = document.querySelectorAll('.rating .rating__input'),
labelLength = label.length,
opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

checkedRate();


rateWrap.forEach(wrap => {
wrap.addEventListener('mouseenter', () => {
    stars = wrap.querySelectorAll('.star-icon');

    stars.forEach((starIcon, idx) => {
        starIcon.addEventListener('mouseenter', () => {
            if (wrap.classList.contains('readonly') == false) {
                initStars(); // 기선택된 별점 무시하고 초기화
                filledRate(idx, labelLength);  // hover target만큼 별점 active

                // hover 시 active된 별점의 opacity 조정
                for (let i = 0; i < stars.length; i++) {
                    if (stars[i].classList.contains('filled')) {
                        stars[i].style.opacity = opacityHover;
                    }
                }
            }
        });

        starIcon.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
                checkedRate(); // 체크된 라디오 버튼 만큼 별점 active
            }
        });

        // rate wrap을 벗어날 때 active된 별점의 opacity = 1
        wrap.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
            }
        });

        // readonnly 일 때 비활성화
        wrap.addEventListener('click', (e) => {
            if (wrap.classList.contains('readonly')) {
                e.preventDefault();
            }
        });
    });
});
});

//target보다 인덱스가 낮은 .star-icon에 .filled 추가 (별점 구현)
function filledRate(index, length) {
if (index <= length) {
    for (let i = 0; i <= index; i++) {
        stars[i].classList.add('filled');
    }
}
}

//선택된 라디오버튼 이하 인덱스는 별점 active
function checkedRate() {
let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


initStars();
checkedRadio.forEach(radio => {
    let previousSiblings = prevAll(radio);

    for (let i = 0; i < previousSiblings.length; i++) {
        previousSiblings[i].querySelector('.star-icon').classList.add('filled');
    }

    radio.nextElementSibling.classList.add('filled');

    function prevAll() {
        let radioSiblings = [],
            prevSibling = radio.parentElement.previousElementSibling;

        while (prevSibling) {
            radioSiblings.push(prevSibling);
            prevSibling = prevSibling.previousElementSibling;
        }
        return radioSiblings;
    }
});
}

//별점 초기화 (0)
function initStars() {
for (let i = 0; i < stars.length; i++) {
    stars[i].classList.remove('filled');
}
}


document.getElementById("form").addEventListener("submit", function(event) {
    var ratingSelected = false;
    // 모든 라디오 버튼 중에서 선택된 것이 있는지 확인
    var radios = document.getElementsByName("sr_score");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            ratingSelected = true;
            break;
        }
    }

    if (!ratingSelected) {
        event.preventDefault();  // 폼 제출 막기
        alert("별점을 입력하세요.");  // 사용자 정의 경고 메시지
    }
});
</script>

</html>