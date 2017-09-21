<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="free_board.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String upDir = "/free_board/storage";
	String tempDir = "/free_board/temp";
	

%>

