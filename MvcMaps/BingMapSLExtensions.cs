/*
* MvcMaps Preview 2 - A Unified Mapping API for ASP.NET MVC
* Copyright (c) 2009 Chris Pietschmann
* http://mvcmaps.codeplex.com
* Licensed under the Microsoft Reciprocal License (Ms-RL)
* http://mvcmaps.codeplex.com/license
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using MvcMaps.Utils;

namespace MvcMaps
{
    public static class BingMapSLExtensions
    {
        public static BingMapSL BingMapSL(this AjaxHelper helper)
        {
            return BingMapSL(helper, "B" + GuidUtils.NewShortGuid());
        }

        public static BingMapSL BingMapSL(this AjaxHelper helper, string mapID)
        {
            if (string.IsNullOrEmpty(mapID))
            {
                throw new ArgumentNullException("mapID");
            }
            return new BingMapSL(helper, mapID);
        }
    }
}
