/*
* MvcMaps - A Unified Mapping API for ASP.NET MVC
* Copyright (c) 2009 Chris Pietschmann
* http://mvcmaps.codeplex.com
* Licensed under the Microsoft Reciprocal License (Ms-RL)
* http://mvcmaps.codeplex.com/license
*/
using System.Linq;
using System.Web.Mvc;
using System.Xml.Linq;
using MvcMaps;
using System.Collections.Generic;

namespace InteractiveSDKWebsite.Controllers
{
    public class DynamicMapController : Controller
    {
        //
        // GET: /DynamicMap/
        public ActionResult Index() {
            return View();
        }

        public ActionResult DataLoaded()
        {
            return View();
        }

        public ActionResult DisplayData()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SchoolDistricts(double minLat, double maxLat, double minLng, double maxLng)
        {
            // Query and Get all School Districts within the passed in "Map View".
            var doc = XDocument.Load(Server.MapPath("~/App_Data/WISchoolDistricts.xml"));
            var schooldistricts = (from d in doc.Element("schooldistricts").Elements("schooldistrict")
                            where double.Parse(d.Attribute("latitude").Value) >= minLat
                            && double.Parse(d.Attribute("latitude").Value) <= maxLat
                            && double.Parse(d.Attribute("longitude").Value) >= minLng
                            && double.Parse(d.Attribute("longitude").Value) <= maxLng
                            select d
                        );

            // Generate "Pushpin" objects for each School District to be Plotted on the Map.
            var pushpins = (from d in schooldistricts
                            select(new Pushpin(double.Parse(d.Attribute("latitude").Value), double.Parse(d.Attribute("longitude").Value))
                            {
                                Title = d.Attribute("name").Value,
                                Description = d.Attribute("address").Value
                            }));



            var polygons = new List<Polygon>();
            polygons.Add(new Polygon(new List<LatLng>(){
                    new LatLng(47, -120),
                    new LatLng(47, -110),
                    new LatLng(35, -110),
                    new LatLng(35, -120),
                    new LatLng(47, -120)
                }));
            polygons.Add(new Polygon(new List<LatLng>(){
                    new LatLng(42, -104),
                    new LatLng(44, -101),
                    new LatLng(44, -95),
                    new LatLng(42, -92),
                    new LatLng(38, -92),
                    new LatLng(36, -95),
                    new LatLng(36, -101),
                    new LatLng(38, -104),
                    new LatLng(42, -104)
                }) {
                    FillColor = "#11FF11",
                    LineColor = "#FF0000"
                });
            polygons.Add(new Polygon(new List<LatLng>(){
                    new LatLng(37, -88),
                    new LatLng(37, -76),
                    new LatLng(44, -82),
                    new LatLng(37, -88)
                })
                {
                    FillColor = "#11FF11",
                    FillOpacity = 0.5,
                    LineColor = "#FF0000",
                    LineOpacity = 0.8
                });


            var polylines = new List<Polyline>();
            polylines.Add(new Polyline(new List<LatLng>() {
                        new LatLng(47, -110),
                        new LatLng(34, -120)
                    }) { LineColor = "#FFAAAA" });
            polylines.Add(new Polyline(new List<LatLng>() {
                        new LatLng(47, -90),
                        new LatLng(34, -100)
                    })
                    {
                        LineColor = "#11FF11",
                        LineWeight = 5
                    });
            polylines.Add(new Polyline(new List<LatLng>() {
                        new LatLng(47, -70),
                        new LatLng(34, -80)
                    })
                    {
                        LineColor = "#FF0000",
                        LineWeight = 8,
                        LineOpacity = 0.5
                    });


            // Return a "MapDataResult" object that contains all the data that is to be Plotted on the Map.
            return new MapDataResult()
            {
                Pushpins = pushpins,
                Polygons = polygons,
                Polylines = polylines
            };
        }

    }
}
