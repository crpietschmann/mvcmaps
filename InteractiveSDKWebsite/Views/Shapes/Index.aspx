<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Basic Shapes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>
    
    <h2>Basic Shapes (Pushpin, Polyline and Polygon)</h2>
    <p>These are basic examples of adding Shapes (Pushpins, Polylines and Polygons) to the Map.</p>
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing",
            Ajax.BingMap().CssClass("BingMap")
                .AddPushpin(new Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                .AddPolyline(
                    new Polyline(new List<LatLng>() {
                       new LatLng(48.166085, -121.11328),
                       new LatLng(34.270835, -118.34472),
                       new LatLng(43.041543, -87.901954),
                       new LatLng(38.889546, -77.035338)
                   }) {
                        LineColor = "#0000FF",
                        LineWeight = 6
                   }
                )
               .AddPolygon(
                    new Polygon(new List<LatLng>() {
                       new LatLng(34.270835, -118.34472),
                       new LatLng(43.041543, -87.901954),
                       new LatLng(38.889546, -77.035338)
                   }) {
                        FillColor = "#00ff00",
                        FillOpacity = 0.5,
                        LineWeight = 2,
                        LineColor = "#FF0000"
                    }
                )
        },
        { "Google",
            Ajax.GoogleMap().CssClass("GoogleMap")
                .AddPushpin(new Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                .AddPolyline(
                    new Polyline(new List<LatLng>() {
                        new LatLng(48.166085, -121.11328),
                        new LatLng(34.270835, -118.34472),
                        new LatLng(43.041543, -87.901954),
                        new LatLng(38.889546, -77.035338)
                    }) {
                        LineColor = "#0000FF",
                        LineWeight = 6
                    }
                )
                .AddPolygon(
                    new Polygon(new List<LatLng>() {
                        new LatLng(34.270835, -118.34472),
                        new LatLng(43.041543, -87.901954),
                        new LatLng(38.889546, -77.035338)
                    }) {
                        FillColor = "#00ff00",
                        FillOpacity = 0.5,
                        LineWeight = 2,
                        LineColor = "#FF0000"
                    }
                )
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
                        // Add Pushpin Shape
                        .AddPushpin(new Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                        
                        // Add Polyline Shape
                        .AddPolyline(
                            new Polyline(new List&lt;LatLng&gt;() {
                                new LatLng(48.166085, -121.11328),
                                new LatLng(34.270835, -118.34472),
                                new LatLng(43.041543, -87.901954),
                                new LatLng(38.889546, -77.035338)
                            }) {
                                LineColor = "#0000FF",
                                LineWeight = 6
                            }
                        )
                        
                        // Add Polygon Shape
                        .AddPolygon(
                            new Polygon(new List&lt;LatLng&gt;() {
                                new LatLng(34.270835, -118.34472),
                                new LatLng(43.041543, -87.901954),
                                new LatLng(38.889546, -77.035338)
                            }) {
                                FillColor = "#00ff00",
                                FillOpacity = 0.5,
                                LineWeight = 2,
                                LineColor = "#FF0000"
                            }
                        )
                        
                        // Render Map (HTML and JavaScript) to the Page
                        .Render()
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        ' Create Map and Add Pushpin Shape
                        Dim map = Ajax.BingMap _
                            .AddPushpin(New Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                        
                        ' Create Polyline Shape
                        Dim polylinePoints = New List(Of LatLng)
                        polylinePoints.Add(New LatLng(48.166085, -121.11328))
                        polylinePoints.Add(New LatLng(34.270835, -118.34472))
                        polylinePoints.Add(New LatLng(43.041543, -87.901954))
                        polylinePoints.Add(New LatLng(38.889546, -77.035338))
                        
                        Dim polylineShape = New Polyline(polylinePoints)
                        polylineShape.LineColor = "#0000FF"
                        polylineShape.LineWeight = 6
                        
                        ' Add Polyline Shape to Map
                        map.AddPolyline(polylineShape)
                        
                        ' Create Polygon Shape
                        Dim polygonPoints = New List(Of LatLng)
                        polygonPoints.Add(New LatLng(34.270835, -118.34472))
                        polygonPoints.Add(New LatLng(43.041543, -87.901954))
                        polygonPoints.Add(New LatLng(38.889546, -77.035338))
                        
                        Dim polygonShape = New Polygon(polygonPoints)
                        polygonShape.FillColor = "#00ff00"
                        polygonShape.FillOpacity = 0.5
                        polygonShape.LineWeight = 2
                        polygonShape.LineColor = "#FF0000"
                        
                        ' Add Polygon Shape to Map
                        map.AddPolygon(polygonShape)
                        
                        ' Render Map (HTML and JavaScript) to the Page
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
            <div id="google">
            <h3>ASP.NET / C#</h3>
                <pre class="brush: csharp">
                    &lt;% Ajax.GoogleMap().CssClass("BingMap")
                        // Add Pushpin Shape
                        .AddPushpin(new Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                        
                        // Add Polyline Shape
                        .AddPolyline(
                            new Polyline(new List&lt;LatLng&gt;() {
                                new LatLng(48.166085, -121.11328),
                                new LatLng(34.270835, -118.34472),
                                new LatLng(43.041543, -87.901954),
                                new LatLng(38.889546, -77.035338)
                            }) {
                                LineColor = "#0000FF",
                                LineWeight = 6
                            }
                        )
                        
                        // Add Polygon Shape
                        .AddPolygon(
                            new Polygon(new List&lt;LatLng&gt;() {
                                new LatLng(34.270835, -118.34472),
                                new LatLng(43.041543, -87.901954),
                                new LatLng(38.889546, -77.035338)
                            }) {
                                FillColor = "#00ff00",
                                FillOpacity = 0.5,
                                LineWeight = 2,
                                LineColor = "#FF0000"
                            }
                        )
                        
                        // Render Map (HTML and JavaScript) to the Page
                        .Render()
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        ' Create Map and Add Pushpin Shape
                        Dim map = Ajax.GoogleMap _
                            .AddPushpin(New Pushpin(39.9097362345372, -97.470703125, "Some Pushpin Title", "Some Pushpin Description"))
                        
                        ' Create Polyline Shape
                        Dim polylinePoints = New List(Of LatLng)
                        polylinePoints.Add(New LatLng(48.166085, -121.11328))
                        polylinePoints.Add(New LatLng(34.270835, -118.34472))
                        polylinePoints.Add(New LatLng(43.041543, -87.901954))
                        polylinePoints.Add(New LatLng(38.889546, -77.035338))
                        
                        Dim polylineShape = New Polyline(polylinePoints)
                        polylineShape.LineColor = "#0000FF"
                        polylineShape.LineWeight = 6
                        
                        ' Add Polyline Shape to Map
                        map.AddPolyline(polylineShape)
                        
                        ' Create Polygon Shape
                        Dim polygonPoints = New List(Of LatLng)
                        polygonPoints.Add(New LatLng(34.270835, -118.34472))
                        polygonPoints.Add(New LatLng(43.041543, -87.901954))
                        polygonPoints.Add(New LatLng(38.889546, -77.035338))
                        
                        Dim polygonShape = New Polygon(polygonPoints)
                        polygonShape.FillColor = "#00ff00"
                        polygonShape.FillOpacity = 0.5
                        polygonShape.LineWeight = 2
                        polygonShape.LineColor = "#FF0000"
                        
                        ' Add Polygon Shape to Map
                        map.AddPolygon(polygonShape)
                        
                        ' Render Map (HTML and JavaScript) to the Page
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
        </div>
        
</asp:Content>
