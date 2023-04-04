<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
    <link
      href="<c:url value='/resources/css/common/style.css'></c:url>"
      rel="stylesheet"
    />
    <link
      href="<c:url value='/resources/css/login_etc/signup.css'></c:url>"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"
    />
    <link href="<c:url value='/resources/css/common/font.css'></c:url>" rel="stylesheet">
    <script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/jquery.validate.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/additional-methods.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/jquery-ui.min.js'></c:url>"></script>
  </head>
  <body>
    <header class="topBar">
      <div class="topBar__containerBox">
        <!-- 최상단 로그인 메뉴바 -->
        <div class="topBar__containerBox1">
          <ul class="topBar__list">
            <li>
              <a
                href="#"
                onclick="window.open('<%=request.getContextPath()%>/login','login','width=450, height=500, scrollbars=no, resizable=no, toolbars=no, menubar=no')"
                >로그인</a
              >
            </li>
            <li><a href="#" style="color: black">고객센터</a></li>
          </ul>
        </div>
        <!-- 메인 메뉴바 -->
        <nav class="signUp-topMenu">
          <ul class="menu-containerBox2__bigBox">
            <li class="signUp-topMenu__goMainPage">
              <a href="<c:url value='/'></c:url>" target="_top" id="home"
                >HERE <i class="fa-solid fa-baseball"></i
              ></a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <main class="signup">
      <div class="container">
        <p class="signUp-dsscription">😎 히어로의 회원가입 페이지입니다.</p>
        <form action="<c:url value='/signup'></c:url>" class="signup_form" method="post">
          <div class="signup-container">
            <div class="signup-withBtn_container">
              <div class="signup-withBtn01">
                <label for="id">아이디 :</label><br />
                <!-- 아이디 중복체크 -->
                <input
                  type="text"
                  class="signup-id signUp-form"
                  id="id"
                  name="me_id"
                  required
                />
              </div>
              <div class="signup-withBtn02">
                <button class="idCheck-btn">중복 확인</button>
              </div>
            </div>
          </div>
          <div class="signup-container">
            <label for="pw">비밀번호 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw"
              name="me_pw"
              required
            />
          </div>
          <div class="signup-container">
            <label for="pw2">비밀번호 확인 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw2"
              name="me_pw2"
              required
            />
          </div>
          <div class="signup-container">
            <label for="name">이름 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="name"
              name="me_name"
              required
            />
          </div>
          <div class="signup-container">
            <label for="nick_name">닉네임 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="nick_name"
              name="me_nickname"
              placeholder="커뮤니티 게시판에서 사용할 닉네임을 작성해주세요"
              required
            />
          </div>
          <div class="signup-container">
            <label for="email">이메일 :</label><br />
            <input
              type="email"
              class="signUp-form"
              id="email"
              name="me_mail"
              required
            />
          </div>
          <div class="signup-container">
            <label for="gender">성별 :</label><br />
            <div class="signup-gender">
            <label>
            	<span class="genderType-letter">남</span>
            	<input type="radio" class="signUp-form gender-type" name="me_gender" value="1">
            </label>
            <label>
            	<span class="genderType-letter">여</span>
            	<input type="radio" class="signUp-form gender-type" name="me_gender" value="2">
            </label>
            </div>
          </div>
          <div class="signup-container">
            <label for="phone">핸드폰 번호 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="phone"
              name="me_tel"
              required
            />
          </div>

          <button type="submit" class="signup-btn">회원가입</button>
        </form>
      </div>
    </main>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
    <script>
      $(".signup_form").validate({
        rules: {
          me_id: {
            required: true,
            regex: /^[a-zA-Z]{1}[a-zA-Z0-9]{7,12}$/,
          },
          me_pw: {
            required: true,
            regex: /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$]).{8,20}$/,
          },
          me_pw2: {
            equalTo: pw,
          },
          me_name: {
            required: true,
            regex: /^[가-힣]{2,35}$/,
          },
          me_nickname: {
            required: true,
            regex: /^[a-zA-Z0-9가-힣]{2,13}$/,
          },
          me_mail: {
            required: true,
            email: true,
          },
          me_tel: {
            required: true,
            regex: /^010[0-9]{7,8}$/,
          },
          me_gender: {
            required: true,
          },
        },
        messages: {
          me_id: {
            required: "필수 항목입니다.",
            regex:
              "아이디는 첫글자가 영문자로 시작해야하며, 영문과 숫자를 조합하여 8~13자까지 가능합니다.",
          },
          me_pw: {
            required: "필수 항목입니다.",
            regex:
              "비밀번호는 영문, 숫자, 특수문자(!,@,#,$)를 조합하여 8~20자까지 가능합니다.",
          },
          me_pw2: {
            required: "필수 항목입니다.",  
            equalTo: "설정한 비밀번호와 일치하지 않습니다.",
          },
          me_name: {
            required: "필수 항목입니다.",
            regex: "이름은 한글로만 작성해야 합니다.",
          },
          me_nickname: {
            required: "필수 항목입니다.",
            regex:
              "닉네임은 한글, 영문, 숫자를 조합하여 2~13자까지 가능합니다.",
          },
          me_mail: {
            required: "필수 항목입니다.",
            email: "이메일 형식으로 작성해야 합니다.",
          },
          me_tel: {
            required: "필수 항목입니다.",
            regex: "핸드폰 번호를 입력해주세요.",
          },
          me_gender: {
            required: "필수 항목입니다.",
          },
        },
      });
      $.validator.addMethod(
        "regex",
        function (value, element, regexp) {
          var re = new RegExp(regexp);
          return this.optional(element) || re.test(value);
        },
        "필수 항목입니다."
      );
    </script>
  </body>
</html>
