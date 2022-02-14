using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MDYOS.Models
{
    public class PropertyClass
    {
        public List<PropertyClass> BundleList { get; set; }
        public string Search { get; set; }


        public string ConvertNumbertoWords(long number)
        {
            if (number == 0) return "ZERO";
            if (number < 0) return "minus " + ConvertNumbertoWords(Math.Abs(number));
            string words = "";
            if ((number / 1000000) > 0)
            {
                words += ConvertNumbertoWords(number / 100000) + " LAKES ";
                number %= 1000000;
            }
            if ((number / 1000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
                number %= 1000;
            }
            if ((number / 100) > 0)
            {
                words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
                number %= 100;
            }
            //if ((number / 10) > 0)  
            //{  
            // words += ConvertNumbertoWords(number / 10) + " RUPEES ";  
            // number %= 10;  
            //}  
            if (number > 0)
            {
                if (words != "") words += "AND ";
                var unitsMap = new[]
                {
            "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"
        };
                var tensMap = new[]
                {
            "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"
        };
                if (number < 20) words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0) words += " " + unitsMap[number % 10];
                }
            }
            return words;
        }

        public static List<SelectListItem> BindDDL(DataTable dt)
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    lst.Add(new SelectListItem()
                    {
                        Text = Convert.ToString(item[1]),
                        Value = Convert.ToString(item[0])
                    });
                }
            }
            else
            {
                lst.Add(new SelectListItem() { Text = "--none--", Value = "" });
            }
            return lst;
        }





        public static List<SelectListItem> BindDDL1(DataTable dt)
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    lst.Add(new SelectListItem()
                    {
                        Text = Convert.ToString(item[0]),
                        Value = Convert.ToString(item[0])
                    });
                }
            }
            else
            {
                lst.Add(new SelectListItem() { Text = "--none--", Value = "" });
            }
            return lst;
        }
        public string productid { get; set; }
        public string qty { get; set; }

        public string txtpartnerlogo { get; set; }
        public string txtpartnername { get; set; }
        public string Rootcatid { get; set; }
        public string catid { get; set; }
        public bool IsAdd { get; set; }
        public bool IsView { get; set; }
        public bool IsEdit { get; set; }
        public bool IsDelete { get; set; }
        public string AccountCode { get; set; }
        public string AccountType { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string OldPassword { get; set; }
        public string Role { get; set; }
        public bool IsActive { get; set; }
        public string Action { get; set; }
        public string EntryBy { get; set; }
        public int Id { get; set; }
        public string MenuTitle { get; set; }
        public string Url { get; set; }
        public string iconClass { get; set; }
        public int Priority { get; set; }
        public string SubMenuTitle { get; set; }
        public int MainMenuId { get; set; }
        public int RoleId { get; set; }
        public string name { get; set; }
        public string RoleName { get; set; }
        public string DepartmentName { get; set; }
        public int StateId { get; set; }
        public string StateName { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string BatchNo { get; set; }
        public string HSNCode { get; set; }
        public decimal PuchaseRate { get; set; }
        public decimal MRP { get; set; }
        public decimal GSTPer { get; set; }
        public decimal CGSTPer { get; set; }
        public decimal SGSTPer { get; set; }
        public DateTime? MfgDate { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public decimal Rate { get; set; }
        public decimal Quantity { get; set; }
        public string mDate { get; set; }
        public string eDate { get; set; }
        public decimal PendingQuantity { get; set; }
        public decimal TrfQuantity { get; set; }
        public decimal CoupenAmount { get; set; }
        public string iscoupenapplied { get; set; }
        public decimal deliverycharges { get; set; }

        //---------- Parameters for SS

        public string OutLetCode { get; set; }
        public string SSCode { get; set; }
        public string SSName { get; set; }
        public string ContactPerson { get; set; }
        public string ContactNo { get; set; }
        public string EmailAddress { get; set; }
        public string PinCode { get; set; }
        public string Address { get; set; }
        public string CityName { get; set; }
        public string GstNo { get; set; }
        public string PanNo { get; set; }
        public string TanNo { get; set; }
        public string GstDoc { get; set; }
        public string PanDoc { get; set; }
        public string StCode { get; set; }
        public string TINNo { get; set; }
        public string accountno { get; set; }
        public string ifsccode { get; set; }
        public string branchname { get; set; }
        public string AccountName { get; set; }

        [AllowHtml]
        public string Description { get; set; }
        [AllowHtml]
        public string ProductSpacification { get; set; }
        public string CompanyCode { get; set; }
        public string UOM { get; set; }
        public string OrderId { get; set; }
        public string PartyStateCode { get; set; }
        public string Mtype { get; set; }
        public string Status { get; set; }
        public string ActiveStatus { get; set; }
        public string StockistName { get; set; }
        public string ItemBarCode { get; set; }
        public decimal PurchaseRate_Bulk { get; set; }
        public decimal PurchaseRate_Loose { get; set; }
        public decimal SaleRate_Bulk { get; set; }
        public decimal SaleRate_Loose { get; set; }
        public decimal StorePrice { get; set; }
        public decimal OnlinePrice { get; set; }
        public string BulkUOM { get; set; }
        public string LooseUOM { get; set; }
        public decimal BulkUOMQty { get; set; }
        public string CustomerId { get; set; }
        public string CardType { get; set; }
        public string msg { get; set; }
        public string WalletBalance { get; set; }
        public string strId { get; set; }

        //-------- DashBoard Count Parameters
        public string TotStokist { get; set; }
        public string TotOutlets { get; set; }
        public string TotPurchase { get; set; }
        public string TotDemands { get; set; }
        public string todayPo { get; set; }
        public string todayPoAmt { get; set; }
        public string todaySaleAmt { get; set; }
        public string todaySaleInv { get; set; }
        public string WalletBal { get; set; }
        public string CashBackBalance { get; set; }
        public string GroupCode { get; set; }
        public string GroupName { get; set; }
        public string parent_groupcode { get; set; }
        public string close_to { get; set; }
        public string Relation { get; set; }

        public string OfferTitle { get; set; }
        public string OfferType { get; set; }
        public decimal OnPurchaseAmount { get; set; }
        public decimal CashBackAmount { get; set; }
        public DateTime ValidStartDate { get; set; }
        public DateTime ValidEndDate { get; set; }
        public decimal Points { get; set; }
        public decimal AmountPerPoint { get; set; }
        public HttpPostedFileWrapper multipleImages { get; set; }
        public string locality { get; set; }
        public string AddressType { get; set; }
        public string landmark { get; set; }
        public string altmobileno { get; set; }
        public string IsFreeItem { get; set; }
        public string FreeItemCode { get; set; }
        public string FreeQty { get; set; }
        public string PurchaseBy { get; set; }
        public string IsCashbackApplied { get; set; }
        public string OpenBal { get; set; }
        public string CloseBal { get; set; }
        public string CrBal { get; set; }
        public string DrBal { get; set; }

        public string narration { get; set; }
        public string AccCode { get; set; }
        public string AccName { get; set; }
        public string employee_father_name { get; set; }
        public string gender { get; set; }
        public DateTime date_of_joining { get; set; }
        public string designation { get; set; }
        public string workemailid { get; set; }

        #region  Parameters for Purchase Order
        public string BranchCode { get; set; }
        public string SupplierAccCode { get; set; }
        public DateTime InvoiceDate { get; set; }
        public DateTime DeliveryDate { get; set; }
        public string ShipmentPref { get; set; }
        public string PurchaseFile { get; set; }
        public string DeliveryTo { get; set; }
        public string TermsCond { get; set; }
        public string notes { get; set; }
        public decimal DiscPer { get; set; }
        public decimal DiscAmt { get; set; }
        public decimal CgstAmt { get; set; }
        public decimal SgstAmt { get; set; }
        public decimal IgstAmt { get; set; }
        public decimal PayableAmt { get; set; }
        public decimal GrossPayable { get; set; }
        public decimal NetTotal { get; set; }
        public decimal Payablegst { get; set; }
        public string IsFrieghtInclude { get; set; }
        public decimal FrieghtCharges { get; set; }
        public string InvoiceNo { get; set; }
        public string EwayBillNo { get; set; }
        public decimal RoundOffAmt { get; set; }
        public string PayMode { get; set; }
        public string ChqNo { get; set; }
        public DateTime ChqDate { get; set; }
        public string BanKAccName { get; set; }
        public string BankTransId { get; set; }
        public decimal PaidAmount { get; set; }
        public string txnId { get; set; }
        public string Purchase_taxIncludeExclude { get; set; }
        public string Sale_taxIncludeExclude { get; set; }

        public string PaytmTransId { get; set; }
        public string RespoCode { get; set; }
        public string RespMsg { get; set; }
        public string GateWayname { get; set; }
        public string Bankname { get; set; }

        public string EPFNo { get; set; }
        public string ESINo { get; set; }
        public string EmpCode { get; set; }
        public DateTime DOB { get; set; }
        public decimal basicmonthly { get; set; }
        public decimal hramonthly { get; set; }
        public decimal conveyanceallowancemonthly { get; set; }
        public decimal fixedallowancemonthly { get; set; }
        public decimal monthlyctc { get; set; }
        public decimal annuallyctc { get; set; }

        #endregion

        #region DayBookDashboard Proprty

        public string CashOpeningBal { get; set; }
        public string CashClosingBal { get; set; }
        public string CashRecived { get; set; }
        public string CashPayment { get; set; }

        public string BankOpeningBal { get; set; }
        public string BankClosingBal { get; set; }
        public string BankRecived { get; set; }
        public string BankPayment { get; set; }
        public string FinancialYear { get; set; }

        #endregion
        public DataTable dt { get; set; }
        public DataTable dt1 { get; set; }
        public DataTable dt2 { get; set; }

        public DataTable dt11 { get; set; }
        public DataTable dt12 { get; set; }
        public List<PropertyClass> poList = new List<PropertyClass>();

        public PropertyClass()
        {
            this.ItemList = new List<SelectListItem>();
        }
        public List<SelectListItem> ItemList { get; set; }
        public string EntryDate { get; set; }
        public string InitialQty { get; set; }
        public string LowStock { get; set; }
        public string Servicetype { get; set; }
        public string CompanyLogo { get; set; }
        public string AadhaarNo { get; set; }
        public string InvoicePrefix { get; set; }
        public bool IsLatterPad { get; set; }
        public string notetype { get; set; }
        public DateTime notedate { get; set; }
        public string invoicetype { get; set; }
        public decimal totalcessamount { get; set; }

        public string Monthly_Salary_Based_On { get; set; }
        public string First_PayrollStartsOn { get; set; }
        public string WorkingDays { get; set; }
        public string MonthName { get; set; }
        public string Year { get; set; }
        public Int64 LOPDays { get; set; }
        public Int64 ActualDays { get; set; }
        public decimal BasicPer { get; set; }
        public decimal HRAPer { get; set; }

        public DateTime servicedate { get; set; }
        public string modelno { get; set; }
        public string icrno { get; set; }
        public DateTime nextservicedate { get; set; }
        //public string servicetype { get; set; }
        public string visittype { get; set; }
        public bool isreplacedparts { get; set; }


        public decimal minloanamount { get; set; }
        public decimal maxloanamount { get; set; }
        public decimal loanamountonasset { get; set; }
        public decimal annualintrate { get; set; }
        public Int64 minage { get; set; }
        public decimal loanproccesingfeeper { get; set; }
        public decimal loanproccessingfeeamount { get; set; }
        public decimal loansecurityper { get; set; }
        public decimal penaltyperdayper { get; set; }
        public decimal penaltyperweekper { get; set; }
        public decimal penaltypermonthper { get; set; }
        public Int64 GracePeriodDays { get; set; }
        public string loanplantypeid { get; set; }
        public string loanplancode { get; set; }
        public string loanpurposeid { get; set; }
        public decimal assetvalue { get; set; }
        public decimal requiredloanamount { get; set; }
        public string installmentmode { get; set; }
        public Int64 loantenure { get; set; }
        public string interestcalmethod { get; set; }
        public decimal totinterestamount { get; set; }
        public decimal totalrepaymentamount { get; set; }
        public int totalinstallments { get; set; }
        public string Guarantor1Id { get; set; }
        public string Guarantor1Name { get; set; }
        public string Guarantor2Id { get; set; }
        public string Guarantor2Name { get; set; }
        public string AssetPropertyDescription { get; set; }
        public string Guarantor1MobileNo { get; set; }
        public string Guarantor2MobileNo { get; set; }
        public string MemberAge { get; set; }
        public string Gurantor1Address { get; set; }
        public string Gurantor2Address { get; set; }

        public string MemberCount { get; set; }
        public string PlanCount { get; set; }
        public string DisburseSum { get; set; }
        public string RecoverySum { get; set; }

        public string TanDoc { get; set; }
        public string KycDoc { get; set; }
        public string kycdocumentno { get; set; }
        public string Slugname { get; set; }

        public string CategoryId { get; set; }
        public string SubCatId { get; set; }

        public string ImgPath1 { get; set; }
        public string ImgPath2 { get; set; }
        public string ImgPath3 { get; set; }
        public string ImgPath4 { get; set; }
        public string VariationList { get; set; }
        public string IsMultiVar { get; set; }
        public string IsExchangeble { get; set; }
        public string mobile { get; set; }
        public string posation { get; set; }
        public string venderid { get; set; }

        public string SmallTitle { get; set; }
        public string Title { get; set; }
        public string BannerType { get; set; }
        public string BannerImage { get; set; }

        //
        public string percentage { get; set; }
        public string Isofferproduct { get; set; }
        public string offerproductid { get; set; }
        public string deliverycharge { get; set; }
        public string offerimage { get; set; }


        public string apicall(string url)
        {
            HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
            try
            {
                HttpWebResponse httpres = (HttpWebResponse)httpreq.GetResponse();
                StreamReader sr = new StreamReader(httpres.GetResponseStream());
                string results = sr.ReadToEnd();
                sr.Close();
                return results;
            }
            catch
            {
                return "0";
            }
        }
        public void sendsms(string MobileNo, string Message)
        {
            try
            {
                string url = ConfigurationManager.AppSettings["smsRoute"].ToString();
                string result = apicall(url + "&number=" + MobileNo + "&message=" + Message);
            }
            catch
            {
            }
        }
        public string pmethod { get; set; }

        public string fromdate { get; set; }
        public string todate { get; set; }



    }
    public class updatecheckputproducrs
    {
        public string Action { get; set; }

        public string productid { get; set; }
        public string RespoCode { get; set; }
        public string qty { get; set; }
    }

    public class OfferProperty
    {
        public string Id { get; set; }
        public string offername { get; set; }
        public string offerimage { get; set; }
        public string Action { get; set; }
        public DataTable dt { get; set; }
    }
}