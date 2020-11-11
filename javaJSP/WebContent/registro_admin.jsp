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
<title>Registro nuevo admin</title>
</head>
<body>
	<div class="container mt-5">
		<form action="registro_admin.jsp" method="post">
			<div class="form-group">
				<label>Usuario Nuevo</label> <input type="text" class="form-control"
					id="inputUsuario" placeholder="Introduce tu Usuario" name="usuario_nuevo">
			</div>
			<div class="form-group">
				<label>Contraseña</label> <input type="text" class="form-control"
					id="inputContraseña" placeholder="Introduce tu contraseña"
					name="contraseña1">
			</div>
			<div class="form-group">
				<label> Repite la Contraseña</label> <input type="text" class="form-control"
					id="inputContraseña" placeholder="Introduce tu contraseña"
					name="contraseña2">
			</div>

			<button type="submit" class="btn btn-primary" name="registrar">Registrar</button>
		</form>
		
		<%
		if(request.getParameter("registrar")!=null){
			//comprobar que coincidan las contraseñas
			if(request.getParameter("contraseña1").equals(request.getParameter("contraseña2"))){
				try{
					//conexion con el driver
					Class.forName("com.mysql.jdbc.Driver");
				}catch( Exception e){
					out.print("ERROR al usar el Driver: "+e);
				}
				try{
					//conexion con la base de datos
					String url="jdbc:mysql://localhost:3306/jsp_kevin";
					String user="root";
					String pas="";
					Connection con=DriverManager.getConnection(url,user,pas);
					PreparedStatement st=con.prepareStatement("INSERT INTO useradmin (admin,password) VALUES (?,?)");
					st.setString(1,request.getParameter("usuario_nuevo"));
					st.setString(2, request.getParameter("contraseña1"));
					st.executeUpdate();
					//redireccion al inicio
					response.sendRedirect("inicio.jsp");
				}catch(Exception e){
					out.print("ERROR al conectar a la base de datos: "+ e);
					
				}
			
			}
			else{
			out.print("	<div class=\"alert alert-warning\" role=\"alert\"> Las contraseñas no coinciden</div>");
				
			}
		}
		%>
	</div>
</body>
</html>