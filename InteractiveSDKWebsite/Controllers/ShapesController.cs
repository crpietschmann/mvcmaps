using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace InteractiveSDKWebsite.Controllers
{
    public class ShapesController : Controller
    {
        //
        // GET: /Shapes/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Pushpin()
        {
            return View();
        }

        public ActionResult Polyline()
        {
            return View();
        }

        public ActionResult Polygon()
        {
            return View();
        }
    }
}
