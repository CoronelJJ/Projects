<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Solicitar Préstamo</title>
</head>
<body>
<div>
	<select name="misCuentas" id="misCuentas">
        <option value="Cuenta1">Mi cuenta 1</option>
        <option value="Cuenta2">Mi cuenta 2</option>
        <option value="Cuenta3">Mi cuenta 3</option>
    </select>
 </div>
 
<h1 id="usuario" style="position: absolute; top:1px; right:6px">Nombre Usuario</h1>
<h2>Solicitar Préstamo</h2>
<div>
<table style="text-align:center;">
	<thead >
		<tr>
			<td style="width: 74px; ">Importe</td>
			<td style="width: 162px; "><input type="number" name="txtImporte"></td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<tr style="width: 482px; ">
				
			<td>Cuotas</td>
			<td style="width: 128px">
				<select name="ddlCuotas" id="ddlCuotas">
			        <option value="Cuota1">1 cuota</option>
			        <option value="Cuota3">3 cuotas</option>
			        <option value="Cuota6">6 cuotas</option>
			        <option value="Cuota12">12 cuotas</option>
			    </select>
			</td>
			<td>Interes:</td>
			
		</tr>
		<tr style="width: 482px; ">
			
			<td>Cuenta a depositar</td>
			<td style="width: 128px"><select name="cuentas">
					<option value="cuenta1">Cuenta 1</option>
					<option value="cuenta2">Cuenta 2</option>
					<option value="cuenta3">Cuenta 3</option>
				</select></td>
				<td></td>
			
		</tr>
		<tr>
			<td colspan="3" style=" height:50px;"><button type="submit" name="btnSolicitar" style="text-align:center; border-radius: 5px;">Solicitar</button>
			</td>
		</tr>
		
	</tbody>
</table>
</div>
</body>
</html>