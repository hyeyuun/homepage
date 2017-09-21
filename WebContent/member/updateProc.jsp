<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="vo" class="member.MemberVO"/>  
<jsp:setProperty property="*" name="vo"/>
<%
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	vo.setId(UploadSave.encode(upload.getParameter("id")));
	vo.setPasswd(upload.getParameter("passwd"));
	vo.setMname(UploadSave.encode(upload.getParameter("mname")));
	vo.setTel(upload.getParameter("tel"));
	vo.setEmail(upload.getParameter("email"));
	vo.setZipcode(upload.getParameter("zipcode"));
	vo.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	vo.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	vo.setJob(upload.getParameter("job"));
	String oldFile = UploadSave.encode(upload.getParameter("oldFile"));
	
	FileItem fileItem = upload.getFileItem("fname");
	int filesize = (int)fileItem.getSize();
	String fname = "";
	if(filesize > 0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}else{
		fname = oldFile;
	}
	vo.setFname(fname);
	boolean flag = dao.update(vo); 
	if(flag && !fname.equals("") && !fname.equals("default.jpg")){
		System.out.println("삭제될 파일 : "+oldFile);
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
<script type="text/javascript">
function mread(){
	var url = "./read.jsp";
	url += "?id=<%=vo.getId()%>";
	location.href = url;
}
</script>
</head>
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<div class="title">[ 회원수정 처리확인 ]</div>

<div class="content">
	<%
		if(flag){
			out.print("회원수정 되었습니다.");
		}else {
			out.print("회원수정이 실패하였습니다. 다시시도해주세요.");
		}
	%>
</div>
<div class="bottom">
	<button type="button" onclick="mread()">MYINFO</button>
	<button type="button" onclick="history.back()">다시시도 </button>
</div>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>
