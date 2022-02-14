using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using MDYOS.Models;
using TPTWOWJINN.Models;
using System.Web.Security;
using TPTWOWJINN.Authorization;

namespace TPTWOWJINN.Controllers
{

    public class WebController : Controller
    {

        LogicClass objL = new LogicClass();
        PropertyClass objp = new PropertyClass();
        // GET: Web
        public ActionResult Index()
        {
            string Action = "1";
            DataSet ds = objL.showindexrecord("dbo.procshowindex", objp, Action);
            if (ds.Tables[0] != null)
            {return View(ds);
            }
            else
            {
                return View();
            }

        }
        public ActionResult VenderRegistration()
        {
            ViewBag.Zone = PropertyClass.BindDDL(objL.Bindzone());
            return View();
        }
        //PRODUCTS
        public ActionResult ProductsCategoryWise(string value)
        {
            objp.catid = value;
            objp.Action = "1";
            return View();
        }
        public ActionResult CheckoutProduct()
        {
            if (Session["UserName"] != null)
            {
                objp.Action = "7";
                objp.RespoCode = Session["UserName"].ToString();
                DataSet ds = objL.Checkout("[dbo].[proc_AddToCart]", objp);
                if (ds.Tables != null)
                {
                    return View(ds);
                }
            }


            return RedirectToAction("Registrationform", "Customer");

        }

        public ActionResult Contactus()
        {
            return View();
        }
        public JsonResult InsertContactus(string name, string email, string mobile, string comment)
        {
            objp.name = name;
            objp.EmailAddress = email;
            objp.mobile = mobile;
            objp.MonthName = comment;
            objp.Action = "1";
            DataTable dt = objL.contactus("dbo.PROCCONTACTUS", objp);
            if (dt.Rows.Count > 0 && dt != null)
            {
                objp.msg = dt.Rows[0]["msg"].ToString();
            }
            return Json(objp, JsonRequestBehavior.AllowGet);
        }


        public ActionResult MyAccount(string id)
        {
            if (Session["UserName"] != null)
            {
                objp.Action = "1";
                DataSet ds = objL.Showsingledetailsproduct("dbo.procordercustomerwise", objp, id);
                return View(ds);
            }
            else
            {
                return RedirectToAction("Registrationform", "Customer");
            }
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Web");
        }

        public ActionResult franchisebenefits()
        {
            return View();
        }
        public ActionResult Bestseller()
        {
            objp.dt = objL.GetBestSeller(objp, "[dbo].ProcBestSeller");
            return View(objp);
        }

        public ActionResult P_Search()
        {
            try
            {
                objp.Action = "8";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
                return View(objp);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult PartialFormodal()
        {
            objp.Action = "2";
            objp.dt = objL.getarea(objp, "[dbo].[proc_ZoneMaster]");
            return View(objp);
        }

        public JsonResult DeleteCheckoutproduct(string action, string srno, string CustomerCode)
        {
            objp.Action = action;
            objp.productid = srno;
            objp.CustomerId = CustomerCode;
            objL.Deletecheckout("[dbo].[proc_AddToCart]", objp);
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult IItemName(string Search)
        {
            objp.Search = Search;
            ViewBag.SearchList = PropertyClass.BindDDL(objL.BindVenders());

            objp.dt = objL.GetSearch("GetSearchProcduct", objp);
            return Json(objp.dt, JsonRequestBehavior.AllowGet);

        }

        public ActionResult OverView()
        {
            return View();

        }

        public ActionResult PrivacyandPolicy()
        {
            return View();

        }
        public ActionResult Savelocation(string value)
        {
            Session["location"] = value;
            return RedirectToAction("Index");
        }


        public JsonResult Searchdata(string value)
        {
            PropertyClass objp = new PropertyClass();
            string Action = "1";
            objp.dt = objL.GetAutocompletedata(objp, "[dbo].getsearchauto", Action, value);
            string[] arr = new string[objp.dt.Rows.Count];
            for (int i = 0; i < objp.dt.Rows.Count; i++)
            {
                arr[i] = objp.dt.Rows[i]["ProductTitle"].ToString();
            }
            return Json(arr, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FiterProduct(string text)
        {
            objp.catid = text;
            objp.Action = "2";
            objp.dt = objL.getfilterdata(objp, "[dbo].getsearchauto");
            return View(objp);
        }



    }
}