<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionCuenta.aspx.cs" Inherits="Vistas.MiCuenta.GestionCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 202px;
        }
        .auto-style3 {
            width: 690px;
        }
        .auto-style4 {
            width: 690px;
            text-align: center;
        }
        .auto-style5 {
            text-align: right;
        }
    </style>
    <link rel="stylesheet" href="../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlnkInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Gestionar Mi Cuenta"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblCambiarPass" runat="server" CssClass="mainItem" Text="Cambiar Contraseña"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNuevaPass" runat="server" CssClass="subItem" Text="Ingrese Nueva Contraseña"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNuevaPass" runat="server" ValidationGroup="1" Width="179px" MaxLength="12" TextMode="Password"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="rfvNuevaPass" runat="server" ControlToValidate="txtNuevaPass" ErrorMessage="Ingrese Nueva Contraseña" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblRepetirPass" runat="server" CssClass="subItem"  Text="Repetir Nueva Contraseña"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtRepetirPass" runat="server" ValidationGroup="1" Width="176px" MaxLength="12" TextMode="Password"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="rfvRepetirPass" runat="server" ControlToValidate="txtRepetirPass" ErrorMessage="Repita La Contraseña" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="btnAceptarPass" class="myButton" runat="server" OnClick="btnAceptarPass_Click" Text="Cambiar" ValidationGroup="1" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CompareValidator ID="cvPassIguales" runat="server" ControlToCompare="txtNuevaPass" ControlToValidate="txtRepetirPass" ErrorMessage="Las contraseñas no coinciden" ValidationGroup="1"></asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblDatos" runat="server"  CssClass="mainItem"  Text="Cambiar Datos"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNombres" runat="server" CssClass="subItem"  Text="Nombres"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNombres" runat="server" ValidationGroup="2" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblApellidos" runat="server" CssClass="subItem"  Text="Apellidos"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtApellidos" runat="server" ValidationGroup="2" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txtApellidos" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblProvincia" runat="server"  CssClass="subItem" Text="Provincia"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlProvincias" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" ValidationGroup="2" Width="125px">
                            <asp:ListItem Value="-- Seleccionar --">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblCiudad" runat="server" CssClass="subItem"  Text="Ciudad"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlCiudades" runat="server" DataTextField="-- Seleccionar --" DataValueField="0" ValidationGroup="2" Width="123px">
                            <asp:ListItem Value="0">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ControlToValidate="ddlCiudades" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDireccion" runat="server"  CssClass="subItem" Text="Direccion"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDireccion" runat="server" ValidationGroup="2" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblTelefono" runat="server"  CssClass="subItem" Text="Telefono"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtTelefono" runat="server" ValidationGroup="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblEmail" runat="server" CssClass="subItem"  Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="2" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo Obligatorio" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="btnAceptarDatos" CssClass="myButton" runat="server" Text="Cambiar" ValidationGroup="2" OnClick="btnAceptarDatos_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
