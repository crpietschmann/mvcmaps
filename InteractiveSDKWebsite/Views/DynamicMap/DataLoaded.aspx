<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dynamic Map - DataLoaded Option
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Dynamic Map - DataLoaded Option</h2>
    
    <p>This JavaScript Function that will be executed once data is loaded; everytime data is loaded.</p>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing", Ajax.BingMap()
            .CssClass("BingMap")
            .DynamicMap(
                    new { controller = "DynamicMap", action = "SchoolDistricts" },
                    new DynamicMapOptions() {
                        DataLoaded = "function(data) { $('#lblBingMapPushpinCount').html(data.pushpins.length); }"
                    }
                )
            },
            { "BingHeader", "Pushpin Count: <span id='lblBingMapPushpinCount'></span>"},
        { "Google", Ajax.GoogleMap()
            .CssClass("GoogleMap")
            .DynamicMap(
                    new { controller = "DynamicMap", action = "SchoolDistricts" },
                    new DynamicMapOptions() { 
                        DataLoaded = "function(data) { $('#lblGoogleMapPushpinCount').html(data.pushpins.length); }"
                    }
                )
            },
            { "GoogleHeader", "Pushpin Count: <span id='lblGoogleMapPushpinCount'></span>"},
    }); %>
    
    <div class="tabs">
        <ul>
            <li><a href="#bing">Bing Maps</a></li>
            <li><a href="#google">Google Maps</a></li>
        </ul>
        <div id="bing">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                Pushpin Count: &lt;span id='lblPushpinCount'&gt;&lt;/span&gt;&lt;br /&gt;
                &lt;% Ajax.BingMap()
                    .CssClass("BingMap")
                    .DynamicMap(
                        new { controller = "DynamicMap", action = "SchoolDistricts" },
                        new DynamicMapOptions() {
                            DataLoaded = "function(data) { $('#lblPushpinCount').html(data.pushpins.length); }"
                        })
                    .Render();
                %&gt;
            </pre>
        </div>
        <div id="google">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                Pushpin Count: &lt;span id='lblPushpinCount'&gt;&lt;/span&gt;&lt;br /&gt;
                &lt;% Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .DynamicMap(
                        new { controller = "DynamicMap", action = "SchoolDistricts" },
                        new DynamicMapOptions() {
                            DataLoaded = "function(data) { $('#lblPushpinCount').html(data.pushpins.length); }"
                        })
                    .Render();
                %&gt;
            </pre>
        </div>
    </div>
    
</asp:Content>
