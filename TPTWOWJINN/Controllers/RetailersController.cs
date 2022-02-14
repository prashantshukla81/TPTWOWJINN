using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MDYOS.Models;

namespace MDYOS.Controllers
{
    public class RetailersController : Controller
    {
        PropertyClass objp = new PropertyClass();
        LogicClass objL = new LogicClass();
        // GET: Retailers
        public ActionResult ManageRetailers(string Retailerid)
        {
            if (!string.IsNullOrEmpty(Retailerid))
            {
                objp.Action = "4";
                objp.RespoCode = Retailerid.ToString();
                objp.dt = objL.GetRetailersDetails(objp, "tbl_GetRetailersList");
                objp.DepartmentName = objp.dt.Rows[0]["BusinessName"].ToString();
                objp.AccName = objp.dt.Rows[0]["RetailerName"].ToString();
                objp.mobile = objp.dt.Rows[0]["MobileNo"].ToString();
                objp.modelno = objp.dt.Rows[0]["MobileNo"].ToString();
                objp.EmailAddress = objp.dt.Rows[0]["EmailAddress"].ToString();
                objp.Address = objp.dt.Rows[0]["Address"].ToString();
                objp.kycdocumentno = objp.dt.Rows[0]["KYCDocumentNo"].ToString();
                objp.PanNo = objp.dt.Rows[0]["PANNo"].ToString();
                objp.AadhaarNo = objp.dt.Rows[0]["TANNo"].ToString();
                objp.BanKAccName = objp.dt.Rows[0]["BankAccName"].ToString();
                objp.accountno = objp.dt.Rows[0]["AccountNumber"].ToString();
                objp.Bankname = objp.dt.Rows[0]["BankName"].ToString();
                objp.ifsccode = objp.dt.Rows[0]["IFSCCode"].ToString();
                ViewBag.ddlrcList = PropertyClass.BindDDL(objL.BindZone());

                return View(objp);
            }

            ViewBag.ddlrcList = PropertyClass.BindDDL(objL.BindZone());
            return View(objp);
        }
        public JsonResult InsertUpdateCompanyDetails(PropertyClass p)
        {
            try
            {
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase file = Request.Files[0];
                    if (file != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                        string picExt = System.IO.Path.GetExtension(file.FileName);
                        string fName = "kyc_" + DateTime.Today.Ticks.ToString() + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/RetailerDocs"), fName);
                        file.SaveAs(path);
                        p.KycDoc = fName;
                    }
                }
                if (Request.Files.Count > 1)
                {
                    HttpPostedFileBase filepan = Request.Files[1];
                    if (filepan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filepan.FileName);
                        string picExt = System.IO.Path.GetExtension(filepan.FileName);
                        string fName = "pan_" + DateTime.Today.Ticks.ToString() + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/RetailerDocs"), fName);
                        filepan.SaveAs(path);
                        p.PanDoc = fName;
                    }
                }
                if (Request.Files.Count > 2)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "tan_" + DateTime.Today.Ticks.ToString() + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/RetailerDocs"), fName);
                        filetan.SaveAs(path);
                        p.TanDoc = fName;
                    }

                }




                DataTable dt = objL.InsertUpdateRetailers(p, "proc_InsertUpdateRetailers");
                if (dt != null && dt.Rows.Count > 0)
                {
                    objp.strId = dt.Rows[0]["id"].ToString();
                    objp.msg = dt.Rows[0]["msg"].ToString();
                }
                else
                {
                    objp.strId = "0";
                    objp.msg = "Invalid Input.";
                }
            }
            catch (Exception ex)
            {
                objp.strId = "0";
                objp.msg = ex.Message;
            }
            return Json(objp, JsonRequestBehavior.AllowGet);

        }
        public ActionResult AllRetailers()
        {
            try
            {
                objp.Action = "1";
                objp.dt = objL.GetRetailersDetails(objp, "tbl_GetRetailersList");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        public JsonResult GetRetailerProfile(string RetId)
        {
            try
            {
                objp.Action = "4";
                objp.RespoCode = RetId.Trim();
                DataTable dt = objL.GetRetailersDetails(objp, "tbl_GetRetailersList");
                if (dt != null && dt.Rows.Count > 0)
                {
                    objp.RespoCode = dt.Rows[0]["RetailerCode"].ToString();
                    objp.AccName = dt.Rows[0]["RetailerName"].ToString();
                    objp.ContactNo = dt.Rows[0]["MobileNo"].ToString();
                    objp.EmailAddress = dt.Rows[0]["EmailAddress"].ToString();
                    objp.Address = dt.Rows[0]["Address"].ToString();
                    objp.GroupName = dt.Rows[0]["BusinessName"].ToString();
                    objp.Status = dt.Rows[0]["AccountStatus"].ToString();
                    objp.mDate = dt.Rows[0]["CreateDate"].ToString();
                    objp.CardType = dt.Rows[0]["KYCDocumentType"].ToString();
                    objp.kycdocumentno = dt.Rows[0]["KYCDocumentNo"].ToString();
                    objp.KycDoc = dt.Rows[0]["KycDocFile"].ToString();
                    objp.PanNo = dt.Rows[0]["PANNo"].ToString();
                    objp.PanDoc = dt.Rows[0]["PanDoc"].ToString();
                    objp.TanNo = dt.Rows[0]["TANNo"].ToString();
                    objp.TanDoc = dt.Rows[0]["TANDoc"].ToString();
                    objp.BanKAccName = dt.Rows[0]["BankAccName"].ToString();
                    objp.accountno = dt.Rows[0]["AccountNumber"].ToString();
                    objp.Bankname = dt.Rows[0]["BankName"].ToString();
                    objp.ifsccode = dt.Rows[0]["IFSCCode"].ToString();

                }
            }
            catch (Exception ex)
            {

            }
            return Json(objp, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ActiveRetailersAccounts()
        {
            try
            {
                objp.Action = "2";
                objp.dt = objL.GetRetailersDetails(objp, "tbl_GetRetailersList");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
        public ActionResult BlockedRetailersAccount()
        {
            try
            {
                objp.Action = "3";
                objp.dt = objL.GetRetailersDetails(objp, "tbl_GetRetailersList");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
    }
}