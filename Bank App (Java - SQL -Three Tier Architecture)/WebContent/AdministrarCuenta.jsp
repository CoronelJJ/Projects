<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div>
 <h1 id="usuario" style="position: absolute; top:1px; right:6px">Nombre Usuario</h1>
	<h2>Asignación de cuenta</h2>
</div>

<div>
	<form action="AltaClienteServlet" method="post">
		<table style="width: 353px; text-align:center;">
			<tbody>
				<tr>
					<th>Cliente</th>
					<td style="width: 175px; ">
						<select name="usuarios" id="usuarios">
					        <option value="Usuario1">Felipe</option>
					        <option value="Usuario2">Maria</option>
					        <option value="Uusuario3">Pedro</option>
					    </select>
					</td>	
					
				</tr>
				
				<tr>
					<th>Tipo de cuenta</th>
					<td><select name="tipoCuenta" id="tipoCuenta">
							 <option value="cajaDeAhorro">Caja de Ahorro</option>
					        <option value="cuentaCorriente">Cuenta Corriente</option>
					    </select>
					</td>	
				</tr>
				<tr>
					<th>N° de cuenta</th>
					<td><input type="number" name="txtNroCuenta" id="txtNroCuenta"></td>	
					
				</tr>
				<tr>
					<th>CBU</th>
					<td><input type="number" name="txtCBU" id="txtCBU"></td>	
					
				</tr>
				<tr>
					<th>Monto inicial</th>
					<td><input type="number" name="txtMontoInicial" id="txtMontoInicial"></td>	
				</tr>
				<tr>
		
					<td colspan="2" style=" height:50px;"><button type="submit" name="btnAsignar" style="text-align:center; border-radius: 5px;">Asignar</button>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<div>

<div>
<h2>Eliminar Cuenta</h2>
	<form action="ModificarCuentaServlet" method="post">
	<table style="width: 200px; text-align:center;">
		<tbody>
			<tr>
				<th>Cliente</th>
				<td style="width: 104px; ">
					<select name="usuarios" id="usuarios">
				        <option value="Usuario1">Felipe</option>
				        <option value="Usuario2">Maria</option>
				        <option value="Uusuario3">Pedro</option>
				    </select>
				</td>	
				
			</tr>
			<tr>
	
				<td colspan="2" style=" height:50px; width: 210px"><button type="submit" name="btnEliminar" style="text-align:center; border-radius: 5px;">Eliminar</button>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<h2>Modificar Cuenta</h2>
	<form action="ModificarCuentaServlet" method="post">
		<table style="width: 353px; text-align:center;">
			<tbody>
				<tr>
					<th>Cliente</th>
					<td style="width: 175px; ">
						<select name="usuarios" id="usuarios">
					        <option value="Usuario1">Felipe</option>
					        <option value="Usuario2">Maria</option>
					        <option value="Uusuario3">Pedro</option>
					    </select>
					</td>	
					
				</tr>
				
				<tr>
					<th>Tipo de cuenta</th>
					<td><select name="tipoCuenta" id="tipoCuenta">
							 <option value="cajaDeAhorro">Caja de Ahorro</option>
					        <option value="cuentaCorriente">Cuenta Corriente</option>
					    </select>
					</td>	
				</tr>
				<tr>
					<th>N° de cuenta</th>
					<td><input type="number" name="txtNroCuenta" id="txtNroCuenta"></td>	
					
				</tr>
				<tr>
					<th>CBU</th>
					<td><input type="number" name="txtCBU" id="txtCBU"></td>	
					
				</tr>
				<tr>
					<th>Saldo</th>
					<td><input type="number" name="txtMontoInicial" id="txtMontoInicial"></td>	
				</tr>
				<tr>
		
					<td colspan="2" style=" height:50px;"><button type="submit" name="btnModificar" style="text-align:center; border-radius: 5px;">Modificar</button>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<div>
	<h2>Listar Cuenta</h2>
	<form action="ListarCuentaServlet" method="post">
		<table style="width: 353px; text-align:center;">
			<tbody>
				<tr>
					<th>Cliente</th>
					<th>Fecha de creación</th>
					<th>Tipo de cuenta</th>
					<th>N° de cuenta</th>
					<th>CBU</th>
					<th>Saldo</th>
				</tr>
				<tr>
					<td></td> <td></td> <td></td> <td></td>	<td></td> <td></td>		
				
			</tbody>
		</table>
	</form>
</div>
</body>
</html>