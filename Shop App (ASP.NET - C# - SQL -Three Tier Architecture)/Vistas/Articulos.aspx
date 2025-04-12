<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Vistas.FormularioVentas" %>

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
            height: 25px;
        }

        .auto-style3 {
            height: 26px;
        }

        .auto-style4 {
            height: 25px;
            text-align: center;
            width: 690px;
        }

        .auto-style5 {
            width: 206px;
        }

        .auto-style6 {
            height: 25px;
            width: 206px;
        }

        .auto-style7 {
            height: 26px;
            width: 206px;
        }

        .auto-style8 {
            width: 690px;
        }

        .auto-style9 {
            height: 26px;
            width: 690px;
        }

        .auto-style10 {
            width: 206px;
            height: 120px;
        }

        .auto-style11 {
            width: 690px;
            height: 120px;
        }

        .auto-style12 {
            height: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Ventas"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style9">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Sección de Compra"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style9">Buscá el artículo y la cantidad en la tabla y agregalo a tu carrito:</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label2" runat="server" Text="Buscar articulo o categoria por ID"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscararticulosid" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:DataList ID="dtlArticulos" runat="server">
                        </asp:DataList>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:SqlDataSource ID="sqldsArticulos" runat="server"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style9">
                        <asp:Label ID="lbObservaciones2" runat="server" Font-Bold="True" Text="Observación: Dentro del Datalist estarán los datos del articulos como su stock, así obtendremos el precio total y la fecha será proveida por un procedimiento de almacenado para sacar la fecha actual. Y por último más abajo se mostrarán los productos agregados."></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="lbProductosagregados" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Button ID="btnComprar" runat="server" Text="Comprar" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
