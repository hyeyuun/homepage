<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>    
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Map<Object,String> map = new HashMap<Object,String>();
	map.put("id", id);
	map.put("passwd", passwd);
	boolean flag = dao.loginCheck(map);
	
	if(flag){
		String grade = dao.getGrade(id);
		
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		Cookie cookie = null;
		
		String c_id = request.getParameter("c_id");
		if(c_id != null){
			cookie = new Cookie("c_id","Y");
			cookie.setMaxAge(120);//2분유지
			response.addCookie(cookie);
			
			cookie = new Cookie("c_id_val","id");
			cookie.setMaxAge(120);
			response.addCookie(cookie);
		}else {
			cookie = new Cookie("c_id","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
			cookie = new Cookie("c_id_val","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
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
<jsp:include page="/menu/header.jsp" flush="false"/>
<div class="title">[ 로그인 확인 ]</div>
<div class="content">
<%
	if(flag){
		out.print("로그인 되었습니다.");
	}else {
		out.print("아이디/비밀번호를 잘못입력하셨습니다. <br>다시시도해주세요.");
	}
%>
</div>
<div class="bottom">
	<button type="button" class="btn btn-default" onclick="location.href='<%=root%>/index.jsp'">홈</button>
	<button type="button" class="btn btn-default" onclick="history.back()">다시시도</button>
</div>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>