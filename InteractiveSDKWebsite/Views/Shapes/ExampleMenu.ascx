<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul class="secondaryMenu">
    <li><%= Html.ActionLink("Basic", "Index", "Shapes") %></li>
    <li><%= Html.ActionLink("Pushpin", "Pushpin", "Shapes") %></li>
    <li><%= Html.ActionLink("Polyline", "Polyline", "Shapes")%></li>
    <li><%= Html.ActionLink("Polygon", "Polygon", "Shapes")%></li>
</ul>