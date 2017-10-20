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
using MvcMaps.Utils;
using System.Web.Mvc;
using System.Web.UI.HtmlControls;

[assembly: System.Web.UI.WebResource("MvcMaps.BingMapSL.js", "text/javascript")]

namespace MvcMaps
{
    /// <summary>
    /// This is just the beginnings of a "preview" of this control, and I have found that the
    /// Bing Maps Silverlight controls API for interacting with the Map from JavaScript is a bit limiting.
    /// </summary>
    public class BingMapSL : Map<BingMapSL>
    {
        public BingMapSL(AjaxHelper helper, string mapID)
            : base(helper, mapID, "MvcMaps.BingMapSL")
        {
            this.ScriptInclude("vemap.js", WebUtils.GetWebResourceUrl<BingMapSL>("MvcMaps.BingMapSL.js"));

            //this.ContainerControl = new HtmlGenericControl("iframe");
        }

        public BingMapSL AppId(string appId)
        {
            this.CustomInitializerOptions.Append("appid", "'" + appId + "'");
            return this;
        }

        protected override object ResolveMapType()
        {
            string strMapType = null;
            switch (this._MapType)
            {
                case MvcMaps.MapType.Aerial:
                    strMapType = "'Aerial'";
                    break;
                case MvcMaps.MapType.Hybrid:
                    strMapType = "'AerialWithLabels'";
                    break;
                //case MvcMaps.MapType.Terrain:
                //    strMapType = "'Road'";
                //    break;
                default:
                    strMapType = "'Road'";
                    break;
            }
            return strMapType;
        }
    }
}
