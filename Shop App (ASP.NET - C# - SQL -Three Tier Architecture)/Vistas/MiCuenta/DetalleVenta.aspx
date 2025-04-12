<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="Vistas.MiCuenta.DetalleVenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style2 {
            width: 203px;
        }
        .auto-style3 {
            width: 826px;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style4 {
            width: 203px;
            height: 26px;
        }
        .auto-style5 {
            width: 826px;
            height: 26px;
            text-align: center;
        }
        #lblTitulo{
    color:forestgreen;
    font-family: Consolas,sans-serif;
}

.mainItem {
    background-color: crimson;
    color: floralwhite;
}

        .auto-style6 {
            height: 26px;
        }
        .auto-style1 {
            width: 100%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style7">
                <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:HyperLink ID="hlnkInicio" runat="server" NavigateUrl="~/MiCuenta/HistorialCompra.aspx">Volver al Historial de Compra</asp:HyperLink>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5">
                <asp:Label ID="lblTitulo" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Detalle de Venta" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">
                        <asp:GridView ID="gvDetalleVenta" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"  >
                            <Columns>
                                <asp:BoundField DataField="Venta" HeaderText="Nro Venta" />
                                <asp:BoundField DataField="Articulo" HeaderText="Articulo" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="PrecioTotal" HeaderText="Total" DataFormatString="${0:F}" />
                                <asp:BoundField DataField="FechaVenta" HeaderText="Fecha" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                    </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <div>
        </div>
    </form>
</body>
</html>
