using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TPTWOWJINN.Authorization;
using MDYOS.Models;

namespace MDYOS.Controllers
{
    [AuthorizationFilter]
    public class AdminDashboardController : Controller
    {
        LogicClass objL = new LogicClass();
        // GET: AdminDashboard
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Allcustomer()
        {
            PropertyClass objp = new PropertyClass();
            objp.Action = "1";
            objp.dt = objL.CustomerDetails("[dbo].procallcustomer", objp);
            return View(objp);
        }

        public JsonResult DeleteCustomerdata(PropertyClass objp)
        {
            objp.dt = objp.dt = objL.CustomerDetails("[dbo].procallcustomer", objp);
            return Json(JsonRequestBehavior.AllowGet);


        }


    }
}