<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/common/topBar.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/common/font.css'></c:url>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/js/common/click_menu.js'></c:url>"></script>

   <header class="topBar">
      <div class="topBar__containerBox">
        <!-- 최상단 로그인 메뉴바 -->
        <div class="topBar__containerBox1">
          <ul class="topBar__list">
          	<c:if test="${loginUser==null}">
	            <li>
	              <a
	                href="#" class="login_popup">로그인</a
	              >
	            </li>
            <li><a href="<c:url value='/signup'></c:url>" target="_top">회원가입</a></li>
            </c:if>
            <c:if test="${loginUser!=null}">
            	<li><a href="<c:url value='/logout'></c:url>" target="_top">로그아웃</a></li>
            </c:if>
            <li><a href="#">고객센터</a></li>
          </ul>
        </div>
        <!-- 메인 메뉴바 -->
        <nav class="menu-containerBox2">
          <ul class="menu-containerBox2__bigBox">
            <li class="menu-container__box">
              <a href="<c:url value='/'></c:url>" target="_top" id="home"
                >HERE <i class="fa-solid fa-baseball"></i
              ></a>
            </li>
            <li class="menu-container__box top-menu__team-hover">
              <a href="<c:url value='/team/main'></c:url>"><span>팀</span></a>
              <ul class="submenu-containerBox1 team-submenu__01">
                <li><a href="<c:url value='/team/main'></c:url>">전체 팀</a></li>
                <li>
                  <a href="<c:url value='/team/join'></c:url>">팀 가입신청</a>
                </li>
              </ul>
            </li>
            <li class="menu-container__box top-menu__league-hover">
              <a href="<c:url value='/league/leagueSearch'></c:url>"><span>리그</span></a>
              <ul class="submenu-containerBox1 league-submenu__01">
                <li>
                  <a href="<c:url value='/league/leagueSearch'></c:url>" target="_top"
                    >리그 찾기</a
                  >
                </li>
              </ul>
            </li>
            <li class="menu-container__box top-menu__reservation-hover">
              <a href="<c:url value='/reservation/main'></c:url>"><span>예약</span></a
              >
              <ul class="submenu-containerBox1 reserve-submenu__01">
                <li>
                  <a href="<c:url value='/reservation/main'></c:url>">실시간 예약</a
                  >
                </li>
                <li>
                  <a href="<c:url value='/reservation/stadium-insert'></c:url>"
                    >구장 등록</a
                  >
                </li>
                <li>
                  <a href="<c:url value='/reservation/stadium-list'></c:url>"
                    >구장 등록 확인 리스트</a
                  >
                </li>
                <li>
                  <a href="<c:url value='/reservation/stadium-detail'></c:url>"
                    >구장 등록 정보</a
                  >
                </li>
                <li>
                  <a href="<c:url value='/reservation/stadium-list'></c:url>"
                    >구장 등록 확인 리스트</a
                  >
                </li>
              </ul>
            </li>
            <li class="menu-container__box top-menu__commu-hover">
              <a href="<c:url value='/community/free'></c:url>">
              <span>커뮤니티</span></a>
              <ul class="submenu-containerBox1 commu-submenu__01">
                <li>
                  <a href="../community/commu-free.html" target="_top"
                    >Talk 이모저모</a
                  >
                </li>
                <li>
                  <a href="../community/commu-hero.html" target="_top"
                    >용병 모집</a
                  >
                </li>
                <li>
                  <a href="../community/commu-market.html" target="_top"
                    >중고거래</a
                  >
                </li>
              </ul>
            </li>
          </ul>
        </nav>
        <!-- <div class="submenu__background"></div> -->
      </div>
    </header>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>

	<script>
	$('.login_popup').click(function(e){

			e.preventDefault();
			var url="<c:url value='/login'></c:url>";
			var name="loginP";
			var option="width=450, height=500, scrollbars=no, resizable=no, toolbars=no, menubar=no";
			window.open(url,name,option);

	})
	</script>

