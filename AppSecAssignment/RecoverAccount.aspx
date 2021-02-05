<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverAccount.aspx.cs" Inherits="AppSecAssignment.RecoverAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
                    <!--script src="https://www.google.com/recaptcha/api.js?render=6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs"></script-->

</head>
<body  >
    <form id="form1" runat="server">
        <div>
            Account Recovery<br />
            <asp:Label ID="Label1" runat="server" Text="Enter email:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbEmail" runat="server" Width="107px"></asp:TextBox>
            <asp:Button ID="btnConfirm" runat="server" Text="ConfirmEmail" OnClick="btnConfirm_Click" />
            <br />
            <asp:TextBox ID="tbQ" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="tbA" runat="server" MaxLength="16"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Questions FROM Users WHERE Email = @Email">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbEmail" Name="Email" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
             <script>
                grecaptcha.ready(function () {
                    grecaptcha.execute('6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs', { action: 'RecoverAccount.aspx' }).then(function (token) {
                        document.getElementById("g-recaptcha-response").value = token;
                    });
                });
             </script>
            <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
