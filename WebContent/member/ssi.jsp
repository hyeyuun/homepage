<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="member.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	
%>

