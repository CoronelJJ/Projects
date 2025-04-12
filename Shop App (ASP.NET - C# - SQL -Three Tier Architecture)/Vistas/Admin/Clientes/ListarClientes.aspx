<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="Vistas.Admin.Clientes.ListarClientes" %>

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
            text-align: center;
            height: 49px;
            font-weight: bold;
            font-size: xx-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }

        .auto-style3 {
            height: 49px;
        }

        .auto-style4 {
            width: 193px;
        }

        .auto-style5 {
            height: 49px;
            width: 193px;
        }

        .auto-style6 {
            width: 193px;
            height: 27px;
        }

        .auto-style7 {
            height: 27px;
        }
        .auto-style8 {
            text-align: center;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Inicio.aspx" Width="105%">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style2">
                        Clientes</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <span class="auto-style8">Buscar cliente por DNI:</span><asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscar" CssClass="myButton" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:GridView ID="gvClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gdvClientes_PageIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="DNI" HeaderText="DNI" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre y Apellido" />
                                <asp:BoundField DataField="Alias" HeaderText="Alias" />
                                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                                <asp:BoundField DataField="EMail" HeaderText="Email" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="NombreCiudad" HeaderText="Ciudad" />
                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado" ReadOnly="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style7"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
