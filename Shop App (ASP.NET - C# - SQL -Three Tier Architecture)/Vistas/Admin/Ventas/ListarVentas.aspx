<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarVentas.aspx.cs" Inherits="Vistas.Admin.Ventas.ListarVentas" %>

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
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            text-align: right;
        }
        .auto-style9 {
            text-align: center;
        }
        .auto-style10 {
            font-size: large;
            height: 26px;
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
                        <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2 mainItem"><strong>Listado de ventas</strong></td>
                    <td class="auto-style2 subItem"><strong>Filtros de búsqueda</strong></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td rowspan="14" class="auto-style9">
                        <asp:GridView ID="gvVentas" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvVentas_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="IDVenta" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="ID Venta" />
                                <asp:BoundField DataField="NombreArticulo" HeaderText="Articulo" SortExpression="Articulo" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                <asp:BoundField DataField="FechaDeVenta" HeaderText="Fecha Venta" SortExpression="Fecha Venta" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Comprador" HeaderText="Comprador" ReadOnly="True" SortExpression="Comprador" />
                                <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                <strong><em>No hay ventas realizadas con los criterios de búsqueda propuestos</em></strong>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                    <td class="auto-style3"><strong>Artículos</strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtArticulo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>ID Venta</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtIdVenta" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:CompareValidator ID="cpvFiltroId" runat="server" ControlToValidate="txtIdVenta" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Fecha Venta</strong></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtFechaVenta" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>DNI Cliente</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDniCliente" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:CompareValidator ID="cpvDniCliente" runat="server" ControlToValidate="txtDniCliente" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnFiltrar" class="myButton" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
