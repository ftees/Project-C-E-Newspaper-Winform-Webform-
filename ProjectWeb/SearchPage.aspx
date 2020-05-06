<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" MasterPageFile="~/Frame.Master" Inherits="ProjectWeb.SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="repeater1" runat="server">
         <ItemTemplate>
             <div class="post">
                 <div class="img">
                     <img class="picture2" src="<%# Eval("imgLink") %>" />
                 </div>
                 <div class="info">
                     <h4><asp:LinkButton CssClass="Titles" ID="LinkButton1" CommandName ='<%# Eval("postID") %>' OnCommand="LinkButton1_Command" runat="server"> <%# Eval("Title") %></asp:LinkButton></h4>
                     <p><%# Eval("shortDesc") %></p>
                     <p class="topic"><%# Eval("TopicName") %> </p>
                 </div>
                 

             </div>
         </ItemTemplate>
     </asp:Repeater>
          <div class="paging">
                <asp:Repeater ID="repeater2" runat="server" OnItemCommand="btnPage_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton CssClass="btnPaging" ID="btnLink" runat="server" Class="<%# Container.DataItem %>" CommandName="<%# Container.DataItem %>">
                            <%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
              <p style="padding-top:20px; ">
                
                 <asp:Label ID="Label1" runat="server"></asp:Label>
               
            </p>
            </div>
    </asp:Content>
