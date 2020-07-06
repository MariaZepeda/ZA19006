<%-- 
    Document   : mostrar
    Created on : 5 jul. 2020, 2:33:29
    Author     : raf35
--%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.progra2.persistencia.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="com.progra2.persistencia.UsuarioJpaController"%>
<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    UsuarioJpaController controler = new UsuarioJpaController(emf);
    List<Usuario> lista = new ArrayList<Usuario>();
    lista = controler.findUsuarioEntities();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla de Usuarios Registrados</title>
    </head>
    <body>
        <h1>Usuarios Registrados</h1>
        <br>
        <br>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Usuario us : lista) {
                %>
                <tr>
                    <th scope="row"><%=us.getId()%> </th>
                    <td> <%=us.getNombre()%> </td>
                    <td> <%=us.getCorreo()%></td>
                    <td> <%=us.getContrasenia()%></td>
                    <td> <a href="/ZA19006/ServletEliminar?id=<%=us.getId()%>"><button class="btn btn-danger eliminar">Eliminar</button></a> </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
