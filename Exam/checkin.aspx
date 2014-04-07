<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.master" AutoEventWireup="true" CodeFile="checkin.aspx.cs" Inherits="checkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
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
<script type="text/javascript" src="/fancybox/source/helpers/jquery.fanc
    ybox-media.js?v=1.0.5"></script>

<link rel="stylesheet" href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.1.js">
</script>
<script src="https://connect.facebook.net/en_US/all.js">
</script>

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
     .label1{
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

           

#slideshow #slideshowWindow
{
width:300px;
height:300px;
margin:0;
padding:0;
position:relative;
overflow:hidden;
}
#slideshow #slideshowWindow .slide
{
margin:0;
padding:0;
width:300px;
height:300px;
position:relative;
}
 .hello:hover {
	background: #f53300;
	border: 1px solid #f53300;
}
    </style>

    
    <script type="text/javascript" src="~/js/responsiveslides.min.js"></script>
    <meta charset="UTF-8" />
    <title>Find a route using Geolocation and Google Maps API</title>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
        function calculateRoute(from, to) {
            // Center initialized to Naples, Italy
            var myOptions = {
                zoom: 10,
                center: new google.maps.LatLng(40.84, 14.25),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            // Draw the map
            var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);

            var directionsService = new google.maps.DirectionsService();
            var directionsRequest = {
                origin: from,
                destination: to,
                travelMode: google.maps.DirectionsTravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC
            };
            directionsService.route(
              directionsRequest,
              function (response, status) {
                  if (status == google.maps.DirectionsStatus.OK) {
                      new google.maps.DirectionsRenderer({
                          map: mapObject,
                          directions: response
                      });
                  }
                  else
                      $("#error").append("Unable to retrieve your route<br />");
              }
            );
        }

        $(document).ready(function () {
            // If the browser supports the Geolocation API
            if (typeof navigator.geolocation == "undefined") {
                $("#error").text("Your browser doesn't support the Geolocation API");
                return;
            }

            $("#from-link, #to-link").click(function (event) {
                event.preventDefault();
                var addressId = this.id.substring(0, this.id.indexOf("-"));

                navigator.geolocation.getCurrentPosition(function (position) {
                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({
                        "location": new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
                    },
                    function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK)
                            $("#" + addressId).val(results[0].formatted_address);
                        else
                            $("#error").append("Unable to retrieve your address<br />");
                    });
                },
                function (positionError) {
                    $("#error").append("Error: " + positionError.message + "<br />");
                },
                {
                    enableHighAccuracy: true,
                    timeout: 10 * 1000 // 10 seconds
                });
            });

            $("#calculate-route").submit(function (event) {
                event.preventDefault();
                calculateRoute($("#from").val(), $("#to").val());
            });
        });
    </script>
    <style type="text/css">
      #map {
        width: 500px;
        height: 400px;
        margin-top: 10px;
      }

      #sidebar #sbox1
{
	margin-bottom: 30px;
    position: absolute;
    top: 196px;
    float: right;
    right: 300px;
    bottom:100px;
}
    </style>
    <script type="text/javascript">
        $(function () {
            var currentPosition = 0;
            var slideWidth = 300;
            var slides = $('.slide');
            var numberOfSlides = slides.length;
            setInterval(changePosition, 3000);
            slides.wrapAll('<div id="slidesHolder"></div>');
            slides.css({ 'float': 'left' });
            $('#slidesHolder').css('width', slideWidth * numberOfSlides);
            function changePosition() {
                if (currentPosition == numberOfSlides - 1) {
                    currentPosition = 0;
                }
                else {
                    currentPosition++;
                }
                moveSlide();
            }
            function moveSlide() {
                $('#slidesHolder').animate({ 'marginLeft': slideWidth * (-currentPosition) });
            }
        });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 700px; height: 1500px;">
    <h2> Check In Points</h2>

    <h3>Click here to get route from your location to check in point !! </h3>
    <br />
    <form id="calculate-route" name="calculate-route" action="#" method="get">
      <label for="from">From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" id="from" name="from" required="required" placeholder="Your location address" size="30"  />
      <a id="from-link" href="#">Get my position</a>
      <br />
        <br />
      
            
      <label for="to">To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <input type="text" id="to" name="to" required="required" placeholder="Destination address" size="30" />
           <br />
        <br />
        <br />
      <input class="label1" type="submit" />
      <input class="label1" type="reset" />
    </form>
    <div id="map"></div>
    <p id="error"></p>

    <form runat="server">
					    	<div id="user_profile">
                                   
         
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
          <label runat="server" font-names="Tahoma" style="color: red">Latitude:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="latitude" runat="server" Text="Label" position="absolute"  Font-Names="Lucida Sans" Height="50px" Width="500px" ForeColor="black"></asp:Label>
        </li>
        
        <li>
        <label runat="server" font-names="Tahoma" style="color: red" >Longitude:&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="longitude" runat="server" Text="Label" Font-Names="Lucida Sans"  Height="56px" Width="500px" ForeColor="black"></asp:Label>
        </li>
           <li>
        <label runat="server" font-names="Tahoma" style="color: red" >To Address:&nbsp;&nbsp;&nbsp;</label>
        <asp:Label ID="address" runat="server" Text="Label" Font-Names="Lucida Sans"  Height="56px" Width="500px" ForeColor="black"></asp:Label>
        </li>

        <h3> Click here to know your check in position on Map</h3>
             <li>
          
        <br />
       
                <asp:Label ID="gimg" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
        </li>
            <h3> Click here to share your route on facebook and twitter </h3>
             <li>
          
        <br />
       
                <asp:Label ID="facebook" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
                 <asp:Label ID="twitter" runat="server" Text="Label" Font-Names="Lucida Sans" Height="66px" Width="500px" ForeColor="black"></asp:Label>
        </li>
                 <li>
               <asp:Label ID="Label3" runat="server" cssclass="label" Text="Route" Visible="False" ></asp:Label>       
          </li>
            <br /> <br />
        <asp:Button ID="Done" runat="server" onclick="check_click"  cssclass="hello" Text="Check in" />
        <br />
        <br />
      </ul>
    </div>
					    </form>
    </div>
    <div id="sidebar">
                <div id="sbox1">
                    <h2>Tour Images</h2>
                    <div id="slideshow">
<div id="slideshowWindow">
<div class="slide"><b></b><img src="images/1.jpg" width="300" height="300" alt=""  /> </div>
<div class="slide"><b></b><img src="images/2.jpg" width="300" height="300" alt=""/> </div>
    <div class="slide"><b></b><img src="images/3.jpg" width="300" height="300" alt=""/> </div>
     <div class="slide"><b></b><img src="images/4.jpg" width="300" height="300" alt=""/> </div>
     <div class="slide"><b></b><img src="images/8.jpg" width="300" height="300" alt=""/> </div>
     <div class="slide"><b></b><img src="images/6.jpg" width="300" height="300" alt=""/> </div>
     <div class="slide"><b></b><img src="images/7.jpg" width="300" height="300" alt=""/> </div>
    <div class="slide"><b></b><img src="images/8.jpg" width="300" height="300" alt=""/> </div>
    <div class="slide"><b></b><img src="images/9.jpg" width="300" height="300" alt=""/> </div>
    <div class="slide"><b></b><img src="images/10.jpg" width="300" height="300" alt=""/> </div>
    <div class="slide"><b></b><img src="images/11.jpg" width="300" height="300" alt=""/> </div>
   
</div>
</div>
                   
                </div>
            </div>

    
</asp:Content>

