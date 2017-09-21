<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="vo" class="member.MemberVO"/>  
<jsp:setProperty property="*" name="vo"/>
<%
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String oldFile = UploadSave.encode(upload.getParameter("oldFile"));
	String id = UploadSave.encode(upload.getParameter("id"));
	FileItem fileItem = upload.getFileItem("fname");
	int filesize = (int)fileItem.getSize();
	String fname = "";
	if(filesize > 0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	vo.setFname(fname);
	Map<String,String> map = new HashMap<String,String>();
	map.put("id", id);
	map.put("fname", vo.getFname());
	boolean flag = dao.updateFile(map); 
	
	if(flag && !fname.equals("") && fname.equals("default.jpg")){
		UploadSave.deleteFile(upDir, oldFile);
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="stylesheet">
<style type="text/css">
*{
	font-family: gulim;
	font-size: 20px;
}
</style>
</head>
<body>
<div class="title">[ 사진수정 처리확인 ]</div>

<div class="content">
	<%
		if(flag){
			out.print("사진수정이 되었습니다.");
		}else {
			out.print("사진수정이 실패하였습니다. 다시시도해주세요.");
		}
	%>
</div>
<div class="bottom">
	<button type="button" onclick="location.href='./read.jsp'">MYINFO</button>
	<button type="button" onclick="history.back()">다시시도 </button>
</div>

</body>
</html>