<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"   %> 
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);
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
	opener.frm.email.value = '<%=email%>';
	window.close();
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<DIV class="title"> [ E-mail 중복확인 ] </DIV>
 <div class="content">
	입력된 E-mail : <%=email%> <br><br>
	<%
		if(flag){
			out.print("중복된 이메일입니다. 다른 이메일을 사용해주세요.");
		}else {
			out.print("사용가능한 이메일입니다.<br><br>");
			out.print("<button type='button' onclick='use()'>사용</button>");
		}
	%>
 </div>
 
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='email_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

</body>
<!-- *********************************************** -->
</html> 
