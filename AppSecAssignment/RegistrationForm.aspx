<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="AppSecAssignment.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function validate() {
            var str = document.getElementById('<%=tbPassword.ClientID %>').value;
            if (str.length < 8) {
                document.getElementById("passwdChkr").innerHTML = "Password length must be at least 8 characters";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");

            }
            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "Password must have at least 1 number";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[A-Za-z]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "Password must have at least 1 upper and lower letter";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/^[a-zA-Z0-9]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "Password must have at least 1 special character";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else {
                document.getElementById("passwdChkr").innerHTML = "";
                document.getElementById("passwdChkr").style.color = "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Table ID="Table1" runat="server" Height="113px" Width="515px">
                <asp:TableRow ID ="TableRow1" runat="server">
                    <asp:TableCell ID ="TableCell1" runat="server">
                                    <asp:Label ID="lblFName" runat="server" Text="First Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell2" runat="server">
                                    <asp:TextBox ID="tbFName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow2" runat="server">
                    <asp:TableCell ID ="TableCell3" runat="server">
                                    <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell4" runat="server">
                                    <asp:TextBox ID="tbLName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow3" runat="server">
                    <asp:TableCell ID ="TableCell5" runat="server">
                                    <asp:Label ID="lblCard" runat="server" Text="Credit Card Info:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell6" runat="server">
                                    <asp:TextBox ID="tbCard" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow4" runat="server">
                    <asp:TableCell ID ="TableCell7" runat="server">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell8" runat="server">
                                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow5" runat="server">
                    <asp:TableCell ID ="TableCell9" runat="server">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell10" runat="server">
                                    <asp:TextBox ID="tbPassword" runat="server" onkeyup></asp:TextBox>
                                    <asp:Label ID="passwdChkr" runat="server" Text=""></asp:Label>  

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow6" runat="server">
                    <asp:TableCell ID ="TableCell11" runat="server">
                                    <asp:Label ID="lblDOB" runat="server" Text="Date of Birth"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell12" runat="server">
                                    <asp:TextBox ID="tbDOB" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </div>

    </form>
</body>
</html>
