<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"   %> 
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function use(){
	opener.frm.id.value = '<%=id%>';
	window.close();
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<DIV class="title"> [ ID 중복확인 ] </DIV>
 <div class="content">
	입력된 ID : <%=id%> <br><br>
	<%
		if(flag){
			out.print("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
		}else {
			out.print("사용가능한 아이디입니다.<br><br>");
			out.print("<button type='button' onclick='use()'>사용</button>");
		}
	%>
 </div>
 
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

</body>
<!-- *********************************************** -->
</html> 
