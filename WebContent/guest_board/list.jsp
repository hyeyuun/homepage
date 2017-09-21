<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/guest_board/ssi.jsp" %>    
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	int nowPage = 1;
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 3;
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	Map<Object,Object> map = new HashMap<Object,Object>();
	map.put("col", col);
	map.put("word", word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	List<GuestVO> list = dao.list(map);
	int total = dao.total(map);
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
<div class="title">[ 방 명 록 ]</div>
<div class="content">
<!-- <form action="./list.jsp" method="post" name="frm"> -->
<!-- 	<select name="col"> -->
<!-- 		<option value="id" -->
<%-- 		<%if(col.equals("id")) out.print("selected='selected'");%> --%>
<!-- 		>아이디</option> -->
<!-- 		<option value="name"  -->
<%-- 		<%if(col.equals("name")) out.print("selected='selected'");%> --%>
<!-- 		>이름</option> -->
<!-- 		<option value="tel" -->
<%-- 		<%if(col.equals("tel")) out.print("selected='selected'");%> --%>
<!-- 		>전화번호</option> -->
<!-- 		<option value="total" -->
<%-- 		<%if(col.equals("total")) out.print("selected='selected'");%> --%>
<!-- 		>전체</option> -->
<!-- 	</select> -->
<%-- 	<input type="text" name="word" value="<%=word%>"> --%>
<!-- 	<button type="submit">검색</button> -->
<!-- </form> -->

	<% for(int i=0; i<list.size(); i++){ 
		GuestVO vo = list.get(i);
	%>
  	<TABLE>
  		<tr>
  			<th><%=vo.getGnum() %></th>
  			<th><%=vo.getGname() %></th>
  			<th>(<%=vo.getGdate() %>)</th>
  		</tr>
  		<tr>
  			<td><%=vo.getFname() %></td>
  			<td><textarea rows="5" cols="10"><%=vo.getFname() %></textarea> </td>
  		</tr>
  	</TABLE>
	<% } %>    

</div>
<div class="bottom">
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
</div>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>