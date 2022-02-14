using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MDYOS.Models;
using System.Data;
using TPTWOWJINN.Authorization;

namespace MDYOS.Controllers
{
    // [AuthorizationFilter]
    public class AccountController : Controller
    {
        LogicClass objL = new LogicClass();
        PropertyClass objp = new PropertyClass();
        // GET: Account
        public ActionResult AdminLogin()
        {
            return View();
        }
        public JsonResult GetLogInDetails(PropertyClass p)
        {
            try
            {
                p.Action = "1";
                DataTable dt = objL.getLoginDetails(p, "proc_GetLoginDetails");
                ViewBag.data = dt.Rows[0]["RoleType"].ToString();
                if (dt != null && dt.Rows.Count > 0)
                {
                    Session["BranchCode"] = dt.Rows[0]["BranchCode"].ToString();
                    Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                    Session["Name"] = dt.Rows[0]["Name"].ToString();
                    Session["Role"] = dt.Rows[0]["RoleType"].ToString();
                    if (Session["Role"].ToString() == "1")
                    {
                        objp.strId = "1";
                    }
                    else if (Session["Role"].ToString() == "2")
                    {
                        objp.strId = "2";
                    }
                    else if (Session["Role"].ToString() == "4")
                    {
                        objp.strId = "4";

                    }

                    else if (Session["Role"].ToString() == "0")
                    {
                        objp.strId = "0";
                    }
                    else
                    {
                        objp.strId = "0";
                    }
                }
                else
                {
                    objp.strId = "0";
                }
            }
            catch (Exception ex)
            {
                objp.strId = "0";
            }
            return Json(objp, JsonRequestBehavior.AllowGet);

        }
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            FormsAuthentication.SignOut();
            return RedirectToAction("AdminLogin", "Account");
        }


        public JsonResult RetailerActivationandBlock(string Retid,string Action)
        {
            objL.RetailerSActivationandBlock("[dbo].Activeproc", Retid, Action);
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}