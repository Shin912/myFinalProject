<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<!-- 지역 팀 조회 -->
	
	<section class="playermain-main">
		<div class="playermain-leftbox">
			<!-- 지역 리스트 -->
			<div class="left1-nav-container clear-fix">
				<div class="container-region">
					<ul class="list-region clear-fix">
						<li class="item-region">
							<div class="btn-group">
								<a role="button" class="btn btn-info whole_select">
									전체
								</a>
							</div>
						</li>
						<li class="item-region">
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
									직위<span class="caret"></span>
								</button>
								<div class="dropdown-menu">
									<a href="#" class="dropdown-item">단장</a>
									<a href="#" class="dropdown-item">총무</a>
									<a href="#" class="dropdown-item">팀원</a>
								</div>
							</div>
						</li>
						<li class="item-region">
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle " data-toggle="dropdown">
									포지션<span class="caret"></span>
								</button>
								<div class="dropdown-menu">
									<a href="#" class="dropdown-item">투수</a>
									<a href="#" class="dropdown-item">타자</a>
									<a href="#" class="dropdown-item">포수</a>
									<a href="#" class="dropdown-item">내야수</a>
									<a href="#" class="dropdown-item">외야수</a>
								</div>
							</div>
						</li>
						<li class="item-region">
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
									다음 경기 참석여부<span class="caret"></span>
								</button>
								<div class="dropdown-menu">
									<a href="#" class="dropdown-item">참석</a>
									<a href="#" class="dropdown-item">미정</a>
									<a href="#" class="dropdown-item">불참</a>
								</div>
							</div>
						</li>
						

					</ul>
				</div>
				<!-- 지역 리스트 끝 -->
				<div class="group-search-player input-group col-sm-3">
					<input type="text" class="form-control " id="search-member" name="search-member" placeholder="팀원 검색">
					<div class="input-group-append">
						<button class="btn btn-success">검색</button>
					</div>
				</div>
			</div>
				<!-- 팀 리스트 -->
			<div class="container-playerbox">
				<ul class="list-playerbox" id="list-player">
					<c:forEach items="${playerList }" var="player">
						<li class="item-playerbox">
							<div class="left-playerbox">
								<a href="<c:url value='/team/pdetail?player=${player.pl_num }'></c:url>" class="link-player-img3 rounded-circle clear-fix"
								style="background-image: url(
									<c:choose>
										<c:when test="${empty player.pl_player_img}">
											<c:url value='/files/defaultlogo.png'></c:url>
										</c:when>
										<c:otherwise>
											<c:url value='/files${player.pl_player_img}'></c:url>
										</c:otherwise>
									</c:choose>
									
								);">
									<div class="label-player">
										<span class="player-backNum badge badge-danger">투수</span> 
										<span class="player-name">${player.me_nickname }</span>
									</div>
								</a>
							</div>
							<div class="right-playerbox">
								직위 : <span class="team_class">${param.teamNum }</span><br>
								희망 포지션 : <c:forEach items="${player.positionList }" var="pl"><span class="team_position badge badge-pill badge-success">${pl.ph_po_ko_name }</span>
								</c:forEach>
								<br>
								다음 경기 출전: <span class="match_type badge">벤치</span>
								
							</div>
							<button type="button" class="btn btn-danger btn-kickout" data-toggle="modal" data-target="#warning_kickout">탈퇴</button>
							
						</li>
					</c:forEach>

					
				</ul>
			</div>
			<!-- 팀 리스트 끝 -->
			<div class="team-request">
				<button class="btn btn-dark btn-team-manage">팀원 관리</button>
			</div>
			<!-- 페이지 번호 -->
			<div class="container-pagenation">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev }">
						<li class="page-item prev"><a href="<c:url value='/team/wholeplayer?teamNum=${param.teamNum }&page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li class="page-item
							<c:if test='${index == pm.cri.page  }'> active </c:if> ">
							<a href="<c:url value='/team/wholeplayer?teamNum=${param.teamNum }&page=${index}'></c:url>" class="page-link">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item next"><a href="<c:url value='/team/wholeplayer?teamNum=${param.teamNum }&page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 호버 박스 -->
		
	</section>	
	<div class="modal" id="warning_kickout">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">탈퇴 확인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					정말로 팀에서 방출 시키겠습니까?
				</div>
	
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
	
			</div>
		</div>
	</div>


   
  </body>
	<script
	src="https://kit.fontawesome.com/bedfa56d7f.js"
	crossorigin="anonymous"
></script>
<script>
let cri = {
		page:1,
		perPageNum: 10, 
		search: '',
		type: 0,
		strType:''
	}
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
	</script>
	<script>
	$(document).ready(function(){
		$("#search-member").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#list-player li").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});

		$(".list-region .item-region .btn-group a").click(function(e) {
			e.preventDefault();
			var value = $(this).text();
			if($(this).hasClass('whole_select')){
				$("#list-player li").show();
			}else{
				$("#list-player li").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
			}
		});
	});
		</script>
		<script>
			$('.btn-team-manage').click(function(){
				if($(this).hasClass('btn-dark')){
					$('.btn-kickout').show();
					$(this).removeClass('btn-dark').addClass('btn-outline-dark').text('팀원 관리 닫기');
				}else{
					$('.btn-kickout').hide();
					$(this).removeClass('btn-outline-dark').addClass('btn-dark').text('팀원 관리');
				}
			})	
		</script>