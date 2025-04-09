<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asignación de cuenta</title>
</head>
<body>

 <div>
 <h1 id="usuario" style="position: absolute; top:1px; right:6px">Nombre Usuario</h1>
	<h2>Asignación de cuenta</h2>
</div>

<div>
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
</div>
</body>
</html>