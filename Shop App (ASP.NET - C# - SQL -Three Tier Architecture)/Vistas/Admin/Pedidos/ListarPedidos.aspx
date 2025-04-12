<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPedidos.aspx.cs" Inherits="Vistas.Admin.Pedidos.ListarPedidos" %>

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
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
            width: 692px;
        }
        .auto-style6 {
            width: 692px;
        }
        .auto-style7 {
            width: 692px;
            text-align: center;
            height: 74px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }
        .auto-style11 {
            height: 74px;
        }
        .auto-style16 {
            width: 692px;
            text-align: center;
        }
        .auto-style18 {
            text-align: center;
        }
        .auto-style19 {
            height: 26px;
            text-align: right;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlVolverinicio" runat="server" BorderStyle="None" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style19">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                    </td>
                    <td class="auto-style7">
                        Listar pedidos</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>Filtros de Búsqueda:</td>
                </tr>
                <tr>
                    <td rowspan="6">&nbsp;</td>
                    <td class="auto-style16" rowspan="6">
                        <asp:GridView ID="gvListarPedidos" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gdvListarPedidos_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="IDPedido" HeaderText="Id" />
                                <asp:BoundField DataField="NombreArticulo" HeaderText="Articulo" />
                                <asp:BoundField DataField="NombreProveedor" HeaderText="Proveedor" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="FechaPedido" HeaderText="Fecha" />
                                <asp:BoundField DataField="CostoTotal" HeaderText="Total" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                    <td>ID:<br />
                        <asp:TextBox ID="tbIDPedido" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="cpvFiltroId" runat="server" ControlToValidate="tbIDPedido" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Proveedor:<br />
                        <asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True">-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Total:<br />
                        <asp:DropDownList ID="ddlFiltroTotal" runat="server">
                            <asp:ListItem Selected="True" Value="&gt;=">&gt;=</asp:ListItem>
                            <asp:ListItem Value="&lt;=">&lt;=</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="tbTotal" runat="server" Width="142px"></asp:TextBox>
                        <asp:CustomValidator ID="cvFiltroPrecioTotal" runat="server" ControlToValidate="tbTotal" ForeColor="Red" OnServerValidate="cvFiltroPrecioTotal_ServerValidate">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Button ID="btnFiltrar" CssClass="myButton" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" Height="38px" />
                        </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
