<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
	<!-- ########################################################## -->
	<!-- 마스터 화면 왼쪽 선택 바 made by kbs -->
	<!-- ########################################################## -->
<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">
<!-- <link rel="stylesheet" href="/javaBang/resources/checkbox/check.css">	 -->
	
	
<!-- Left Panel -->
	<aside id="left-panel" class="left-panel" style="width:300;font-size:15pt;font-weight:600;">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
<!-- 					<li class="active" style="margin: 10 30 -50 30;">
					<i	class="menu-icon fa fa-laptop" style="margin-right: 20;"></i>Dashboard </a></li> -->
					<li class="menu-title" style="margin:50 50 0 30;"><b>관리자</b></li>
					<!-- /.menu-title -->
					<li style="margin: 20 40 -10 50;"><a  class="text-dark" href="/javaBang/master/homeForm.do"> 
					<i	class="menu-icon fa fa-cogs" style="margin-right: 20;"></i>관리자 홈
					</a> 
					</li>
					<li class="menu-item-has-children dropdown" style="margin: 50 20 20 50;">
					<a class="text-dark"  href="#"	class="dropdown-toggle" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">
						<i	class="menu-icon fa fa-table" style="margin-right: 20;"></i>데이터 조회 ▼
					</a>
						<ul class="sub-menu children dropdown-menu" style="position: initial;border: 0;padding: 10 0 0 40;">
						<!-- 	<li style="padding-bottom: 5;"><i class="fa fa-table"></i><a class="text-dark"  href="/javaBang/readyPage.jsp">주요4개</a></li> -->
							<li style="padding-bottom: 5;"><i class="fa fa-table"></i><a class="text-dark"  href="/javaBang/master/roomListForm.do">매물 현황</a></li>
							<li style="padding-bottom: 5;"><i class="fa fa-table"></i><a class="text-dark"  href="/javaBang/master/customerListForm.do">고객 현황</a></li>
							<li style="padding-bottom: 5;"><i class="fa fa-table"></i><a class="text-dark"  href="/javaBang/master/rentListForm.do">렌트물품 현황</a></li>
							<li style="padding-bottom: 5;"><i class="fa fa-table"></i><a class="text-dark"  href="/javaBang/master/realtorListForm.do">공인중개사 현황</a></li>
							<!-- <li><i class="fa fa-table"></i><a href="/javaBang/master/sellerListForm.do">고객정보</a></li> -->
						</ul></li>
					<li class="menu-item-has-children dropdown" style="margin:20 20 20 50;"><a class="text-dark"  href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i	class="menu-icon fa fa-th" style="margin-right: 20;"></i>목록 수정 ▼
					</a>
						<ul class="sub-menu children dropdown-menu" style="position: initial;border: 0;padding: 10 0 0 40;">
							<li style="padding-bottom: 5;"><i class="menu-icon fa fa-th"></i><a class="text-dark"  href="/javaBang/master/sellerCodeForm.do">판매자Code</a></li>
							<li style="padding-bottom: 5;"><i class="menu-icon fa fa-th"></i><a class="text-dark"  href="/javaBang/master/realtorCodeForm.do">공인중개사Code</a></li>
							<li style="padding-bottom: 5;"><i class="menu-icon fa fa-th"></i><a class="text-dark"  href="/javaBang/master/rentalCodeForm.do">물품렌트Code</a></li>
						</ul></li>

					<!-- <li class="menu-title">Icons</li>/.menu-title
 -->
					<!-- <li class="menu-item-has-children dropdown" style="margin:20 20 20 50;"><a class="text-dark"  href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 
						<i  class="menu-icon fa fa-tasks" style="margin-right: 20;"></i>승인 ▼</a>
						<ul class="sub-menu children dropdown-menu" style="position: initial;border: 0;padding: 10 0 0 40;">
							<li style="padding-bottom: 5;"><i class="menu-icon fa fa-fort-awesome"></i>
							<a class="text-dark"  	href="font-fontawesome.html">공인중개사 승인</a></li>
							                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html"></a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">공인중개사 승인</a></li>
						</ul></li> -->

					<li class="menu-item-has-children dropdown" style="margin:20 20 20 50;">
					<a class="text-dark"  href="#"	class="dropdown-toggle" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">
						<i class="menu-icon fa fa-bar-chart" style="margin-right: 20;"></i>설정 ▼
					</a>
						<ul class="sub-menu children dropdown-menu" style="position: initial;border: 0;padding: 10 0 0 40;">
							<li style="padding-bottom: 10;"><i class="menu-icon fa fa-line-chart"></i><a class="text-dark"  href="/javaBang/master/sendNoticeMsg.do">공지사항</a></li>
							<li style="padding-bottom: 10;"><i class="menu-icon fa fa-area-chart"></i><a class="text-dark"  href="/javaBang/master/checkingForm.do">유저 접속 관리</a></li>
							<!-- <li><i class="menu-icon fa fa-pie-chart"></i><a 	href="/javaBang/readyPage.jsp">렌트 현황</a></li> -->
						</ul></li>

					<!-- <li class="menu-item-has-children dropdown" style="margin:20 20 20 50;"><a class="text-dark"  href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i	class="menu-icon fa fa-area-chart" style="margin-right: 20;"></i>전체 통계
					</a>
						<ul class="sub-menu children dropdown-menu" style="position: initial;border: 0;padding: 10 0 0 40;">
							<li style="padding-bottom: 5;"><i class="menu-icon fa fa-map-o"></i><a class="text-dark" 	href="/javaBang/readyPage.jsp">전체통계</a></li>
							<li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Vector Maps</a></li>
						</ul>
					</li> -->
					<li style="margin: 20 40 -10 50;">
						<a  class="text-dark" href="/javaBang/Main_javaBang.do"> 
							<i	class="menu-icon fa fa-home" style="margin-right: 20;"></i>초기화면
						</a> 
					</li>
					<li style="margin: 300 50 0 60;">
						<a  class="text-dark" href="/javaBang/logoutForm.do?logout=master"> 
							<i	class="menu-icon fa fa-home" style="margin-right: 20;"></i>로그아웃
						</a> 
					</li>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->
	
	
	    <link rel="stylesheet" href="${ctRoot}/resources/assets/js/main.js">
	