<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.master" AutoEventWireup="true" CodeFile="route.aspx.cs" Inherits="route" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript" src="//scribblemaps.com/api/js/"></script>

    <script type="text/javascript">
        window.onload = function () {
            var sm = new ScribbleMap(document.getElementById('ScribbleMap'));
        }
    </script>
    <style>
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
        #Done
        {
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    -khtml-border-radius: 20px;
    border-radius: 20px;        
    border: solid #FF0000; 
            background-color: #C0C0C0; 
            font-family: verdana; 
            font-size: 10pt; 
            font-weight: bold;
            border-top-left-radius: 40px 30px;
            border-bottom-right-radius: 30% 25%;
            border-top-right-radius: 40px;
            border-radius: 40px;
            float:right;
        }

        .label{
        float : left;
        left:50px;
   display : inline;
   display : block ;
   text-align: left;
   color:darkviolet;
   

}
   .textbox{
	font-family: 'Open Sans', sans-serif;
	margin-top: 5px;
	display: block;
	width: 30%;
	background: rgba(255, 255, 255, 1);
       position:absolute;
       left:350px;
	outline: none;
	color: black;
	font-size: 1em;
	border: groove
	-webkit-appearance: none;
    border-style:solid;
    border-width: 3px;
    border-color: grey;
} 
    .hello{
	margin-top: 10px;
	font-family: 'Open Sans', sans-serif;
	cursor: pointer;
	background: brown;
	border: 1px solid #242424;
	padding: 2px 24px;
	outline: none;
	color: #ffffff;
	font-size: 1em;
	text-transform: uppercase;
	-webkit-appearance: none;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	border-radius: 2px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-o-border-radius: 2px;
    left: 250px;
}
 .hello:hover {
	background: #f53300;
	border: 1px solid #f53300;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="ScribbleMap" style="width: 900px; height: 500px "></div>
    <br />
    <h2> Creation of route</h2>
    <form runat="server"> 
    <asp:Label ID="Label3" runat="server" cssclass="label" Text="Route" Visible="False" ></asp:Label>
    <br />
    <br />
				<asp:Label ID="label1" runat="server" cssclass="label" Text="Name of the Route" AssociatedControlID="Name" />
<asp:TextBox id="name" cssclass="textbox" runat="server" />
<br /><br />
<asp:Label ID="label2" runat="server" cssclass="label" Text="Description" AssociatedControlID="Description" />
<asp:TextBox id="description" cssclass="textbox"  runat="server" />
<br />
        <br />
        <asp:Label ID="label4" runat="server" cssclass="label" Text="Route Image URL" AssociatedControlID="Image" />
<asp:TextBox id="image" cssclass="textbox" runat="server" />
<br /><br /> 
        <asp:Label ID="label5" runat="server" cssclass="label" Text="Route Map URL" AssociatedControlID="Map" />
<asp:TextBox id="map" cssclass="textbox" runat="server" />
<br /><br />
     <asp:Label ID="label6" runat="server" cssclass="label" Text="Price" AssociatedControlID="Price" />
<asp:TextBox id="price" cssclass="textbox" runat="server" />
<br /><br />         
           

  <asp:Button ID="Done" runat="server" onclick="route_click" cssclass="hello" Text="Done" />
        <br /><br />
         <h2> Creation of Check-In Points</h2>

        <asp:Label ID="Label7" runat="server" cssclass="label" Text="Check-In" Visible="False" ></asp:Label>
    <br />
    <br />
				<asp:Label ID="label8" runat="server" cssclass="label" Text="Title" AssociatedControlID="Name" />
<asp:TextBox id="title" cssclass="textbox" runat="server" />
<br /><br />
<asp:Label ID="label9" runat="server" cssclass="label" Text="Description" AssociatedControlID="Description" />
<asp:TextBox id="cdescription" cssclass="textbox"  runat="server" />
<br />

        <br />
        <asp:Label ID="label13" runat="server" cssclass="label" Text="Add Image" AssociatedControlID="Image" />
        <asp:FileUpload ID="FileUpload1" cssclass="textbox" runat="server" />
        <br />
        <br />
        <asp:Button ID="btnUpload" onclick="btnUpload_Click" runat="server" cssclass="hello" Text="Upload" align="right"/>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "false" Font-Names = "Arial" >
            <Columns>
                <asp:ImageField DataImageUrlField = "FilePath" ControlStyle-Width = "100" ControlStyle-Height = "100" HeaderText = "Preview Image"/>
            </Columns> 
        </asp:GridView> 
        <asp:Label ID="label10" runat="server" cssclass="label" Text="Latitude" AssociatedControlID="Image" />
<asp:TextBox id="latitude" cssclass="textbox" runat="server" />
<br /><br /> 
        <asp:Label ID="label11" runat="server" cssclass="label" Text="Longitude" AssociatedControlID="Map" />
<asp:TextBox id="longitude" cssclass="textbox" runat="server" />
<br /><br />
     <asp:Label ID="label12" runat="server" cssclass="label" Text="Route Name" AssociatedControlID="Price" />
<asp:TextBox id="rname" cssclass="textbox" runat="server" />
<br /><br />         
            

  <asp:Button ID="Checkin" runat="server" onclick="checkin_click" cssclass="hello" Text="Add Check-In" />
        <br /><br />
    
    </form>
</asp:Content>

