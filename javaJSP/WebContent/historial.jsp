<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Historial de movimientos</title>
</head>
<body>

	<%
	//podria tratar de meter este codigo jsp dentro de editaragenda.jsp y elimagenda.jsp en los while
		HttpSession sesion = request.getSession();

		if (sesion.getAttribute("logueado") != "1") {
			response.sendRedirect("login.jsp");
		}

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			out.print("Error al conectar con el driver: " + e);
		}
		try {

			String url = "jdbc:mysql://localhost:3306/jsp_kevin";
			String user = "root";
			String pas = "";

			Connection con = DriverManager.getConnection(url, user, pas);

			String sql = "INSERT INTO historial (motivo,ID,Nombre,Direccion,Telefono) VALUES (?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			//recibo de la http y coloco los parametros en la bd 
			st.setString(1, request.getParameter("motivo"));
			st.setString(2, request.getParameter("ID"));
			st.setString(3, request.getParameter("Nombre"));
			st.setString(4, request.getParameter("Direccion"));
			st.setString(5, request.getParameter("Telefono"));

			st.executeUpdate();

			response.sendRedirect("inicio.jsp");

		} catch (Exception e) {

		}
	%>

</body>
</html>