<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="AppSecAssignment.RegistrationForm"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function validate() {
            var str = document.getElementById('<%=tbPassword.ClientID %>').value;

            if (str.length < 8) {
                document.getElementById("passwdChkr").innerHTML = "  Password length must be at least 8 characters";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "  Password must have at least 1 number";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "  Password must have at least 1 upper letter";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "  Password must have at least 1 lower letter";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[^a-zA-Z0-9]/) == -1) {
                document.getElementById("passwdChkr").innerHTML = "  Password must have at least 1 special character";
                document.getElementById("passwdChkr").style.color = "Red";
                return ("too_short");
            }
            else {
                document.getElementById("passwdChkr").innerHTML = "";
                document.getElementById("passwdChkr").style.color = "";
            }
        }
    </script>
                <!--script src="https://www.google.com/recaptcha/api.js?render=6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs"></script-->

</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Table ID="Table1" runat="server" Height="113px" Width="753px">
                <asp:TableRow ID ="TableRow1" runat="server">
                    <asp:TableCell ID ="TableCell1" runat="server" style="text-align: left; width:25%">
                    <asp:Label ID="lblEmail" runat="server" Text="Email address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell2" runat="server" style="text-align: left">
                    <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox> 
                                                <asp:Label ID="emailChkr" runat="server" ></asp:Label> 

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is a required field."></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow2" runat="server">
                    <asp:TableCell ID ="TableCell3" runat="server" style="text-align: left">
                                    <asp:Label ID="lblFName" runat="server" Text="First Name:"></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell4" runat="server" style="text-align: left">
                                    <asp:TextBox ID="tbFName" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFName" ErrorMessage="First name is a required field."></asp:RequiredFieldValidator>
            
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow3" runat="server">
                    <asp:TableCell ID ="TableCell5" runat="server" style="text-align: left">
                        <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label>            
                        
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell6" runat="server" style="text-align: left">
                                    <asp:TextBox ID="tbLName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbLName" ErrorMessage="Last name is a required field."></asp:RequiredFieldValidator>
            

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow4" runat="server">
                    <asp:TableCell ID ="TableCell7" runat="server" style="text-align: left">
                        <asp:Label ID="lblCard" runat="server" Text="Credit Card Info:" ></asp:Label>
                                   
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell8" runat="server" style="text-align: left">
                                    <asp:TextBox ID="tbCard" runat="server" MaxLength="16" MinLength ="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbCard" ErrorMessage="Credit card is a required field."></asp:RequiredFieldValidator>
            

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow5" runat="server">
                    <asp:TableCell ID ="TableCell9" runat="server" style="text-align: left">
                        <asp:Label ID="lblDOB" runat="server" Text="Date of Birth"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell10" runat="server" style="text-align: left">
                        <asp:TextBox ID="tbDOB" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbDOB" ErrorMessage="Date of birth is a required field."></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID ="TableRow6" runat="server">
                    <asp:TableCell ID ="TableCell11" runat="server" style="text-align: left">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell ID ="TableCell12" runat="server" style="text-align: left">
                        <asp:TextBox ID="tbPassword" runat="server" onkeyup="javascript:validate()" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbPassword" ErrorMessage="Password is a required field."></asp:RequiredFieldValidator>
                        <asp:Label ID="passwdChkr" runat="server" ></asp:Label> 
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                                    <asp:Label ID="Questions" runat="server" Text="Recovery questions"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlQuestions" runat="server">
                <asp:ListItem>Name of first pet</asp:ListItem>
                <asp:ListItem>Favourite song</asp:ListItem>
                <asp:ListItem>Name of mother</asp:ListItem>
                <asp:ListItem>Name of father</asp:ListItem>
            </asp:DropDownList>
                        <br />
            <asp:TextBox ID="tbAnswer" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbAnswer" ErrorMessage="This is a required field."></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>         
<input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
            <br />
            <script>
                grecaptcha.ready(function () {
                    grecaptcha.execute('6LdjCEUaAAAAAH43Z3uxxIPjhPEJtmehUViiAlPs', { action: 'RegistrationForm.aspx' }).then(function (token) {
                        document.getElementById("g-recaptcha-response").value = token;
                    });
                });
            </script>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </div>

    </form>

</body>
</html>
