<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 콘텐츠 타입에서 인코딩을 지정해주는것은 해당 타입의 응답결과를 뜻하고 
    페이지인코딩에서 인코딩을 지정해주는것은 utf-8로 작성하겠다는 뜻 -->
    <%@ page import="java.util.Date,java.util.Calendar" %>
    <!-- 콤마를 통해 여러패키지를 한번에 임포트 가능 * 도 사용가능 -->
    <%@ page trimDirectiveWhitespaces="true" %>
    <!-- 불필요한 공백문자를 제거해준다  안쓰면< %@값들만큼 공백이 생기는데 그걸 제거해줌-->
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Date now = new Date(); %> <!-- 객체생성 -->
<% Calendar cal = Calendar.getInstance(); %>
<br>
현재시간 : <%= now %>
<br>
오늘은 
	<%= cal.getWeekYear() %>년
	<%= cal.get(Calendar.MONTH+1) %>월<!-- 달은 0부터시작함 -->
	<%= cal.get(java.util.Calendar.DATE) %>일 <!-- 이런식으로 패키지를 입력시켜서 사용도 가능 -->
<br>	
	스크립트릿 -> 자바 코드 작성 <br>
	<% int a = 1;
	int b = 4;
	int sum = 0;
	for(int i = a; i < b ; i++ ){
		sum += i;
	}
	%>
	<%= sum %>
<br>
	표현식 -> 값출력 <br> <%= 10 > 9 %> 
<br>
	선언부 -> 자바 메소드 작성 <br>
	<%!
	public int test(int a, int b){
		return a*b;
	}
	%>
	<%= test(3,5) %>

</body>
</html>