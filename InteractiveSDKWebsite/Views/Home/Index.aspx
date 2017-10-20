<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    MvcMaps Preview 1 Interactive SDK
</asp:Content>  

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the MvcMaps Preview 1 Interactive SDK!</h2>
    
    <% Ajax.BingMapSL().CssClass("BingMap")
           .AppId("[Bing Maps Key]")
           .Zoom(3)
           //.MapType(MapType.Hybrid)
           .Center(45, -95)
           //.AddPushpin(new Pushpin(45, -95))
           .DynamicMap(new { controller = "DynamicMap", action = "SchoolDistricts" })
           .Render(); %>
    
    <p>This sample website will demonstrate many of the ways that the library can be used to implement both Bing Maps for Enterprise and Google Maps within an ASP.NET MVC Web Application with ease.</p>
    
    <h3>Prerequisites</h3>
    <p>
    MvcMaps can only be implemented within an ASP.NET MVC Web Application Project, and has the following requirements:<br />
        <ul>
            <li>ASP.NET 3.5 or later</li>
            <li><a href="http://asp.net/mvc">ASP.NET MVC 1.0</a> or later</li>
            <li><a href="http://jquery.com">jQuery Library</a> v1.3.2 or later</li>
        </ul>
    </p>
    <p>
    Before you can add Maps to your Views, you must first Add a Reference to "MvcMaps.dll" to your ASP.NET MVC Web Application Project.<br />
    Then, you must also Import it's namespace into each View, as below:
    </p>
    <pre class="brush: xml">
        &lt;%@ Import Namespace="MvcMaps" %&gt;    
    </pre>
    <p>Alternatively to Importing the Namespace within every page, you can add it to the Web.Config to be included within All Pages:</p>
    <pre class="brush: xml">
        &lt;pages&gt;
			&lt;namespaces&gt;
                &lt;add namespace="MvcMaps"/&gt;
			&lt;/namespaces&gt;
		&lt;/pages&gt;
    </pre>
    
    <h3>Map Licensing</h3>
    <p>
    MvcMaps does not include any licensing, or grant any rights for either Bing Maps or Google Maps.<br />
    You must agree and abide by the Terms of Use for the specific Mapping Provider (Bing or Google) that you use with this library.<br />
    <br />
    Bing Maps Terms of Use - <a href="http://www.microsoft.com/maps/product/terms.html">http://www.microsoft.com/maps/product/terms.html</a><br />
    Google Maps Terms of Use = <a href="http://code.google.com/apis/maps/terms.html">http://code.google.com/apis/maps/terms.html</a>
    </p>
    
    <h2>Sample View with Map</h2>
    <pre class="brush: xml">
        &lt;%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %&gt;
        
        &lt;%@ Import Namespace="MvcMaps" %&gt;
        
        &lt;asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"&gt;
            Page Title
        &lt;/asp:Content&gt;
        
        &lt;asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"&gt;
            
            &lt;% Ajax.BingMap().CssClass("BingMap").Render(); %&gt;
            
        &lt;/asp:Content&gt;
    </pre>
    
    <h1>Display Default Map</h1>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing", Ajax.BingMap().CssClass("BingMap") },
        { "Google", Ajax.GoogleMap().CssClass("GoogleMap") }
    }); %>
        
    <div class="tabs">
        <ul>
            <li><a href="#bing">Bing Maps</a></li>
            <li><a href="#google">Google Maps</a></li>
        </ul>
        <div id="bing">
            <h3>CSS</h3>
            <pre class="brush: css">
                .BingMap
                {
                    width: 600px;
                    height: 400px;
                    border: solid 1px black;
                }
            </pre>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
        <div id="google">
            <h3>CSS</h3>
            <pre class="brush: css">
                .GoogleMap
                {
                    width: 600px;
                    height: 400px;
                    border: solid 1px black;
                }
            </pre>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.GoogleMap()      // Create a Google Map
                    .CssClass("GoogleMap")  // Define the CSS Style to use. These specify the Maps Size
                    .Render();              // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <h1>Custom Client-Side ID</h1>
    <p>
    Specify a specific client-side ID to use for the client-side MvcMap object and the Maps container DIV element.<br />
    Example: Passing in "myBingMap" will define the global JavaScript variable name of "myBingMap" for the client-side MvcMap JavaScript object. The Map Container DIV element will be named the same, but prefixed with "div".
    </p>
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
           { "Bing", Ajax.BingMap("myCustomBingMap").CssClass("BingMap") },
           { "Google", Ajax.GoogleMap("myCustomGoogleMap").CssClass("GoogleMap") }
       }); %>
       
    <div class="tabs">
        <ul>
            <li><a href="#bingFixed">Bing Maps</a></li>
            <li><a href="#googleFixed">Google Maps</a></li>
        </ul>
        <div id="Div1">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap("myBingMap")     // Create a Bing Map with a specific client-side ID
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
        <div id="Div2">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.GoogleMap("myGoogleMap")     // Create a Google Map with a specific client-side ID
                    .CssClass("GoogleMap") // Define the CSS Style to use. These specify the Maps Size
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <h1>Fixed Map</h1>
    <p>A "Fixed" Map can not be manipulated (Panned and Zoomed) by the user.</p>
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
           { "Bing", Ajax.BingMap().CssClass("BingMap").Fixed(true) },
           { "Google", Ajax.GoogleMap().CssClass("GoogleMap").Fixed(true) }
       }); %>
       
    <div class="tabs">
        <ul>
            <li><a href="#bingFixed">Bing Maps</a></li>
            <li><a href="#googleFixed">Google Maps</a></li>
        </ul>
        <div id="bingFixed">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .Fixed(true)         // Set Map to be Fixed
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
        <div id="googleFixed">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.GoogleMap()     // Create a Google Map
                    .CssClass("GoogleMap") // Define the CSS Style to use. These specify the Maps Size
                    .Fixed(true)         // Set Map to be Fixed
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    
    <h1>Define "Default" Map Provider in Web.Config</h1>
    <p>
    This allows a method of specifying the "Default" Map Provider to use within the applications Web.Config. Using this method will allow you to change the Map Provider used throughout your application by just changing a single Application Setting value within the Web.Config.
    </p>
    <% var defaultMap = Ajax.DefaultMap();
       Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
           { "Default", defaultMap }
       }); %>
    <div class="tabs">
        <ul>
            <li><a href="#defaultMap">Default Map</a></li>
        </ul>
        <div id="defaultMap">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% var defaultMap = Ajax.DefaultMap(); // Create a "Default" Map from Web.Congig
                    defaultMap.Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
            <h3>Web.Config</h3>
            <pre class="brush: xml">
                &lt;appSettings&gt;
                    &lt;!-- Define the "Default" Map Provider to use for the Application, when Ajax.DefaultMap() is called. --&gt;
                    &lt;add key="MvcMaps.DefaultMapProvider" value="MvcMaps.BingMap, MvcMaps" /&gt;
                    &lt;!-- Define the "Default" Map Css to use when Ajax.DefaultMap() is called. --&gt;
                    &lt;add key="MvcMaps.Default.CssClass" value="DefaultMap" /&gt;
                &lt;/appSettings&gt;
            </pre>
        </div>
    </div>
<%--    <% Ajax.BingMap()
           .CssClass("BingMap")
           //.GeoRSS("http://www.microsoft.com/virtualearth/isdk/ajax/georsstest.xml") <-- commented out / not working completely. Is is Bing's fault?
           
           .DynamicMap("~/data/dynamicmap.aspx")
           .DynamicMap(new { controller = "DynamicMap", action = "Index" })
           .Render(); %>
    <hr />
    <% Ajax.GoogleMap()
           .CssClass("GoogleMap")
           .DynamicMap(new { controller = "DynamicMap", action = "Index" })
           .Render(); %>--%>

   
 <%--   
    <hr />
    <% Ajax.BingMap("myBingMap")
           .CssClass("BingMap")
           .MapType(MapType.Road)
           .Center(39.9097362345372, -97.470703125)
           .Zoom(4)
           //.ScriptInclude("main", "http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2&mkt=fr-FR")
           .Load("alert('Bing Map Loaded\\n' + this.getCenter() + '\\n' + this.getZoom());")
           .CssStyle("width", "600px").CssStyle("height", "400px")

           .AddPushpin(new Pushpin()
           {
               Title = "Center!",
               Description = "Some <b>Basic</b> Description for the VEMap pin!",
               Position = new LatLng(39.9097362345372, -97.470703125),
               ImageUrl = "~/Content/BluePin.png" // ImageUrl = "http://domain/folder/image.jpg"
           })
           .AddPushpin(
                new Pushpin() { Position = new LatLng(48.166085, -121.11328) },
                new Pushpin() { Position = new LatLng(34.270835, -118.34472) },
                new Pushpin() { Position = new LatLng(43.041543, -87.901954) },
                new Pushpin() { Position = new LatLng(38.889546, -77.035338) }
           )

           .AddPolyline(new BingPolyline(new List<LatLng>() {
                   new LatLng(48.166085, -121.11328),
                   new LatLng(34.270835, -118.34472),
                   new LatLng(43.041543, -87.901954),
                   new LatLng(38.889546, -77.035338)
               }) {
               LineWeight = 1,
               LineOpacity = 0.5,
               LineColor = "#FF0000",
               ShowIcon = true,
               Title = "My VEPolyline",
               Description = "Some Description for the VEPolyline.",
               ImageUrl = "~/Content/RedPin.png"
           })
           
           //.AddPolyline(new BingPolyline()
           //{
           //    LineWeight = 1,
           //    LineOpacity = 0.5,
           //    LineColor = "#FF0000",
           //    Points = new List<LatLng>() {
           //        new LatLng(48.166085, -121.11328),
           //        new LatLng(34.270835, -118.34472),
           //        new LatLng(43.041543, -87.901954),
           //        new LatLng(38.889546, -77.035338)
           //    },
           //    ShowIcon = true,
           //    Title = "My VEPolyline",
           //    Description = "Some Description for the VEPolyline.",
           //    ImageUrl = "~/Content/RedPin.png"
           //})

           .AddPolygon(new BingPolygon(new List<LatLng>() {
                   new LatLng(34.270835, -118.34472),
                   new LatLng(43.041543, -87.901954),
                   new LatLng(38.889546, -77.035338)
               }) {
               LineWeight = 2,
               LineColor = "#F00F00",
               FillColor = "#0000FF",
               FillOpacity = 0.5,
               ShowIcon = true,
               Title = "My VEPolygon",
               Description = "Some Description for the VEPolyline.",
               ImageUrl = "~/Content/RedPin.png"
           })

           //.AddPolygon(new BingPolygon()
           //{
           //    LineWeight = 2,
           //    LineColor = "#F00F00",
           //    FillColor = "#0000FF",
           //    FillOpacity = 0.5,
           //    Points = new List<LatLng>() {
           //        new LatLng(34.270835, -118.34472),
           //        new LatLng(43.041543, -87.901954),
           //        new LatLng(38.889546, -77.035338)
           //    },
           //    ShowIcon = true,
           //    Title = "My VEPolygon",
           //    Description = "Some Description for the VEPolyline.",
           //    ImageUrl = "~/Content/RedPin.png"
           //})

           .Render(); %>
    
    
    <hr />
    <% Ajax.GoogleMap("myGoogleMap")
           .CssClass("GoogleMap")
           //.Fixed(false)
           .MapType(MapType.Terrain)
           .Center(39.9097362345372, -97.470703125)
           .Zoom(4)
           //.Load("alert('GMap Loaded');")
           .Load(() => { %>myGMap_HasLoaded(this);<%})

           .AddPushpin(new GooglePushpin()
           {
               Title = "Center!",
               Description = "Some <b>Basic</b> Description for the GMap Pin!",
               Position = new LatLng(39.9097362345372, -97.470703125),
               ImageUrl = "~/Content/RedPin.png",
               ImageSize = new System.Drawing.Size(20, 20),
               ImageOffset = new System.Drawing.Point(10, 10)
           })
           .AddPushpin(
                new GooglePushpin() { Description = "Test showing InfoWindow", ShowInfoEvent = GooglePushpinShowEvents.DoubleClick, Position = new LatLng(48.166085, -121.11328) },
                new Pushpin(34.270835, -118.34472),
                new Pushpin(43.041543, -87.901954, "Milwaukee, WI"),
                new Pushpin(38.889546, -77.035338, "Washington D.C.", "Some Pushpin Description")
           )

           .AddPolyline(new Polyline(new List<LatLng>() {
                   new LatLng(48.166085, -121.11328),
                   new LatLng(34.270835, -118.34472),
                   new LatLng(43.041543, -87.901954),
                   new LatLng(38.889546, -77.035338)
               }) {
               LineWeight = 12,
               LineOpacity = 0.5,
               LineColor = "#FF0000"
           })
           
           //.AddPolyline(new Polyline()
           //{
           //    LineWeight = 12,
           //    LineOpacity = 0.5,
           //    LineColor = "#FF0000",
           //    Points = new List<LatLng>() {
           //        new LatLng(48.166085, -121.11328),
           //        new LatLng(34.270835, -118.34472),
           //        new LatLng(43.041543, -87.901954),
           //        new LatLng(38.889546, -77.035338)
           //    }
           //})

           .AddPolygon(new Polygon(new List<LatLng>() {
                   new LatLng(34.270835, -118.34472),
                   new LatLng(43.041543, -87.901954),
                   new LatLng(38.889546, -77.035338)
               }) {
               LineWeight = 6,
               LineColor = "#FF0000",
               FillColor = "#0000FF",
               FillOpacity = 0.5
           })
           
           //.AddPolygon(new Polygon()
           //{
           //    LineWeight = 6,
           //    LineColor = "#FF0000",
           //    FillColor = "#0000FF",
           //    FillOpacity = 0.5,
           //    Points = new List<LatLng>() {
           //        new LatLng(34.270835, -118.34472),
           //        new LatLng(43.041543, -87.901954),
           //        new LatLng(38.889546, -77.035338)
           //    }
           //})

           .Render(); %>
           
    <script type="text/javascript">
        function myGMap_HasLoaded(gmap) {
            var map = gmap.mapObject; // Get the "GMap" object reference
            var centerLocation = gmap.getCenter(); //gmap.mapObject.getCenter(); // Get Map Center Location
            alert("Google Map Loaded\n" + centerLocation + "\n" + gmap.getZoom());
        }
    </script>
    
    --%>
    
    

</asp:Content>
