<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul class="secondaryMenu">
    <li><%= Html.ActionLink("Properties", "Index", "Bing") %></li>
    <li><%= Html.ActionLink("Polyline", "Polyline", "Bing")%></li>
</ul>
