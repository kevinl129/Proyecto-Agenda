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
<title>Inicio</title>
</head>
<body>

	<%
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("logueado") != "1") {
			response.sendRedirect("login.jsp");
		}
	%>

	<nav class="navbar navbar-light bg-light">
		<!-- Image and text -->
		<a class="navbar-brand" href="#"> <img
			src="C:\Users\kevin\eclipse-workspace\javaJSP\src\img\admin.png" width="30"
			height="30" class="d-inline-block align-top" alt="" loading="lazy">
			<%=sesion.getAttribute("usuario")%>
		</a>
		
		<form class="form-inline" action="nuevoregistro.jsp">

			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Nuevo registro</button>
			
		</form>

		<form class="form-inline" action="logout.jsp">

			<button class="btn btn-outline-dark" type="submit">Cerrar sesion</button>
				
		</form>
		
		
	</nav>

	<table class="table table-dark">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nombre</th>
				<th scope="col">Direccion</th>
				<th scope="col">Telefono</th>
				<th scope="col">Acciones</th>

			</tr>
		</thead>

		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (Exception e) {
				out.print("ERROR al conectar con el driver: " + e);
			}
			try {
				String url = "jdbc:mysql://localhost:3306/jsp_kevin";
				String user = "root";
				String pas = "";
				Connection con = DriverManager.getConnection(url, user, pas);
				PreparedStatement st = con.prepareStatement("SELECT * FROM `empleados` ");
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
		%>

		<tbody>
			<tr>
				<th scope="row"><%=rs.getString(1)%></th>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td>
				<!-- botones para editar y eliminar persona de la agenda -->
				<a href="editagenda.jsp?ID=<%=rs.getString(1)%>"><button type="button" class="btn btn-warning" >Editar</button></a>
				<a href="elimagenda.jsp?ID=<%=rs.getString(1)%>"><button type="button" class="btn btn-danger" >Eliminar</button></a>
				
				</td>

			</tr>


			<%
				}

				} catch (Exception e) {
					out.print("ERROR al conectar con la base de datos " + e);
				}
			%>




		</tbody>
	</table>
</body>
</html>