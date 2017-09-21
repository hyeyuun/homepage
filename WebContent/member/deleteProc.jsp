<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	String oldFile = request.getParameter("oldFile");
	
	boolean flag = dao.delete(id); 
	System.out.println(":::"+id+"::"+oldFile+"::"+flag);
	
	if (flag) {
 		if (oldFile != null && !oldFile.equals("default.jpg")) {
 			UploadSave.deleteFile(upDir, oldFile);
 		}
 		session.invalidate(); //서버상에 있는 사용자와 관련된 모든 세션 변수의 값을 삭제
 	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="stylesheet">

</head>
<body>
<div class="title">[ 회원탈퇴 처리확인 ]</div>

<div class="content">
	<%
		if(flag){
			out.print("회원탈퇴가 되었습니다.");
		}else {
			out.print("회원탈퇴가 실패하였습니다. 다시시도해주세요.");
		}
	%>
</div>
<div class="bottom">
	<button type="button" onclick="location.href='../index.jsp'">홈</button>
	<button type="button" onclick="history.back()">다시시도 </button>
</div>

</body>
</html>