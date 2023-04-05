<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/common/topBar.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/common/font.css'></c:url>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/common/click_menu.js'></c:url>"></script>

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
            <li><a href="<c:url value='/signup'></c:url>" target="_top">회원가입</a></li>
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
              <a href="<c:url value='/league/main'></c:url>"><span>리그</span></a>
              <ul class="submenu-containerBox1 league-submenu__01">
                <li>
                  <a href="<c:url value='/league/main'></c:url>" target="_top">
                  리그 찾기
                  </a>
                </li>
                <li>
                  <a href="<c:url value='/league/main'></c:url>" target="_top">
                  리그 메인
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-container__box top-menu__reservation-hover">
              <a href="../reservation/reservation-main.html" target="_parent"
                ><span>예약</span></a
              >
              <ul class="submenu-containerBox1 reserve-submenu__01">
                <li>
                  <a href="../reservation/reservation-main.html" target="_top"
                    >실시간 예약</a
                  >
                </li>
                <li>
                  <a href="../reservation/stadium-search.html" target="_top"
                    >구장 찾기</a
                  >
                </li>
              </ul>
            </li>
            <li class="menu-container__box top-menu__commu-hover">
              <a href="../community/commu-free.html" target="_parent"
                ><span>커뮤니티</span></a
              >
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
