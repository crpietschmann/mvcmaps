<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Bing Specific Features
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Bing Properties</h2>
    <p>
    The below are Bing Maps specific features that you can use with the component.
    </p>
    
    <div class="tabs">
        <ul>
            <li><a href="#BingCollection">BingCollection</a></li>
        </ul>
        <div id="BingCollection">
            <p>Allows you to display a Bing Collection created on <a href="http://bing.com/maps">http://bing.com/maps</a>.</p>
            
            <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
                { "Bing", Ajax.BingMap().CssClass("BingMap").BingCollection("546E7E30AC2C5011!451") }
            }); %>
            
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .BingCollection("546E7E30AC2C5011!451") // Display a Bing Collection by id.
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#BirdseyeOrientation">BirdseyeOrientation</a></li>
        </ul>
        <div id="BirdseyeOrientation">
            <p>Specifies the orientation of the bird's eye map. The Default is VEOrientation.North.</p>
            
            <%-- Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
                { "Bing", Ajax.BingMap().CssClass("BingMap").Zoom(10).BirdseyeOrientation(BingOrientation.South) }
            }); --%>
            
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .BirdseyeOrientation(BingOrientation.South) // Set Birdseye Orientation to South
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#clienttoken">ClientToken</a></li>
        </ul>
        <div id="clienttoken">
            <p>Set the Bing Maps Client Token to use when <a href="http://msdn.microsoft.com/en-us/library/bb924353.aspx">Implementing Customer Identification</a>.</p>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .ClientToken("####") // Set Bing Maps Client Token
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#EnableBirdseye">EnableBirdseye</a></li>
        </ul>
        <div id="EnableBirdseye">
            <p>Specify whether or not to enable the Birdseye map style in the map control. The Default is True.</p>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .EnableBirdseye(false) // Disable Birdseye Map Style
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#EnableDashboardLabels">EnableDashboardLabels</a></li>
        </ul>
        <div id="EnableDashboardLabels">
            <p>Specify whether or not to show labels on the map when a user clicks the Aerial or Birdseye map style buttons on the map control dashboard. The Default is True (show labels).</p>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .EnableDashboardLabels(false) // Don't display labels on the map
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#LoadBaseTiles">LoadBaseTiles</a></li>
        </ul>
        <div id="LoadBaseTiles">
            <p>Specify whether or not to load the base map tiles (Bing Maps Imagery). The Default is True.</p>
            
            <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
                { "Bing", Ajax.BingMap().CssClass("BingMap").LoadBaseTiles(false) }
            }); %>
            
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .LoadBaseTiles(false) // Hide Base Tile Imagery
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
            <p>This can be useful when displaying your own Map Tile Imagery.</p>
        </div>
    </div>

    <div class="tabs">
        <ul>
            <li><a href="#mapmode">MapMode</a></li>
        </ul>
        <div id="mapmode">
            <p>Specify whether to load the map in 2D or 3D Map Mode.</p>
            
            <%-- Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
                { "Bing", Ajax.BingMap().CssClass("BingMap").MapMode(BingMapMode.Mode3D) }
            }); --%>
            
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .MapMode(BingMapMode.Mode3D) // Set the map to 3D Mode
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#mapmodeswitch">MapModeSwitch</a></li>
        </ul>
        <div id="mapmodeswitch">
            <p>Specify whether or not to show the "Map Mode Switch" within the Bing Maps Dashboard control. The Default is True (switch is displayed).</p>
            
            <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
                { "Bing", Ajax.BingMap().CssClass("BingMap").MapModeSwitch(false) }
            }); %>
            
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .MapModeSwitch(false) // Don't display the "Map Mode Switch"
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>
    
    <div class="tabs">
        <ul>
            <li><a href="#TileBuffer">TileBuffer</a></li>
        </ul>
        <div id="TileBuffer">
            <p>Specify the amount of Tile Buffer to use when loading map tiles. The Default is 0 (do not load an extra boundary of tiles).</p>
            <h3>ASP.NET / C#</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()     // Create a Bing Map
                    .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
                    .TileBuffer(2) // Set "Tile Buffer" to 2 extra boundary tiles
                    .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
                    %&gt;
            </pre>
        </div>
    </div>

</asp:Content>