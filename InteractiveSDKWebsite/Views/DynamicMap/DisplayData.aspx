<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dynamic Map - DisplayData Option
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Dynamic Map - DisplayData Option</h2>
    
    <p>This JavaScript Function will be called to display loaded data. This will override the default functionality. Also, if this is set, the DataLoaded property will be ignored.</p>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing", Ajax.BingMap()
            .CssClass("BingMap")
            .DynamicMap(
                new { controller = "DynamicMap", action = "SchoolDistricts" },
                new DynamicMapOptions() {
                    DisplayData = "DynamicMap_DiplayData_Bing"
                })
            },
            { "BingHeader", "Pushpin Count: <span id='lblBingMapPushpinCount'></span>"},
        { "Google", Ajax.GoogleMap()
            .CssClass("GoogleMap")
            .DynamicMap(
                new { controller = "DynamicMap", action = "SchoolDistricts" },
                new DynamicMapOptions() {
                    DisplayData = "DynamicMap_DiplayData_Google"
                })
            },
            { "GoogleHeader", "Pushpin Count: <span id='lblGoogleMapPushpinCount'></span>"},
    }); %>
    
    <script type="text/javascript">
        function DynamicMap_DiplayData_Bing(data) {
            // Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object
            this.clearDynamicMapData();
            this.plotPushpins(data.pushpins);

            $('#lblBingMapPushpinCount').html(data.pushpins.length);
        }

        function DynamicMap_DiplayData_Google(data) {
            // Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object
            this.clearDynamicMapData();
            this.plotPushpins(data.pushpins);

            $('#lblGoogleMapPushpinCount').html(data.pushpins.length);
        }        
    </script>
    
    <div class="tabs">
        <ul>
            <li><a href="#bing">Bing Maps</a></li>
            <li><a href="#google">Google Maps</a></li>
        </ul>
        <div id="bing">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                Pushpin Count: &lt;span id='lblPushpinCount'&gt;&lt;/span&gt;
                &lt;% Ajax.BingMap()
                    .CssClass("BingMap")
                    .DynamicMap(
                        new { controller = "DynamicMap", action = "SchoolDistricts" },
                        new DynamicMapOptions() {
                            DisplayData = "DynamicMap_DisplayData_Handler"
                        })
                    .Render();
                %&gt;
            </pre>
            <h3>JavaScript (Client-Side)</h3>
            <pre class="brush: js">
                function DynamicMap_DisplayData_Handler(data) {
                    // Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object
                    
                    // Clear All Currently Plotted Data
                    this.clearDynamicMapData();
                    
                    // Plot New Pushpins that were Loaded
                    this.plotPushpins(data.pushpins);

                    // Display Pushpin Count
                    $('#lblPushpinCount').html(data.pushpins.length);
                }
            </pre>
        </div>
        <div id="google">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                Pushpin Count: &lt;span id='lblPushpinCount'&gt;&lt;/span&gt;
                &lt;% Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .DynamicMap(
                        new { controller = "DynamicMap", action = "SchoolDistricts" },
                        new DynamicMapOptions() {
                            DisplayData = "DynamicMap_DisplayData_Handler"
                        })
                    .Render();
                %&gt;
            </pre>
            <h3>JavaScript (Client-Side)</h3>
            <pre class="brush: js">
                function DynamicMap_DisplayData_Handler(data) {
                    // Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object
                    
                    // Clear All Currently Plotted Data
                    this.clearDynamicMapData();
                    
                    // Plot New Pushpins that were Loaded
                    this.plotPushpins(data.pushpins);

                    // Display Pushpin Count
                    $('#lblPushpinCount').html(data.pushpins.length);
                }
            </pre>
        </div>
    </div>
    
</asp:Content>
