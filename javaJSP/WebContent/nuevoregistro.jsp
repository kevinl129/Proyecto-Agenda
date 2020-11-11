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
<title>Nuevo registro</title>
</head>
<body>
<%
HttpSession sesion=request.getSession();

if(sesion.getAttribute("logueado")!="1")
	response.sendRedirect("login.jsp");
%>

	<div class="container mt-5">
		<h2>Nuevo registro en la agenda</h2>
		<form>
			<div class="form-group">
				<label>Nombre</label> <input type="text" class="form-control"
					id="inputnombre" placeholder="Introduce nuevo nombre" value=""
					name="newnombre">
			</div>
			<div class="form-group">
				<label>Direccion</label> <input type="text" class="form-control"
					id="inputdireccion" placeholder="Introduce nueva direccion" value=""
					name="newdireccion">

			</div>
			<div class="form-group">
				<label>Telefono</label> <input type="number" class="form-control"
					id="inputtelefono" placeholder="Introduce nuevo telefono" value=""
					name="newtelefono">
			</div>

			<button type="submit" class="btn btn-primary" name="nuevo_registro">Nuevo registro</button>
			<a href="inicio.jsp" type="submit" class="btn btn-danger" name="cancelar">Cancelar </a>
			
			<%
			
			if(request.getParameter("nuevo_registro")!=null){
				try{
					Class.forName("com.mysql.jdbc.Driver");
				}catch(Exception e){
					out.print("ERROR al conectar con el driver: "+e);
				}
				try{
					String url="jdbc:mysql://localhost:3306/jsp_kevin";
					String user="root";
					String pas="";
					
					Connection con=DriverManager.getConnection(url,user,pas);
					
					PreparedStatement st=con.prepareStatement("INSERT INTO empleados (Nombre,Direccion,Telefono) VALUES (?,?,?);");
					
					st.setString(1, request.getParameter("newnombre"));
					st.setString(2, request.getParameter("newdireccion"));
					st.setString(3, request.getParameter("newtelefono"));
					
					st.executeUpdate();
					response.sendRedirect("inicio.jsp");
					
				}catch(Exception e){
					out.print("ERROR al conectar con la base de datos: "+e);
				}
			}
			
			%>	

		</form>
	</div>

</body>
</html>