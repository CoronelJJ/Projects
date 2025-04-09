<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pago de Préstamo</title>
</head>

<body >
<div>
	<select name="misCuentas" id="misCuentas">
        <option value="Cuenta1">Mi cuenta 1</option>
        <option value="Cuenta2">Mi cuenta 2</option>
        <option value="Cuenta3">Mi cuenta 3</option>
    </select>
 </div>
 
<h1 id="usuario" style="position: absolute; top:1px; right:6px">Nombre Usuario</h1>
<h2>Pago de Préstamos</h2>
<div>
<table style="text-align:center;">
	<thead >
		<tr>
			<th style="width: 41px; "></th>
			<th style="width: 162px; ">Cuota a pagar</th>
			<th>Importe</th>
			<th style="width: 115px; ">Cuenta</th>
		</tr>
	</thead>
	<tbody>
		<tr style="width: 482px; ">
			<td style=" 30px; height: 13px"><input type="radio" name="radio" value="radio1"></td>	
			<td>4/6</td>
			<td style="width: 128px">10000</td>
			<td><select name="cuentas">
					<option value="cuenta1">Cuenta 1</option>
					<option value="cuenta1">Cuenta 2</option>
					<option value="cuenta1">Cuenta 3</option>
				</select> </td>
		</tr>
		<tr style="width: 482px; ">
			<td style=" 30px; height: 13px"><input type="radio" name="radio" value="radio2"></td>	
			<td>1/12</td>
			<td style="width: 128px">4166,666</td>
			<td><select name="cuentas">
					<option value="cuenta1">Cuenta 1</option>
					<option value="cuenta1">Cuenta 2</option>
					<option value="cuenta1">Cuenta 3</option>
				</select> </td>
		</tr>
		<tr>
			<td colspan="4" style=" height:50px;"><button type="submit" name="btnPagar" style="text-align:center; border-radius: 5px;">Pagar</button>
			</td>
		</tr>
		
	</tbody>
</table>
</div>


</body>
</html>