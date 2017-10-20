<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Polygon Shape
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>
    
    <h2>Polygon Shape</h2>

    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary()
       {
           {
               "Bing",
               Ajax.BingMap().CssClass("BingMap")
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(47, -120),
                    new LatLng(47, -110),
                    new LatLng(35, -110),
                    new LatLng(35, -120),
                    new LatLng(47, -120)
                }))
                
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(42, -104),
                    new LatLng(44, -101),
                    new LatLng(44, -95),
                    new LatLng(42, -92),
                    new LatLng(38, -92),
                    new LatLng(36, -95),
                    new LatLng(36, -101),
                    new LatLng(38, -104),
                    new LatLng(42, -104)
                }) {
                    FillColor = "#11FF11",
                    LineColor = "#FF0000"
                })
                
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(37, -88),
                    new LatLng(37, -76),
                    new LatLng(44, -82),
                    new LatLng(37, -88)
                }) {
                    FillColor = "#11FF11",
                    FillOpacity = 0.5,
                    LineColor = "#FF0000",
                    LineOpacity = 0.8
                })
           },
           {
               "Google",
               Ajax.GoogleMap().CssClass("GoogleMap")
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(47, -120),
                    new LatLng(47, -110),
                    new LatLng(35, -110),
                    new LatLng(35, -120),
                    new LatLng(47, -120)
                }))
                
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(42, -104),
                    new LatLng(44, -101),
                    new LatLng(44, -95),
                    new LatLng(42, -92),
                    new LatLng(38, -92),
                    new LatLng(36, -95),
                    new LatLng(36, -101),
                    new LatLng(38, -104),
                    new LatLng(42, -104)
                }) {
                    FillColor = "#11FF11",
                    LineColor = "#FF0000"
                })
                
                .AddPolygon(new Polygon(new List<LatLng>(){
                    new LatLng(37, -88),
                    new LatLng(37, -76),
                    new LatLng(44, -82),
                    new LatLng(37, -88)
                }) {
                    FillColor = "#11FF11",
                    FillOpacity = 0.5,
                    LineColor = "#FF0000",
                    LineOpacity = 0.8,
                    LineWeight = 4
                })               
           }
       }); %>

    <div class="tabs">
        <ul>
            <li><a href="#bing">Bing Maps</a></li>
            <li><a href="#google">Google Maps</a></li>
        </ul>
        <div id="bing">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: csharp">
                &lt;% Ajax.BingMap().CssClass("BingMap")
                
                    // Add "default" Polygon at a Specific Location
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(47, -120),
                        new LatLng(47, -110),
                        new LatLng(35, -110),
                        new LatLng(35, -120),
                    }))
                    
                    // Add Polygon with Specific Fill Color and Line Color
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(42, -104),
                        new LatLng(44, -101),
                        new LatLng(44, -95),
                        new LatLng(42, -92),
                        new LatLng(38, -92),
                        new LatLng(36, -95),
                        new LatLng(36, -101),
                        new LatLng(38, -104),
                    }) {
                        FillColor = "#11FF11", // Color Green
                        LineColor = "#FF0000"  // Color Red
                    })
                    
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(37, -88),
                        new LatLng(37, -76),
                        new LatLng(44, -82)
                    }) {
                        FillColor = "#11FF11", // Color Green
                        FillOpacity = 0.5, // 50% Opacity
                        LineColor = "#FF0000", // Color Red
                        LineOpacity = 0.8,  // 80% Opacity
                        LineWeight = 4 // Line Weight (Width) of 4px
                    })
                    
                    .Render();
                %&gt;
            </pre>
        </div>
        <div id="google">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: csharp">
                &lt;% Ajax.GoogleMap().CssClass("GoogleMap")
                
                    // Add "default" Polygon at a Specific Location
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(47, -120),
                        new LatLng(47, -110),
                        new LatLng(35, -110),
                        new LatLng(35, -120),
                        new LatLng(47, -120) // Last point is same as First to make sure Polygon is connected
                    }))
                    
                    // Add Polygon with Specific Fill Color and Line Color
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(42, -104),
                        new LatLng(44, -101),
                        new LatLng(44, -95),
                        new LatLng(42, -92),
                        new LatLng(38, -92),
                        new LatLng(36, -95),
                        new LatLng(36, -101),
                        new LatLng(38, -104),
                        new LatLng(42, -104) // Last point is same as First to make sure Polygon is connected
                    }) {
                        FillColor = "#11FF11", // Color Green
                        LineColor = "#FF0000"  // Color Red
                    })
                    
                    .AddPolygon(new Polygon(new List&lt;LatLng&gt;(){
                        new LatLng(37, -88),
                        new LatLng(37, -76),
                        new LatLng(44, -82),
                        new LatLng(37, -88) // Last point is same as First to make sure Polygon is connected
                    }) {
                        FillColor = "#11FF11", // Color Green
                        FillOpacity = 0.5, // 50% Opacity
                        LineColor = "#FF0000", // Color Red
                        LineOpacity = 0.8,  // 80% Opacity
                        LineWeight = 4 // Line Weight (Width) of 4px
                    })
                    
                    .Render();
                %&gt;
            </pre>
        </div>
    </div>
       
</asp:Content>

