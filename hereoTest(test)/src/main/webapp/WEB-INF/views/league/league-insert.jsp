<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/league/league-insert.css" />
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>

<body>
  <div class="main-container">
      <h2>리그생성 신청페이지</h2>
      <form class="form-horizontal" action="<c:url value='/league/leagueInsert'></c:url>" method="post" enctype="multipart/form-data">
          <div class="form-group">
              <label for="leagueLogo">리그로고</label>
              <div class="col-sm-10">
                <input type="file" class="form-control league-logo" name="files">
              </div>
            </div>
        <div class="form-group">
          <label class="control-label" for="leagueName">리그이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control league-name" id="leagueName" placeholder="리그이름을 입력하세요." name="leagueName">
            <label for="leagueName" class="error" id="leagueName-error"></label> 
          </div>
        </div>
        <div class="form-group">
          <label class="control-label" for="leagueIntro">리그소개</label>
          <div class="col-sm-10">          
            <input type="text" class="form-control league-introduce" id="leagueIntro" placeholder="리그소개를 입력하세요 (추후 변경가능)" name="leagueIntro">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label" for="leagueLocal">리그지역</label>
          <select class="form-control league-local" name="leagueLocal" id="league-local" style="width: 100px; margin-left: 210px">
            <option value="1">서울</option>
            <option value="2">경기</option>
            <option value="3">인천</option>
            <option value="4">대전</option>
            <option value="5">충남</option>
            <option value="6">충북</option>
            <option value="7">광주</option>
            <option value="8">전남</option>
            <option value="9">전북</option>
            <option value="10">강원</option>
            <option value="11">부산</option>
            <option value="12">울산</option>
            <option value="13">대구</option>
            <option value="14">경남</option>
            <option value="15">경북</option>
            <option value="16">제주</option>
          </select>
          <label for="leagueLocal" class="error" id="leagueLocal-error"></label> 
        </div>
        <div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">리그신청하기</button>
          </div>
        </div>
      </form>
    </div>

    <script>
      $(function(){ 
    	$("form").validate({ 
        rules: { 
					leagueName: { 
						required : true, 
						regex : /^[a-zA-Zㄱ-ㅎ0-9]{5,20}$/ 
					}, 
          leagueLocal: { 
						required : true, 

					}
        }, 
        //규칙체크 실패시 출력될 메시지 
        messages : { 
					leagueName: { 
						required : "필수 항목입니다.", 
						regex : "리그이름은 5~20자, 영문, 한글, 숫자만 가능합니다." 
					},
					leagueLocal: { 
						required : "필수 항목입니다." ,
            regex : "지역선택은 필수 입니다"
					} 
        }, 
				submitHandler : function (form){ 
					alert('전송 전 마지막 확인'); 
					return true; 
				} 
    	}); 
		}) 
		$.validator.addMethod( 
			"regex", 
			function(value, element, regexp) { 
				var re = new RegExp(regexp); 
				return this.optional(element) || re.test(value); 
			}, 
			"Please check your input." 
		); 

    </script>