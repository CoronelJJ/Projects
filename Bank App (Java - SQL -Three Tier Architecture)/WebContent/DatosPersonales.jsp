<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datos Personales</title>
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">
    <div>
        <h1 style="text-align: center;">Datos Personales</h1>
        <h3 style="text-align: center;">Ingrese sus datos personales:</h3>
        <form action="DatosPersonalesServlet" method="post">
            <table style="margin: 0 auto;">
                <tr>
                    <td style="text-align: left;"><label for="dni">DNI:</label></td>
                    <td><input type="number" id="dni" name="dni"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="cuil">CUIL:</label></td>
                    <td><input type="text" id="cuil" name="cuil"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="nombre">Nombre:</label></td>
                    <td><input type="text" id="nombre" name="nombre"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="apellido">Apellido:</label></td>
                    <td><input type="text" id="apellido" name="apellido"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="sexo">Sexo:</label></td>
                    <td>
                        <select id="sexo" name="sexo">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="nacionalidad">Nacionalidad:</label></td>
                    <td>
                        <select id="nacionalidad" name="nacionalidad">
                            <option value="Argentina">Argentina</option>
                            <option value="Brasil">Brasil</option>
                            <option value="Chile">Chile</option>
                            <option value="Uruguay">Uruguay</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="fechaNacimiento">Fecha Nacimiento:</label></td>
                    <td><input type="date" id="fechaNacimiento" name="fechaNacimiento"></input></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="direccion">Dirección:</label></td>
                    <td><input type="text" id="direccion" name="direccion"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="localidad">Localidad:</label></td>
                    <td><input type="text" id="localidad" name="localidad"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="provincia">Provincia:</label></td>
                    <td>
                        <select id="provincia" name="provincia">
                            <option value="Buenos Aires">Buenos Aires</option>
                            <option value="Córdoba">Córdoba</option>
                            <option value="Santa Fe">Santa Fe</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email"></td>
                </tr>
                <tr>
                    <td style="text-align: left;"><label for="telefono">Teléfono:</label></td>
                    <td><input type="tel" id="telefono" name="telefono"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 15px;">
                        <button type="submit">Enviar</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>