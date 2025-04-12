<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Vistas.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 26px;
        }

        .auto-style3 {
            text-align: center;
            font-weight: bold;
            font-size: xx-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }

        .auto-style4 {
            height: 26px;
            width: 156px;
        }

        .auto-style5 {
            width: 156px;
        }

        .auto-style8 {
            width: 261px;
            text-align: right;
        }

        .auto-style9 {
            height: 26px;
            width: 261px;
        }

        .auto-style11 {
            width: 261px;
            text-align: right;
            height: 26px;
        }

        .auto-style12 {
            width: 156px;
            height: 29px;
        }

        .auto-style14 {
            height: 29px;
        }

        .auto-style15 {
            text-align: left;
            height: 26px;
        }
        .auto-style16 {
            width: 156px;
            height: 34px;
        }
        .auto-style17 {
            width: 261px;
            text-align: right;
            height: 34px;
            color: #DC143C;
        }
        .auto-style18 {
            height: 34px;
        }
        .auto-style19 {
            width: 261px;
            text-align: right;
            height: 26px;
            color: #DC143C;
        }
        .auto-style20 {
            width: 261px;
            text-align: right;
            height: 29px;
            color: #DC143C;
        }
        .auto-style21 {
            width: 261px;
            text-align: right;
            color: #DC143C;
        }
    </style>
     <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style2" colspan="2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        Menú de Registro</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlnkLogin" runat="server" NavigateUrl="~/Login.aspx">Volver al Menú de Ingreso</asp:HyperLink>
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style2 mainItem" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos Necesarios para el registro de la cuenta:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        Nombre(s):</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNombres" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txtNombres" ForeColor="Red" ValidationGroup="1">*Debe ingresar su(s) nombre(s)</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        Apellido(s):</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtApellido" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txtApellido" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar su(s) apellido(s)</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        DNI (Solo números):</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDni" runat="server" TextMode="Number"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar su dni</asp:RequiredFieldValidator>
&nbsp;
                        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se aceptan números</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style20">
                        Provincia:</td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="ddlProvincias" runat="server" AppendDataBoundItems="True" CausesValidation="True" DataTextField="-- Seleccionar --" DataValueField="0" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                            <asp:ListItem Value="-- Seleccionar --">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" ForeColor="#FF3300" InitialValue="0" ValidationGroup="1">*Debe seleccionar una provincia</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style20">
                        Ciudad:</td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="ddlCiudades" runat="server" AppendDataBoundItems="True" DataTextField="-- Seleccionar --" DataValueField="-- Seleccionar --" CausesValidation="True" ValidationGroup="1">
                            <asp:ListItem Selected="True" Value="0">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvCiudades" runat="server" ControlToValidate="ddlCiudades" ForeColor="#FF3300" InitialValue="0" ValidationGroup="1"> *Debe seleccionar una ciudad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        Dirección:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDireccion" runat="server" MaxLength="100"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar una dirección</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style21">
                        Teléfono:</td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar un teléfono</asp:RequiredFieldValidator>
&nbsp;
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se aceptan números</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar su email</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ForeColor="#FF3300" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$" ValidationGroup="1">*Debe ingresar email válido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style15 mainItem" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos para el ingreso del Usuario a la plataforma:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style20">
                        Nombre de usuario:</td>
                    <td class="auto-style14">
                        <asp:TextBox ID="txtUsuario" runat="server" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar un nombre de usuario</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style16"></td>
                    <td class="auto-style17">
                        Contraseña:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" ForeColor="#FF3300" ValidationGroup="1">*Debe completar su contraseña</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="cvContrasenia" runat="server" ControlToCompare="txtRepetirContrasenia" ControlToValidate="txtContrasenia" ForeColor="#FF3300" ValidationGroup="1">*Las contraseñas deben coincidir</asp:CompareValidator>
                    </td>
                    <td class="auto-style18"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style21">
                        Repetir contraseña:</td>
                    <td>
                        <asp:TextBox ID="txtRepetirContrasenia" runat="server" TextMode="Password" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRepetirContrasenia" runat="server" ControlToValidate="txtRepetirContrasenia" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" ValidationGroup="1">*Debe volver a repetir su contraseña</asp:RequiredFieldValidator>
&nbsp;
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCrear" CssClass="myButton" runat="server" Text="Crear" OnClick="btnCrear_Click" ValidationGroup="1" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
