<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%-- 
 --%>
<script>

jQuery.noConflict();

$(document).ready
(
	function()
	{

		
		/*검색값 설정*/
		
		$('[name=keyword]').val("${roomSerachDTO.keyword}");
		
	
		
		<c:forEach items="${roomSerachDTO.roomtype}" var="roomtype">
		$('[name=roomtype]').filter("[value=${roomtype}]").prop("checked",true);
		</c:forEach>
		
		/*클릭시 목록갱신*/
		$('[name=roomtype]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		
		<c:forEach items="${roomSerachDTO.selltype}" var="selltype">
		$('[name=selltype]').filter("[value=${selltype}]").prop("checked",true);
		</c:forEach>
		
		$('[name=selltype]').click
		(
			function()
			{
				document.serach.submit();
			}
		);

		$('[name=dep]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=dep]').filter("[value=${roomSerachDTO.dep}]").prop("checked",true);

		$('[name=jeo]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=jeo]').filter("[value=${roomSerachDTO.jeo}]").prop("checked",true);

		$('[name=mon]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=mon]').filter("[value=${roomSerachDTO.mon}]").prop("checked",true);
		
		$('[name=sal]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=sal]').filter("[value=${roomSerachDTO.sal}]").prop("checked",true);
		
		$('[name=roomsize]').click
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=roomsize]').filter("[value=${roomSerachDTO.roomsize}]").prop("checked",true);
		
		$('[name=builddate]').change
		(
			function()
			{
				document.serach.submit();
			}
		);
		$('[name=builddate]').filter("[value=${roomSerachDTO.builddate}]").prop("checked",true);
	}
);

/*검색조건 초기화*/
function formreset()
{
	$('[name=roomtype]').prop("checked",false);
	$('[name=selltype]').prop("checked",false);
	$('[name=builddate]').prop("checked",false);
	$('[name=builddate]').filter("[value='전체']").prop("checked",true);
	$('[name=dep]').prop("checked",false);
	$('[name=jeo]').prop("checked",false);
	$('[name=mon]').prop("checked",false);
	$('[name=sal]').prop("checked",false);
	$('[name=roomsize]').prop("checked",false);
	
	document.serach.submit();
}
function goserach(a)
{
	
	$('[name=roomtype]').filter("[value="+a+"]").prop("checked",false);
	
	$('[name=selltype]').filter("[value="+a+"]").prop("checked",false);
	
	$('[name=dep]').filter("[value="+a+"]").prop("checked",false);
	$('[name=jeo]').filter("[value="+a+"]").prop("checked",false);
	
	$('[name=mon]').filter("[value="+a+"]").prop("checked",false);
	
	$('[name=sal]').filter("[value="+a+"]").prop("checked",false);
	
	$('[name=roomsize]').filter("[value="+a+"]").prop("checked",false);
	
	
	
	if(is_empty('[name=keyword]')){alert("키워드입력바람");return;}
	document.serach.submit();
}
</script>
			
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">

<title>JAVABANG</title>
</head>
<body>
	<form name="serach" action="/javaBang/buyer/roomListForm.do">
		<div class="container custom-control custom-radio">
			<table  cellpadding=10>
				<tr>
					<td class="form-group">
						<font color="black" size=${roomsearchfont1}>매물위치검색 :</font>&nbsp;&nbsp;<input type="text" class="form-group" placeholder="ex)가산동" name=keyword  size=10 style="background:#F8EBC6;height:40px;text-align:center;font-size:${roomsearchfont2}">
					<td class="dropdown">
						<a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
							<font color="black" size=${roomsearchfont1}>방타입</font></a>
							<ul class="dropdown-menu" >
								<div class="custom-control custom-checkbox">
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input type="checkbox" class="custom-control-input" value="원룸" name="roomtype" id="customCheck1" >
											<label class="custom-control-label" for="customCheck1">원룸</label>
									</li>
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input  type="checkbox" class="custom-control-input" value="투룸" name="roomtype" id="customCheck2" >
											<label class="custom-control-label" for="customCheck2">투룸</label>
									</li>
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input  type="checkbox" class="custom-control-input" value="오피스텔" name="roomtype" id="customCheck3" >
											<label class="custom-control-label" for="customCheck3">오피스텔</label>
									</li>
								</div>
							</ul>
					</td>	
					<td class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
							<font color="black" size=${roomsearchfont1}>매물종류</font></a>
							<ul class="dropdown-menu">
								<div class="custom-control custom-checkbox">
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input type="checkbox" class="custom-control-input" name="selltype" value="월세" id="customCheck4">
											<label class="custom-control-label" for="customCheck4">월세
									</li>
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input type="checkbox" class="custom-control-input" name="selltype"value="전세" id="customCheck5">
											<label class="custom-control-label" for="customCheck5">전세</label>
									</li>
									<li style=margin-left:30px;font-size:${roomsearchfont2}>
										<input type="checkbox" class="custom-control-input" name="selltype"value="매매" id="customCheck6">
											<label class="custom-control-label" for="customCheck6">매매</label>
									</li>
								</div>
							</ul>
					</td>	
					
					<td class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
							<font color="black" size=${roomsearchfont1}>가격대</font></a>
								<ul class="dropdown-menu" style="width: max-content;padding: 0px 0px 20px 60px;top: 20px;">
								<div class="custom-control custom-radio" style="float:left;width: 180px;margin-left: -3%;">
									<p style="margin-top: 20;margin-bottom: auto;font-weight: bold;font-size:${roomsearchfont2}">보증금</p>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep1 id="customRadio1">
												<label class="custom-control-label" for="customRadio1" id=dep1 style="font-size:${roomsearchfont2}">0~10000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep2 id="customRadio2">
												<label class="custom-control-label" for="customRadio2" id=dep2  style="font-size:${roomsearchfont2}">10001~15000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep3 id="customRadio3">
												<label class="custom-control-label" for="customRadio3" id=dep3  style="font-size:${roomsearchfont2}">15001~20000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep4 id="customRadio4">
												<label class="custom-control-label" for="customRadio4" id=dep4  style="font-size:${roomsearchfont2}">20001~25000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep5 id="customRadio5">
												<label class="custom-control-label" for="customRadio5" id=dep5  style="font-size:${roomsearchfont2}">25001~30000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=dep value=dep6 id="customRadio6">
												<label class="custom-control-label" for="customRadio6" id=dep6  style="font-size:${roomsearchfont2}">30001~</label>
										</li>
								</div>
								<div class="custom-control custom-radio" style="float:left;width: 180px;">
									<p style="margin-top: 20;margin-bottom: auto;font-weight: bold;font-size:${roomsearchfont2}">전세가</p>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo1 id="customRadio7">
												<label class="custom-control-label" for="customRadio7" id=jeo1   style="font-size:${roomsearchfont2}">0~10000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo2 id="customRadio8">
												<label class="custom-control-label" for="customRadio8" id=jeo2 style="font-size:${roomsearchfont2}">10001~15000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo3 id="customRadio9">
												<label class="custom-control-label" for="customRadio9" id=jeo3 style="font-size:${roomsearchfont2}">15001~20000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo4 id="customRadio10">
												<label class="custom-control-label" for="customRadio10" id=jeo4 style="font-size:${roomsearchfont2}">20001~25000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo5 id="customRadio11">
												<label class="custom-control-label" for="customRadio11" id=jeo5 style="font-size:${roomsearchfont2}">25001~30000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=jeo value=jeo6 id="customRadio12">
												<label class="custom-control-label" for="customRadio12" id=jeo6 style="font-size:${roomsearchfont2}">30001~</label>
										</li>
								</div>
								<div class="custom-control custom-radio" style="float:left;width: 140px;">
									<p style="margin-top: 20;margin-bottom: auto;font-weight: bold;font-size:${roomsearchfont2}">월세</p>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon1 id="customRadio13">
												<label class="custom-control-label" for="customRadio13" id=mon1 style="font-size:${roomsearchfont2}">0~50</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon2 id="customRadio14">
												<label class="custom-control-label" for="customRadio14"id=mon2 style="font-size:${roomsearchfont2}">51~100</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon3 id="customRadio15">
												<label class="custom-control-label" for="customRadio15"id=mon3 style="font-size:${roomsearchfont2}">101~150</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon4 id="customRadio16">
												<label class="custom-control-label" for="customRadio16"id=mon4 style="font-size:${roomsearchfont2}">151~200</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon5 id="customRadio17">
												<label class="custom-control-label" for="customRadio17"id=mon5 style="font-size:${roomsearchfont2}">201~250</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=mon value=mon6 id="customRadio18">
												<label class="custom-control-label" for="customRadio18"id=mon6 style="font-size:${roomsearchfont2}">251~</label>
										</li>
								</div>
								<div class="custom-control custom-radio" style="float:left;width: 180px;margin-right:2%;">
									<p style="margin-top: 20;margin-bottom: auto;font-weight: bold;font-size:${roomsearchfont2}">매매가</p>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal1 id="customRadio19">
												<label class="custom-control-label" for="customRadio19"id=sal1 style="font-size:${roomsearchfont2}">0~10000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal2 id="customRadio20">
												<label class="custom-control-label" for="customRadio20"id=sal2 style="font-size:${roomsearchfont2}">10001~15000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal3 id="customRadio21">
												<label class="custom-control-label" for="customRadio21"id=sal3 style="font-size:${roomsearchfont2}">15001~20000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal4 id="customRadio22">
												<label class="custom-control-label" for="customRadio22"id=sal4 style="font-size:${roomsearchfont2}">20001~25000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal5 id="customRadio23">
												<label class="custom-control-label" for="customRadio23"id=sal5 style="font-size:${roomsearchfont2}">25001~30000</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=sal value=sal6 id="customRadio24">
												<label class="custom-control-label" for="customRadio24"id=sal6 style="font-size:${roomsearchfont2}">30000~</label>
										</li>
								</div>
								</ul>
					</td>		
					<td class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
							<font color="black" size=${roomsearchfont1}>방크기</font></a>
								<ul class="dropdown-menu" style="padding:20% 20% 20% 20%;">
									<div class="custom-control custom-radio">
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize1 id="customRadio25">
												<label class="custom-control-label" for="customRadio25"id=roomsize1 style="font-size:${roomsearchfont2}">0~5평</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize2 id="customRadio26">
												<label class="custom-control-label" for="customRadio26"id=roomsize2 style="font-size:${roomsearchfont2}">6~10평</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize3 id="customRadio27">
												<label class="custom-control-label" for="customRadio27"id=roomsize3 style="font-size:${roomsearchfont2}">11~15평</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize4 id="customRadio28">
												<label class="custom-control-label" for="customRadio28"id=roomsize4 style="font-size:${roomsearchfont2}">16~20평</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize5 id="customRadio29">
												<label class="custom-control-label" for="customRadio29"id=roomsize5 style="font-size:${roomsearchfont2}">21~25평</label>
										</li>
										<li>
											<input type=radio class="custom-control-input" name=roomsize value=roomsize6 id="customRadio30">
												<label class="custom-control-label" for="customRadio30"id=roomsize6 style="font-size:${roomsearchfont2}">26~평</label>
										</li>
									</div>
								</ul>
					</td>		
					<td class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
							<font color="black" size=${roomsearchfont1}>준공년차</font></a>
							<ul class="dropdown-menu" style="padding:20% 20% 20% 20%; font-size: 15pt;width: max-content;">
								<div class="custom-control custom-radio">
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="전체" checked id="customRadio31">
											<label class="custom-control-label" for="customRadio31">전체</label>
									</li>
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="1년" id="customRadio32">
											<label class="custom-control-label" for="customRadio32" >1년 이내</label>
									</li>
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="5년" id="customRadio33">
											<label class="custom-control-label" for="customRadio33">5년 이내</label>
									</li>
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="10년" id="customRadio34">
											<label class="custom-control-label" for="customRadio34">10년 이내</label>
									</li>
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="15년" id="customRadio35">
											<label class="custom-control-label" for="customRadio35" >15년 이내</label>
									</li>
									<li>
										<input type="radio" class="custom-control-input" name="builddate"value="16년" id="customRadio36">
											<label class="custom-control-label" for="customRadio36" >15년 이상</label>
									</li>
								</div>
							</ul>
					<td>
						<input class="btn btn-secondary" type="button" value="검색" style="height:50px;"onClick="goserach();" style="font-size:${roomsearchfont2}">
						<input class="btn btn-secondary" type="button" value="초기화" style="height:50px;" onClick="formreset();" style="font-size:${roomsearchfont2}">
					</td>
				</tr>				
			</table>
		</div>
	</form>
	<div style="background-color:#FFCE67;width: fit-content;padding: 15;margin-bottom:50px;font-size: x-large;">
	
	 <b>검색조건 : </b>
	 <c:if test="${roomSerachDTO.keyword!=null}">
	 ${roomSerachDTO.keyword}
	 </c:if>
	 
	<c:forEach items="${roomSerachDTO.roomtype}" var="roomtype2">
	<a href="javascript:goserach('${roomtype2}');">${roomtype2}<sup>ⓧ</sup></a>
	</c:forEach>
	
	 <c:forEach items="${roomSerachDTO.selltype}" var="selltype2">
	<a href="javascript:goserach('${selltype2}');">${selltype2}<sup>ⓧ</sup></a>
	</c:forEach>
	
	<c:if test="${roomSerachDTO.dep!=''}">
	<a href="javascript:goserach(' ${roomSerachDTO.dep}');">
	 	<script>
	 	document.write( $("#${roomSerachDTO.dep}").text() );
	 	</script>
	 <sup>ⓧ</sup>
	 </a>
	 </c:if>
	 
	 <c:if test="${roomSerachDTO.jeo!=''}">
	<a href="javascript:goserach(' ${roomSerachDTO.jeo}');">
	 	<script>
	 	document.write($("#${roomSerachDTO.jeo}").text())
	 	</script>
	 <sup>ⓧ</sup>
	 </a>
	 </c:if>
	 
	 <c:if test="${roomSerachDTO.mon!=''}">
	 <a href="javascript:goserach(' ${roomSerachDTO.mon}');">
	 	<script>
	 	document.write($("#${roomSerachDTO.mon}").text())
	 	</script>
	 <sup>ⓧ</sup>
	 </a>
	 </c:if>
	
	  <c:if test="${roomSerachDTO.sal!=''}">
	 <a href="javascript:goserach(' ${roomSerachDTO.sal}');">
	 	<script>
	 	document.write($("#${roomSerachDTO.sal}").text())
	 	</script>
	 <sup>ⓧ</sup>
	 </a>
	 </c:if>
	
	  <c:if test="${roomSerachDTO.roomsize!=''}">
	 <a href="javascript:goserach(' ${roomSerachDTO.roomsize}');">
	 	<script>
	 	document.write($("#${roomSerachDTO.roomsize}").text())
	 	</script>
	 <sup>ⓧ</sup>
	 </a>
	 </c:if>
	</div>
	
</body>
</html>