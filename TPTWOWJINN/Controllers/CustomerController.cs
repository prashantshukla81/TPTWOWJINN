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

    public class CustomerController : Controller
    {
        LogicClass objL = new LogicClass();
        PropertyClass Objp = new PropertyClass();
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Registrationform()
        {
            return View();
        }
        public JsonResult customerRegistration(registration pr)
        {
            try
            {
                objL.custmer("[dbo].[proc_customerregistration]", pr);
                return Json(objL, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw;
            }

        }
        [AuthorizationFilter]
        public JsonResult Addtocart(string productid, string qty)
        {

            string customerid = "";
            if (Session["Name"] == null)
            {
                if (Request.Cookies["CustomerCode"] == null)
                {
                    HttpCookie myCookie = new HttpCookie("CustomerCode");

                    myCookie.Value = DateTime.Now.Ticks + Guid.NewGuid().ToString("N");
                    myCookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(myCookie);
                    customerid = myCookie.Value;
                }
                else
                {
                    customerid = Request.Cookies["CustomerCode"].Value.ToString();
                }
                Objp.Action = "1";
                Objp.RespoCode = customerid;
                Objp.productid = productid;
                Objp.qty = qty;
                objL.Addtocard("[dbo].[proc_AddToCart]", Objp);
            }
            else
            {
                if (Request.Cookies["CustomerCode"] == null)
                {
                    HttpCookie myCookie = new HttpCookie("CustomerCode");
                    myCookie.Value = DateTime.Now.Ticks + Guid.NewGuid().ToString("N");
                    myCookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(myCookie);
                    customerid = myCookie.Value;
                }
                else
                {
                    customerid = Request.Cookies["CustomerCode"].Value.ToString();
                }
                Objp.Action = "4";
                Objp.RespoCode = customerid;
                Objp.CustomerId = Convert.ToString(Session["UserName"]);
                Objp.productid = productid;

                Objp.qty = qty;
                objL.Addtocard("[dbo].[proc_AddToCart]", Objp);

            }

            return Json(Objp, JsonRequestBehavior.AllowGet);
        }

        public ActionResult P_Addtocard()

        {
            string CustomerId = "";
            if (Session["UserName"] == null)
            {
                if (Request.Cookies["CustomerCode"] == null)
                {
                    HttpCookie myCookie = new HttpCookie("CustomerCode");
                    myCookie.Value = DateTime.Now.Ticks + Guid.NewGuid().ToString("N");
                    myCookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(myCookie);
                    CustomerId = myCookie.Value;
                }
                else
                {
                    CustomerId = Request.Cookies["CustomerCode"].Value.ToString();
                }
                Objp.Action = "2";
                Objp.RespoCode = CustomerId;
                Objp.dt = objL.Addtocard("proc_AddToCart", Objp);

                decimal TotalAmt = 0;
                int TotCount = 0;
                TotCount = Objp.dt.Rows.Count;

                if (Objp.dt != null && Objp.dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in Objp.dt.Rows)
                    {
                        TotalAmt += !string.IsNullOrEmpty(dr["SaleRate"].ToString()) ? Convert.ToDecimal(dr["SaleRate"]) : 0;
                    }
                }
                Objp.PayableAmt = TotalAmt;
                Objp.MemberCount = TotCount.ToString();
            }
            else
            {
                if (Request.Cookies["CustomerCode"] == null)
                {
                    HttpCookie myCookie = new HttpCookie("CustomerCode");
                    myCookie.Value = DateTime.Now.Ticks + Guid.NewGuid().ToString("N");
                    myCookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(myCookie);
                    CustomerId = myCookie.Value;
                }
                else
                {
                    CustomerId = Request.Cookies["CustomerCode"].Value.ToString();
                }
                Objp.Action = "5";
                Objp.RespoCode = CustomerId;
                Objp.CustomerId = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.Addtocard("proc_AddToCart", Objp);
                if (dt != null && dt.Rows.Count > 0)
                {
                    Objp.strId = dt.Rows[0]["id"].ToString();
                }
                else
                {
                    Objp.strId = "0";
                }

                Objp.Action = "7";
                Objp.AccCode = Convert.ToString(Session["UserName"]);
                Objp.dt = objL.Addtocard("proc_AddToCart", Objp);

                decimal TotalAmt = 0;
                int TotCount = 0;
                TotCount = Objp.dt.Rows.Count;

                if (Objp.dt != null && Objp.dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in Objp.dt.Rows)
                    {
                        TotalAmt += !string.IsNullOrEmpty(dr["SaleRate"].ToString()) ? Convert.ToDecimal(dr["SaleRate"]) : 0;
                    }
                }
                Objp.PayableAmt = TotalAmt;
                Objp.MemberCount = TotCount.ToString();
            }

            return View(Objp);
        }

        public JsonResult Updatecart(updatecheckputproducrs Objps)
        {
            DataTable dt = objL.Updtaecheckoutcart("ProcupdateCart", Objps);
            if (dt.Rows.Count > 0 && dt != null)
            {
                Objp.qty = dt.Rows[0]["Quantity"].ToString();
                Objp.RoleName = dt.Rows[0]["discount"].ToString();
                Objp.Servicetype = dt.Rows[0]["totalamt"].ToString();

            }
            return Json(Objp, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Insertcheckoutaddress(PropertyClass objpr)
        {
            DataTable dt = objL.Insertcheckoutaddress("proc_customerAddress", objpr);
            return Json(dt, JsonRequestBehavior.AllowGet);
        }

        public JsonResult finalPlaceorder(PropertyClass obj)
        {

            DataTable dtItems = new DataTable();
            dtItems.Columns.Add("ProductId");
            dtItems.Columns.Add("unitrate");
            dtItems.Columns.Add("Qty");
            dtItems.Columns.Add("SaleRate");


            if (!string.IsNullOrEmpty(obj.VariationList))
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                List<Placeorder> result = js.Deserialize<List<Placeorder>>(obj.VariationList);
                foreach (var item in result)
                {
                    dtItems.Rows.Add(item.ProductId, item.unitrate, !string.IsNullOrEmpty(item.Qty) ? Convert.ToDecimal(item.Qty) : 0, !string.IsNullOrEmpty(item.SaleRate) ? Convert.ToDecimal(item.SaleRate) : 0);
                }
            }
            DataTable dt = objL.placeorderlist("dbo.procplaceorder", obj, dtItems);
            if (dt.Rows.Count > 0)
            {
                obj.msg = dt.Rows[0]["msg"].ToString();
            }
            return Json(obj, JsonRequestBehavior.AllowGet);
        }

        //public ActionResult Profile()
        //{
        //    return View();
        //}

        public ActionResult Custmerlist()
        {
            Objp.Action = "1";
            Objp.dt = objL.Customerlist("dbo.poccustomerlist", Objp);
            return View(Objp);
        }
        public JsonResult updatepropfile(string mobile, string Action, string name, string email)
        {
            Objp.EmailAddress = email;
            Objp.Action = Action;
            Objp.name = name;
            Objp.UserName = mobile;
            DataTable dt = objL.UpdatecustomerDetails("[dbo].[procordercustomerwise]", Objp);
            return Json(JsonRequestBehavior.AllowGet);
        }
        public class Placeorder
        {
            public string Customerid { get; set; }
            public string ProductId { get; set; }
            public string Qty { get; set; }
            public string SaleRate { get; set; }
            public string unitrate { get; set; }

        }
    }
}