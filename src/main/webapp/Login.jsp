<%@page import="Modelo.UsuariosDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session = "true" %>
 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand"><img src="assets/img/logos/logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="Productos.jsp">Productos</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contactenos.jsp">Contactenos</a></li>
                    </ul>
                </div>
            </div>
        </nav>
  <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Acceso de Usuarios</h2>
                    <h3 class="section-subheading text-muted">Por favor registre sus datos</h3>
                </div>
                </div>
                <form id="login" action ="Login.jsp" method="post">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                               
                                <input class="form-control" id="name" name="usuario" type="text" placeholder="Escriba su usuario" required/>
                               
                            <div class="form-group">
                            <br>
                                
                                <input class="form-control" id="pass" name="pass" type="password" placeholder="Ingrese su contrase�a" required/>
                                 <br>
                    			 <br>
                            </div>
                          
                        </div>
                       
                    </div>
                    </div>
                   
                   
                  
                  
                    <div class="text-center"><input class="btn btn-primary btn-xl text-uppercase" id="submitButton" type="submit"  name="btniniciar" value="Iniciar Sesi�n"></div>
                </form>
                <%
                		UsuariosDAO usu = new UsuariosDAO();
                		if(request.getParameter("btniniciar")!=null){
                			String usuario = request.getParameter("usuario");
                			String pass = request.getParameter("pass");
                			
                			switch(usu.validarusuario(usuario, pass)){
                			case 1:
                				HttpSession sesion = request.getSession();
                				sesion.setAttribute("user", usuario);
                				sesion.setAttribute("Nivel", 1);
                				response.sendRedirect("Admin.jsp");
                				break;
                			default:
                				%><script>alert("El usuario no esta registrdo")</script><%
                				break;
                				
                			
                			}
                			
                		}
                		
                
                %>
           
        </section>
		
</body>
</html>