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
<title>Editar agenda</title>
</head>
<body>
	<%
		HttpSession sesion = request.getSession();

		String ID = request.getParameter("ID");

		String url = "jdbc:mysql://localhost:3306/jsp_kevin";
		String user = "root";
		String pas = "";

		if (sesion.getAttribute("logueado") != "1") {
			response.sendRedirect("login.jsp");
		}

		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			out.print("ERROR al conectar con driver" + e);
		}
		try {

			Connection con = DriverManager.getConnection(url, user, pas);

			PreparedStatement st = con
					.prepareStatement("SELECT * FROM `empleados` WHERE ID='" + request.getParameter("ID") + "';");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
	%>
	<div class="container mt-5">
		<form>
			<div class="form-group">
				<label>Nombre</label> <input type="text" class="form-control"
					id="inputnombre" placeholder="Introduce tu nombre"
					value="<%=rs.getString(2)%>" name="nombre">
			</div>
			<div class="form-group">
				<label>Direccion</label> <input type="text" class="form-control"
					id="inputdireccion" placeholder="Introduce tu direccion"
					value="<%=rs.getString(3)%>" name="direccion">

			</div>
			<div class="form-group">
				<label>Telefono</label> <input type="number" class="form-control"
					id="inputtelefono" placeholder="Introduce tu telefono"
					value="<%=rs.getString(4)%>" name="telefono">
			</div>

			<button type="submit" class="btn btn-primary" name="aceptar">Aceptar</button>
			<a href="inicio.jsp" type="submit" class="btn btn-danger"
				name="cancelar">Cancelar </a>
				<!-- Este input del ID es para que en la instrucciones sql funcione porque sino no encuentra el ID y nose el motivo exacto-->
                <input type="hidden" name="ID" value="<%=ID%>">

		</form>
	</div>

	<%
		}
		} catch (Exception e) {
			out.print("ERROR al conectar con la base de datos: " + e);
		}

		if (request.getParameter("aceptar") != null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (Exception e) {
				out.print("ERROR al conectar con el driver");
			}
			try {
				String nombre = request.getParameter("nombre");
				String direccion = request.getParameter("direccion");
				String telefono = request.getParameter("telefono");

				String query = "UPDATE empleados SET Nombre='" + nombre + "', Direccion='" + direccion
						+ "', Telefono='" + telefono + "' WHERE ID='" + ID + "'; ";

				Connection conection = DriverManager.getConnection(url, user, pas);

				Statement statement = conection.createStatement();
				statement.executeUpdate(query);
				request.getRequestDispatcher("inicio.jsp").forward(request, response);

			} catch (Exception e) {
				out.print("ERROR al conectar con la base de datos: " + e);
			}

		}
	%>


</body>
</html>