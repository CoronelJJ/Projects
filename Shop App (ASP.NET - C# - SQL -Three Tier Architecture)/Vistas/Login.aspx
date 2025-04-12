<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 42px;
        }
        .auto-style6 {
            height: 26px;
            width: 42px;
        }
        .auto-style7 {
            width: 42px;
            height: 29px;
        }
        .auto-style9 {
            height: 29px;
        }
        .auto-style10 {
            height: 26px;
            text-align: center;
            font-family: Consolas, sans-serif;
            font-weight: bold;
            font-size: x-large;
            color: #228B22;
        }
        .auto-style11 {
            height: 26px;
            margin-left: 80px;
        }
        .auto-style12 {
            width: 42px;
            height: 24px;
        }
        .auto-style13 {
            height: 24px;
        }
        .auto-style14 {
            height: 26px;
            width: 297px;
        }
        .auto-style15 {
            height: 24px;
            width: 297px;
        }
        .auto-style16 {
            font-family: Consolas, sans-serif;
            font-weight: bold;
            font-size: x-large;
            color: #008B8B;
        }
        .auto-style17 {
            text-align: right;
            height: 29px;
            width: 297px;
            font-family: Consolas, sans-serif;
            color: #DC143C;
        }
    </style>
     <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body id="FondoLocal">
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
            <table id="tablalogin" class="auto-style1">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4" colspan="2">
                        <span class="auto-style16">Electrónica G6</span><br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style10" colspan="2">
                        ¡Bienvenido/a a nuestra tienda online!</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style14"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style17">
                        Usuario:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtUsuario" runat="server" ValidationGroup="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ValidationGroup="1">Ingrese usuario</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style17">
                        Contraseña</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" ValidationGroup="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUserPssw" runat="server" ControlToValidate="txtContrasenia" ValidationGroup="1">Ingrese contraseña</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style11">
                        <asp:Button ID="btnIngresar" class="myButton" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" ValidationGroup="1" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblErrorLogeo" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style3">
                        </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style13">
                        <asp:LinkButton runat="server" PostBackUrl="~/Registro.aspx">No tenes cuenta? Registrate!</asp:LinkButton>
                    </td>
                    <td class="auto-style13"></td>
                </tr>
            </table>
    </form>
</body>
</html>
