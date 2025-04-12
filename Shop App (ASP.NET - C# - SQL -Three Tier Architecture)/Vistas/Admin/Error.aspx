<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Vistas.Admin.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            width: 62%;
        }
        .auto-style12 {
            width: 270px;
            font-size: xx-large;
        }
        .auto-style17 {
            text-align: left;
        }
        .auto-style21 {
            width: 62%;
            text-align: left;
        }
        .auto-style22 {
            width: 62%;
            text-align: left;
            color: #FF0000;
            font-size: x-large;
        }
        .auto-style23 {
            font-size: xx-large;
        }
        .auto-style24 {
            width: 270px;
        }
        .auto-style25 {
            width: 9%;
        }
    </style>
     <link rel="stylesheet" href="../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12 mainItem"><strong>Error al ingresar a</strong></td>
                    <td class="auto-style17" colspan="2"><strong><em>
                        <asp:Label ID="lblErrorPagina" runat="server" CssClass="auto-style23"></asp:Label>
                        </em></strong></td>
                    <td class="auto-style23"><strong></strong></td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style22 mainItem"><em>No tienes permisos para continuar</em></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style21">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver a Inicio</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
