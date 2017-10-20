<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Map Events
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Map Events</h2>
    <p>The "Load" event is fired once the Map has finished loading on the Page and can now be manipulated. This allows you to hook up any JavaScript code you need to run as soon as the Map has finished loading/initializing.</p>
    
    <h1>Basic "Load" Event Example</h1>
    <strong>Map Loaded:</strong><br /><span id="lblMapLoaded" class="error"></span>
    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Bing", Ajax.BingMap().CssClass("BingMap").Load("$('#lblMapLoaded').append('Bing Map Finished Loading!</br>');") },
        { "Google", Ajax.GoogleMap().CssClass("GoogleMap").Load("$('#lblMapLoaded').append('Google Map Finished Loading!</br>');") }
    }); %>
    
    <div class="tabs">
        <ul>
            <li><a href="#basicbing">Bing Maps</a></li>
            <li><a href="#basicgoogle">Google Maps</a></li>
        </ul>
        <div id="basicbing">
            <h3>ASP.NET / C#</h3>
            <pre class="brush: csharp">
            &lt;%-- Pass in JavaScript as String --%&gt
            &lt;% Ajax.BingMap()
                    .Load("alert('Map Loaded!');")
                    .Render();
                    %&gt;
                    
            &lt;%-- Use Lambda Expression to define JavaScript code --%&gt;
            &lt;% Ajax.BingMap()
                    .Load( () => {%&gt;
                        alert('Map Loaded!');
                    &lt;%})
                    .Render();
                    %&gt;
            </pre>
            <%--<h3>VB.NET</h3>
            <pre class="brush: xml">
            &lt;%-- Pass in JavaScript as String 
            &lt;% Ajax.BingMap()
                    .Load("alert('Map Loaded!');")
                    .Render()
                    %&gt;
            </pre>--%>
        </div>
        <div id="basicgoogle">
        <h3>ASP.NET / C#</h3>
            <pre class="brush: csharp">
            &lt;%-- Pass in JavaScript as String --%&gt
            &lt;% Ajax.GoogleMap()
                    .Load("alert('Map Loaded!');")
                    .Render();
                    %&gt;
                    
            &lt;%-- Use Lambda Expression to define JavaScript code --%&gt;
            &lt;% Ajax.GoogleMap()
                    .Load( () => {%&gt;
                        alert('Map Loaded!');
                    &lt;%})
                    .Render();
                    %&gt;
            </pre>
            <%--<h3>VB.NET</h3>
            <pre class="brush: xml">
            &lt;%-- Pass in JavaScript as String 
            &lt;% Ajax.GoogleMap()
                    .Load("alert('Map Loaded!');")
                    .Render()
                    %&gt;
            </pre>--%>
        </div>
    </div>
    
</asp:Content>

