<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PractiCalTimeSheet.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br /><br /><br /><br /><br /><br /><br /><br />
        <div style="text-align:center; vertical-align:middle">
            <asp:Label ID="LabelLoginID" runat="server" Text="Login ID" ToolTip="Enter 'Employee' or 'Admin'"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextboxLogin" runat="server"></asp:TextBox>
        </div>
        <br /><br />
        <div style="text-align:center; vertical-align:middle">
            <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextboxPassword" runat="server"></asp:TextBox>
        </div>
        <br /><br />
        <div style="text-align:center; vertical-align:middle">
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click"></asp:Button>
        </div>
    </form>
</body>
</html>
