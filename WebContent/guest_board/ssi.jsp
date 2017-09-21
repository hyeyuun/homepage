<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="guest_board.*" %>
<jsp:useBean id="dao" class="guest_board.GuestDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

