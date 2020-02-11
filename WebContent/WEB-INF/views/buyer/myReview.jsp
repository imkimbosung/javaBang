<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 리뷰</title>





<script>

	$(document).ready(function(){
		

	  /*
		$('.boardTable tbody tr:odd').css("background", "lightgray");
        $('.boardTable tbody tr:even').css("background", "white");
            var cnt = 0;
            var trsObj = $('.boardTable tbody tr');
            trsObj.hide();
            trsObj.each( function() {

                var flag = false;
                var thisTrObj = $(this);
                var td1Text = thisTrObj.find("td:eq(0)").text().toUpperCase();
                var td2Text = thisTrObj.find("td:eq(1)").text().toUpperCase();
                var td3Text = thisTrObj.find("td:eq(2)").text().toUpperCase();
               
                if (flag) {
                    if(cnt%2==0){
                        thisTrObj.css("background", "lightgray");
                    }
                    else {
                        thisTrObj.css("background", "white");
                }
                }
            });
           
        } ); */
        
        

        
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});

			 $(".pagingNumber").html(
						getPagingNumber(
							"${roomListAllCnt}"
							,"${sellroomSearchDTO.selectPageNo}"
							,"${sellroomSearchDTO.rowCntPerPage}"
							,"15"
							,"goSearch();"
						)
				); 
			 
			
				inputData( "[name=selectPageNo]","${sellroomSearchDTO.selectPageNo}");
				inputData( "[name=rowCntPerPage]","${sellroomSearchDTO.rowCntPerPage}");

				<c:forEach items="${sellroomSearchDTO.date}" var="date">
					inputData( "[name=date]","${date}");
				</c:forEach>
				<c:forEach items="${sellroomSearchDTO.readcnt}" var="readcnt">
					inputData( "[name=readcnt]","${readcnt}");
				</c:forEach>
				
	
				
		});
		
	function goSearch(){
			
			document.managementHouse.submit();
			
	}
	
	function goSearchAll(){
		
			document.managementHouse.reset();
				$("[name=managementHouse] [name=selectPageNo]").val("1");
				$("[name=managementHouse] [name=rowCntPerPage]").val("15");
				goSearch(); 
				
	}

	function goBoardContentForm(sr_no){
		
		/* var str = "sr_no="+sr_no+"&"+$("[name=managementHouse]").serialize();
		location.replace("${ctRoot}/likeRoomContent.do?"+str); 
		
		 */
		//우선 테스트
		location.replace("${ctBuyerRoot}/myReviewContent.do?review_no=1"); 
		
	}
	
	
	function goCheck(sr_no){

		$("[name=sr_no]").val(sr_no);
		//alert($("[name=sr_no]").val())
		//alert($('[name=managementHouseProc]').serialize())
		 if(confirm("이 매물을 확인 하시겠습니까?")==false){return;}
		
		
		$.ajax({
			url:"${ctRealtorRoot}/managementHouseProc.do"
			,type:"post"
			,data:$('[name=managementHouseProc]').serialize()
			,success:function(checkCnt){
				alert(checkCnt);
					if(checkCnt==1){
						alert("확인 완료.");
						location.replace("${ctRealtorRoot}/managementHouse.do");
					}else if(checkCnt == 0){
						alert("확인 실패.");
					}
					else {
						alert("서버쪽 DB 연동 실패");
					}
			}
			,error:function(){
				alert("서버와 통신 실패");
			}
		}); 
		
			
		}
	
	
</script>
</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay"  style="background-image: url('${ctRoot}/resources/images/boodong.jpg');height: 200px;">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center" style="height: 200px;">
            <div class="col-md-7">
				<h3 class="mb-1" style="padding: 20px;font-size: 40px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;">마이페이지</h3> 
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="/WEB-INF/views/buyer/incloudfile//myPageFormUpMenu.jsp"%>
    <!-- ===================================================================================================== -->
    
    
    
	<br><br><br>
	<div id="root">
		<div class="col-md-10" style="float: right;margin: 2.1% 11.5% 0 0;width: 1250;">
			<div id="root">
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item active"><b>여러분들의 평가는 자바방에 큰 힘이 됩니다.</b></li>
			    </ol>
			</div>
		</div>
	</div>
	
	
	<!-- ==================================== 게시판 ================================================================= -->
	<div class="col-lg-10 bg-light" style="margin:4.85% 0 0 26%;width:60%;">	
		<div class=" bg-light">
			<div class="container" style="padding:30px;">
		      <div class="row">
				<div class="card-body">
				    
             
          
                                    
				                                <form class="myReview" name="myReview" action="${ctBuyerRoot}/myReview.do">
				                                    
										            <center><div style = "width:800">
													<center> 
															<input type = "hidden" name="selectPageNo" >
															<input type="hidden" name="b_no" class="b_no" value="${buyerDTO.b_no}">
													</div>
														
										        		[총 개수] : ${roomListAllCnt}&nbsp; 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											        		
											        		<select name = "rowCntPerPage" >
																<option value="1">1
																<option value="15">15
																<option value="20">20
																<option value="25">25
																<option value="30">30
															</select>행보기
					
											
												</form>
												<br><br><br>
												
									   			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
									   			<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div> 
												<!-- -------------------------------------------------------------------------------------------------------------------------- -->
				                                    <form class="myReview" name="myReview" method="post" action="${ctBuyerRoot}/myReview.do">
				                                    
				                                    <table id="bootstrap-data-table" class="boardTable table table-striped ">
				                                    
				                                    <input type="hidden" name="b_no" class="b_no" value="${buyerDTO.b_no}">
				                                    <thead>
				                                        <tr align=center;>  
				                                            <th align=center width=100>번호<th width=250>작성자 아이디<th width=250>공인중개사<th width=100>점수<th width=100>작성날짜                      
				                                        </tr>
				                                    
				                                    </thead>
				                                    <tbody>
				                                    
				                                   <c:forEach items="${reviewList}" var="reviewList" varStatus="loopTagStatus">
				                                    
				                                    	<tr>
				                                    	<tr style="cursor:pointer" onClick="goBoardContentForm();">
				                                       <!-- <tr style="cursor:pointer" onClick="goBoardContentForm(${room.sr_no});">	  -->
	        			
											        		<td align=center>
																 ${roomListAllCnt
																-
																(sellroomSearchDTO.selectPageNo*sellroomSearchDTO.rowCntPerPage-sellroomSearchDTO.rowCntPerPage+1+loopTagStatus.index)
																+1} 
																<%-- ${sellroomSearchDTO.selectPageNo*sellroomSearchDTO.rowCntPerPage-sellroomSearchDTO.rowCntPerPage+1+loopTagStatus.index} --%>
															<td align=center>
											        			${buyerDTO.b_id}					<%-- ${reviewList.sr_no} --%>
											        		<td align=center>
											        			김중개
											        		<td align=center>
											        			5
											        		<td align=center>
											        			${reviewList.write_date}
											        		

				                                     </c:forEach>
				                                     
				                                    </tbody>
												</table>
												
												
													<%-- 	<c:if test="${empty roomList}">
													내가 쓴 리뷰가 없습니다.
													 </c:if> --%>
				                                
				                                </form> 
				                                
				                                
				                          </div>
			     					 </div>
							    </div>    
							</div>
						
					</div>
		<br><br><br><br><br><br><br>
	
  </body>
  
  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>



