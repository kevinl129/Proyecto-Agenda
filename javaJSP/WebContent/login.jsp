<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<title>Login Admin</title>
</head>
<body>

	<!-- Navbar agenda -->
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img
			src="C:\Users\kevin\eclipse-workspace\javaJSP\src\img\agenda.png" width="30"
			height="30" class="d-inline-block align-top" alt="" loading="lazy">
		    Agenda
		</a>
	</nav>

<!-- Formulario login -->
	<div class="container mt-5">

		<form action="login.jsp" method="post">
			<div class="form-group">
				<label>Usuario</label> <input type="text" class="form-control"
					id="inputUsuario" placeholder="Introduce tu Usuario" name="usuario">
			</div>
			<div class="form-group">
				<label>Contraseña</label> <input type="text" class="form-control"
					id="inputContraseña" placeholder="Introduce tu contraseña"
					name="contraseña">
			</div>

			<button type="submit" class="btn btn-primary" name="ingresar">Ingresar</button>
			<br> <br>
			<button type="submit" class="btn btn-danger" name="registrarse">Registrarse</button>
		</form>

		<%
			HttpSession sesion = request.getSession();
			if (request.getParameter("registrarse") != null) {
				response.sendRedirect("registro_admin.jsp");
			}

			if (request.getParameter("ingresar") != null) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (Exception e) {
					out.print("ERROR al conectar con el DRIVER  " + e);
				}
				try {
					String url = "jdbc:mysql://localhost:3306/jsp_kevin";
					String user = "root";
					String pas = "";
					Connection con = DriverManager.getConnection(url, user, pas);
					Statement st = con.createStatement();
					ResultSet rs = st
							.executeQuery("SELECT * FROM `useradmin` WHERE admin='" + request.getParameter("usuario")
									+ "' and password='" + request.getParameter("contraseña") + "';");
					while (rs.next()) {
						sesion.setAttribute("logueado", "1");
						sesion.setAttribute("usuario", request.getParameter("usuario"));
						sesion.setAttribute("id", rs.getString("ID"));
						response.sendRedirect("inicio.jsp");
					}
					out.print("CONTRASEÑA O USUARIO no validos");

				} catch (Exception e) {
					out.print("ERROR al conectar con la base de datos: " + e);
				}
			}
		%>

	</div>


</body>
</html>