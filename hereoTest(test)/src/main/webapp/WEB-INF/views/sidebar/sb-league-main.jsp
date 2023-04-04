<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-side.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">

<div class="container-side">
	<ul class="list-main-menu">
		<li class="item-main-menu">
			<a href="#" class="link-main-menu">리그소개</a>
			<div class="list-sub-menu off">
				<ul>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">리그소개</span>
						</a>
					</li>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">리그규정</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="item-main-menu">
			<a href="#" class="link-main-menu">리그일정</a>
			<div class="list-sub-menu off">
				<ul>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">리그일정</span>
						</a>
					</li>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">리그결과</span>
						</a>
					</li>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">리그경기신청</span>
						</a>
					</li>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">경기일정관리</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="item-main-menu">
			<a href="#" class="link-main-menu">기록실</a>
			<div class="list-sub-menu off">
				<ul>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">선수기록</span>
						</a>
					</li>
					<li class="item-sub-menu">
						<a href="#">
							<span class="menu-title">팀순위</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
	</ul>
</div>

	<script>
		$('.link-main-menu').click((e)=>e.preventDefault());
		$('.link-main-menu').click(function(){
			$(this).next().toggle();
		});
	</script>