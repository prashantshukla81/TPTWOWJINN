using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace MDYOS.Models
{

    public class LogicClass
    {
        PropertyClass objp = new PropertyClass();
        dbHelper objdb = new dbHelper();

        public string GetCurrentFinancialYear()
        {
            int CurrentYear = DateTime.Today.Year;
            int PreviousYear = DateTime.Today.Year - 1;
            int NextYear = DateTime.Today.Year + 1;
            string PreYear = PreviousYear.ToString();
            string NexYear = NextYear.ToString();
            string CurYear = CurrentYear.ToString();
            string FinYear = null;

            if (DateTime.Today.Month > 3)
                FinYear = CurYear + "-" + NexYear;
            else
                FinYear = PreYear + "-" + CurYear;
            return FinYear.Trim();
        }
        public DateTime? ConvertStringDateTo_Datetime(string date)
        {
            DateTime? dt = new DateTime();

            if (date != "" && date != null)
            {
                string[] arrDate = date.Split('/');
                int year = Convert.ToInt32(arrDate[2]);
                int month = Convert.ToInt32(arrDate[1]);
                int day = Convert.ToInt32(arrDate[0]);
                dt = new DateTime(year, month, day);
            }
            else
            {
                dt = null;
            }

            return dt;
        }

        public DataTable getLoginDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@UserName",Objp.UserName),
                new SqlParameter("@Password",Objp.Password),
                new SqlParameter("@Action",Objp.Action)
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable StateMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@StateName",Objp.StateName),
                new SqlParameter("@StateAfix",Objp.StCode),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable DistrictMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@CityName",Objp.StateName),
                new SqlParameter("@StateId",Objp.StCode),
                new SqlParameter("@RefID",Objp.RespoCode),
              //  new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable ZoneMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ZoneName",Objp.StateName),
                new SqlParameter("@CityId",Objp.StCode),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@Pincode ",Objp.PinCode)
              //  new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }


        public DataTable RootCategoryMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@RootCategoryName",Objp.StateName),
                new SqlParameter("@Cat_Image",Objp.KycDoc),
                new SqlParameter("@SrNo",Objp.RespoCode),
                new SqlParameter("@SlugName ",Objp.Slugname)
              //  new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable Getcategoryforedit(PropertyClass Obj, String Procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Obj.Action),
                new SqlParameter("@SrNo",Obj.RespoCode)

            };
            dt = objdb.ExecProcDataTable(Procname, param);
            return dt;

        }


        public DataTable CategoryMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@CategoryName",Objp.StateName),
                new SqlParameter("@Cat_Image",Objp.KycDoc),
                new SqlParameter("@SrNo",Objp.RespoCode),
                new SqlParameter("@SlugName ",Objp.Slugname),
                new SqlParameter("@RootCategoryId",Objp.Rootcatid)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }


        public DataTable subCategoryMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@subCategoryName",Objp.StateName),
                new SqlParameter("@Cat_Image",Objp.KycDoc),
                new SqlParameter("@SrNo",Objp.RespoCode),
                new SqlParameter("@SlugName ",Objp.Slugname),
                new SqlParameter("@CategoryId ",Objp.catid)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable TehsilMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@DistrictName",Objp.StateName),
                new SqlParameter("@StateId",Objp.StCode),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        internal DataTable BindStateDropDown()
        {
            DataTable dt = new DataTable();
            //string Query = "SELECT '' AS Stateid,'Select State' AS State_name UNION ALL SELECT Stateid,State State_name FROM MasterState WHERE IsActive=1";
            // string Query = "SELECT '' AS Stateid,'Select State' AS State UNION ALL SELECT Stateid,State State FROM MasterState WHERE IsActive=1"; 
            string Query = "select * from MasterState";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindCityDropDown()
        {
            DataTable dt = new DataTable();
            // string Query = "SELECT '' AS Disttid,'Select District' AS State_name UNION ALL SELECT Disttid,Distric State_name FROM MasterDistric WHERE IsActive=1";
            string Query = "SELECT 0 AS Cityid,'Select City' AS City UNION ALL SELECT Cityid,City FROM MasterCity WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }

        internal DataTable Bindzone()
        {
            DataTable dt = new DataTable();
            // string Query = "SELECT '' AS Disttid,'Select District' AS State_name UNION ALL SELECT Disttid,Distric State_name FROM MasterDistric WHERE IsActive=1";
            string Query = "select SrNo,AreaName from tbl_AreaMaster";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindLoanTypeDropDown()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS SrNo,'Select Loan Type' AS LoanTypeName UNION ALL SELECT SrNo,LoanTypeName FROM tbl_LoanTypeMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }

        internal DataTable BindrcDropDown()
        {
            DataTable dt = new DataTable();
            //string Query = "SELECT 0 AS SrNo,'Select Root Cat' AS Rootcategory UNION ALL SELECT SrNo,RootCategoryName FROM tbl_RootCategoryMaster WHERE IsActive=1";
            string Query = " SELECT RootCategoryId,RootCategoryName FROM tbl_RootCategoryMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }

        internal DataTable BindZone()
        {
            DataTable dt = new DataTable();
            string Query = "select SrNo,AreaName from tbl_AreaMaster";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;

        }
        internal DataTable BindcDropDown()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS SrNo,'Select  Category' AS category UNION ALL SELECT SrNo,CategoryName FROM tbl_CategoryMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindDepartmentDropDown()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS SrNo,'Select Department' AS DepartmentName UNION ALL SELECT SrNo,DepartmentName FROM tbl_DepartmentMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindBranch()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '0' AS BranchCode,'Select Branch' Branch UNION ALL SELECT CompanyId BranchCode,CompanyName+'(HO)' AS Branch FROM tbl_CompanyMaster UNION ALL SELECT BranchCode,BranchName+'('+BranchCode+')' AS Branch FROM tbl_BranchMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindDocumentDDL()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS SrNo,'Select Document Type' DocumentTitle UNION ALL SELECT SrNo,DocumentTitle FROM tbl_KYCDocumentMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindRoleDLL()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' AS RoleId,'Select Role' RoleName UNION ALL SELECT RoleId,RoleName FROM tbl_RoleMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindUserDLL()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT ''UserName,'Select User' Name UNION ALL SELECT UserName,Name FROM tbl_UserMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindDistrictByState(string StateCode)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS DisttCode,'Select District' Distric UNION ALL SELECT Disttid DisttCode,Distric FROM MasterDistric WHERE Stateid='" + StateCode + "' AND IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindTehsilByDistrict(string DistrictCode)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS Tahshilid,'Select Tehsil' Tahshil UNION ALL SELECT Tahshilid,Tahshil FROM MasterTahshil WHERE Disttid='" + DistrictCode + "' AND IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindLoanPlanByLoanTypeDDL(string Type)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '0' AS PlanCode,'Select Loan Plan' PlanName UNION ALL SELECT PlanCode,PlanName FROM tbl_LoanPlanMaster WHERE PlanType='" + Type + "' AND IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindLoanPurposeByLoanTypeDDL(string Type)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '0' AS SrNo,'Select Loan Purpose' LoanPurposeName UNION ALL SELECT SrNo,LoanPurposeName FROM tbl_LoanPurposeMaster WHERE LoanTypeId='" + Type + "' AND IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }

        internal DataTable BindRootCategoryDll()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' RootCategoryId,'Select' RootCategoryName UNION ALL SELECT RootCategoryId,RootCategoryName FROM tbl_RootCategoryMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindCategoryDll()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' CategoryId,'Select' CategoryName UNION ALL SELECT CategoryId,CategoryName FROM tbl_CategoryMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindSubCategoryDll()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' SubCategoryId,'Select' SubCategoryName UNION ALL SELECT SubCategoryId,SubCategoryName FROM tbl_SubCategoryMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindRetailers()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' RetailerCode,'Select Retailer' BusinessName UNION ALL SELECT RetailerCode,BusinessName FROM tbl_Retailers WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable BindOfferMaster()
        {
            DataTable dt = new DataTable();
            string Query = "select offerdid ,OfferName as ID FROM [dbo].tbl_offermaster WHERE Isactive='1'";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable GetLoanPlanDetails(string PlanId)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT * FROM tbl_LoanPlanMaster WHERE PlanCode='" + PlanId + "' AND IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        public DataTable LoanTypeMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@LoanTypeName",Objp.OfferType),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable LoanPurposeMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@LoanTypeId",Objp.StCode),
                new SqlParameter("@LoanPurpose",Objp.OfferType),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable DepartmentMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@DepartmentName",Objp.DepartmentName),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable DesignationMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@DepartmentId",Objp.ItemCode),
                new SqlParameter("@DesignationTitle",Objp.DepartmentName),
                new SqlParameter("@RefID",Objp.RespoCode),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InserUserMaster(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@name",Objp.AccName),
                new SqlParameter("@mobileno",Objp.ContactNo),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@username",Objp.UserName),
                new SqlParameter("@isview",Objp.IsView),
                new SqlParameter("@isedit",Objp.IsEdit),
                new SqlParameter("@isdelete",Objp.IsDelete),
                new SqlParameter("@isadd",Objp.IsAdd),
                new SqlParameter("@entryby",Objp.EntryBy),
                new SqlParameter("@password",Objp.Password),
                new SqlParameter("@RefID",Objp.RespoCode)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertUpdateCompanyDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@companyname",Objp.SSName),
                new SqlParameter("@contactperson",Objp.ContactPerson),
                new SqlParameter("@mobileno",Objp.ContactNo),
                new SqlParameter("@emailaddress",Objp.EmailAddress),
                new SqlParameter("@stateid",Objp.PartyStateCode),
                new SqlParameter("@districtid",Objp.StCode),
                new SqlParameter("@tehsilid",Objp.EmpCode),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@gstinno",Objp.GstNo),
                new SqlParameter("@cinno",Objp.TanNo),
                new SqlParameter("@panno",Objp.PanNo),
                new SqlParameter("@websiteurl",Objp.Url),
                new SqlParameter("@companylogourl",Objp.CompanyLogo),
                new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertUpdateBranchDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            DateTime? backDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                backDate = Convert.ToDateTime(Objp.mDate);
            }

            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@branchname",Objp.SSName),
                new SqlParameter("@contactperson",Objp.ContactPerson),
                new SqlParameter("@contactno",Objp.ContactNo),
                new SqlParameter("@emailaddress",Objp.EmailAddress),
                new SqlParameter("@stateid",Objp.PartyStateCode),
                new SqlParameter("@districtid",Objp.StCode),
                new SqlParameter("@tehsilid",Objp.EmpCode),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@isbackdateallow",Objp.IsEdit),
                new SqlParameter("@backdate",backDate),
                new SqlParameter("@UserName",Objp.UserName),
                new SqlParameter("@Password",Objp.Password),
                new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertUpdateCollectionCenterDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();


            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@branchname",Objp.SSName),
                new SqlParameter("@contactperson",Objp.ContactPerson),
                new SqlParameter("@contactno",Objp.ContactNo),
                new SqlParameter("@emailaddress",Objp.EmailAddress),
                new SqlParameter("@stateid",Objp.PartyStateCode),
                new SqlParameter("@districtid",Objp.StCode),
                new SqlParameter("@tehsilid",Objp.EmpCode),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@UserName",Objp.UserName),
                new SqlParameter("@Password",Objp.Password),
                new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable BranchBackDateEntrySetup(PropertyClass Objp, string ProcName)
        {
            DateTime? allowdate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                allowdate = Convert.ToDateTime(Objp.mDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@AllowDate",allowdate)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertUpdateInsuranceType(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@InsuranceType",Objp.OfferType),
                new SqlParameter("@InsuranceClaimPer",Objp.BasicPer),
                new SqlParameter("@InsuranceClaimAmt",Objp.CashBackAmount),
                new SqlParameter("@RefId",Objp.RespoCode),
                new SqlParameter("@InsMode",Objp.modelno),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable InsertUpdateLoanPlanMaster(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@plantype",Objp.OfferType),
                new SqlParameter("@planname",Objp.OfferTitle),
                new SqlParameter("@minloanamount",Objp.minloanamount),
                new SqlParameter("@maxloanamount",Objp.maxloanamount),
                new SqlParameter("@loanamountonasset",Objp.loanamountonasset),
                new SqlParameter("@annualintrate",Objp.annualintrate),
                new SqlParameter("@minage",Objp.minage),
                new SqlParameter("@loanproccesingfeeper",Objp.loanproccesingfeeper),
                new SqlParameter("@loanproccessingfeeamount",Objp.loanproccessingfeeamount),
                new SqlParameter("@loansecurityper",Objp.loansecurityper),
                new SqlParameter("@penaltyperdayper",Objp.penaltyperdayper),
                new SqlParameter("@penaltyperweekper",Objp.penaltyperweekper),
                new SqlParameter("@penaltypermonthper",Objp.penaltypermonthper),
                new SqlParameter("@GracePeriodDays",Objp.GracePeriodDays),
                new SqlParameter("@RefId",Objp.RespoCode),


            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable InsertUpdateMemberLoanRegistration(PropertyClass Objp, string ProcName)
        {
            DateTime? RegDate = null;
            DateTime? dob = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                RegDate = Convert.ToDateTime(Objp.mDate);
            }
            if (!string.IsNullOrEmpty(Objp.eDate))
            {
                dob = Convert.ToDateTime(Objp.eDate);
            }

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@membertype",Objp.AccountType),
                new SqlParameter("@membername",Objp.AccName),
                new SqlParameter("@registrationdate",RegDate),
                new SqlParameter("@fatherhusbandname",Objp.employee_father_name),
                new SqlParameter("@mobileno",Objp.ContactNo),
                new SqlParameter("@gender",Objp.gender),
                new SqlParameter("@dateofbirth",dob),
                new SqlParameter("@age",!string.IsNullOrEmpty(Objp.MemberAge)?Convert.ToInt32(Objp.MemberAge):0),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@entryby",Objp.EntryBy),
                new SqlParameter("@loanplantypeid",Objp.loanplantypeid),
                new SqlParameter("@loanplancode",Objp.loanplancode),
                new SqlParameter("@loanpurposeid",Objp.loanpurposeid),
                new SqlParameter("@assetvalue",Objp.assetvalue),
                new SqlParameter("@requiredloanamount",Objp.requiredloanamount),
                new SqlParameter("@installmentmode",Objp.installmentmode),
                new SqlParameter("@loantenure",Objp.loantenure),
                new SqlParameter("@interestcalmethod",Objp.interestcalmethod),
                new SqlParameter("@totinterestamount",Objp.totinterestamount),
                new SqlParameter("@totalrepaymentamount",Objp.totalrepaymentamount),
                new SqlParameter("@totalinstallments",Objp.totalinstallments),
                new SqlParameter("@Guarantor1Id",Objp.Guarantor1Id),
                new SqlParameter("@Guarantor1Name",Objp.Guarantor1Name),
                new SqlParameter("@Guarantor2Id",Objp.Guarantor2Id),
                new SqlParameter("@Guarantor2Name",Objp.Guarantor2Name),
                new SqlParameter("@AssetPropertyDescription",Objp.AssetPropertyDescription),
                new SqlParameter("@Guarantor1MobileNo",Objp.Guarantor1MobileNo),
                new SqlParameter("@Guarantor2MobileNo",Objp.Guarantor2MobileNo),
                new SqlParameter("@Gurantor1Address",Objp.Gurantor1Address),
                new SqlParameter("@Gurantor2Address",Objp.Gurantor2Address),
                new SqlParameter("@loanprocessingFeeType",Objp.CardType),
                new SqlParameter("@LoanSecurityPer",Objp.loansecurityper),
                new SqlParameter("@LoanProcessFee",Objp.loanproccessingfeeamount),
                new SqlParameter("@AnnualInterestRate",Objp.Rate),
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable GetRegisteredPlanList(PropertyClass Objp, string ProcName)
        {
            DateTime? entDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                entDate = Convert.ToDateTime(Objp.mDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                 new SqlParameter("@payDate",entDate),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertUpdateMemberKYC(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@DocumentTypeId",Objp.CardType),
                new SqlParameter("@DocumentNo",Objp.InvoiceNo),
                new SqlParameter("@FilePath",Objp.Url),
                new SqlParameter("@EntryBy",Objp.EntryBy),
                new SqlParameter("@DocumentFor",Objp.AccountType),
                 new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataSet GetMemberKYC(PropertyClass Objp, string ProcName)
        {
            DataSet dtt = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@DocumentTypeId",Objp.CardType),
                new SqlParameter("@DocumentNo",Objp.InvoiceNo),
                new SqlParameter("@FilePath",Objp.Url),
                new SqlParameter("@EntryBy",Objp.EntryBy),
                new SqlParameter("@DocumentFor",Objp.AccountType),
                new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataSet(ProcName, param);
            return dtt;
        }
        public DataTable UpdateLoanRegistrationStatus(PropertyClass Objp, string ProcName)
        {
            DateTime? entDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                entDate = Convert.ToDateTime(Objp.mDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@Status",Objp.Status),
                new SqlParameter("@EntryDate",entDate),
                new SqlParameter("@EntryBy",Objp.EntryBy),
                new SqlParameter("@RejectReason",Objp.Description),
                new SqlParameter("@SanctionedAmount",Objp.PaidAmount),
                new SqlParameter("@SanctionedIntAmt",Objp.DiscAmt),
                new SqlParameter("@SanctionedRepayAmt",Objp.PayableAmt),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable InsertLoanDisbursement(PropertyClass Objp, string ProcName)
        {
            DateTime? entDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                entDate = Convert.ToDateTime(Objp.mDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@DisburseDate",entDate),
                new SqlParameter("@DisburseBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable GetLoanEMILateFee(PropertyClass Objp, string ProcName)
        {
            DateTime? entDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                entDate = Convert.ToDateTime(Objp.mDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@CollectionDate",entDate),
                new SqlParameter("@InstallmentNo",Objp.InvoiceNo)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable InsertLoanEMI(PropertyClass Objp, string ProcName, DataTable dtEMI)
        {
            DateTime? entDate = null, chdate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                entDate = Convert.ToDateTime(Objp.mDate);
            }
            if (!string.IsNullOrEmpty(Objp.eDate))
            {
                chdate = Convert.ToDateTime(Objp.eDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode),
                new SqlParameter("@CollectionCenterId",Objp.EmpCode),
                new SqlParameter("@PaymentDate",entDate),
                new SqlParameter("@PaidAmount",Objp.PaidAmount),
                new SqlParameter("@PaymentMode",Objp.PayMode),
                new SqlParameter("@EntryBy",Objp.EntryBy),
                new SqlParameter("@LatefFee",Objp.RoundOffAmt),
                new SqlParameter("@type_EMIDetails",dtEMI),
                new SqlParameter("@ChequeNo",Objp.ChqNo),
                new SqlParameter("@ChequeDate",chdate),
                new SqlParameter("@OnlineTxnId",Objp.txnId),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable GetEMICollectionReport(PropertyClass Objp, string ProcName)
        {
            DateTime? entDate = null, stDate = null;
            if (!string.IsNullOrEmpty(Objp.mDate))
            {
                stDate = Convert.ToDateTime(Objp.mDate);
            }
            if (!string.IsNullOrEmpty(Objp.eDate))
            {
                entDate = Convert.ToDateTime(Objp.eDate);
            }
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@StartDate",stDate),
                new SqlParameter("@EndDate",entDate),
                new SqlParameter("@BranchCode",Objp.BranchCode),
                new SqlParameter("@ProfarmaNo",Objp.ItemCode)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable BindMenuDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@RoleId",Objp.Role),
                new SqlParameter("@UserId",Objp.UserName)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable insertUpdateMenuPermission(PropertyClass Objp, string ProcName, DataTable dtMenu)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@RoleId",Objp.Role),
                new SqlParameter("@UserId",Objp.UserName),
                new SqlParameter("@typeMenuPermission",dtMenu),
                new SqlParameter("@EntryBy",Objp.EntryBy)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        internal DataTable BranchBackDateDetails(string BranchCode)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT IsBackDateAllow,format(BackDate,'dd-MMM-yyyy')backDate FROM tbl_BranchMaster WHERE BranchCode='" + BranchCode + "'";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable GetCurrentDate()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT format(getdate(),'dd-MMM-yyyy')CurrDate";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        internal DataTable GetCollectionCenterDLL(string BranchCode)
        {
            DataTable dt = new DataTable();
            string Query = "SELECT '' CenterCode,'Select Collection Center'CenterName UNION ALL SELECT CenterCode,CenterName+'-('+CenterCode+')' CenterName FROM tbl_CollectionCenterMaster WHERE BranchCode=isnull('" + BranchCode + "',BranchCode)";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        public DataTable InsertLoanGroup(PropertyClass Objp, string ProcName, DataTable dtList)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@branchcode",Objp.BranchCode),
                new SqlParameter("@centercode",Objp.EmpCode),
                new SqlParameter("@entryby",Objp.EntryBy),
                new SqlParameter("@type_LoanGroupList",dtList),
                new SqlParameter("@GroupName",Objp.GroupName),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable GetNidhiMembers(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchId",Objp.BranchCode),
                new SqlParameter("@MemberId",Objp.EmpCode),
            };
            dtt = objdb.ExecProcDataTableNidhi(ProcName, param);
            return dtt;
        }
        public DataSet BindDashbOard(PropertyClass Objp, string ProcName)
        {

            DataSet dtt = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@BranchCode",Objp.BranchCode)
            };
            dtt = objdb.ExecProcDataSet(ProcName, param);
            return dtt;
        }
        #region MDYOS

        internal DataTable BindUnitDLL()
        {
            DataTable dt = new DataTable();
            string Query = "SELECT 0 AS SrNo,'Select Unit' AS UnitName UNION ALL SELECT SrNo,UnitName FROM tbl_UnitMaster WHERE IsActive=1";
            dt = objdb.ExecAdaptorDataTable(Query);
            return dt;
        }
        public DataTable InsertUpdateRetailers(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@retailername",Objp.AccName),
                new SqlParameter("@mobileno",Objp.ContactNo),
                new SqlParameter("@emailaddress",Objp.EmailAddress),
                new SqlParameter("@address",Objp.Address),
                new SqlParameter("@gstinno",Objp.GstNo),
                new SqlParameter("@cinno",Objp.TINNo),
                new SqlParameter("@panno",Objp.PanNo),
                new SqlParameter("@businessname",Objp.DepartmentName),
                new SqlParameter("@zonecode",Objp.AccCode),
                new SqlParameter("@kycdocumenttype",Objp.AccountType),
                new SqlParameter("@kycdocumentno",Objp.kycdocumentno),
                new SqlParameter("@kycdocfile",Objp.KycDoc),
                new SqlParameter("@pandoc",Objp.PanDoc),
                new SqlParameter("@tanno",Objp.TanNo),
                new SqlParameter("@tandoc",Objp.TanDoc),
                new SqlParameter("@bankaccname",Objp.BanKAccName),
                new SqlParameter("@accountnumber",Objp.accountno),
                new SqlParameter("@bankname",Objp.Bankname),
                new SqlParameter("@ifsccode",Objp.ifsccode),
                new SqlParameter("@RefId",Objp.RespoCode),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable GetRetailersDetails(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@RetId",Objp.RespoCode),
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable InsertProductDetails(PropertyClass Objp, string ProcName, DataTable dtVar)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@retailercode",Objp.EntryBy),
                new SqlParameter("@producttitle",Objp.OfferTitle),
                new SqlParameter("@rootcatid",Objp.Rootcatid),
                new SqlParameter("@catid",Objp.CategoryId),
                new SqlParameter("@subcatid",Objp.SubCatId),
                new SqlParameter("@productdescription",Objp.Description),
                new SqlParameter("@productmrp",Objp.MRP),
                new SqlParameter("@salerate",Objp.SaleRate_Loose),
                new SqlParameter("@commqty",Objp.Quantity),
                new SqlParameter("@mainimgfile",Objp.PurchaseFile),
                new SqlParameter("@img1",Objp.ImgPath1),
                new SqlParameter("@img2",Objp.ImgPath2),
                new SqlParameter("@img3",Objp.ImgPath3),
                new SqlParameter("@img4",Objp.ImgPath4),
                new SqlParameter("@entryby",Objp.EntryBy),
                new SqlParameter("@ProductType",Objp.IsMultiVar),
                new SqlParameter("@IsExchangeble",Objp.IsExchangeble),
                new SqlParameter("@tbl_VariationList",dtVar),
                new SqlParameter("@Offertype",Objp.OfferType),
                new SqlParameter("@percentage",Objp.percentage),
                new SqlParameter("@deliverycharge",Objp.deliverycharge),
                new SqlParameter("@offerproductid",Objp.offerproductid),
                new SqlParameter("@Isofferproduct",Objp.Isofferproduct),
                new SqlParameter("@Offerimage",Objp.offerimage)

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable UpdateProductDetails(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Productcodes",Objp.productid),
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@retailercode",Objp.EntryBy),
                new SqlParameter("@producttitle",Objp.OfferTitle),
                new SqlParameter("@rootcatid",Objp.Rootcatid), 
                  new SqlParameter("@catid",Objp.CategoryId), 
                  new SqlParameter("@subcatid",Objp.SubCatId),
                  new SqlParameter("@productdescription",Objp.Description),
                  new SqlParameter("@productmrp",Objp.MRP),
                  new SqlParameter("@salerate",Objp.SaleRate_Loose),
                  new SqlParameter("@commqty",Objp.Quantity),
                  new SqlParameter("@entryby",Objp.EntryBy),
                  new SqlParameter("@percentage",Objp.percentage),
                  new SqlParameter("@deliverycharge",Objp.deliverycharge),
                  new SqlParameter("@offerproductid",Objp.offerproductid),
                  new SqlParameter("@Isofferproduct",Objp.Isofferproduct),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable GetProductListing(PropertyClass Objp, string ProcName)
        {
            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable GetProductListingVenderWise(PropertyClass Objp, string ProcName)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@id",Objp.CustomerId)
            };
            dt = objdb.ExecProcDataTable(ProcName, param);
            return dt;

        }



        public DataTable ManageProduct(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ProductId",Objp.RespoCode),
                new SqlParameter("@DeleteBy",Objp.EntryBy),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable UpdateProductQuantity(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@ProductId",Objp.RespoCode),
                new SqlParameter("@Quantity",Objp.Quantity),
                new SqlParameter("@EntryBy",Objp.EntryBy),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable BindHomePage(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action)
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        public DataTable BindProductForAssign(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@RetailerId",Objp.AccCode),
                new SqlParameter("@RootCategoryId",Objp.CategoryId),
                new SqlParameter("@CategoryId",Objp.SubCatId),
            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }

        public DataTable InsertProductAssignment(PropertyClass Objp, string ProcName, DataTable dtProd)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@RetailerId",Objp.AccCode),
                new SqlParameter("@type_ProductAssignList",dtProd),

            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }
        #endregion


        public DataSet showindexrecord(string proname, PropertyClass Objp, string Action)
        {
            DataSet dt = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Action),
                new SqlParameter("@catid",Objp.catid)
             };
            dt = objdb.ExecProcDataSet(proname, param);
            return dt; ;
        }
        public DataSet Showsingledetailsproduct(string procname, PropertyClass Objp, string id)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@id",id)
            };
            ds = objdb.ExecProcDataSet(procname, param);
            return ds;
        }
        public DataTable custmer(string procname, registration objd)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objd.Action),
                new SqlParameter("@MobileNo",objd.UserName),
                new SqlParameter("@password",objd.Password),
                new SqlParameter("@custmername",objd.name),
                new SqlParameter("@gender",objd.Gender)


            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }
        public DataTable Addtocard(string procname, PropertyClass objpr)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objpr.Action),
                new SqlParameter("@IpAddress",objpr.RespoCode),
                new SqlParameter("@CustomerCode",objpr.CustomerId),
                new SqlParameter("@ProductId",objpr.productid),
                new SqlParameter("@Quantity",objpr.qty)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }

        public DataSet Checkout(string procname, PropertyClass objpr)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objpr.Action),
                new SqlParameter("@CustomerCode",objpr.RespoCode)
            };
            ds = objdb.ExecProcDataSet(procname, param);
            return ds;

        }

        public DataTable Deletecheckout(string procnamme, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@ProductId",objp.productid),
                new SqlParameter("@CustomerCode",objp.CustomerId),
                new SqlParameter("@Action",objp.Action)
            };
            dt = objdb.ExecProcDataTable(procnamme, param);
            return dt;

        }

        public DataTable Updtaecheckoutcart(string procname, updatecheckputproducrs Objpr)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objpr.Action),
                new SqlParameter("@qty",Objpr.qty),
                new SqlParameter("@CustomerCode",Objpr.RespoCode),
                new SqlParameter("@productid",Objpr.productid)

            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }

        public DataTable Insertcheckoutaddress(string procname, PropertyClass Op)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Op.Action),
                new SqlParameter("@Fullname",Op.name),
                new SqlParameter("@Mobilenumber",Op.mobile),
                new SqlParameter("@Pincode",Op.PinCode),
                new SqlParameter("@Locality",Op.locality),
                new SqlParameter("@Address",Op.Address),
                new SqlParameter("@City",Op.CityName),
                new SqlParameter("@State",Op.StateName),
                new SqlParameter("@Landmark",Op.landmark),
                new SqlParameter("@Alternatemobile",Op.altmobileno),
                new SqlParameter("@Addresstype",Op.AddressType),
                new SqlParameter("@Customercode",Op.CustomerId)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }


        public DataTable placeorderlist(string procname, PropertyClass Objpl, DataTable dtItems)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
          {
                new SqlParameter("@Action", Objpl.Action),
                new SqlParameter("@Fullname", Objpl.name),
                new SqlParameter("@Mobilenumber", Objpl.mobile),
                new SqlParameter("@Pincode", Objpl.PinCode),
                new SqlParameter("@Locality", Objpl.locality),
                new SqlParameter("@Address", Objpl.Address),
                new SqlParameter("@City", Objpl.CityName),
                new SqlParameter("@State", Objpl.StateName),
                new SqlParameter("@Landmark", Objpl.landmark),
                new SqlParameter("@Alternatemobile", Objpl.altmobileno),
                new SqlParameter("@Addresstype", Objpl.AddressType),
                new SqlParameter("@Customercode", Objpl.CustomerId),
                new SqlParameter("@paymentmethod",Objpl.pmethod),
                new SqlParameter("@tbl_orderitems",dtItems),
          };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }

        public DataSet showoplaceorderrecord(string procnamem, PropertyClass Objp)
        {
            DataSet dt = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@srno",Objp.OrderId),
               new SqlParameter("@emailid",Objp.EmailAddress)

            };
            dt = objdb.ExecProcDataSet(procnamem, param);
            return dt;
        }

        public DataTable Filteration(string procname, PropertyClass Objp)
        {
            DateTime? fDate = null;
            DateTime? tDate = null;
            if (!string.IsNullOrEmpty(Objp.fromdate))
            {
                fDate = Convert.ToDateTime(Objp.fromdate);
            }
            if (!string.IsNullOrEmpty(Objp.todate))
            {
                tDate = Convert.ToDateTime(Objp.todate);
            }

            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {

                new SqlParameter("@Action",Objp.Action),
                //new SqlParameter("@srno",Objp.OrderId),
               new SqlParameter("@emailid",Objp.EmailAddress),
               new SqlParameter("@fromdate",fDate),
               new SqlParameter("@todate",tDate),
               new SqlParameter("@orderid",Objp.OrderId)

            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }

        public DataTable Customerlist(string procname, PropertyClass Objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }
        public DataTable contactus(string procname, PropertyClass Objph)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objph.Action),
                new SqlParameter("@NAME",Objph.name),
                new SqlParameter("@EMAILADDRESS",Objph.EmailAddress),
                new SqlParameter("@TITLE",Objph.mobile),
                new SqlParameter("@COMMENTS",Objph.MonthName)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }


        public DataTable updateorderrecord(string procname, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@Productid",objp.productid),
                new SqlParameter("@Stringvalue",objp.ProductSpacification),
                new SqlParameter("@orderid",objp.OrderId)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }
        public DataSet offerproduct(string procname, PropertyClass objp)
        {
            DataSet dt = new DataSet();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action)
            };
            dt = objdb.ExecProcDataSet(procname, param);
            return dt;


        }
        public DataTable ManageofferProduct(PropertyClass Objp, string ProcName)
        {

            DataTable dtt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Objp.Action),
                new SqlParameter("@retailercode",Objp.RespoCode),


            };
            dtt = objdb.ExecProcDataTable(ProcName, param);
            return dtt;
        }


        public DataTable managegiffile(string procname, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@logoname",objp.StateName),
                new SqlParameter("@gif",objp.KycDoc),
                new SqlParameter("@id",objp.Id)
            };

            dt = objdb.ExecProcDataTable(procname, param);


            return dt;


        }

        internal DataTable BindVenders()
        {
            DataTable dt = new DataTable();
            string query = "select EmailAddress,RetailerName,RetailerCode from tbl_Retailers";
            dt = objdb.ExecAdaptorDataTable(query);
            return dt;
        }

        public DataTable insertupdateposation(string procname, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@vendername",objp.venderid),
                new SqlParameter("@venderposation",objp.posation),
                new SqlParameter("@id",objp.Id)


            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }


        public DataTable getarea(PropertyClass objp, string procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),


            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }

        public DataTable getrootcategoryedit(PropertyClass objp, string Proname)
        {
            DataTable dt = new DataTable
                ();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@SrNo",objp.RespoCode)
            };
            dt = objdb.ExecProcDataTable(Proname, param);
            return dt;

        }
        public DataTable GetSearch(string procName, PropertyClass objp)
        {

            DataTable dt = new DataTable
                ();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Search",objp.Search),

            };
            dt = objdb.ExecProcDataTable(procName, param);
            return dt;

        }

        public DataTable DeleteRootcategoty(PropertyClass objp, string procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@SrNo",objp.RespoCode),
                new SqlParameter("@Action",objp.Action)
            };
            dt = objdb.ExecProcDataTable(procname, para);
            return
                 dt;

        }

        public DataTable GetBestSeller(PropertyClass objp, string procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] paream = new SqlParameter[]
            {
                new SqlParameter("@Action","1")
            };
            dt = objdb.ExecProcDataTable(procname, paream);
            return dt;


        }
        public DataTable GetAutocompletedata(PropertyClass Objp, string procname, string Action, string value)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Action),
                new SqlParameter("@catid ",value)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }

        public DataTable getfilterdata(PropertyClass objp, string procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@catid",objp.catid)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }

        public DataTable OfferMasterInsertUpdate(string procname, OfferProperty objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@OfferName",objp.offername),
                new SqlParameter("@OfferImage",objp.offerimage),
                new SqlParameter("@ID",objp.Id)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;
        }

        public DataTable Showofferdetails(string procname, OfferProperty objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@Offerid",objp.offername)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }

        public DataTable CustomerDetails(string procnmae, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@username",objp.UserName)
            };
            dt = objdb.ExecProcDataTable(procnmae, parm);
            return dt;
        }

        public DataTable UpdatecustomerDetails(string procnmae, PropertyClass objp)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),
                new SqlParameter("@CustomerName",objp.name),
                new SqlParameter("@email",objp.EmailAddress),
                new SqlParameter("@id",objp.UserName)
            };
            dt = objdb.ExecProcDataTable(procnmae, param);
            return dt;

        }

        public DataTable RetailerSActivationandBlock(string procname, string Retid, string Action)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",Action),
                new SqlParameter("@RespoCode",Retid)
            };

            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }
        public DataTable getlistedproductforedit(PropertyClass objp, string procname)
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Action",objp.Action),new SqlParameter("@ProductId",objp.productid)
            };
            dt = objdb.ExecProcDataTable(procname, param);
            return dt;

        }
    }



    public class registration

    {
        public string Action { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string name { get; set; }
        public string Gender { get; set; }
    }
}