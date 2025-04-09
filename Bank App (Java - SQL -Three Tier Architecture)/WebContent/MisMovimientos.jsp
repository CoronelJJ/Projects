<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movimientos</title>
</head>
<body style="display: flex; justify-content: center; height: 100vh; margin: 0;">
	<div>
		<select name="misCuentas" id="misCuentas">
        <option value="Cuenta1">Mi cuenta 1</option>
        <option value="Cuenta2">Mi cuenta 2</option>
        <option value="Cuenta3">Mi cuenta 3</option>
    	</select>
	</div>
    <div>
        <h2>Historial de Movimientos</h2>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Detalle</th>
                    <th>Importe</th>
                    <th>Tipo de Movimiento</th>
                </tr>
                <tr>
                	<td>11/11/22</td>
                	<td>Creacion CA</td>
                	<td>$10.000</td>
                	<td>Alta de Cuenta</td>
                </tr>
            </thead>
        </table>
    </div>
</body>
</html>