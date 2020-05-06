<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectWeb.Login" %>
<link href="CSS/StyleLogin.css" rel="stylesheet" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<section>
	<div class="box">
		<h2>Login</h2>
		<form ID="form1" runat="server">
			<div class="inputbox">	
				<asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
				<label>Username</label>
			</div>
            
			<div class="inputbox">
				
				<asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox>
				<label>Password</label>
			</div>
			<p style="color:aqua; text-decoration:none;font-weight:bold"><asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server">Create an Account </asp:LinkButton></p>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>viewer</asp:ListItem>
                <asp:ListItem>writer</asp:ListItem>
                <asp:ListItem>admin</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"/>
            <br />
		    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
		</form>
	</div>
	<div class="box" style="left: 65%;top: 63%;">
		<h2>Create a new account</h2>
		<form id="form2" runat="server">
			<div class="inputbox">	
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
				<label>Username</label>
			</div>
			<div class="inputbox">
				<asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ></asp:TextBox>
				<label>Password</label>
			</div>
			<div class="inputbox">	
				<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
				<label>Name</label>
			</div>
			<div class="inputbox">	
				<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
				<label>Email</label>
			</div>
            <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" ValidationExpression="^[a-z][a-z0-9]{5,32}@[a-z0-9]{2,}(.[a-z0-9]{2,4})$" runat="server" ErrorMessage="Invalid Email" ForeColor="Red"></asp:RegularExpressionValidator>
			<asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
            <br />
		    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
		</form>
	</div>
		</section>
</body>
</html>
