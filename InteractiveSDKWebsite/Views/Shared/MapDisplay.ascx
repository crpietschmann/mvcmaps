<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<table>
    <tr>
        <%
        var defaultMap = (MvcMaps.IMap)ViewData["Default"];
        if (defaultMap != null)
        { %>
        <td>
            <h3>Default Map Provider</h3>
            <% if (ViewData["DefaultHeader"] != null)
               {
                   %><%=ViewData["DefaultHeader"]%><%
               }
            %>
            <% defaultMap.Render(); %>
        </td>
        <% } %>
        
        <%
        var bingMap = (MvcMaps.IMap)ViewData["Bing"];
        if (bingMap != null)
        { %>
        <td>
            <h3>Bing Maps</h3>
            <% if (ViewData["BingHeader"] != null)
               {
                   %><%=ViewData["BingHeader"]%><%
               }
            %>
            <% bingMap.Render(); %>
        </td>
        <% } %>
        
        <%
        var googleMap = (MvcMaps.IMap)ViewData["Google"];
        if (googleMap != null)
        { %>
        <td>
            <h3>Google Maps</h3>
             <% if (ViewData["GoogleHeader"] != null)
               {
                   %><%=ViewData["GoogleHeader"]%><%
               }
            %>
            <% googleMap.Render(); %>
        </td>
        <% } %>
    </tr>
</table>