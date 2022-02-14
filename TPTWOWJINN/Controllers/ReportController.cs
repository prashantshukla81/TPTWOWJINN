using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MDYOS.Models;
using System.Data;
using System.Web.Script.Serialization;
using TPTWOWJINN.Authorization;

namespace TPTWOWJINN.Controllers
{
    [AuthorizationFilter]
    public class ReportController : Controller
    {
        LogicClass objL = new LogicClass();
        PropertyClass Objp = new PropertyClass();
        // GET: Report
        public ActionResult Index()
        {
            Objp.Action = "1";
            DataSet ds = objL.showoplaceorderrecord("dbo.orderreport", Objp);
            return View(ds);
        }
        public ActionResult venderIndex()
        {
            Objp.Action = "1";
            Objp.EmailAddress = Session["UserName"].ToString();
            DataSet ds = objL.showoplaceorderrecord("dbo.orderreport", Objp);
            return View(ds);
        }

        public JsonResult Searchorder(string FromDate, string ToDate, string OrderId)
        {
            Objp.OrderId = !string.IsNullOrEmpty(OrderId) ? OrderId : null;
            Objp.fromdate = !string.IsNullOrEmpty(FromDate) ? Convert.ToDateTime(FromDate).ToString("dd-MMM-yyyy") : null;
            Objp.todate = !string.IsNullOrEmpty(ToDate) ? Convert.ToDateTime(ToDate).ToString("dd-MMM-yyyy") : null;
            Objp.Action = "2";

            Objp.EmailAddress = Session["UserName"].ToString();
            Objp.dt = objL.Filteration("[dbo].[orderreport]", Objp);
            return Json(Objp, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Searchorderadmin(string FromDate, string ToDate, string OrderId)
        {
            Objp.OrderId = !string.IsNullOrEmpty(OrderId) ? OrderId : null;
            Objp.fromdate = !string.IsNullOrEmpty(FromDate) ? Convert.ToDateTime(FromDate).ToString("dd-MMM-yyyy") : null;
            Objp.todate = !string.IsNullOrEmpty(ToDate) ? Convert.ToDateTime(ToDate).ToString("dd-MMM-yyyy") : null;
            Objp.Action = "3";

            // Objp.EmailAddress = Session["UserName"].ToString();
            Objp.dt = objL.Filteration("[dbo].[orderreport]", Objp);

            return Json(Objp, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Contactuslist()
        {
            Objp.Action = "2";
            Objp.dt= objL.contactus("dbo.PROCCONTACTUS", Objp);
            return View(Objp);
        }
    }
}