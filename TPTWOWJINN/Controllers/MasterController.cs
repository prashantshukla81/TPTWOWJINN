using MDYOS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using TPTWOWJINN.Authorization;
namespace MDYOS.Controllers
{
    [AuthorizationFilter]
    public class MasterController : Controller
    {
        PropertyClass objp = new PropertyClass();
        LogicClass objL = new LogicClass();
        // GET: Master
        public ActionResult Index()
        {
            return View();
        }
        #region city
        public ActionResult CityMaster()
        {
            try
            {
                ViewBag.StateList = PropertyClass.BindDDL(objL.BindStateDropDown());
                objp.Action = "2";
                objp.dt = objL.DistrictMaster(objp, "proc_DistrictMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        public JsonResult InsertUpdateDistrictMaster(PropertyClass p)
        {
            try
            {
                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.DistrictMaster(p, "proc_DistrictMaster");
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
        public JsonResult GetDistrictForEdit(string StateId)
        {
            try
            {
                objp.Action = "3";
                objp.RespoCode = StateId.Trim();
                DataTable dt = objL.DistrictMaster(objp, "proc_DistrictMaster");
                if (dt != null && dt.Rows.Count > 0)
                {
                    objp.RespoCode = dt.Rows[0]["Cityid"].ToString();
                    objp.StateName = dt.Rows[0]["City"].ToString();
                    objp.StCode = dt.Rows[0]["Stateid"].ToString();

                }
            }
            catch (Exception ex)
            {

            }
            return Json(objp, JsonRequestBehavior.AllowGet);
        }

        #endregion city
        #region zone
        public ActionResult ZoneMaster()
        {
            try
            {
                ViewBag.CityList = PropertyClass.BindDDL(objL.BindCityDropDown());
                objp.Action = "2";
                objp.dt = objL.ZoneMaster(objp, "proc_ZoneMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        public JsonResult InsertUpdateZoneMaster(PropertyClass p)
        {
            try
            {
                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.ZoneMaster(p, "proc_ZoneMaster");
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
        public JsonResult GetzoneForEdit(string StateId)
        {
            try
            {
                objp.Action = "3";
                objp.RespoCode = StateId.Trim();
                DataTable dt = objL.ZoneMaster(objp, "proc_ZoneMaster");
                if (dt != null && dt.Rows.Count > 0)
                {
                    objp.RespoCode = dt.Rows[0]["SrNo"].ToString();
                    objp.StateName = dt.Rows[0]["CityId"].ToString();
                    objp.StCode = dt.Rows[0]["AreaName"].ToString();
                    objp.PinCode = dt.Rows[0]["Pincode"].ToString();

                }
            }
            catch (Exception ex)
            {

            }
            return Json(objp, JsonRequestBehavior.AllowGet);
        }
        #endregion zone

        #region Rootcategory
        public ActionResult Rootcategory()
        {
            try
            {
                objp.Action = "2";
                objp.dt = objL.RootCategoryMaster(objp, "proc_RootCategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }


        public JsonResult InsertUpdateRootCategoryMaster(PropertyClass p)
        {
            try
            {
                HttpPostedFileBase file = Request.Files["KycDoc"];
                if (file != null)
                {
                    string pic = System.IO.Path.GetFileName(file.FileName);
                    string path = System.IO.Path.Combine(Server.MapPath("~/RootCategorydoc"), pic);
                    // file is uploaded
                    file.SaveAs(path);

                    //string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                    //string picExt = System.IO.Path.GetExtension(file.FileName);
                    //string fName = "Cat_" + DateTime.Today.Ticks.ToString() + picExt;
                    //string path = System.IO.Path.Combine(Server.MapPath("~/RootCategorydoc"), fName);
                    //file.SaveAs(path);
                    p.KycDoc = file.FileName;
                }

                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.RootCategoryMaster(p, "proc_RootCategoryMaster");
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



        public JsonResult DeleteSubcategory(string action, string RespoCode)
        {

            objp.RespoCode = RespoCode;
            objp.Action = action;
            objL.DeleteRootcategoty(objp, "[dbo].[proc_SubCategoryMaster]");
            return Json(JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetrootcategoryforEdit(PropertyClass objp)
        {
            DataTable dt = objL.getrootcategoryedit(objp, "[dbo].[proc_RootCategoryMaster]");
            if (dt.Rows.Count > 0 && dt != null)
            {
                objp.RespoCode = dt.Rows[0]["SrNo"].ToString();
                objp.RoleName = dt.Rows[0]["RootCategoryName"].ToString();
                objp.Slugname = dt.Rows[0]["SlugName"].ToString();
                return Json(objp, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(objp, JsonRequestBehavior.AllowGet);
            }



        }


        #endregion Rootcategory
        public ActionResult Category()
        {
            try
            {
                ViewBag.ddlrcList = PropertyClass.BindDDL(objL.BindrcDropDown());
                objp.Action = "2";
                objp.dt = objL.CategoryMaster(objp, "proc_CategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
        public JsonResult InsertUpdateCategoryMaster(PropertyClass p)
        {
            try
            {
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase file = Request.Files[0];
                    if (file != null)
                    {
                        string pic = System.IO.Path.GetFileName(file.FileName);
                        string path = System.IO.Path.Combine(Server.MapPath("~/categorydoc"), pic);
                        // file is uploaded
                        file.SaveAs(path);
                        //string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                        //string picExt = System.IO.Path.GetExtension(file.FileName);
                        //string fName = "Cat_" + DateTime.Today.Ticks.ToString() + picExt;
                        //string path = System.IO.Path.Combine(Server.MapPath("~/categorydoc"), fName);
                        //file.SaveAs(path);
                        p.KycDoc = file.FileName;
                    }
                }


                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.CategoryMaster(p, "proc_CategoryMaster");
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

        public JsonResult GetcatForEdit(string Action, string id)
        {
            objp.Action = Action;
            objp.RespoCode = id;
            DataTable dt = objL.Getcategoryforedit(objp, "[dbo].[proc_CategoryMaster]");
            if (dt.Rows.Count > 0 && dt != null)
            {
                objp.RespoCode = dt.Rows[0]["SrNo"].ToString();
                objp.CategoryId = dt.Rows[0]["CategoryName"].ToString();
                objp.Slugname = dt.Rows[0]["SlugName"].ToString();
                objp.Rootcatid = dt.Rows[0]["RootCategoryId"].ToString();
            }
            return Json(objp, JsonRequestBehavior.AllowGet);

        }
        public ActionResult SubCategory()
        {
            try
            {
                ViewBag.ddlcList = PropertyClass.BindDDL(objL.BindcDropDown());
                objp.Action = "2";
                objp.dt = objL.subCategoryMaster(objp, "proc_SubCategoryMaster");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }
        public JsonResult InsertUpdateSubCategoryMaster(PropertyClass p)
        {
            p.SSName = "";
            try
            {
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase file = Request.Files[0];
                    if (file != null)
                    {
                        string pic = System.IO.Path.GetFileName(file.FileName);
                        string path = System.IO.Path.Combine(Server.MapPath("~/Subcategorydoc"), pic);
                        // file is uploaded
                        file.SaveAs(path);

                        //string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                        //string picExt = System.IO.Path.GetExtension(file.FileName);
                        //string fName = "Cat_" + DateTime.Today.Ticks.ToString() + picExt;
                        //string path = System.IO.Path.Combine(Server.MapPath("~/Subcategorydoc"), fName);
                        //file.SaveAs(path);
                        p.KycDoc = file.FileName;
                    }
                }

                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.subCategoryMaster(p, "proc_SubCategoryMaster");
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
        public JsonResult GetsubcatForEdit(string StateId)
        {
            try
            {
                objp.Action = "3";
                objp.RespoCode = StateId.Trim();
                DataTable dt = objL.subCategoryMaster(objp, "proc_SubCategoryMaster");
                if (dt != null && dt.Rows.Count > 0)
                {
                    objp.RespoCode = dt.Rows[0]["SrNo"].ToString();
                    objp.StateName = dt.Rows[0]["SubCategoryName"].ToString();
                    objp.StCode = dt.Rows[0]["SlugName"].ToString();
                    objp.KycDoc = dt.Rows[0]["Cat_Image"].ToString();
                    objp.CategoryId = dt.Rows[0]["CategoryId"].ToString();

                }
            }
            catch (Exception ex)
            {

            }
            return Json(objp, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ManageourPartners()
        {
            return View();

        }
        public JsonResult Insertupdatepartner(PropertyClass Objp)
        {
            return Json("true", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logo()
        {
            objp.Action = "2";
            objp.dt = objL.managegiffile("[dbo].procmanagegif", objp);
            return View(objp);

        }
        public JsonResult gifmaster(PropertyClass p)
        {
            HttpPostedFileBase file = Request.Files["KycDoc"];
            if (file != null)
            {
                string pic = System.IO.Path.GetFileName(file.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/GIFIMAGE"), pic);
                // file is uploaded
                file.SaveAs(path);
                //string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                //string picExt = System.IO.Path.GetExtension(file.FileName);
                //string fName = "Root_" + DateTime.Today.Ticks.ToString() + picExt;
                //string path = System.IO.Path.Combine(Server.MapPath("~/GIFIMAGE"), fName);
                //file.SaveAs(path);
                p.KycDoc = file.FileName;
            }

            DataTable dt = objL.managegiffile("[dbo].procmanagegif", p);



            return Json(p, JsonRequestBehavior.AllowGet);
        }//getmanagegiffile


        public JsonResult getmanagegiff(PropertyClass p)
        {

            DataTable dt = objL.managegiffile("[dbo].procmanagegif", p);


            if (dt.Rows.Count > 0)
            {
                p.StateName = dt.Rows[0]["logoname"].ToString();
                p.strId = dt.Rows[0]["id"].ToString();
            }


            return Json(p, JsonRequestBehavior.AllowGet);
        }//getmanagegiff

        public ActionResult VenderZone()
        {
            ViewBag.venderlist = PropertyClass.BindDDL(objL.BindVenders());
            objp.Action = "2";
            objp.dt = objL.insertupdateposation("procvenderposition", objp);
            return View(objp);

        }

        public JsonResult insertupdatevenderposation(PropertyClass objp)
        {
            try
            {
                objp.dt = objL.insertupdateposation("procvenderposition", objp);
                return Json(objp, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public JsonResult getrecordforupdatevenderposation(PropertyClass objp)
        {
            try
            {
                DataTable dt = objL.insertupdateposation("procvenderposition", objp);
                if (dt.Rows.Count > 0 && dt != null)
                {
                    objp.venderid = dt.Rows[0]["vendername"].ToString();
                    objp.posation = dt.Rows[0]["venderposation"].ToString();
                    objp.RespoCode = dt.Rows[0]["id"].ToString();
                }
                return Json(objp, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public ActionResult ManageBanner()
        {
            return View();

        }

        public JsonResult InsertUpdateManageBannerMaster(PropertyClass Objp)
        {
            HttpPostedFileBase file = Request.Files["BannerImage"];
            if (file != null)
            {
                string Filename = System.IO.Path.GetFileName(file.FileName);

            }
            return Json(JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddOfferMaster()
        {
            OfferProperty obj = new OfferProperty();
            obj.Action = "2";
            obj.dt = objL.OfferMasterInsertUpdate("[dbo].Procoffermaster", obj);
            return View(obj);
        }

        public JsonResult InsertaUpdateOfferMaster(OfferProperty obj)
        {
            try
            {
                HttpPostedFileBase file = Request.Files["offerimage"];
                if (file != null)
                {
                    var filename = System.IO.Path.GetFileName(file.FileName);

                    string Fname = "Offer" + obj.offername + DateTime.Today.Ticks.ToString() + filename;
                    string path = System.IO.Path.Combine(Server.MapPath("~/OfferImage"), Fname);
                    file.SaveAs(path);
                    obj.offerimage = Fname;

                }
                DataTable dt = objL.OfferMasterInsertUpdate("[dbo].Procoffermaster", obj);
            }
            catch (Exception ex)
            {

                throw;
            }
            return Json(JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetOfferMasterForEdit(OfferProperty obj)
        {
            obj.Action = "3";
            DataTable dt = objL.OfferMasterInsertUpdate("[dbo].Procoffermaster", obj);
            if (dt != null && dt.Rows.Count > 0)
            {
                obj.offername = dt.Rows[0]["OfferName"].ToString();
                obj.Id = dt.Rows[0]["ID"].ToString();
            }
            return Json(obj, JsonRequestBehavior.AllowGet);
        }
    }
}