<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul class="secondaryMenu">
    <li><%= Html.ActionLink("Basic", "Index", "DynamicMap") %></li>
    <li><%= Html.ActionLink("DataLoaded", "DataLoaded", "DynamicMap")%></li>
    <li><%= Html.ActionLink("DisplayData", "DisplayData", "DynamicMap")%></li>
</ul>