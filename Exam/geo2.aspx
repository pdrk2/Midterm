﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.master" AutoEventWireup="true" CodeFile="geo2.aspx.cs" Inherits="geo2" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Calculate your route</h1>
    <form runat="server" id="calculate-route" name="calculate-route" action="#" method="get" >
       
      <label for="from">From:</label>
      <input type="text" id="from" name="from" required="required" placeholder="An address" size="30" />
      <a id="from-link" href="#">Get my position</a>
      <br />
 
      <label for="to">To:</label>
        <asp:TextBox id="to" cssclass="textbox" runat="server" name="to" required="required" placeholder="Another address" size="30"/>
      
           <br />
 
      <input type="submit" />
      <input type="reset" />
    </form>
    <div id="map"></div>
    <p id="error"></p>
</asp:Content>

