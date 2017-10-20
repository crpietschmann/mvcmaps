/*
* MvcMaps Preview 2 - A Unified Mapping API for ASP.NET MVC
* Copyright (c) 2009 Chris Pietschmann
* http://mvcmaps.codeplex.com
* Licensed under the Microsoft Reciprocal License (Ms-RL)
* http://mvcmaps.codeplex.com/license
*/
using System;
using System.Web.Mvc;
using MvcMaps.Utils;

namespace MvcMaps
{
    public static class GoogleMapExtensions
    {
        public static GoogleMap GoogleMap(this AjaxHelper helper)
        {
            return GoogleMap(helper, "G" + GuidUtils.NewShortGuid());
        }

        public static GoogleMap GoogleMap(this AjaxHelper helper, string mapID)
        {
            if (string.IsNullOrEmpty(mapID))
            {
                throw new ArgumentNullException("mapID");
            }
            var map = new GoogleMap(helper, mapID);
            return map;
        }
    }
}
