<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Polyline Shape
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>
    
    <h2>Polyline Shape</h2>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
           {"Bing",
                Ajax.BingMap().CssClass("BingMap")
                    .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -110),
                        new LatLng(34, -110)
                    }))
                    
                    .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -100),
                        new LatLng(34, -100)
                    }) {
                        LineColor = "#11FF11",
                        LineWeight = 5
                    }) 
                                      
                    .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -90),
                        new LatLng(34, -90)
                    }) {
                        LineColor = "#FF0000",
                        LineWeight = 8,
                        LineOpacity = 0.5
                    }) 
            },
           {"Google",
               Ajax.GoogleMap().CssClass("GoogleMap")
                    .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -110),
                        new LatLng(34, -110)
                    }))
                    
                     .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -100),
                        new LatLng(34, -100)
                    }) {
                        LineColor = "#11FF11",
                        LineWeight = 5
                    })
                    
                    .AddPolyline(new Polyline(new List<LatLng>() {
                        new LatLng(47, -90),
                        new LatLng(34, -90)
                    }) {
                        LineColor = "#FF0000",
                        LineWeight = 8,
                        LineOpacity = 0.5
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
                    &lt;% Ajax.BingMap()
                        
                        // Add "default" Polyline as Specific Location
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -110),
                            new LatLng(34, -110)
                        }))
                        
                        // Add Polyline of Specific Color and Line Weight (Width)
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -100),
                            new LatLng(34, -100)
                        }) {
                            LineColor = "#11FF11", // Color Green
                            LineWeight = 5 // Width of 5px
                        }) 
                        
                        // Add Polyline with "50%" Opacity     
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -90),
                            new LatLng(34, -90)
                        }) {
                            LineColor = "#FF0000", // Color Red
                            LineWeight = 8, // Width of 8px
                            LineOpacity = 0.5 // 50% Opacity
                        })
                        
                        .Render();
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        Dim map = Ajax.BingMap()
                        
                        '' Add "default" Polyline as Specific Location
                        Dim points = New List(Of LatLng)
                        points.Add(New LatLng(47, -110))
                        points.Add(New LatLng(34, -110))
                        
                        map.AddPolyline(New Polyline(points))
                        
                        '' Add Polyline of Specific Color and Line Weight (Width)
                        points = new List(Of LatLng)
                        points.Add(New LatLng(47, -100))
                        points.Add(New LatLng(34, -100))
                        
                        Dim secondPolyline = new Polyline(points)
                        secondPolyline.LineColor = "#11FF11"  ' Color Green
                        secondPolyline.LineWeight = 5  ' Width of 5px
                        
                        map.AddPolyline(secondPolyline)
                        
                        '' Add Polyline with "50%" Opacity  
                        points = new List(Of LatLng)
                        points.Add(New LatLng(47, -90))
                        points.Add(New LatLng(34, -90))
                        
                        Dim thirdPolyline = new Polyline(points)
                        secondPolyline.LineColor = "#FF0000"  ' Color Red
                        secondPolyline.LineWeight = 8  ' Width of 8px
                        secondPolyline.LineOpacity = 0.5  ' 50% Opacity
                        
                        map.AddPolyline(thirdPolyline)
                                               
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
            <div id="google">
            <h3>ASP.NET / C#</h3>
                <pre class="brush: csharp">
                    &lt;% Ajax.GoogleMap()
                        
                        // Add "default" Polyline as Specific Location
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -110),
                            new LatLng(34, -110)
                        }))
                        
                        // Add Polyline of Specific Color and Line Weight (Width)
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -100),
                            new LatLng(34, -100)
                        }) {
                            LineColor = "#11FF11", // Color Green
                            LineWeight = 5 // Width of 5px
                        }) 
                        
                        // Add Polyline with "50%" Opacity     
                        .AddPolyline(new Polyline(new List&lt;LatLng&gt;() {
                            new LatLng(47, -90),
                            new LatLng(34, -90)
                        }) {
                            LineColor = "#FF0000", // Color Red
                            LineWeight = 8, // Width of 8px
                            LineOpacity = 0.5 // 50% Opacity
                        })
                        
                        .Render();
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        Dim map = Ajax.GoogleMap()
                        
                        '' Add "default" Polyline as Specific Location
                        Dim points = New List(Of LatLng)
                        points.Add(New LatLng(47, -110))
                        points.Add(New LatLng(34, -110))
                        
                        map.AddPolyline(New Polyline(points))
                        
                        '' Add Polyline of Specific Color and Line Weight (Width)
                        points = new List(Of LatLng)
                        points.Add(New LatLng(47, -100))
                        points.Add(New LatLng(34, -100))
                        
                        Dim secondPolyline = new Polyline(points)
                        secondPolyline.LineColor = "#11FF11"  ' Color Green
                        secondPolyline.LineWeight = 5  ' Width of 5px
                        
                        map.AddPolyline(secondPolyline)
                        
                        '' Add Polyline with "50%" Opacity  
                        points = new List(Of LatLng)
                        points.Add(New LatLng(47, -90))
                        points.Add(New LatLng(34, -90))
                        
                        Dim thirdPolyline = new Polyline(points)
                        secondPolyline.LineColor = "#FF0000"  ' Color Red
                        secondPolyline.LineWeight = 8  ' Width of 8px
                        secondPolyline.LineOpacity = 0.5  ' 50% Opacity
                        
                        map.AddPolyline(thirdPolyline)
                                               
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
        </div>
</asp:Content>
