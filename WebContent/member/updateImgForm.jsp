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
img {
	margin: 10px 10px 10px 10px;
}
</style>
</head>
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<div class="title"> 사진수정 </div>
<!-- start--> 
	<form class="form-horizontal" action="./updateImgProc.jsp" method="post" name="frm" enctype="multipart/form-data" onsubmit="return inCheck(this)">
		<input type="hidden" name="oldFile" value="<%=oldFile%>">
		<input type="hidden" name="id" value="<%=id%>">
		<div class="form-group">
		<table>
    		<tr>
				<th style="text-align: center; width: 50%;">원본사진</th>
				<th style="text-align: center; width: 50%;">수정사진</th>
				
			</tr>
			<tr>
				<td>
					<span class="col-sm-10">
						<img src="./storage/<%=oldFile%>" width="500px" height="380px">
					</span>
				</td>
				<td>
					<span class="col-sm-10">
						<img src="../images/default.jpg" width="500px" height="380px">
						
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="fname" class="form-ctl" style="float: right; width: 500px; margin-right: 25px;">
				</td>
			</tr>
		</table>
	</div>
	<!-- end-->

	<div class="bottom">
        <button type="submit" class="btn btn-default btn-sm" >
          <span class="glyphicon glyphicon-user"></span> 사진수정 
        </button>
		<button type="button" class="btn btn-default btn-sm" onclick="history.back()">
          <span class="glyphicon glyphicon-remove"></span> 취소
        </button>
	</div>
</form>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>