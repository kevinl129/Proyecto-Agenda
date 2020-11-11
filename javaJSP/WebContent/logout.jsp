<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("logueado") != "1") {
			response.sendRedirect("login.jsp");
		} else {
			sesion.invalidate();
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>