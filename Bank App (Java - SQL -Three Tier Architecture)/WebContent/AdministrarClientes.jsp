<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrar Clientes</title>
</head>
<div>
	<h1 id="usuario" style="position: absolute; top: 1px ;right:6px " >Nombre usuario</h1>
</div>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">
		
		<div>
<div>
	<h2 id="modificar" style="position: absolute;  top: 255px ;right:870px" >Modificar Usuario</h2>
</div>
        <form action="ModificarClienteServlet" method="post">
            <table style="margin: 0 auto;">
                <tr>
                    <td style="text-align: left;"><label for="usuario">Usuario:</label></td>
                     <td>
                        <select id="usuario" name="usuario">
                            <option value="Leandro">Leandro</option>
                            <option value="Ignacio">Ignacio</option>
                            <option value="Felipe">Felipe</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="contraseña">Contraseña:</label></td>
                    <td><input type="password" id="contraseña" name="contraseña"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 15px;">
                        <button type="submit">Modificar</button>
                    </td>
                </tr>
            </table>
        </form>
    
	<div style="height: 56px; ">
	
	</div>	

<div>
	<h2 id="eliminar" style="position: absolute;  top: 400px ;right:870px" >Eliminar Usuario</h2>
</div>
        <form action="EliminarClienteServlet" method="post">
            <table style="margin: 0 auto;">
                <tr>
                    <td style="text-align: left;"><label for="usuario">Usuario:</label></td>
                    <td>
                        <select id="usuario" name="usuario">
                            <option value="Leandro">Leandro</option>
                            <option value="Ignacio">Ignacio</option>
                            <option value="Felipe">Felipe</option>
                        </select>
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 15px;">
                        <button type="submit">Eliminar</button>
                    </td>
                </tr>
            </table>
        </form>
    

<div style="height: 56px; ">
	
	</div>	
<div>
	<h2 id="listar" style="position: absolute;  top: 525px ;right:890px" >Total Clientes</h2>
</div>
        
            <table  border="1" style="margin: 0 auto; ">
               <tr> <th>DNI</th>  <th>CUIL</th>  <th>Nombre</th>  <th>Apellido</th><th>Sexo</th> <th>Nacionalidad</th><th>Fecha Nacimiento</th><th>Direccion</th><th>Localidad</th><th>Provincia</th><th>Email</th><th>Telefonos</th><th>Usuario</th><th>Contraseña</th></tr>
	
	
	<tr>  <td> </td> <td></td> <td> </td> <td></td> <td></td> <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>  
	     
	 
	
               
               
            </table>
       
    </div>



</body>
</html>