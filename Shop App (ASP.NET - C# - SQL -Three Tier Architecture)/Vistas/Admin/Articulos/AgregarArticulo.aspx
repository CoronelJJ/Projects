<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="AgregarArticulo.aspx.cs" Inherits="Vistas.Admin.Articulos.AgregarArticulo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 29px;
        }
        .auto-style13 {
            width: 220px;
        }
        .auto-style9 {
            width: 29px;
            height: 50px;
        }
        .auto-style15 {
            width: 220px;
            height: 50px;
        }
        .auto-style12 {
            height: 50px;
            text-align: right;
        }
        .auto-style21 {
            margin-left: 0px;
        }
        .auto-style22 {
            width: 29px;
            height: 29px;
        }
        .auto-style24 {
            width: 220px;
            height: 29px;
        }
        .auto-style25 {
            height: 29px;
        }
        .auto-style26 {
            height: 50px;
        }
        .auto-style27 {
            height: 50px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            text-align: center;
            background-color: #DC143C;
        }
        .auto-style29 {
            width: 233px;
        }
        .auto-style32 {
            width: 29px;
            height: 23px;
        }
        .auto-style33 {
            width: 233px;
            height: 23px;
        }
        .auto-style34 {
            width: 220px;
            height: 23px;
        }
        .auto-style35 {
            height: 23px;
        }
        .auto-style36 {
            color: #FF0000;
        }
        </style>
    <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style26" colspan="2">
                                    <asp:HyperLink ID="hlnkInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al inicio</asp:HyperLink>
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style12">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style27" colspan="2">
                                    Agregar Articulo</td>
                                <td class="auto-style12">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style36">
                                    Nombre:</td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="txtNombreArticulo" runat="server" Width="210px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvNombreArticulo" runat="server" ControlToValidate="txtNombreArticulo">Ingrese un nombre</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style36">
                                    Categoria:</td>
                                <td class="auto-style24">
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="auto-style21" AppendDataBoundItems="True">
                                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ddlCategoria" ErrorMessage="Seleccione una categoria" InitialValue="--Seleccionar--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style36">
                                    Proveedor:</td>
                                <td class="auto-style24">
                                    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="auto-style21" AppendDataBoundItems="True">
                                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvProveedor" runat="server" ControlToValidate="ddlProveedor" ErrorMessage="Seleccione un proveedor" InitialValue="--Seleccionar--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style36">
                                    Precio de venta:</td>
                                <td class="auto-style13">
                                    $
                                    <asp:TextBox ID="txtPrecioVenta" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeVenta" runat="server" ControlToValidate="txtPrecioVenta" ErrorMessage="Ingrese precio de venta"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:CustomValidator ID="cvPrecioVenta" runat="server" ControlToValidate="txtPrecioVenta" OnServerValidate="cvPrecios_ServerValidate">El precio de venta debe ser positivo</asp:CustomValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style36">
                                    Precio de compra:</td>
                                <td class="auto-style13">
                                    $
                                    <asp:TextBox ID="txtPrecioCompra" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeCompra" runat="server" ControlToValidate="txtPrecioCompra" ErrorMessage="Ingrese precio de compra"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:CustomValidator ID="cvPrecioCompra" runat="server" ControlToValidate="txtPrecioCompra">El precio de compra debe ser positivo</asp:CustomValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style36">
                                    Stock:</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese stock"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtStock" Operator="GreaterThan" Type="Integer" ValueToCompare="0"> El stock debe ser positivo</asp:CompareValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style36">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    <asp:Button ID="btnAceptar" class="myButton" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" style="height: 29px" />
                                </td>
                                <td>
                                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32"></td>
                                <td class="auto-style33">
                                    </td>
                                <td class="auto-style34">
                                    </td>
                                <td class="auto-style35">
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
