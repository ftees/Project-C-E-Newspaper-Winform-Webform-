<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" MasterPageFile="~/Frame.Master" Inherits="ProjectWeb.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:Repeater runat="server" ID="detail">
          <ItemTemplate>
              <div class="Details">
                 <h3 class="Title"><%# Eval("Title") %> </h3>
                  
                  <div class="news">
                      <p class="shortDesc"><%# Eval("shortDesc") %></p>
                      <img class="picture" src="<%# Eval("imgLink") %>" />
                      
                      <p class="longDesc"><%# Eval("longDesc") %></p>
                      <p class="time"> <%# Eval("writer") %> | <%# Eval("date") %></p>
                  </div>
              </div>
          </ItemTemplate>
      </asp:Repeater>
    <div style="height:80px;"></div>
    <h2 style="margin-left:100px;">Bình Luận</h2>
    <div class="ListComment">
        <div class="createCmt">
            <h4><asp:Label ID="Label1" runat="server"></asp:Label></h4>
            <textarea id="TextArea1" runat="server" cols="20" rows="2" class="txtCmt"></textarea>
            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" CssClass="btnPost" Text="Đăng" />
        </div>
       <asp:Repeater runat="server" ID="rptComment">
           <ItemTemplate>
               <div class="comment">
                   <h4><%# Eval("[account ID]") %></h4>
                   <p><%# Eval("content") %></p>
               </div>
           </ItemTemplate>
       </asp:Repeater>
        </div>
    </asp:Content>
