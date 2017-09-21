<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>  
<%
	String c_id = "";
	String c_id_val = "";
	
	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			cookie = cookies[i];
			if(cookie.getName().equals("c_id")){
				c_id = cookie.getValue();
			} else if(cookie.getName().equals("c_id_val")){
				c_id_val = cookie.getValue();
			}
		}
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
.form-control {
    display: block;
    width: 40%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>
</head>
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<div class="title"> 로 그 인 </div>
<!-- start-->
	<form class="form-horizontal" action="./logInProc.jsp" method="post" name="frm">
		
		
		<div class="form-group" style="width: 700px; margin: 0 auto;">
			<label class="control-label col-sm-2" for="id">아이디 :</label>
			<span class="col-sm-10" style="width: 50%;">
				<input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" value="<%=c_id_val%>">
				<label><input type="checkbox" name="remember" value="Y"
					<%
						if(c_id.equals("Y")){
							out.print("checked='checked'");
						}
					%>
					>id저장</label>
				
			</span>
			<%-- <span class="col-sm-offset-2 col-sm-10" >
				<span class="checkbox">
					<label><input type="checkbox" name="remember" value="Y"
					<%
						if(c_id.equals("Y")){
							out.print("checked='checked'");
						}
					%>
					>id저장</label>
				</span>
			</span> --%>
		</div>
		<div class="form-group" style="width: 700px; margin: 0 auto;">
			<label class="control-label col-sm-2" for="pwd">비밀번호 :</label>
			<div class="col-sm-10" style="width: 50%;">
				<input type="password" class="form-control" id="pwd" placeholder="Enter PASSWORD" name="passwd" >
			</div>
		</div>
		<div class="form-group" style="width: 700px; margin: 0 auto;">
			<div class="col-sm-offset-2 col-sm-10" style="width: 50%;">
				<button type="button" class="btn btn-default">회원가입</button>
				<button type="submit" class="btn btn-default">로그인</button>
			</div>
		</div>
		
	</form>
	<!-- end-->

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>