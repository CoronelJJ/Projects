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
        <h1>TRANSFERIR FONDOS</h1>  
        <h1 id="usuario" style="position: absolute; top: 1px ;right:6px " >Nombre usuario</h1>
    </div>

    <div style="position: absolute; left: 50%; top: 50%; transform: translateX(-50%) translateY(-50%);" >
        
        <table style="border: 2px;">
            <tr>
                <td>
                <label for="cbuDestino">CBU del destinatario:</label>
                <input type="text" id="cbuDestino" name="cbuDestino">
            </td>
             </tr>

             <tr>
                <td>
                <label for="importeATransferir">&emsp;&emsp;&nbsp;Importe:&emsp;&emsp;&emsp;</label>
                <input type="text" id="importeATransferir" name="importeATransferir">
            </td>
            </tr>
            <tr></tr>
            <tr>
                <td></td>
                <td style="align-content:flex-end;">
                    <button type="submit" id="aceptarTranferencia" name="aceptarTranferencia">Transferir</button>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>