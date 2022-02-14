using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MDYOS.Models;
using System.Web.Script.Serialization;
using TPTWOWJINN.Authorization;

namespace TPTWOWJINN.Controllers
{
    public class VenderController : Controller
    {
        // GET: Vender
        PropertyClass objp = new PropertyClass();
        LogicClass objL = new LogicClass();
        [AuthorizationFilter]
        public ActionResult Index()
        {
            try
            {
                objp.Action = "1";
                objp.CustomerId = Session["UserName"].ToString();
                objp.dt = objL.GetProductListingVenderWise(objp, "dbo.ProcgetListedproductVenderwise");
            }
            catch (Exception ex)
            {
            }
            return View(objp);
        }

        [AuthorizationFilter]
        public ActionResult AddProductDetails()
        {

            ViewBag.ddlRootCat = PropertyClass.BindDDL(objL.BindRootCategoryDll());
            ViewBag.ddlCat = PropertyClass.BindDDL(objL.BindCategoryDll());
            ViewBag.ddlSubCat = PropertyClass.BindDDL(objL.BindSubCategoryDll());
            ViewBag.ddlRetailers = PropertyClass.BindDDL(objL.BindRetailers());

            ViewBag.ddlUnit = PropertyClass.BindDDL(objL.BindUnitDLL());
            return View(objp); ;
        }

    }
}