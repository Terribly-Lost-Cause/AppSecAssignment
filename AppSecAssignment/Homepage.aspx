<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="AppSecAssignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSuccess" runat="server" Text="Welcome!"></asp:Label>
            <br />
            <asp:Table runat ="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server" Text="XSS Testing"></asp:Label>
                        <br />
                    </asp:TableCell>

                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" Height="194px" Width="415px"></asp:TextBox>
            <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Comments" runat="server" Text=""></asp:Label>
            <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                   <asp:Button ID="Submit" runat="server" Text="Submit" />

            <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br />
            <br />
            
            

            
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="btnLogut" runat="server" OnClick="btnLogut_Click" Text="Logout" />
        </div>
    </form>
</body>
</html>
