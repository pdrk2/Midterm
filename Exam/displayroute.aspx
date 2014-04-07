<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.master" AutoEventWireup="true" CodeFile="displayroute.aspx.cs" Inherits="displayroute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

<link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.3" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.3"></script>

<link rel="stylesheet" href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

<link rel="stylesheet" href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>




<script type="text/javascript">
    $(".details").fancybox({
        maxWidth: 800,
        maxHeight: 600,
        fitToView: false,
        width: '70%',
        height: '70%',
        autoSize: false,
        closeClick: false,
        openEffect: 'elastic',
        closeEffect: 'elastic'
    });

    $(".email").fancybox({
        maxWidth: 750,
        maxHeight: 600,
        fitToView: false,
        width: '60%',
        height: '60%',
        autoSize: false,
        closeClick: false,
        openEffect: 'elastic',
        closeEffect: 'elastic'
    });

</script>
   
    <style>
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
     ul {
    list-style: none;
    margin: 0;
    padding: 0;
    font: 16px arial-black;
    display: block !important;
    display: inline;
    overflow: hidden;
}
  .label{
        float : left;
   display : inline;
   display : block;
   text-align: left;
   font-family:Tahoma;
   font-weight:bold;
   font-size:medium;
  
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
    <h2> Route Details</h2>
    <form runat="server">
					    	<div id="user_profile">

    <br />
                                   
         <br class="clear" />
        <ul>
            <li>
          <label runat="server" font-names="Tahoma" style="color: red">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="name" runat="server" Text="Label" position="absolute"  Font-Names="Lucida Sans" Height="50px" Width="500px" ForeColor="black"></asp:Label>
        </li>
        
        <li>
        <label runat="server" font-names="Tahoma" style="color: red" >Description:&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="description" runat="server" Text="Label" Font-Names="Lucida Sans"  Height="56px" Width="500px" ForeColor="black"></asp:Label>
        </li>
        
        <li>
       <label runat="server" font-names="Tahoma" style="color: red">Map URL :&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="mapurl" runat="server" Text="Label" Font-Names="Lucida Sans" Height="61px" Width="500px" ForeColor="black"></asp:Label>
        </li>
        
        <li>
       <label runat="server" font-names="Tahoma" style="color: red">Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="price" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
        </li>
            <li>
       <label runat="server" font-names="Tahoma" style="color: red">Image:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="image" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
        </li>
            <li>
       <label runat="server" font-names="Tahoma" style="color: red">Click here to check the route:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <br />
                <asp:Label ID="gimg" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
        </li>
                      
          
        <asp:Button ID="Done" runat="server"  onclick="start_click" cssclass="hello" Text="Start your journey" />
        <br /><br />
        <br />
      </ul>
    </div>
					    </form>
</asp:Content>

