<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-insertType.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>

<div class="container-box">
	<h1>리그 타입 등록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>연도</th>
				<th>리그이름</th>
				<th>리그타입</th>
				<th>모집상태</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${laList }" var="la" varStatus="vs">
			<tr>
			<form action="<c:url value="/leauge/updateType"></c:url>">
					<td>${vs.index+1 }</td>
					<td class="form-group">
						<select class="form-control" name="la_start_date">
							<option value="${la.la_start_date_str }">2023</option>
							<option value="${la.la_start_date_str+1 }">2024</option>
						</select>
					</td>
					<td class="form-group"><input class="form-control" type="text" value="${la.la_name }" name="la_name"></td>
					<td class="form-group"><input class="form-control" type="text" value="${la.la_match_type }" name="la_name"></td>
					<td class="form-group">
						<select class="form-control" name="la_team_state">
							<option value="${la.la_team_state }">모집중</option>
							<option value="${la.la_team_state }">모집완료</option>
						</select>
					</td>
					<td>
						<button class="btn btn-outline-warning btn-up">수정</button>
						<button class="btn btn-outline-danger btn-del">삭제</button>
					</td>
			</form>
			</tr>
		</c:forEach>
			
		</tbody>
		<tfoot>
		<tr>
			<form action="<c:url value='/league/insertType/${lg_num }/insert'></c:url>" method="post">
				<th></th>
				<th></th>
				<th>
					<div class="form-group">
						<input type="text" class="form-control" name="la_name" >
					</div>
	  			</th>
				<th>
					<div class="form-group">
	  					<input type="text" class="form-control" name="la_match_type" >
	  				</div>
				</th>
				<th>
					<button class="btn btn-outline-success">등록</button>
				</th>
			</form>
		</tr>
	</tfoot>
	</table>
</div>