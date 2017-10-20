<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Bing Polyline
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Bing Polyline</h2>
    <p>Show a custom icon image for the Polyline's icon, and set it's InfoBox Title and Description.</p>
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
           { "Bing", Ajax.BingMap().CssClass("BingMap")
               .AddPolyline(new BingPolyline(new List<LatLng>() {
                       new LatLng(48.166085, -121.11328),
                       new LatLng(34.270835, -118.34472),
                       new LatLng(43.041543, -87.901954),
                       new LatLng(38.889546, -77.035338)
                   }) {
                   LineWeight = 2,
                   LineOpacity = 0.5,
                   LineColor = "#FF0000",
                   ShowIcon = true,
                   Title = "My VEPolyline",
                   Description = "Some Description for the VEPolyline.",
                   ImageUrl = "~/Content/RedPin.png"
               })
           }
       }); %>
       
    <div class="tabs">
        <ul>
            <li><a href="#bingFixed">Bing Polyline</a></li>
        </ul>
        <div id="bingFixed">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .AddPolyline(new BingPolyline(new List&lt;LatLng&gt;() {
                               new LatLng(48.166085, -121.11328),
                               new LatLng(34.270835, -118.34472),
                               new LatLng(43.041543, -87.901954),
                               new LatLng(38.889546, -77.035338)
                           }) {
                           LineWeight = 2,
                           LineOpacity = 0.5,
                           LineColor = "#FF0000",
                           ShowIcon = true,
                           Title = "My VEPolyline",
                           Description = "Some Description for the VEPolyline.",
                           ImageUrl = "~/Content/RedPin.png"
                       })
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
</asp:Content>
