<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsing" data-toggle="collapsing" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false"autocomplete="off">
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left">
				<li>
					<input type="text" class="form-control" placeholder="ex)가산동" name="serach">
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					방타입<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
								<label class="btn btn-primary active">
									<input type="checkbox" autocomplete="off" checked>원룸
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="checkbox" autocomplete="off" >투*쓰리룸
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="checkbox" autocomplete="off" >아파트
								</label>
							</li>
						</div>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					매물종류<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
								<label class="btn btn-primary active">
									<input type="checkbox" autocomplete="off" checked>월세
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="checkbox" autocomplete="off" >전세
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="checkbox" autocomplete="off" >매매
								</label>
							</li>
						</div>
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					가격대<span class="caret"></span></a>
					<ul class="dropdown-menu">
						
							<input id="price" type="text" class="span2" value="" data-slider-min="0" data-slider-max="9999999999" data-slider-step="5" data-slider-value="[250,450]/">
				
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					관리비<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
						
							</li>
						</div>
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					방크기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
						
							</li>
						</div>
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					준공년차<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
								<label class="btn btn-primary active">
									<input type="radio" autocomplete="off" checked>전체
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="radio" autocomplete="off" >1년이내
								</label>
							</li>
							<li>
								<label class="btn btn-primary">
									<input type="radio" autocomplete="off" >5년이내
								</label>
							</li><li>
								<label class="btn btn-primary">
									<input type="radio" autocomplete="off" >10년이내
								</label>
							</li><li>
								<label class="btn btn-primary">
									<input type="radio" autocomplete="off" >15년이내
								</label>
							</li><li>
								<label class="btn btn-primary">
									<input type="radio" autocomplete="off" >15년이상
								</label>
							</li>
						</div>
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
					추가필터<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<div class="btn-group" data-toggle="buttons">
							<li class="active">
						
							</li>
						</div>
					</ul>
				</li>
				<!-- -------------------------------------------------------------------------------------------------------------------- -->
			</ul>
		</div>
	</nav>

</body>
</html>