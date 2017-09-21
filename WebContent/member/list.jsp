<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>    
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
	
	List<MemberVO> list = dao.list(map);
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
<div class="title">[ 회 원 목 록 ]</div>
<div class="content">
<form action="./list.jsp" method="post" name="frm">
	<select name="col">
		<option value="id"
		<%if(col.equals("id")) out.print("selected='selected'");%>
		>아이디</option>
		<option value="name" 
		<%if(col.equals("name")) out.print("selected='selected'");%>
		>이름</option>
		<option value="tel"
		<%if(col.equals("tel")) out.print("selected='selected'");%>
		>전화번호</option>
		<option value="total"
		<%if(col.equals("total")) out.print("selected='selected'");%>
		>전체</option>
	</select>
	<input type="text" name="word" value="<%=word%>">
	<button type="submit">검색</button>
</form>

	<% for(int i=0; i<list.size(); i++){ 
		MemberVO vo = list.get(i);
	%>
  	<TABLE>
	    <TR>
	      <TD rowspan="7"><img src="<%=root %>/member/storage/<%=vo.getFname()%>" width="300px" height="230px"></TD>
	     <!--  <td></td> -->
	    </TR>
	    <tr>
	    	<th>아이디</th>
	    	<td><a href="javascript:read('<%=vo.getId()%>')"> <%=vo.getId() %> </a></td>
	    </tr>
	    <tr>
	    	<th>이름</th>
	    	<td><%=vo.getMname() %></td>
	    </tr>
	    <tr>
	    	<th>전화번호</th>
	    	<td><%=vo.getTel() %></td>
	    </tr>
	    <tr>
	    	<th>이메일</th>
	    	<td><%=vo.getEmail() %></td>
	    </tr>
	    <tr>
	    	<th>직업</th>
	    	<td><%=Utility.getCodeValue(vo.getJob()) %></td>
	    </tr>
	    <tr>
	    	<th>등록날짜</th>
	    	<td><%=vo.getMdate() %></td>
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