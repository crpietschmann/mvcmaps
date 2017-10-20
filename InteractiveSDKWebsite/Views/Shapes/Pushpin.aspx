<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pushpin Shape
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("ExampleMenu"); %>

    <h2>Pushpin Shape</h2>
    
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary()
       {
           {
               "Bing",
               Ajax.BingMap().CssClass("BingMap")
                    .AddPushpin(new Pushpin(47, -110))
                    .AddPushpin(new Pushpin(41, -100) {
                        Title = "Second Pushpin",
                        Description = "Some Pushpin Description"
                    })
                    .AddPushpin(new Pushpin(34, -90){
                        ImageUrl = "~/Content/BluePin.png"
                    })
           },
           {
               "Google",
               Ajax.GoogleMap().CssClass("GoogleMap")
                    .AddPushpin(new Pushpin(47, -110))
                    .AddPushpin(new Pushpin(41, -100) {
                        Title = "Second Pushpin",
                        Description = "Some Pushpin Description"
                    })
                    .AddPushpin(new Pushpin(34, -90){
                        ImageUrl = "~/Content/BluePin.png",
                        ImageSize = new System.Drawing.Size(20, 20)
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
                    
                        // Add a "default" Pusphin at a Specific Location
                        .AddPushpin(new Pushpin(47, -110))
                        
                        // Specify the "Title" and "Description" for the Pushpin
                        // These show up in the "InfoBox" on Bing Maps, and the
                        // "Tooltip" and "InfoWindow" on Google Maps.
                        .AddPushpin(new Pushpin(41, -100) {
                            Title = "Second Pushpin",
                            Description = "Some &lt;b&gt;Pushpin&lt;/b&gt; Description"
                        })
                        
                        // Specify a Custom Image / Icon to use for the Pushpin
                        .AddPushpin(new Pushpin(34, -90){
                            ImageUrl = "~/Content/BluePin.png" // Can be absolute or app relative
                        })
                        
                        .Render();
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        Dim map = Ajax.BingMap()
                        
                        '' Add a "default" Pusphin at a Specific Location
                        map.AddPushpin(new Pushpin(47, -110))
                        
                        '' Specify the "Title" and "Description" for the Pushpin
                        '' These show up in the "InfoBox" on Bing Maps, and the
                        '' "Tooltip" and "InfoWindow" on Google Maps.
                        Dim pushpin2 = new Pushpin(41, -100, _
                            "Second Pushpin", _
                            "Some &lt;b&gt;Pushpin&lt;/b&gt; Description")
                        map.AddPushpin(pushpin2)
                        
                        '' Specify a Custom Image / Icon to use for the Pushpin
                        Dim pushpin3 = new Pushpin(34, -90)
                        pushpin3.ImageUrl = "~/Content/BluePin.png" 'Can be absolute or app relative
                        
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
            <div id="google">
                <h3>ASP.NET / C#</h3>
                <pre class="brush: csharp">
                    &lt;% Ajax.GoogleMap()
                    
                        // Add a "default" Pusphin at a Specific Location
                        .AddPushpin(new Pushpin(47, -110))
                        
                        // Specify the "Title" and "Description" for the Pushpin
                        // These show up in the "InfoBox" on Bing Maps, and the
                        // "Tooltip" and "InfoWindow" on Google Maps.
                        .AddPushpin(new Pushpin(41, -100) {
                            Title = "Second Pushpin",
                            Description = "Some &lt;b&gt;Pushpin&lt;/b&gt; Description"
                        })
                        
                        // Specify a Custom Image / Icon to use for the Pushpin
                        .AddPushpin(new Pushpin(34, -90){
                            ImageUrl = "~/Content/BluePin.png", // Can be absolute or app relative
                            ImageSize = new System.Drawing.Size(20, 20) // Specify Image Size (required by Google Maps for proper display)
                        })
                        
                        .Render();
                    %&gt;
                </pre>
                <%--<h3>ASP.NET / VB.NET</h3>
                <pre class="brush: vb">
                    &lt;%
                        Dim map = Ajax.GoogleMap()
                        
                        '' Add a "default" Pusphin at a Specific Location
                        map.AddPushpin(new Pushpin(47, -110))
                        
                        '' Specify the "Title" and "Description" for the Pushpin
                        '' These show up in the "InfoBox" on Bing Maps, and the
                        '' "Tooltip" and "InfoWindow" on Google Maps.
                        Dim pushpin2 = new Pushpin(41, -100, _
                            "Second Pushpin", _
                            "Some &lt;b&gt;Pushpin&lt;/b&gt; Description")
                        map.AddPushpin(pushpin2)
                        
                        '' Specify a Custom Image / Icon to use for the Pushpin
                        Dim pushpin3 = new Pushpin(34, -90)
                        pushpin3.ImageUrl = "~/Content/BluePin.png" 'Can be absolute or app relative
                        pushpin3.ImageSize = new System.Drawing.Size(20, 20) ' Specify Image Size (required by Google Maps for proper display)
                        map.Render()
                    %&gt;
                </pre>--%>
            </div>
        </div>

</asp:Content>
