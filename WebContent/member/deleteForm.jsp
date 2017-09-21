<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>    
<%
	String id = (String)session.getAttribute("id");
	String oldFile = dao.getFname(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
.form-ctl{
	width : 80%;
	height: 34px;
    padding: 6px 12px 6px 12px;
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
<div class="title"> 회원탈퇴 </div>
<!-- start--> 
	<form class="form-horizontal" action="./deleteProc.jsp" method="post" name="frm" >
			<input type="hidden" name="id" value="<%=id%>"> 
			<input type="hidden" name="oldFile" value="<%=oldFile%>"> 

		<div class="form-group">

			<div class="content">
				탈퇴를 하시면 더이상 컨텐츠를 제공받을 수 없습니다.<br> 그래도 탈퇴를 원하시면 아래 탈퇴 버튼을 클릭하세요.
			</div>
		</div>
		<!-- end-->

	<div class="bottom">
        <button type="submit" class="btn btn-default btn-sm" >
          <span class="glyphicon glyphicon-user"></span> 회원탈퇴
        </button>
		<button type="button" class="btn btn-default btn-sm" onclick="history.back()">
          <span class="glyphicon glyphicon-remove"></span> 취소
        </button>
	</div>
</form>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>