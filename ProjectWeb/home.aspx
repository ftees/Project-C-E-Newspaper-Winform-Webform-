<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Frame.Master" CodeBehind="home.aspx.cs" Inherits="ProjectWeb.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
     
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="content">
        <div class="content-left">
            <div class="content">
                <div class="left">
                     <asp:Repeater runat="server" ID="top1" >
                           <ItemTemplate>
                        <div class="intro">
                           <div class="intro-image">
  
                                <img class="imgTop1" src="<%#Eval("imgLink") %>" />
                               </div>
                               <div class="intro-shortDes">                                
                               <div class="Title"> <asp:LinkButton CssClass="Titles" ID="LinkButton1" OnClick="LinkButton1_Click1" CommandName ='<%# Eval("postID") %>' OnCommand="LinkButton1_Command" runat="server"><%# Eval("Title") %></asp:LinkButton><br /></div>
                               
                                   <asp:Label CssClass="shortDesc" ID="Label1" runat="server"><%# Eval("shortDesc") %></asp:Label><br />
                                   <asp:Label ID="Label2" CssClass="date" runat="server"><%# Eval("date") %></asp:Label><br/>
                            </div>
                        </div>
                    </ItemTemplate>
                         </asp:Repeater>
                 
                
                    <h4 class="type">Esport</h4>
                    <div class="top2-cakes">
                        <asp:Repeater runat="server" ID="rptEsport">
                            <ItemTemplate>
                                <div class="cake">
                                <div class="cake-pic"><img src="<%#Eval("imgLink") %>"></div>
                                <div class="Titles"><asp:LinkButton CssClass="Titles" ID="LinkButton1"  CommandName ='<%# Eval("postID") %>' OnCommand="LinkButton1_Command" runat="server">
                                    <%#Eval("Title") %> </asp:LinkButton></div>
                                
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                            
                      
                        
                    </div>
                    <h4 class="type">Game</h4>
                    
                     <div class="top2-cakes">
                        
                           <asp:Repeater runat="server" ID="rptGame">
                            <ItemTemplate>
                                <div class="cake">
                                <div class="cake-pic"><img src="<%#Eval("imgLink") %>"></div>
                                <div class="Titles"><asp:LinkButton CssClass="Titles" ID="LinkButton1"  CommandName ='<%# Eval("postID") %>'
                                    OnCommand="LinkButton1_Command" runat="server">
                                    <%#Eval("Title") %> </asp:LinkButton></div>
                                
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <h4 class="type">Trick</h4>
                    
                     <div class="top2-cakes">
                        
                            <asp:Repeater runat="server" ID="rptTrick">
                            <ItemTemplate>
                                <div class="cake">
                                <div class="cake-pic" ><img src="<%#Eval("imgLink") %>"></div>
                               <div class="Titles"><asp:LinkButton CssClass="Titles" ID="LinkButton1"  CommandName ='<%# Eval("postID") %>' 
                                   OnCommand="LinkButton1_Command" runat="server">
                                    <%#Eval("Title") %> </asp:LinkButton></div>
                                
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                    </div>
                    </div>
                <div class="Content-right">
                   
                     <asp:Repeater runat="server" ID="rptArea">
                         <ItemTemplate>
                             <div class="area">
                                 <h4><asp:LinkButton ID="areaBtn" CssClass="areaBtn" runat="server" CommandName='<%# Eval("id") %>' OnCommand="areaBtn_Command"> <%# Eval("name") %></asp:LinkButton> </h4>
                              </div>
                         </ItemTemplate>
                     </asp:Repeater>
                    <img class="adv" src="/Images/banner1.jpg" />
                      </div>
                
                   </div>
                      
                </div>
          
        
      
          </div>
</asp:Content>
