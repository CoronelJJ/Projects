<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialCompra.aspx.cs" Inherits="Vistas.MiCuenta.HistorialCompra" %>

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
            width: 203px;
        }
        .auto-style3 {
            width: 826px;
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
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            text-align: right;
        }
    </style>
     <link rel="stylesheet" href="../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
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
                <asp:HyperLink ID="hlnkInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5">
                <asp:Label ID="lblTitulo" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Mi Historial" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">
                        <asp:GridView ID="gvHistorial" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnPageIndexChanging="gvHistorial_PageIndexChanging" >
                            <Columns>
                                <asp:BoundField DataField="IDVenta" HeaderText="Nro Venta" />
                                <asp:BoundField DataField="PrecioTotal" HeaderText="Total" DataFormatString="${0:F}" />
                                <asp:BoundField DataField="FechaVenta" HeaderText="Fecha" />
                                <asp:HyperLinkField DataNavigateUrlFields="IDVenta" DataNavigateUrlFormatString="~/MiCuenta/DetalleVenta.aspx?id={0}" Text="Ver detalle" />
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
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3"></td>
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
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <div>
        </div>
    </form>
</body>
</html>
