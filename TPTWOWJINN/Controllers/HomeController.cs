using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MDYOS.Models;

namespace MDYOS.Controllers
{
    public class HomeController : Controller
    {
        PropertyClass objp = new PropertyClass();
        LogicClass objL = new LogicClass();
        // GET: Home
        public ActionResult Index()
        {
            try
            {
                objp.Action = "6";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        public ActionResult _pBindWebMenu()
        {
            try
            {
                objp.Action = "7";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
        public ActionResult _pBindMobileMenu()
        {
            try
            {
                //objp.Action = "7";
                //objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }


        #region New Layout

        public ActionResult HomePage()
        {
            try
            {
                objp.Action = "2";
                objp.dt = objL.GetProductListing(objp, "proc_GetListedProduct");
                objp.Action = "1";
                objp.dt1 = objL.BindHomePage(objp, "proc_BindHomePoge");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
        public ActionResult _pBindWebCategory()
        {
            try
            {
                objp.Action = "6";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        public ActionResult _pBindMobCategory()
        {
            try
            {
                objp.Action = "6";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        #endregion

    }
}