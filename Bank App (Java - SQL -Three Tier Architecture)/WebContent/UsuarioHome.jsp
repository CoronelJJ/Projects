<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mi home</title>
</head>
<body>
	<form action="redireccionarServlet" method="post">
    <select name="misCuentas" id="misCuentas">
        <option value="Cuenta1">Mi cuenta 1</option>
        <option value="Cuenta2">Mi cuenta 2</option>
        <option value="Cuenta3">Mi cuenta 3</option>
    </select>
    <div>
    <h1 id="usuario" style="position: absolute; top: 1px ;right:6px " >Nombre usuario</h1>
    <h1 id="cuentaSeleccionada" style="text-align: left;">Cuenta "tipo X" Nº "Y"</h1>
    <h1 id="miSaldo" style="text-align: right;" >SALDO: $xxxx.xx</h1>
    </div>
    <div>
    <table style="margin-left: auto; margin-right: auto;">

        <tr>
            <td><button type="submit" id="misDatos" name="misDatos">MIS DATOS</button></td>
        </tr>
        <tr>
            <td><button type="submit" id="misMovimientos" name="misMovientos">MIS MOVIMIENTOS</button></td>
        </tr>
        <tr>
            <td><button type="submit" id="misDeudas" name="misDeudas">PAGO DE DEUDAS</button></td>
        </tr>
        <tr>
            <td> <button type="submit" id="solicitarPrestamo" name="solicitarPrestamo">SOLICTAR PRESTAMO</button></td>
        </tr>
        <tr>
            <td><button type="submit" id="transferirFondos" name="transferirFondos">TRANSFERIR FONDOS</button></td>
        </tr>

    </table>
    </div>
</form>

</body>
</html>