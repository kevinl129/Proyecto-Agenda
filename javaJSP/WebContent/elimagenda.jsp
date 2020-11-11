<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Borrar registro</title>
</head>
<body>

	<%
		String ID = request.getParameter("ID");
		out.print(ID);

		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			out.print("ERROR al borrar registro: "+e);
		}
		try {
			String url="jdbc:mysql://localhost:3306/jsp_kevin";
			String user="root";
			String pas="";
			
           Connection con=DriverManager.getConnection(url,user,pas);
           PreparedStatement st=con.prepareStatement("DELETE  FROM empleados WHERE ID='"+ID+"'; ");
           st.executeUpdate();
           response.sendRedirect("inicio.jsp");
		} catch (Exception e) {
           out.print("ERROR al conectar con la base de datos: "+e);
		}
	%>

</body>
</html>