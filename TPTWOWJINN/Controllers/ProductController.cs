using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MDYOS.Models;
using System.Web.Script.Serialization;
using TPTWOWJINN.Authorization;

namespace MDYOS.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        PropertyClass objp = new PropertyClass();
        LogicClass objL = new LogicClass();
        public ActionResult Index()
        {

            try
            {
                objp.Action = "3";
                objp.dt = objL.GetProductListing(objp, "proc_GetListedProduct");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        [AuthorizationFilter]
        public ActionResult AddNewProduct(string productid)
        {
            ViewBag.ddlRootCat = PropertyClass.BindDDL(objL.BindRootCategoryDll());
            ViewBag.ddlCat = PropertyClass.BindDDL(objL.BindCategoryDll());
            ViewBag.ddlSubCat = PropertyClass.BindDDL(objL.BindSubCategoryDll());
            ViewBag.ddlRetailers = PropertyClass.BindDDL(objL.BindRetailers());
            ViewBag.ddloffermaster = PropertyClass.BindDDL(objL.BindOfferMaster());
            ViewBag.ddlUnit = PropertyClass.BindDDL(objL.BindUnitDLL());
            if (!string.IsNullOrEmpty(productid))
            {
                objp.Action = "8";
                objp.productid = productid;
                objp.dt1 = objL.getlistedproductforedit(objp, "[dbo].[proc_GetListedProduct]");

                if (objp.dt1 != null && objp.dt1.Rows.Count > 0)
                {
                    objp.productid = objp.dt1.Rows[0]["ProductCode"].ToString();
                    objp.Title = objp.dt1.Rows[0]["ProductTitle"].ToString();
                    objp.Rootcatid = objp.dt1.Rows[0]["RootCategoryId"].ToString();
                    objp.txtpartnerlogo = objp.dt1.Rows[0]["RootCategoryName"].ToString();
                    objp.CategoryId = objp.dt1.Rows[0]["CategoryId"].ToString();
                    objp.SubCatId = objp.dt1.Rows[0]["SubCategoryId"].ToString();
                    objp.MRP = Convert.ToDecimal(objp.dt1.Rows[0]["ProductMRP"].ToString());
                    objp.SaleRate_Bulk = Convert.ToDecimal(objp.dt1.Rows[0]["SaleRate"].ToString());
                    objp.qty = objp.dt1.Rows[0]["CommQty"].ToString();
                    objp.Description = objp.dt1.Rows[0]["ProductDescription"].ToString();
                    objp.ImgPath1 = objp.dt1.Rows[0]["Path"].ToString();
                    objp.mDate = objp.dt1.Rows[0]["AddedDate"].ToString();
                    objp.Status = objp.dt1.Rows[0]["Status"].ToString();
                    objp.Isofferproduct = objp.dt1.Rows[0]["Isofferproduct"].ToString();
                    objp.offerproductid = objp.dt1.Rows[0]["offerproductid"].ToString();
                    objp.deliverycharge = objp.dt1.Rows[0]["deliverycharge"].ToString();
                    if (objp.dt1.Rows[0]["percentage"] != null && objp.dt1.Rows[0]["percentage"].ToString() != "")
                        objp.DiscAmt = Convert.ToDecimal(objp.dt1.Rows[0]["percentage"].ToString());
                    else
                        objp.DiscAmt = 0;
                    return View(objp);

                }

            }


            return View(objp);
        }

        [AuthorizationFilter]
        public JsonResult InsertUpdateCompanyDetails(PropertyClass p)
        {
            try
            {
                p.EntryBy = Session["UserName"].ToString();
                #region Image Insert
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase files = Request.Files[0];
                    if (files != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(files.FileName);
                        string picExt = System.IO.Path.GetExtension(files.FileName);
                        string fName = "mainImg_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        files.SaveAs(path);
                        p.PurchaseFile = fName;
                    }
                }
                if (Request.Files.Count > 1)
                {
                    HttpPostedFileBase filepan = Request.Files[1];
                    if (filepan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filepan.FileName);
                        string picExt = System.IO.Path.GetExtension(filepan.FileName);
                        string fName = "img1_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filepan.SaveAs(path);
                        p.ImgPath1 = fName;
                    }
                }
                if (Request.Files.Count > 2)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img2_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath2 = fName;
                    }

                }
                if (Request.Files.Count > 3)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img3_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath3 = fName;
                    }

                }
                if (Request.Files.Count > 4)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img4_" + DateTime.Today.Ticks.ToString() + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath4 = fName;
                    }

                }

                HttpPostedFileBase file = Request.Files["offerimage"];
                if (file != null)
                {
                    //OfferProductImage
                    var filename = System.IO.Path.GetFileName(file.FileName);
                    string fname = "OfferProduct" + DateTime.Today.Ticks.ToString() + filename;
                    string path = System.IO.Path.Combine(Server.MapPath("~/OfferProductImage"), fname);
                    file.SaveAs(path);
                    p.offerimage = fname;
                }
                #endregion

                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("VariationValue");
                dtItems.Columns.Add("UnitId");
                dtItems.Columns.Add("MRP");
                dtItems.Columns.Add("SaleRate");
                dtItems.Columns.Add("Qty");
                dtItems.Columns.Add("Param1");
                dtItems.Columns.Add("Param2");

                if (!string.IsNullOrEmpty(p.VariationList))
                {
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    List<VariationList> result = js.Deserialize<List<VariationList>>(p.VariationList);
                    foreach (var item in result)
                    {
                        dtItems.Rows.Add(item.VariationValue, item.UnitId, item.MRP, item.SaleRate, item.Qty, null, null);
                    }
                }
                DataTable dt = objL.InsertProductDetails(p, "proc_AddProduct", dtItems);
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
        [AuthorizationFilter]
        public JsonResult UpdateProductDetails(PropertyClass p)
        {
            try
            {
                p.EntryBy = Session["UserName"].ToString();


                DataTable dt = objL.UpdateProductDetails(p, "proc_AddProduct");
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

        [AuthorizationFilter]
        public JsonResult ManageProductListing(PropertyClass p)
        {
            try
            {

                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.ManageProduct(p, "proc_ManageProduct");
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
        [AuthorizationFilter]
        public JsonResult UpdateProductQuantity(PropertyClass p)
        {
            try
            {

                p.EntryBy = Convert.ToString(Session["UserName"]);
                DataTable dt = objL.UpdateProductQuantity(p, "proc_UpdateProductQuantity");
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

        [AuthorizationFilter]
        public ActionResult AddProductDetails()
        {
            ViewBag.ddlRootCat = PropertyClass.BindDDL(objL.BindRootCategoryDll());
            ViewBag.ddlCat = PropertyClass.BindDDL(objL.BindCategoryDll());
            ViewBag.ddlSubCat = PropertyClass.BindDDL(objL.BindSubCategoryDll());
            ViewBag.ddlRetailers = PropertyClass.BindDDL(objL.BindRetailers());

            ViewBag.ddlUnit = PropertyClass.BindDDL(objL.BindUnitDLL());
            return View(objp);
        }
        public ActionResult AssignProductstoRetailer()
        {
            ViewBag.ddlRootCat = PropertyClass.BindDDL(objL.BindRootCategoryDll());
            ViewBag.ddlCat = PropertyClass.BindDDL(objL.BindCategoryDll());
            ViewBag.ddlSubCat = PropertyClass.BindDDL(objL.BindSubCategoryDll());
            ViewBag.ddlRetailers = PropertyClass.BindDDL(objL.BindRetailers());
            ViewBag.ddlUnit = PropertyClass.BindDDL(objL.BindUnitDLL());
            return View(objp);
        }
        public ActionResult _pBindProducts(string RetailerCode)
        {
            try
            {
                objp.Action = "1";
                objp.AccCode = !string.IsNullOrEmpty(RetailerCode) ? RetailerCode : null;
                objp.dt = objL.BindProductForAssign(objp, "proc_ProductsForRetailerAssign");
            }
            catch (Exception ex)
            { }
            return View(objp);
        }

        [AuthorizationFilter]
        public JsonResult InsertProductAssignment(PropertyClass p)
        {
            try
            {
                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("ProductId");
                dtItems.Columns.Add("VariationId");
                dtItems.Columns.Add("MRP");
                dtItems.Columns.Add("SaleRate");
                dtItems.Columns.Add("AvlStock");
                dtItems.Columns.Add("Param1");

                if (!string.IsNullOrEmpty(p.VariationList))
                {
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    List<ProductList> result = js.Deserialize<List<ProductList>>(p.VariationList);
                    foreach (var item in result)
                    {
                        dtItems.Rows.Add(item.ProductId, item.VariationId, !string.IsNullOrEmpty(item.MRP) ? Convert.ToDecimal(item.MRP) : 0, !string.IsNullOrEmpty(item.SaleRate) ? Convert.ToDecimal(item.SaleRate) : 0, !string.IsNullOrEmpty(item.AvlStock) ? Convert.ToDecimal(item.AvlStock) : 0, null);
                    }
                }
                DataTable dt = objL.InsertProductAssignment(p, "proc_AssignProductToRetailer", dtItems);
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


        public ActionResult ProductDetails(string id)
        {
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    objp.Action = "2";
                    DataSet ds = objL.Showsingledetailsproduct("[dbo].[procshowindex]", objp, id);
                    if (ds.Tables[0] != null)
                    {
                        return View(ds);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return View();
        }

        public ActionResult offersproducts(string categoryid)

        {
            if (!string.IsNullOrEmpty(categoryid))
            {
                PropertyClass Objp = new PropertyClass();
                Objp.catid = categoryid;
                string Action = "2";
                DataSet ds = objL.showindexrecord("dbo.viewcategory", Objp, Action);
                return View(ds);
            }
            else
            {
                string Action = "1";
                DataSet ds = objL.showindexrecord("dbo.viewcategory", objp, Action);
                return View(ds);
            }



        }
        public ActionResult VenderProduct(string id)
        {
            if (!string.IsNullOrEmpty(id))

            {
                //objp.EntryBy = Session["UserName"].ToString();
                objp.Action = "3";
                DataSet ds = objL.Showsingledetailsproduct("[dbo].[procshowindex]", objp, id);
                return View(ds);
            }
            return View();
        }

        public ActionResult TermsandConditions()
        {
            return View();

        }

        public ActionResult _POrderItems(string orderid)
        {
            try
            {

                ViewBag.data = null;
                ViewBag.totalamt = null;
                objp.Action = "1";
                objp.OrderId = orderid;
                DataSet ds = objL.showoplaceorderrecord("dbo.orderreport", objp);

                if (!string.IsNullOrEmpty(orderid))
                {
                    ViewBag.data = ds.Tables[1].Rows[0]["orderId"].ToString();
                    ViewBag.date = ds.Tables[1].Rows[0]["Orderaccepted"].ToString();
                }
                //if(ds.Tables[2]!=null)
                //{Orderaccepted


                //    ViewBag.totalamt = ds.Tables[2].Rows[0]["totalamt"].ToString();
                //}
                return View(ds);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public ActionResult _POrderItems2(string orderid)
        {
            try

            {
                objp.EmailAddress = Session["UserName"].ToString();
                ViewBag.data = null;
                objp.Action = "1";
                objp.OrderId = orderid;
                DataSet ds = objL.showoplaceorderrecord("dbo.orderreport", objp);
                if (!string.IsNullOrEmpty(orderid))
                {
                    ViewBag.data = ds.Tables[1].Rows[0]["orderId"].ToString();
                }
                //if (ds.Tables[2] != null)
                //{
                //    ViewBag.totalamt = ds.Tables[2].Rows[0]["totalamt"].ToString();
                //}
                return View(ds);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult Categorywiseproduct(string id)
        {
            DataSet ds = new DataSet();
            if (!string.IsNullOrEmpty(id))
            {
                objp.Action = "1";
                ds = objL.Showsingledetailsproduct("dbo.proccategorywiseproduct", objp, id);

            }
            return View(ds);
        }

        public JsonResult OrderUpdate(string Orderid, string Stringvalue, string Productid, string Action)
        {
            objp.OrderId = Orderid;
            objp.ProductSpacification = Stringvalue;
            objp.productid = Productid;
            objp.Action = Action;
            objp.dt = objL.updateorderrecord("dbo.updateorderlist", objp);
            return Json(objp, JsonRequestBehavior.AllowGet);
        }


        public ActionResult addofferProduct()
        {
            ViewBag.ddlRootCat = PropertyClass.BindDDL(objL.BindRootCategoryDll());
            ViewBag.ddlCat = PropertyClass.BindDDL(objL.BindCategoryDll());
            ViewBag.ddlSubCat = PropertyClass.BindDDL(objL.BindSubCategoryDll());
            ViewBag.ddlRetailers = PropertyClass.BindDDL(objL.BindRetailers());

            ViewBag.ddlUnit = PropertyClass.BindDDL(objL.BindUnitDLL());
            return View(objp);
        }
        public ActionResult offerproductlist(PropertyClass objp)
        {

            objp.Action = "2";
            DataSet ds = objL.offerproduct("[dbo].[proc_AddProductoffer]", objp);
            return View(ds);
        }
        public JsonResult Addupdateofferproduct(PropertyClass p)
        {
            try
            {
                p.EntryBy = Session["UserName"].ToString();
                #region Image Insert
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase file = Request.Files[0];
                    if (file != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                        string picExt = System.IO.Path.GetExtension(file.FileName);
                        string fName = "offerImg_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        file.SaveAs(path);
                        p.PurchaseFile = fName;
                    }
                }
                if (Request.Files.Count > 1)
                {
                    HttpPostedFileBase filepan = Request.Files[1];
                    if (filepan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filepan.FileName);
                        string picExt = System.IO.Path.GetExtension(filepan.FileName);
                        string fName = "img1_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filepan.SaveAs(path);
                        p.ImgPath1 = fName;
                    }
                }
                if (Request.Files.Count > 2)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img2_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath2 = fName;
                    }

                }
                if (Request.Files.Count > 3)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img3_" + DateTime.Today.Ticks.ToString() + Guid.NewGuid().ToString("N") + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath3 = fName;
                    }

                }
                if (Request.Files.Count > 4)
                {
                    HttpPostedFileBase filetan = Request.Files[2];
                    if (filetan != null)
                    {
                        string pic = System.IO.Path.GetFileNameWithoutExtension(filetan.FileName);
                        string picExt = System.IO.Path.GetExtension(filetan.FileName);
                        string fName = "img4_" + DateTime.Today.Ticks.ToString() + picExt;
                        string path = System.IO.Path.Combine(Server.MapPath("~/ProductImages"), fName);
                        filetan.SaveAs(path);
                        p.ImgPath4 = fName;
                    }

                }
                #endregion

                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("VariationValue");
                dtItems.Columns.Add("UnitId");
                dtItems.Columns.Add("MRP");
                dtItems.Columns.Add("SaleRate");
                dtItems.Columns.Add("Qty");
                dtItems.Columns.Add("Param1");
                dtItems.Columns.Add("Param2");

                if (!string.IsNullOrEmpty(p.VariationList))
                {
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    List<VariationList> result = js.Deserialize<List<VariationList>>(p.VariationList);
                    foreach (var item in result)
                    {
                        dtItems.Rows.Add(item.VariationValue, item.UnitId, item.MRP, item.SaleRate, item.Qty, null, null);
                    }
                }
                DataTable dt = objL.InsertProductDetails(p, "[dbo].[proc_AddProductoffer]", dtItems);
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
        public JsonResult ManageofferProduct(PropertyClass objp)
        {
            DataTable dt = new DataTable();
            dt = objL.ManageofferProduct(objp, "[dbo].[proc_AddProductoffer]");
            if (dt != null && dt.Rows.Count > 0)
            {
                objp.msg = dt.Rows[0]["msg"].ToString();
                objp.strId = dt.Rows[0]["id"].ToString();
            }
            return Json(objp, JsonRequestBehavior.AllowGet);

        }


        public ActionResult ShowOfferDetails(string orderid)
        {

            if (!string.IsNullOrEmpty(orderid))
            {
                OfferProperty objp = new OfferProperty();
                objp.offername = orderid;
                objp.Action = "1";
                objp.dt = objL.Showofferdetails("[dbo].procofferdetails", objp);
                return View(objp);
            }
            return RedirectToAction("../Web/index");
        }



        public ActionResult More()
        {
            string Action = "1";
            DataSet ds = objL.showindexrecord("dbo.viewcategory", objp, Action);
            return View(ds);
        }
    }
    public class VariationList
    {
        public string VariationValue { get; set; }
        public string UnitId { get; set; }
        public string MRP { get; set; }
        public string SaleRate { get; set; }
        public string Qty { get; set; }
    }
    public class ProductList
    {
        public string ProductId { get; set; }
        public string VariationId { get; set; }
        public string MRP { get; set; }
        public string SaleRate { get; set; }
        public string AvlStock { get; set; }
    }



}