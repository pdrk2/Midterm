<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.master" AutoEventWireup="true" CodeFile="viewroute.aspx.cs" Inherits="viewroute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style> 
        #ok{
            width: 400px;
            height:150px;
           
        }
        body
{
	margin-top: 50px;
	padding: 0px;
    background: url(images/picture.jpg) center center fixed no-repeat;
	-webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  opacity:0.8;
    filter:alpha(opacity=70);
	font-family: 'Open Sans', sans-serif;
	font-size: 10pt;
	color: #737373;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2> List of routes. Please pick a route to walk through it !!</h2>
    
   <asp:Repeater ID="venmenu" runat="server">

              <HeaderTemplate>
           
           
            </HeaderTemplate>
            
            <ItemTemplate>

 <a style="font-size:18px; color:red" href="displayroute.aspx?name=<%#DataBinder.Eval(Container.DataItem, "name")%>"><%#DataBinder.Eval(Container.DataItem, "name")%></a>
                <br />
                <br />
            </ItemTemplate>

            <SeparatorTemplate>
                  
            </SeparatorTemplate>

            <FooterTemplate>
            
            </FooterTemplate>

       
    </asp:Repeater>
    
</asp:Content>


