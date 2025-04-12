<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompraArticulo.aspx.cs" Inherits="Vistas.Articulos.CompraArticulo" %>

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
            width: 128px;
        }

        .auto-style4 {
            width: 577px;
        }
    </style>
    <link rel="stylesheet" href="../StyleSheetG6.css" />
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:HyperLink ID="hlInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="Label1" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Artículos"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hpCarrito" runat="server" NavigateUrl="~/Articulos/CarritoDeCompras.aspx">Carrito de Compras</asp:HyperLink>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">&nbsp;</td>
                    <td class="auto-style4" rowspan="2">
                        <asp:Label ID="lblBuscarArt" runat="server" CssClass="subItem" Text="Buscar Artículo por nombre:"></asp:Label>
                        <asp:TextBox ID="tbBuscarArticulo" runat="server" ValidationGroup="1"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnBuscarArt" runat="server" CssClass="myButton" OnClick="btnBuscarArt_Click" Text="Buscar" ValidationGroup="2" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnVistaPrincipal" runat="server" CssClass="myButton" OnClick="btnVistaPrincipal_Click" Text="Vista Principal" Width="176px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvBuscarArticulol" runat="server" ControlToValidate="tbBuscarArticulo" ForeColor="Red" ValidationGroup="2">*Por favor, ingrese un artículo</asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="2">&nbsp;</td>
                    <td rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="revBuscarArt" runat="server" ControlToValidate="tbBuscarArticulo" ErrorMessage="*Por favor, ingrese solo letras" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="2"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblFiltrarxCategoria" CssClass="subItem" runat="server" Text="Filtrar por Categoria:"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlCategorias" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="-- Seleccione --" DataValueField="0" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" ValidationGroup="2">
                            <asp:ListItem Selected="True" Value="0">-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="gvComprarArticulos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvComprarArticulos_PageIndexChanging" OnRowCommand="gvComprarArticulos_RowCommand" Width="871px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Articulo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NombreArticulo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Articulo" runat="server" Text='<%# Bind("NombreArticulo") %>'></asp:Label>
                                        <asp:Label ID="lbl_it_IdArticulo" runat="server" Text='<%# Bind("IDArticulo") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NombreCategoria" HeaderText="Categoria" />
                                <asp:BoundField DataField="PrecioDeVenta" DataFormatString="$ {0:F}" HeaderText="Precio" />
                                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_it_Cantidad" runat="server" TextMode="Number" CausesValidation="True"></asp:TextBox>
                                        <asp:CustomValidator ID="cv_it_Cantidad" runat="server" ControlToValidate="txt_it_Cantidad" ForeColor="Red" OnServerValidate="cv_it_Cantidad_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_it_Carrito" runat="server" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' CommandName="EventoAgregar" Text="Agregar al carrito" CausesValidation="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
