<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
request.getParameter메서드 사용 : 해당 파라미터값을 받아올 수 있음<br>
name 파라미터 = <%= request.getParameter("name") %> <br>
address 파라미터 = <%= request.getParameter("address") %> <br><br>
request.getParameterValues() 메서드사용 : 같은 파라미터값을 쓰는 값을 가져올 수 있음<br>
<% String[] arr = request.getParameterValues("pet"); 
for(int i = 0; i < arr.length ;i++ ){
%>
<%= arr[i] %>
<% 
}
%><br><br>

request.getParameterNames() 메서드사용 : 넘어오는 name값을 모두 받을 수 있음 <br>
<% Enumeration paramEnum = request.getParameterNames(); 
while(paramEnum.hasMoreElements()){
	String name = (String)paramEnum.nextElement();
%>
<%= name %>
<% 
}
%> <br><br>

request.getParameterMap() 메서드사용 : <파라미터이름,파라미터값> Map형태 데이터로 받을 수 있음<br>
<% Map paramMap = request.getParameterMap();
String[] nameparam = (String[])paramMap.get("address");
if(nameparam != null){
%>
address = <%= nameparam[0] %>
<% } %>
</body>
</html>