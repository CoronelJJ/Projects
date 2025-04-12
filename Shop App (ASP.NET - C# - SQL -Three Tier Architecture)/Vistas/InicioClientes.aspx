<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioClientes.aspx.cs" Inherits="Vistas.InicioClientes" %>

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
            width: 249px;
        }

        .auto-style6 {
            width: 249px;
            height: 49px;
            text-align: center;
        }

        .auto-style13 {
            width: 249px;
            height: 30px;
            text-align: center;
        }
        .auto-style14 {
            width: 249px;
            text-align: center;
        }
        .auto-style15 {
            width: 249px;
            text-align: center;
            height: 27px;
        }
        .auto-style16 {
            height: 27px;
        }
        .auto-style17 {
            text-align: center;
        }
        .auto-style18 {
            width: 249px;
            text-align: center;
            height: 26px;
        }
        .auto-style19 {
            height: 26px;
        }
        .auto-style20 {
            width: 825px;
        }
        .auto-style21 {
            height: 26px;
            width: 825px;
        }
        .auto-style22 {
            height: 27px;
            width: 825px;
        }
        .auto-style23 {
            width: 825px;
            text-align: center;
        }
        .auto-style24 {
            height: 26px;
            width: 825px;
            text-align: center;
        }
        .auto-style25 {
            width: 825px;
            height: 30px;
        }
        .auto-style26 {
            height: 30px;
        }
    </style>
     <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lbSecciones" CssClass="subItem" runat="server" Text="▬ Secciones ▬" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style23">
                        <asp:Label ID="lblHome" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Home"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblSeccionarticulos" CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Artículos▬"></asp:Label>
                    </td>
                    <td class="auto-style25"></td>
                <td class="auto-style26"></td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:HyperLink ID="hlGestionarArticulos" runat="server" NavigateUrl="~/Articulos/CompraArticulo.aspx">Ver/Buscar/Comprar Articulos</asp:HyperLink>
                </td>
                <td class="auto-style21"></td>
                <td class="auto-style19"></td>
            </tr>
            <tr>
                <td class="auto-style18">
                        <asp:Label ID="lblSeccionarticulos1" CssClass="subItem"  runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Ventas▬"></asp:Label>
                    </td>
                <td class="auto-style21"></td>
                <td class="auto-style19"></td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MiCuenta/HistorialCompra.aspx">Historial Compras</asp:HyperLink>
                </td>
                <td class="auto-style24">
                    <asp:Button ID="btnCerrarSesion" CssClass="myButton" runat="server" Text="Cerrar Sesión" />
                </td>
                <td class="auto-style19"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                        <asp:Label ID="lblSeccionarticulos0" CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Cuenta▬"></asp:Label>
                    </td>
                <td class="auto-style22"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:HyperLink ID="hlGestionarCuenta" runat="server" NavigateUrl="~/MiCuenta/GestionCuenta.aspx">Gestionar Cuenta</asp:HyperLink>
                </td>
                <td class="auto-style22"></td>
                <td class="auto-style16"></td>
            </tr>
        </table>
        <div class="auto-style17">
        </div>
    </form>
</body>
</html>
