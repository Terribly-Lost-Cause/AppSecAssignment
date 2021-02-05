<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppSecAssignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
                    <!--script src="https://www.google.com/recaptcha/api.js?render=6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs"></script-->

    
</head>
<body onload="window.history.forward();">
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" Height="113px" Width="753px">
                <asp:TableRow ID ="TableRow1" runat="server">
                    <asp:TableCell ID ="TableCell1" runat="server" style="text-align: left; width:25%">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell2" runat="server" style="text-align: left">
                                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow2" runat="server">
                    <asp:TableCell ID ="TableCell3" runat="server" style="text-align: left">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell4" runat="server" style="text-align: left">
                                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRec" runat="server" OnClick="btnRec_Click" Text="Recover account" Visible="False" />
            <br />
            <br />
             <script>
                 grecaptcha.ready(function () {
                     grecaptcha.execute('6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs', { action: 'Login.aspx' }).then(function (token) {
                         document.getElementById("g-recaptcha-response").value = token;
                     });
                 });
             </script>
            <br />
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
        </div>
    </form>
    
</body>
</html>
