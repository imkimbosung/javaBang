

$(document).ready(function(){


	// 공지사항을 위한 코드 ===============================
	var ws;
	var messages=document.getElementById("messages");
	
	openSocket(ws, messages);
	//=================================================
	

});	


function popupNotice(inputValue){
		    var data = inputValue.split(',');
			var url = "/javaBang/master/noticeForm.do?title=" + data[0]+"&content=" + data[1];
		    var name = "Main_javaBang";
		    var option = "width = 500, height = 550, top = 70, left = 200, location = no"
		    window.open(url, name, option);
		}


		// ======================================================

		
		function openSocket(ws, messages){
		    if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
		        writeResponse("WebSocket is already opened.");
		        return;
		    }
		    //웹소켓 객체 만드는 코드
		   // ws=new WebSocket("ws://localhost:8080/javaBang/echo.do");
		   // ws=new WebSocket("ws://192.168.1.22:8080/javaBang/echo.do");
		    ws=new WebSocket("ws://192.168.0.6:8088/javaBang/echo.do");
		  //  alert("qhtjddlwkqk");
		    //we.send("test");

		    ws.onmessage=function(event){
		    	//alert("qhtjddlwkqk");
		    	popupNotice(event.data);

		    };

		}


		function closeSocket(){
		    ws.close();
		}
		function writeResponse(text){
		
		    messages.innerHTML+="<br/>"+text;
		}
