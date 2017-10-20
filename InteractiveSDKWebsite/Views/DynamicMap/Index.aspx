<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Basic Dynamic Map Example
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Basic Dynamic Map Example</h2>
    
    <p>Below is the most a Basic example of implementing a "Dynamic" or "Interactive" Map search using the control.</p>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing", Ajax.BingMap()
            .CssClass("BingMap")
            .DynamicMap( new { controller = "DynamicMap", action = "SchoolDistricts" })
            },
        { "Google", Ajax.GoogleMap()
            .CssClass("GoogleMap")
            .DynamicMap( new { controller = "DynamicMap", action = "SchoolDistricts" })
            }
    }); %>
    
    <div class="tabs">
        <ul>
            <li><a href="#bing">Bing Maps</a></li>
            <li><a href="#google">Google Maps</a></li>
        </ul>
        <div id="bing">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()
                    .CssClass("BingMap")
                    .DynamicMap( new { controller = "DynamicMap", action = "SchoolDistricts" })
                    .Render();
                %&gt;
            </pre>
           
            <%--<h3>ASP.NET / VB.NET Source</h3>
            <pre class="brush: xml">
                &lt;% Ajax.BingMap()
                    .CssClass("BingMap")
                    .DynamicMap(New With {.controller = "DynamicMap", .action = "SchoolDistricts"})
                    .Render()
                %&gt;
            </pre>--%>
        </div>
        <div id="google">
            <h3>ASP.NET / C# Source</h3>
            <pre class="brush: xml">
                &lt;% Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .DynamicMap( new { controller = "DynamicMap", action = "SchoolDistricts" })
                    .Render();
                %&gt;
            </pre>
           
            <%--<h3>ASP.NET / VB.NET Source</h3>
            <pre class="brush: xml">
                &lt;% Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .DynamicMap(New With {.controller = "DynamicMap", .action = "SchoolDistricts"})
                    .Render()
                %&gt;
            </pre>--%>
        </div>
    </div>
    

    <h2>Action Method Source</h2>
    <h3>C#</h3>
    <pre class="brush: csharp">
        public class DynamicMapController : Controller
        {
            public ActionResult SchoolDistricts(double minLat, double maxLat, double minLng, double maxLng)
            {
                // Query and Get all School Districts within the passed in "Map View".
                var doc = XDocument.Load(Server.MapPath("~/App_Data/WISchoolDistricts.xml"));
                var schooldistricts = (from d in doc.Element("schooldistricts").Elements("schooldistrict")
                                where double.Parse(d.Attribute("latitude").Value) >= minLat
                                && double.Parse(d.Attribute("latitude").Value) <= maxLat
                                && double.Parse(d.Attribute("longitude").Value) >= minLng
                                && double.Parse(d.Attribute("longitude").Value) <= maxLng
                                select d
                            );

                // Generate "Pushpin" objects for each School District to be Plotted on the Map.
                var pushpins = (from d in schooldistricts
                                select(new Pushpin(
                                    double.Parse(d.Attribute("latitude").Value),
                                    double.Parse(d.Attribute("longitude").Value)
                                ){
                                    Title = d.Attribute("name").Value,
                                    Description = d.Attribute("address").Value
                                }));


                // Add Polylines
                var polylines = new List&lt;Polyline&gt;();
                
                // Add Polygons
                var polygons = new List&lt;Polygon&gt;();
                

                // Return a "MapDataResult" object that contains all the data that is to be Plotted on the Map.
                return new MapDataResult()
                {
                    Pushpins = pushpins,
                    Polylines = polylines,
                    Polygons = polygons
                };
            }
        }
    </pre>
    <%--<h3>VB.NET</h3>
    <pre class="brush: vb">
        Public Class DynamicMapController
            Inherits System.Web.Mvc.Controller
            
            Function SchoolDistricts( _
                ByVal minLat As Double, ByVal maxLat As Double, _
                ByVal minLng As Double, ByVal maxLng As Double _
            ) As ActionResult
                ' Query and Get all School Districts within the passed in "Map View".
                Dim doc = XDocument.Load(Server.MapPath("~/App_Data/WISchoolDistricts.xml"))
                Dim schools As IEnumerable(Of XElement) = _
                        From d In doc.Element("schooldistricts").Elements("schooldistrict") _
                        Where (Double.Parse(d.Attribute("latitude").Value) >= minLat) _
                        And Double.Parse(d.Attribute("latitude").Value) <= maxLat _
                        And Double.Parse(d.Attribute("longitude").Value) >= minLng _
                        And Double.Parse(d.Attribute("longitude").Value) <= maxLng _
                        Select d


                ' Generate "Pushpin" objects for each School District to be Plotted on the Map.
                Dim pushpins As IEnumerable(Of Pushpin) = From d In schools _
                    Select New Pushpin( _
                        Double.Parse(d.Attribute("latitude").Value), _
                        Double.Parse(d.Attribute("longitude").Value)) _
                    With { _
                        .Title = d.Attribute("name").Value, _
                        .Description = d.Attribute("address").Value _
                    }

                ' Return a "MapDataResult" object that contains all the data that is to be Plotted on the Map.
                Return New MapDataResult With {.Pushpins = pushpins}
            End Function
        End Class
    </pre>--%>
            
</asp:Content>
