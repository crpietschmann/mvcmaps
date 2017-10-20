/*
* MvcMaps Preview 2 - A Unified Mapping API for ASP.NET MVC
* Copyright (c) 2009 Chris Pietschmann
* http://mvcmaps.codeplex.com
* Licensed under the Microsoft Reciprocal License (Ms-RL)
* http://mvcmaps.codeplex.com/license
*/
using System;
using System.Configuration;
using System.Web.Mvc;
using MvcMaps.Utils;

namespace MvcMaps
{
    public static class DefaultMapExtensions
    {
        /// <summary>
        /// Retrieves the desired Map Provider that is specified within the applications Web.Config.
        /// </summary>
        /// <param name="helper"></param>
        /// <returns>An instance if IMap to use to render the map.</returns>
        public static IMap DefaultMap(this AjaxHelper helper)
        {
            return DefaultMap(helper, "D" + GuidUtils.NewShortGuid());
        }

        public static IMap DefaultMap(this AjaxHelper helper, string mapID)
        {
            string typeString = ConfigurationManager.AppSettings["MvcMaps.Default.MapProvider"];
            Type type = Type.GetType(typeString);

            var map = (IMap)Activator.CreateInstance(type, helper, mapID);

            string cssClass = ConfigurationManager.AppSettings["MvcMaps.Default.CssClass"];
            if (!string.IsNullOrEmpty(cssClass))
            {
                map.CssClassName = cssClass;
            }

            return map;
        }
    }
}
