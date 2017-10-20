# MvcMaps - Unified Bing/Google Mapping API for ASP.NET MVC

A single unified API for both Bing Maps and Google Maps JavaScript development within ASP.NET MVC.

**FYI, this project was migrated here from Codeplex before it shutdown.**

Articles/Tutorials:

[MvcMaps Preview 1 - A Unified Bing/Google Maps API for ASP.NET MVC](http://pietschsoft.com/post/2009/11/02/MvcMaps-Preview-1-e28093-A-Unified-BingGoogle-Maps-API-for-ASPNET-MVC.aspx)

## Basic Map

    <script type='text/javascript'>
        .BingMap { width: 600px; height: 400px; border: solid 1px black; }
    </script>

    <% Ajax.BingMap()     // Create a Bing Map
        .CssClass("BingMap") // Define the CSS Style to use. These specify the Maps Size
        .Render();           // Render all the HTML / JavaScript necessary to create the Map to Server.Response
    %>

An "Interactive SDK" with many more sample usages is included with the source code download available at the link on the right side of this page.

## Prerequisites

MvcMaps can only be implemented within an ASP.NET MVC Web Application Project, and has the following requirements:

* ASP.NET 3.5 or later
* ASP.NET MVC 1.0 or later
* jQuery Library v1.3.2 or later

If you are looking for a control to simplify Bing Maps mapping development within an ASP.NET WebForms Application, go check out [Web.Maps.VE from Simplovation](http://simplovation.com/).

Before you can add Maps to your ASP.NET MVC Views, you must first Add a Reference to the "MvcMaps.dll" to your ASP.NET MVC Web Application Project. Then, you must also Import it's namespace into each View, as below:

    <%@ Import Namespace="MvcMaps" %>

Alternatively to Importing the Namespace within every View/Page, you can add it to the Web.Config to be included within All Views/Pages:

    <pages>
        <namespaces>
            <add namespace="MvcMaps" />
        </namespaces>
    </pages>

