<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="League.aspx.cs" MasterPageFile="~/Frame.Master" Inherits="ProjectWeb.League" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="areaInfo">
      <asp:Repeater runat="server" ID="rptArea">
          <ItemTemplate>
              
              <h4><%# Eval("name") %></h4>
              <img src="<%# Eval("imgLink") %>" />
              <p><%# Eval("longDesc") %></p>
                  
          </ItemTemplate>
      </asp:Repeater>
    <div class="bxh">
        <h4>Bảng xếp hạng</h4>
        <asp:GridView ID ="rptBxh" runat="server" AutoGenerateColumns="false" CssClass="Grid">
            <Columns>
                <asp:BoundField HeaderText="TeamID" DataField="TeamID" />
                <asp:BoundField HeaderText="Team Name" DataField="name" />
                <asp:BoundField HeaderText="Score" DataField="score" />
                <asp:BoundField HeaderText="AreaID" DataField="AreaID" />
            </Columns>
        </asp:GridView>
    </div>
        </div>
</asp:Content>
