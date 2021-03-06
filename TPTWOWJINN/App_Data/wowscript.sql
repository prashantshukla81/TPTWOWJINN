USE [DBWOW]
GO
/****** Object:  User [wowuser]    Script Date: 2/7/2022 12:07:05 PM ******/
CREATE USER [wowuser] FOR LOGIN [wowuser] WITH DEFAULT_SCHEMA=[wowuser]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [wowuser]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [wowuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [wowuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [wowuser]
GO
/****** Object:  Schema [wowuser]    Script Date: 2/7/2022 12:07:06 PM ******/
CREATE SCHEMA [wowuser]
GO
/****** Object:  UserDefinedTableType [dbo].[tbl_orderitems]    Script Date: 2/7/2022 12:07:06 PM ******/
CREATE TYPE [dbo].[tbl_orderitems] AS TABLE(
	[ProductId] [varchar](100) NULL,
	[unitrate] [decimal](18, 2) NULL,
	[Qty] [decimal](10, 0) NULL,
	[SaleRate] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tbl_VariationList]    Script Date: 2/7/2022 12:07:07 PM ******/
CREATE TYPE [dbo].[tbl_VariationList] AS TABLE(
	[VariationValue] [varchar](100) NULL,
	[UnitId] [varchar](50) NULL,
	[MRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[Quantity] [bigint] NULL,
	[Param1] [varchar](50) NULL,
	[Param2] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[type_ProductAssignList]    Script Date: 2/7/2022 12:07:08 PM ******/
CREATE TYPE [dbo].[type_ProductAssignList] AS TABLE(
	[ProductId] [varchar](50) NULL,
	[VariationId] [varchar](20) NULL,
	[MRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[AvlStock] [decimal](18, 2) NULL,
	[Param1] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[contactus]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactus](
	[SRNO] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
	[EMAILADDRESS] [varchar](100) NULL,
	[TITLE] [varchar](100) NULL,
	[COMMENTS] [varchar](max) NULL,
	[ENTRYDATE] [datetime] NULL,
	[STATUS] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[managelogo]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[managelogo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[logoname] [varchar](100) NULL,
	[Isactive] [varchar](100) NULL,
	[Entrydate] [datetime] NULL,
	[gif] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterCity]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterCity](
	[Cityid] [int] IDENTITY(1,1) NOT NULL,
	[Stateid] [int] NULL,
	[City] [varchar](50) NULL,
	[StatePrefix] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterState]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterState](
	[Stateid] [bigint] IDENTITY(1,1) NOT NULL,
	[State] [varchar](50) NULL,
	[EntryUser] [varchar](50) NULL,
	[StatePrefix] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_StateMaster] PRIMARY KEY CLUSTERED 
(
	[Stateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orderlisttable]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orderlisttable](
	[ProductId] [varchar](100) NULL,
	[unitrate] [decimal](18, 2) NULL,
	[Qty] [decimal](10, 0) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[orderid] [varchar](100) NULL,
	[status] [varchar](50) NULL,
	[DispatchdDate] [datetime] NULL,
	[Dileverydate] [datetime] NULL,
	[Orderaccepted] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[placeoperlist]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[placeoperlist](
	[srno] [int] IDENTITY(1,1) NOT NULL,
	[Customercode] [varchar](50) NULL,
	[Fullname] [varchar](200) NULL,
	[Mobilenumber] [varchar](20) NULL,
	[Pincode] [varchar](10) NULL,
	[Locality] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Alternatemobile] [varchar](20) NULL,
	[Addresstype] [varchar](100) NULL,
	[Isactive] [int] NULL,
	[Entrydate] [datetime] NULL,
	[paymentmethod] [varchar](100) NULL,
	[totalpaidamt] [decimal](18, 2) NULL,
	[dicountamt] [decimal](18, 2) NULL,
	[deliveryamt] [decimal](18, 2) NULL,
	[Transactionid] [varchar](100) NULL,
	[orderid] [varchar](100) NULL,
	[status] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_AreaMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_AreaMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CityId] [varchar](10) NULL,
	[AreaName] [varchar](200) NULL,
	[Pincode] [varchar](10) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CategoryMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CategoryMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RootCategoryId] [varchar](20) NULL,
	[CategoryId] [varchar](20) NULL,
	[CategoryName] [varchar](200) NULL,
	[Cat_Image] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](200) NULL,
	[SlugName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CompanyMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CompanyMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [varchar](50) NULL,
	[CompanyName] [varchar](200) NULL,
	[ContactPerson] [varchar](100) NULL,
	[MobileNo] [varchar](20) NULL,
	[EmailAddress] [varchar](200) NULL,
	[StateId] [varchar](20) NULL,
	[DistrictId] [varchar](20) NULL,
	[TehsilId] [varchar](20) NULL,
	[Address] [varchar](1000) NULL,
	[GSTINNo] [varchar](25) NULL,
	[CINNo] [varchar](50) NULL,
	[PANNo] [varchar](20) NULL,
	[WebsiteURL] [varchar](200) NULL,
	[companyLogoUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[ProfarmaNoPrefix] [varchar](50) NULL,
	[MemberPrefix] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Counter]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Counter](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RetailerCount] [bigint] NULL,
	[RootCategoryCount] [bigint] NULL,
	[CategoryCount] [bigint] NULL,
	[SubCategoryCount] [bigint] NULL,
	[ProductCount] [bigint] NULL,
	[DeliveryExcutive] [bigint] NULL,
	[Customer] [bigint] NULL,
	[offerproduct] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_CustomerAddress]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_CustomerAddress](
	[srno] [int] IDENTITY(1,1) NOT NULL,
	[Customercode] [varchar](50) NULL,
	[Fullname] [varchar](200) NULL,
	[Mobilenumber] [varchar](20) NULL,
	[Pincode] [varchar](10) NULL,
	[Locality] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Alternatemobile] [varchar](20) NULL,
	[Addresstype] [varchar](100) NULL,
	[Isactive] [int] NULL,
	[Entrydate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CustomerMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CustomerMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NULL,
	[CustomerName] [varchar](100) NULL,
	[MobileNo] [varchar](20) NULL,
	[EmailAddress] [varchar](200) NULL,
	[ProfilePic] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[Gender] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_DeliveryExcutives]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_DeliveryExcutives](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[DeliveryExcutivesCode] [varchar](50) NULL,
	[Name] [varchar](200) NULL,
	[MobileNo] [varchar](20) NULL,
	[EmailAddress] [varchar](200) NULL,
	[Address] [varchar](1000) NULL,
	[AadharNo] [varchar](25) NULL,
	[PANNo] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[ZoneCode] [varchar](20) NULL,
	[ImageFile] [nvarchar](200) NULL,
	[BankAccName] [varchar](100) NULL,
	[AccountNumber] [varchar](20) NULL,
	[BankName] [varchar](100) NULL,
	[IFSCCode] [varchar](20) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LoginMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LoginMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchCode] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleType] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Name] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MainCart]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MainCart](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](50) NULL,
	[ProductId] [varchar](50) NULL,
	[VariationId] [varchar](50) NULL,
	[Quantity] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MainMenu]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MainMenu](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuTitle] [varchar](200) NULL,
	[MenuUrl] [varchar](1000) NULL,
	[MenuIcon] [nvarchar](max) NULL,
	[Priority] [bigint] NULL,
	[IsActive] [bit] NULL,
	[color_code] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MenuConfiguration]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MenuConfiguration](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[MainMenuId] [varchar](50) NULL,
	[SubMenuId] [varchar](50) NULL,
	[RoleId] [varchar](50) NULL,
	[UserId] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_offermaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_offermaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OfferName] [varchar](100) NULL,
	[OfferImage] [varchar](max) NULL,
	[offerdid] [varchar](50) NULL,
	[Isactive] [int] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](20) NULL,
	[RetailerCode] [varchar](20) NULL,
	[ProductTitle] [varchar](100) NULL,
	[RootCatId] [varchar](20) NULL,
	[CatId] [varchar](20) NULL,
	[SubCatId] [varchar](20) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductMRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[CommQty] [bigint] NULL,
	[MainImgFile] [varchar](1000) NULL,
	[Img1] [varchar](1000) NULL,
	[Img2] [varchar](1000) NULL,
	[Img3] [varchar](1000) NULL,
	[Img4] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](50) NULL,
	[IsMultiVariant] [bit] NULL,
	[IsExchangeble] [bit] NULL,
	[percentage] [int] NULL,
	[deliverycharge] [decimal](18, 0) NULL,
	[offerproductid] [varchar](50) NULL,
	[Isofferproduct] [varchar](50) NULL,
	[Offerimage] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductMasterHistory]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductMasterHistory](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](20) NULL,
	[RetailerCode] [varchar](20) NULL,
	[ProductTitle] [varchar](100) NULL,
	[RootCatId] [varchar](20) NULL,
	[CatId] [varchar](20) NULL,
	[SubCatId] [varchar](20) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductMRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[CommQty] [bigint] NULL,
	[MainImgFile] [varchar](1000) NULL,
	[Img1] [varchar](1000) NULL,
	[Img2] [varchar](1000) NULL,
	[Img3] [varchar](1000) NULL,
	[Img4] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](50) NULL,
	[DeleteDate] [datetime] NULL,
	[DeleteBy] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductMasterOffer]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductMasterOffer](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](20) NULL,
	[RetailerCode] [varchar](20) NULL,
	[ProductTitle] [varchar](100) NULL,
	[RootCatId] [varchar](20) NULL,
	[CatId] [varchar](20) NULL,
	[SubCatId] [varchar](20) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductMRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[CommQty] [bigint] NULL,
	[MainImgFile] [varchar](1000) NULL,
	[Img1] [varchar](1000) NULL,
	[Img2] [varchar](1000) NULL,
	[Img3] [varchar](1000) NULL,
	[Img4] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](50) NULL,
	[IsMultiVariant] [bit] NULL,
	[IsExchangeble] [bit] NULL,
	[Offertype] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductQuantityManage]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductQuantityManage](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](20) NULL,
	[variationId] [varchar](20) NULL,
	[Quantity] [bigint] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductVariations]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductVariations](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](50) NULL,
	[VariationValue] [varchar](500) NULL,
	[UnitId] [varchar](50) NULL,
	[MRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[Quantity] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Retailers]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Retailers](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RetailerCode] [varchar](50) NULL,
	[RetailerName] [varchar](200) NULL,
	[MobileNo] [varchar](20) NULL,
	[EmailAddress] [varchar](200) NULL,
	[StateId] [varchar](20) NULL,
	[CityId] [varchar](20) NULL,
	[Address] [varchar](1000) NULL,
	[GSTINNo] [varchar](25) NULL,
	[CINNo] [varchar](50) NULL,
	[PANNo] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[BusinessName] [varchar](200) NULL,
	[ZoneCode] [varchar](20) NULL,
	[KYCDocumentType] [varchar](200) NULL,
	[KYCDocumentNo] [varchar](20) NULL,
	[KYCDocFile] [nvarchar](200) NULL,
	[PanDoc] [nvarchar](200) NULL,
	[TANNo] [varchar](20) NULL,
	[TANDoc] [nvarchar](200) NULL,
	[BankAccName] [varchar](100) NULL,
	[AccountNumber] [varchar](20) NULL,
	[BankName] [varchar](100) NULL,
	[IFSCCode] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_RetailersProductList]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_RetailersProductList](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RetailerId] [varchar](50) NULL,
	[ProductId] [varchar](50) NULL,
	[VariationId] [varchar](20) NULL,
	[MRP] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[AvailableStock] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_RoleMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [varchar](20) NULL,
	[RoleName] [varchar](200) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_RootCategoryMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_RootCategoryMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[RootCategoryId] [varchar](20) NULL,
	[RootCategoryName] [varchar](200) NULL,
	[Cat_Image] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](200) NULL,
	[SlugName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SubCategoryMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SubCategoryMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [varchar](20) NULL,
	[SubCategoryId] [varchar](20) NULL,
	[SubCategoryName] [varchar](200) NULL,
	[Cat_Image] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](200) NULL,
	[SlugName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SubMenu]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SubMenu](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[MainMenuId] [varchar](200) NULL,
	[MenuTitle] [varchar](200) NULL,
	[MenuUrl] [varchar](1000) NULL,
	[MenuIcon] [varchar](200) NULL,
	[Priority] [bigint] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_tempCart]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_tempCart](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[IpCode] [varchar](100) NULL,
	[ProductId] [varchar](50) NULL,
	[VariationId] [varchar](50) NULL,
	[Quantity] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UnitMaster]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_UnitMaster](
	[SrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [wowuser].[orderlisttable]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [wowuser].[orderlisttable](
	[ProductId] [varchar](100) NULL,
	[unitrate] [decimal](18, 2) NULL,
	[Qty] [decimal](10, 0) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[orderid] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [wowuser].[Tbl_BannerListing]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [wowuser].[Tbl_BannerListing](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[SmallTitle] [varchar](50) NULL,
	[Title] [varchar](100) NULL,
	[BannerType] [varchar](100) NULL,
	[Entrydate] [datetime] NULL,
	[IsActive] [int] NULL,
	[Image] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [wowuser].[tbl_venderposition]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [wowuser].[tbl_venderposition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendername] [varchar](100) NULL,
	[venderposation] [varchar](100) NULL,
	[isactive] [varchar](20) NULL,
	[Entrydate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_venderlist]    Script Date: 2/7/2022 12:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[view_venderlist]
as 
select 'Admin' vcode,'Admin' vname
union all 
select CompanyId vcode,CompanyName vname from dbo.tbl_CompanyMaster
union all 
select EmailAddress as vcode,RetailerName as vname from tbl_Retailers


GO
SET IDENTITY_INSERT [dbo].[contactus] ON 

INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (1, N'Aniket Sharma', N'aniketsharmahkpmbd', N'74125893.', N'lakldfhh', CAST(N'2020-12-29 19:33:18.243' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (2, N'', N'', N'', N'this site is more attractive ', CAST(N'2021-01-24 16:10:15.683' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (3, N'Priyanka Verma', N'priyankaverma', N'', N'this site is more attractive ', CAST(N'2021-01-24 16:11:17.870' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (4, N'ef', N'we', N'ewt', N'weqt', CAST(N'2021-01-25 13:01:22.650' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (5, N'ytre', N'rye', N'reyt', N'tye', CAST(N'2021-01-25 13:02:26.120' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (6, N'dg', N'dsh', N'gh', N'g', CAST(N'2021-01-25 13:04:00.413' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (7, N'xzxV', N'zxvV', N'cv', N'cv', CAST(N'2021-01-25 13:04:20.617' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (8, N'DC', N'R', N'R4GB', N'4B', CAST(N'2021-01-25 17:03:09.793' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (9, N'Wowjin', N'wowjinnn.com@gmail.com', N'1234567890', N'It is very useful for us', CAST(N'2021-01-26 14:32:13.777' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (10, N'Wowjin', N'wowjin.com@gmail.com', N'7317411671', N'It is a multi vender website ', CAST(N'2021-01-28 14:01:29.843' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (11, N'', N'', N'', N'', CAST(N'2021-01-30 18:15:49.410' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (12, N'', N'', N'', N'', CAST(N'2021-01-30 18:15:49.467' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (13, N'Divya Rai', N'divya@gmail.com', N'8052978684', N'You are providing good services . Thank You', CAST(N'2021-01-30 18:40:33.867' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (14, N'Atul', N'atulwowjinn@gmail.com', N'7355606240', N'It is a wonderful platefrom online shoping', CAST(N'2021-02-01 12:25:46.250' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (15, N'Priyanka Verma', N'priyankaverma731741@gmail.com', N'7317411671', N'It is a faster platefrom of online shoping', CAST(N'2021-02-03 17:29:02.790' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (16, N'Atul Kumar Yadav', N'atulwowjinn@gmail.com', N'7380891076', N'I want to Know More about this Website ', CAST(N'2021-02-05 14:21:32.853' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (17, NULL, NULL, NULL, NULL, CAST(N'2021-02-12 20:55:51.990' AS DateTime), 1)
INSERT [dbo].[contactus] ([SRNO], [NAME], [EMAILADDRESS], [TITLE], [COMMENTS], [ENTRYDATE], [STATUS]) VALUES (18, NULL, NULL, NULL, NULL, CAST(N'2021-02-12 22:32:21.563' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[contactus] OFF
SET IDENTITY_INSERT [dbo].[managelogo] ON 

INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (8, N'sfd', N'1', CAST(N'2021-01-08 13:00:17.907' AS DateTime), N'Root_637456608000000000.gif')
INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (3, N'Aniet', N'1', CAST(N'2021-01-05 18:42:54.667' AS DateTime), N'Root_637456608000000000.gif')
INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (11, N'Zcbx', N'1', CAST(N'2021-01-08 13:04:50.817' AS DateTime), N'Root_637456608000000000.png')
INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (12, N'sG', N'1', CAST(N'2021-01-08 13:07:40.903' AS DateTime), N'Root_637456608000000000.png')
INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (14, N'Dsb', N'1', CAST(N'2021-01-08 13:09:10.763' AS DateTime), N'Root_637456608000000000.png')
INSERT [dbo].[managelogo] ([id], [logoname], [Isactive], [Entrydate], [gif]) VALUES (15, N'Alladin', N'1', CAST(N'2021-01-08 13:09:45.667' AS DateTime), N'Root_637456608000000000.gif')
SET IDENTITY_INSERT [dbo].[managelogo] OFF
SET IDENTITY_INSERT [dbo].[MasterCity] ON 

INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (17, 34, N'Prayagraj', NULL, CAST(N'2021-01-22 13:09:56.480' AS DateTime), 1)
INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (18, 29, N'Jaipur', NULL, CAST(N'2021-01-22 13:10:19.077' AS DateTime), 1)
INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (19, 20, N'mp', NULL, CAST(N'2021-01-22 13:10:54.687' AS DateTime), 1)
INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (20, 11, N'goa', NULL, CAST(N'2021-01-22 13:11:06.037' AS DateTime), 1)
INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (21, 34, N'LUCKNOW', NULL, CAST(N'2021-01-24 13:21:49.720' AS DateTime), 1)
INSERT [dbo].[MasterCity] ([Cityid], [Stateid], [City], [StatePrefix], [EntryDate], [IsActive]) VALUES (22, 34, N'Kanpur', NULL, CAST(N'2021-02-04 21:22:47.797' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MasterCity] OFF
SET IDENTITY_INSERT [dbo].[MasterState] ON 

INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (1, N'Andaman And Nicobar Islands', N'admin', N'A.N.I.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (2, N'Andhrs Pradesh', N'admin', N'A.P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (3, N'Arunachal Pradesh', N'admin', N'A.P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (4, N'Assam', N'admin', N'A.S.M.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (5, N'Bihar', N'admin', N'B.H.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (6, N'Chattisgarh', N'admin', NULL, CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (7, N'Chandigarh', N'admin', N'C.H.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (8, N'Daman And Diu', N'admin', N'D.D.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (9, N'Delhi', N'admin', N'D.L.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (10, N'Dadra And Nagar Haveli', N'admin', N'D.N.H.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (11, N'Goa', N'admin', N'G.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (12, N'Gujarat', N'admin', N'G.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (13, N'Himanchal Pradesh', N'admin', N'H.P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (14, N'Haryana', N'admin', N'H.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (15, N'Jammu And Kashmir', N'admin', N'J.K.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (16, N'Jharkhand', N'admin', N'J.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (17, N'Kerala', N'admin', N'K.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (18, N'Karnataka', N'admin', N'K.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (19, N'Lakshadweep', N'admin', N'L.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (20, N'Madhya Pradesh', N'admin', N'M.P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (21, N'Maharashtra', N'admin', N'M.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (22, N'Manipur', N'admin', N'M.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (23, N'Meghalaya', N'admin', N'M.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (24, N'Mizoram', N'admin', N'M.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (25, N'Nagaland', N'admin', N'N.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (26, N'Orissa', N'admin', N'O.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (27, N'Pondicherry', N'admin', N'P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (28, N'Punjab', N'admin', N'P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (29, N'Rajasthan', N'admin', N'R.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (30, N'Sikkim', N'admin', N'S.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (31, N'Tamil Nadu', N'admin', N'T.N.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (32, N'Tripura', N'admin', N'T.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (33, N'Uttarakhand', N'admin', N'U.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (34, N'Uttar Pradesh', N'admin', N'U.P.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (35, N'West Bangal', N'admin', N'W.B.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
INSERT [dbo].[MasterState] ([Stateid], [State], [EntryUser], [StatePrefix], [EntryDate], [IsActive]) VALUES (36, N'Telangana', N'admin', N'T.', CAST(N'2020-09-11 12:14:13.377' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MasterState] OFF
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000004', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER1', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000004', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER2', N'Delivered', CAST(N'2021-01-29 17:08:01.697' AS DateTime), CAST(N'2021-01-29 17:08:15.850' AS DateTime), CAST(N'2021-01-29 17:07:33.543' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000005', CAST(300.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(300.00 AS Decimal(18, 2)), N'ORDER3', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000008', CAST(90.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(90.00 AS Decimal(18, 2)), N'ORDER4', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000007', CAST(60.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(60.00 AS Decimal(18, 2)), N'ORDER4', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000007', CAST(60.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(60.00 AS Decimal(18, 2)), N'ORDER5', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000005', CAST(300.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(300.00 AS Decimal(18, 2)), N'ORDER5', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000007', CAST(60.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(60.00 AS Decimal(18, 2)), N'ORDER6', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000004', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER6', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000018', CAST(100.00 AS Decimal(18, 2)), CAST(3 AS Decimal(10, 0)), CAST(300.00 AS Decimal(18, 2)), N'ORDER7', N'Order Dispatched', CAST(N'2021-02-01 15:11:39.357' AS DateTime), NULL, CAST(N'2021-02-01 15:11:03.803' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(4 AS Decimal(10, 0)), CAST(1000.00 AS Decimal(18, 2)), N'ORDER1', N'Order accepted', NULL, NULL, CAST(N'2021-02-04 14:41:42.950' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000023', CAST(1000.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(1000.00 AS Decimal(18, 2)), N'ORDER1', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(35.00 AS Decimal(18, 2)), N'ORDER2', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER3', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000024', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER4', N'Order Dispatched', CAST(N'2021-02-08 14:41:48.657' AS DateTime), CAST(N'2021-02-04 16:47:47.180' AS DateTime), CAST(N'2021-02-04 14:43:58.793' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER5', N'Order accepted', NULL, NULL, CAST(N'2021-02-04 16:49:57.603' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER6', N'Order accepted', NULL, NULL, CAST(N'2021-02-04 20:33:40.860' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000024', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER7', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000023', CAST(1000.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(1000.00 AS Decimal(18, 2)), N'ORDER7', N'Order accepted', CAST(N'2021-02-04 21:28:48.307' AS DateTime), CAST(N'2021-02-04 21:29:00.747' AS DateTime), CAST(N'2021-02-05 14:48:13.050' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER8', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER9', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER10', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER11', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER12', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER13', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER14', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER15', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(500.00 AS Decimal(18, 2)), N'ORDER24', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000025', CAST(52.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(52.00 AS Decimal(18, 2)), N'ORDER24', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000025', CAST(52.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(52.00 AS Decimal(18, 2)), N'ORDER25', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000024', CAST(50.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(100.00 AS Decimal(18, 2)), N'ORDER26', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000021', CAST(250.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(250.00 AS Decimal(18, 2)), N'ORDER27', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000023', CAST(1000.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(2000.00 AS Decimal(18, 2)), N'ORDER28', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000025', CAST(52.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(52.00 AS Decimal(18, 2)), N'ORDER29', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000023', CAST(1000.00 AS Decimal(18, 2)), CAST(3 AS Decimal(10, 0)), CAST(3000.00 AS Decimal(18, 2)), N'ORDER30', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000023', CAST(1000.00 AS Decimal(18, 2)), CAST(3 AS Decimal(10, 0)), CAST(3000.00 AS Decimal(18, 2)), N'ORDER31', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(4 AS Decimal(10, 0)), CAST(140.00 AS Decimal(18, 2)), N'ORDER32', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(4 AS Decimal(10, 0)), CAST(140.00 AS Decimal(18, 2)), N'ORDER33', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(4 AS Decimal(10, 0)), CAST(140.00 AS Decimal(18, 2)), N'ORDER34', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER35', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER36', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER37', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER38', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER39', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER40', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER41', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER42', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER43', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER44', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER45', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000027', CAST(1.00 AS Decimal(18, 2)), CAST(7 AS Decimal(10, 0)), CAST(1.00 AS Decimal(18, 2)), N'ORDER46', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER47', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER47', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER48', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER48', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER49', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER49', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER50', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER50', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER51', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER51', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER52', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER52', N'Order accepted', NULL, NULL, CAST(N'2021-02-12 20:26:41.833' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER53', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER53', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER54', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER54', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER55', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER55', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER56', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER56', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER57', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER57', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER58', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER58', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER59', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER59', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER60', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER60', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000064', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER61', N'DEL', CAST(N'2021-02-15 16:52:37.950' AS DateTime), CAST(N'2021-02-15 16:55:04.170' AS DateTime), CAST(N'2021-02-15 16:53:56.643' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000063', CAST(120.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(120.00 AS Decimal(18, 2)), N'ORDER61', N'Order accepted', NULL, NULL, CAST(N'2021-02-12 20:26:48.117' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER62', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER64', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER65', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER66', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER67', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER68', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER16', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER17', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER18', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER19', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER20', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER21', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER22', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000020', CAST(35.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER23', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000058', CAST(20.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(20.00 AS Decimal(18, 2)), N'ORDER63', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000056', CAST(80.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(80.00 AS Decimal(18, 2)), N'ORDER69', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000055', CAST(30.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(30.00 AS Decimal(18, 2)), N'ORDER72', N'Delivered', CAST(N'2021-02-14 12:31:10.633' AS DateTime), CAST(N'2021-02-14 12:31:32.850' AS DateTime), NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000057', CAST(30.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(30.00 AS Decimal(18, 2)), N'ORDER73', N'Order accepted', NULL, NULL, CAST(N'2021-02-14 12:29:48.290' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000111', CAST(150.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(150.00 AS Decimal(18, 2)), N'ORDER74', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000125', CAST(50.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(50.00 AS Decimal(18, 2)), N'ORDER74', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000185', CAST(475.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(475.00 AS Decimal(18, 2)), N'ORDER75', N'Order accepted', NULL, NULL, CAST(N'2021-02-15 11:32:36.083' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000184', CAST(190.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(190.00 AS Decimal(18, 2)), N'ORDER75', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000185', CAST(475.00 AS Decimal(18, 2)), CAST(0 AS Decimal(10, 0)), CAST(475.00 AS Decimal(18, 2)), N'ORDER76', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000185', CAST(475.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(475.00 AS Decimal(18, 2)), N'ORDER77', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000098', CAST(197.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(197.00 AS Decimal(18, 2)), N'ORDER77', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000097', CAST(15.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(15.00 AS Decimal(18, 2)), N'ORDER77', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000095', CAST(28.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(28.00 AS Decimal(18, 2)), N'ORDER77', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000183', CAST(750.00 AS Decimal(18, 2)), CAST(2 AS Decimal(10, 0)), CAST(1500.00 AS Decimal(18, 2)), N'ORDER78', N'Order Dispatched', CAST(N'2021-02-15 18:24:20.060' AS DateTime), NULL, CAST(N'2021-02-15 18:24:03.540' AS DateTime))
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000185', CAST(475.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(475.00 AS Decimal(18, 2)), N'ORDER79', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000184', CAST(190.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(190.00 AS Decimal(18, 2)), N'ORDER79', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER70', NULL, NULL, NULL, NULL)
INSERT [dbo].[orderlisttable] ([ProductId], [unitrate], [Qty], [SaleRate], [orderid], [status], [DispatchdDate], [Dileverydate], [Orderaccepted]) VALUES (N'MDYOSPR0000062', CAST(70.00 AS Decimal(18, 2)), CAST(1 AS Decimal(10, 0)), CAST(70.00 AS Decimal(18, 2)), N'ORDER71', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[placeoperlist] ON 

INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (1, N'1', N'Aniket Sharma', NULL, NULL, NULL, NULL, NULL, N'Andaman & Nicobar Islands', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-02 17:47:21.257' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER1', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (2, N'1', N'Aniket Sharma', NULL, NULL, NULL, NULL, N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-04 00:29:30.400' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER2', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (3, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'Bihar', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-04 14:02:15.337' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER3', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (4, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', N'hfjhfjh', N'AYODHYA
UTTAR PRADESH', N'AYODHYA', N'Uttar Pradesh', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-04 14:43:18.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER4', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (5, N'+919919343999', N'amar', N'9919343999', N'245634', N'jkhsdk', N'kjhd', N'kjhdkh', N'Andaman & Nicobar Islands', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-04 16:49:40.397' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER5', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (6, N'8382842791', N'sdfahsjfdh', N'fhdkgflhk', N'67856', N'sdjhkf', N'jdhgfk', N'jhfk', N'Andhra Pradesh', N'dghfj', N'dhgjgk', N'Home (All day delivery)', NULL, CAST(N'2021-02-04 20:33:08.487' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER6', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (7, N'Admin', N'Atul Yadav', N'9919282640', N'226016', N'Indira Nagar', N'Lucknow
UTTAR PRADESH', N'Lucknow', N'null', N'Ring Road', N'7380891076', N'Home (All day delivery)', NULL, CAST(N'2021-02-04 21:27:53.553' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER7', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (8, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:24:11.697' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER8', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (9, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:28:04.513' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER9', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (10, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:29:17.363' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER10', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (11, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:31:21.877' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER11', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (12, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:32:18.030' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER12', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (13, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:34:49.517' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER13', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (14, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:36:31.533' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER14', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (15, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 15:39:26.113' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER15', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (24, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 23:51:55.997' AS DateTime), N'COD', CAST(552.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER24', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (25, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 23:59:49.433' AS DateTime), N'COD', CAST(52.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER25', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (26, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-06 00:12:06.173' AS DateTime), N'COD', CAST(100.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER26', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (27, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-06 00:19:05.457' AS DateTime), N'COD', CAST(250.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER27', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (28, N'6392657909', NULL, NULL, N'226010', N'Gomti nagar lucknow', N'Gomti nagar lucknow', N'Lucknow', NULL, N'fsgscvs', NULL, N'Home', NULL, CAST(N'2021-02-06 09:57:16.023' AS DateTime), N'COD', CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER28', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (29, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-06 12:06:19.690' AS DateTime), N'COD', CAST(52.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER29', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (30, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', N'Uttar Pradesh', NULL, N'7317411671', N'Home (All day delivery)', NULL, CAST(N'2021-02-06 18:42:07.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER30', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (31, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', N'Uttar Pradesh', NULL, N'7317411671', N'Home (All day delivery)', NULL, CAST(N'2021-02-06 18:42:19.300' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER31', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (32, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', NULL, CAST(N'2021-02-07 00:13:21.860' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER32', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (33, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', NULL, CAST(N'2021-02-07 00:13:34.523' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER33', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (34, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', NULL, CAST(N'2021-02-07 00:13:54.517' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER34', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (35, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:55:52.113' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER35', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (36, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:55:57.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER36', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (37, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:00.017' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER37', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (38, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:00.533' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER38', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (39, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:00.580' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER39', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (40, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:01.517' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER40', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (41, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:01.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER41', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (42, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:02.007' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER42', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (43, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:02.157' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER43', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (44, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:02.650' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER44', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (45, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:02.803' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER45', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (46, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-08 11:56:40.390' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER46', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (47, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:47:59.097' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER47', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (48, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:02.627' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER48', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (49, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:03.423' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER49', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (50, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:03.590' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER50', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (51, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:03.757' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER51', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (16, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:26:30.893' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER16', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (17, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:28:55.720' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER17', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (18, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:28:58.870' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER18', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (19, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:29:00.523' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER19', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (20, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:29:01.070' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER20', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (21, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:29:01.563' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER21', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (22, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:29:02.167' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER22', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (23, N'6392657909', NULL, NULL, N'226010', N'rahat', N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', NULL, CAST(N'2021-02-05 20:29:02.547' AS DateTime), N'COD', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER23', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (52, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:03.927' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER52', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (53, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.093' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER53', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (54, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.247' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER54', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (55, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.423' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER55', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (56, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER56', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (57, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.773' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER57', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (58, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:04.957' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER58', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (59, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:13.793' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER59', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (60, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:24.920' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER60', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (61, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-09 19:48:27.403' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER61', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (62, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:49:01.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER62', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (63, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:51:59.793' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER63', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (64, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:54:28.903' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER64', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (65, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:55:03.187' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER65', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (66, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:55:07.263' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER66', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (67, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:55:12.527' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER67', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (68, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 17:55:16.970' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER68', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (69, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 18:20:17.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER69', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (70, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 18:24:44.850' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER70', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (71, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-10 18:26:54.050' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER71', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (72, N'1', NULL, NULL, N'226010', N'Gomti Nagar', N'Gomti Nagar', N'Lucknow', NULL, N'Lucknow', NULL, N'Home', NULL, CAST(N'2021-02-11 15:30:39.130' AS DateTime), N'COD', CAST(30.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER72', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (73, N'6392657909', NULL, NULL, N'226010', N'Near, Adarsh park', N'Near, Adarsh park', N'Lucknow', NULL, N'Punjab National Park', NULL, N'Home', NULL, CAST(N'2021-02-12 01:14:15.160' AS DateTime), N'COD', CAST(30.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER73', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (74, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-14 15:27:45.760' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER74', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (75, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-14 15:29:40.760' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER75', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (76, N'6392657909', NULL, NULL, N'226010', N'Near, Adarsh park', N'Near, Adarsh park', N'Lucknow', NULL, N'Punjab National Park', NULL, N'Home', NULL, CAST(N'2021-02-15 11:34:20.770' AS DateTime), N'COD', CAST(475.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'ORDER76', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (77, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-15 11:36:24.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER77', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (78, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-15 18:14:24.230' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER78', N'Order Placed')
INSERT [dbo].[placeoperlist] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate], [paymentmethod], [totalpaidamt], [dicountamt], [deliveryamt], [Transactionid], [orderid], [status]) VALUES (79, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', NULL, CAST(N'2021-02-15 18:33:38.247' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ORDER79', N'Order Placed')
SET IDENTITY_INSERT [dbo].[placeoperlist] OFF
SET IDENTITY_INSERT [dbo].[tbl_AreaMaster] ON 

INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (379, N'21', N'Gomti Nagar', N'226010', 1, CAST(N'2021-02-04 21:23:56.613' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (2, N'2', N'jhvh', N'34', 1, CAST(N'2020-12-04 17:43:59.040' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (6, N'6', N'Aniekt Sharma', N'235', 1, CAST(N'2020-12-04 18:36:51.897' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (309, N'7', N'Hazratganj', N'226001', 1, CAST(N'2021-01-14 13:41:23.713' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (310, N'7', N'ARJUNGANJ', N'226002', 1, CAST(N'2021-01-15 15:58:36.943' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (354, N'0', N'Chwok', N'226003', 1, CAST(N'2021-01-15 18:40:37.510' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (357, N'0', N'Charbhagh', N'226004', 1, CAST(N'2021-01-15 18:44:20.437' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (313, N'7', N'ALAMBAGH THANA', N'226005', 1, CAST(N'2021-01-15 16:07:59.777' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (12, N'0', N'dfdv', N'212321', 1, CAST(N'2020-12-24 19:10:44.653' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (13, N'0', N'efczds', N'212321', 1, CAST(N'2020-12-24 19:11:07.880' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (14, N'0', N'vccccfvs', N'234323', 1, CAST(N'2020-12-24 19:11:36.197' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (314, N'7', N'NISHATGANJ MAHANAGAR LUCKNOW', N'226006', 1, CAST(N'2021-01-15 16:08:46.453' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (316, N'7', N'SAROJINI NAGAR', N'226008', 1, CAST(N'2021-01-15 16:10:57.507' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (317, N'7', N'naini', N'226009', 1, CAST(N'2021-01-15 16:12:19.470' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (340, N'0', N'Gomti Nagar', N'226010', 1, CAST(N'2021-01-15 18:02:56.183' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (377, N'18', N'green zone', N'123456', 1, CAST(N'2021-01-22 16:01:51.500' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (365, N'8', N'jhhj', N'21210', 1, CAST(N'2021-01-21 17:32:30.833' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (321, N'7', N'IIM CAMPUS OFFICE SITAPUR ROAD MUBARAKPUR', N'226013', 1, CAST(N'2021-01-15 16:17:42.210' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (322, N'7', N'SGPGI STATE BANK OF INDIA', N'226014', 1, CAST(N'2021-01-15 16:18:36.153' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (323, N'7', N' NIZAMUDDIN PUR INDIRA NAGAR LUCKNOW ', N'226015585', 1, CAST(N'2021-01-15 16:19:55.370' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (341, N'0', N'Indira Nagar', N'226016', 1, CAST(N'2021-01-15 18:15:30.213' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (346, N'0', N'Rajajipuram', N'226017', 1, CAST(N'2021-01-15 18:24:28.627' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (352, N'0', N'Aminabad', N'226018', 1, CAST(N'2021-01-15 18:37:23.713' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (328, N'7', N'CHINHAT IND AREA SIS BARRUK INDUSTRIA', N'22601', 1, CAST(N'2021-01-15 16:25:42.800' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (329, N'7', N'HAQ COLONY SITAPUR ROAD NIRALANAGAR', N'226020', 1, CAST(N'2021-01-15 16:26:38.410' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (345, N'0', N'Jankipuram', N'226021', 1, CAST(N'2021-01-15 18:22:24.493' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (343, N'0', N'Khurram Nagar', N'226022', 1, CAST(N'2021-01-15 18:18:55.153' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (332, N'7', N'KRISHNA NAGAR KOTWLI KANPUR ROAD ', N'226023', 1, CAST(N'2021-01-15 16:29:40.917' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (333, N'7', N'ALIGANJ LUCKNOW', N'226024', 1, CAST(N'2021-01-15 16:30:39.837' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (334, N'7', N'TELIBAGH MARKET', N'226024', 1, CAST(N'2021-01-15 16:34:27.633' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (335, N'7', N'SANATAN CHARM ASHRAM DHARAM VIDYA PEETH ', N'226026', 1, CAST(N'2021-01-15 16:35:21.800' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (336, N'7', N'GOVERNER CAMP HAZRATGANJ ', N'226027', 1, CAST(N'2021-01-15 16:36:31.837' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (337, N'7', N'CHINHAT, LUCKNOW', N'226028', 1, CAST(N'2021-01-15 16:37:25.250' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (50, N'0', N'Asti', N'226201', 1, CAST(N'2021-01-13 12:24:44.480' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (51, N'0', N'Atari', N'226104', 1, CAST(N'2021-01-13 12:25:11.967' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (52, N'0', N'Ateswa', N'226203', 1, CAST(N'2021-01-13 12:25:45.850' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (53, N'0', N'Aurawan', N'226401', 1, CAST(N'2021-01-13 12:26:19.220' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (54, N'0', N'Avas Vikas Colony Lucknow', N'226017', 1, CAST(N'2021-01-13 12:26:52.950' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (55, N'0', N'B R A University', N'226025', 1, CAST(N'2021-01-13 12:27:18.707' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (56, N'0', N'Badiyan', N'226104', 1, CAST(N'2021-01-13 12:41:12.337' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (57, N'0', N'Bahargaon', N'226203', 1, CAST(N'2021-01-13 12:41:41.207' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (58, N'0', N'Bahrauli', N'226303', 1, CAST(N'2021-01-13 12:42:14.863' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (59, N'0', N'Baharoo', N'226101', 1, CAST(N'2021-01-13 12:42:32.473' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (366, N'8', N'jk', N'7894', 1, CAST(N'2021-01-21 17:33:13.657' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (339, N'7', N'JANKIPURAM EXTENSION', N'226031', 1, CAST(N'2021-01-15 16:41:33.877' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (342, N'0', N'Vikas Nagar', N'226022', 1, CAST(N'2021-01-15 18:16:47.290' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (344, N'0', N'Kalayanpur', N'208017', 1, CAST(N'2021-01-15 18:20:24.263' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (347, N'0', N'Ashiana', N'226012', 1, CAST(N'2021-01-15 18:25:55.290' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (348, N'0', N'	Alambhagh', N'226012', 1, CAST(N'2021-01-15 18:28:33.270' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (349, N'0', N'Mohanlalganj', N'226301', 1, CAST(N'2021-01-15 18:31:13.797' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (350, N'0', N'Takrohi', N'226016', 1, CAST(N'2021-01-15 18:32:31.527' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (351, N'0', N'Nishatganj', N'226001', 1, CAST(N'2021-01-15 18:35:09.040' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (353, N'0', N'Niralaganj', N'226020', 1, CAST(N'2021-01-15 18:39:19.930' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (355, N'0', N'Lalbhagh', N'226001', 1, CAST(N'2021-01-15 18:42:12.267' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (356, N'0', N'Kanpur Road', N'226012', 1, CAST(N'2021-01-15 18:43:20.183' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (358, N'0', N'Aishbhagh', N'226004', 1, CAST(N'2021-01-15 18:45:21.843' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (359, N'0', N'Dobhaggha', N'226027', 1, CAST(N'2021-01-15 18:46:04.840' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (360, N'0', N'Sadarbazar', N'261001', 1, CAST(N'2021-01-15 18:46:59.237' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (361, N'0', N'Husainganj', N'212651', 1, CAST(N'2021-01-15 18:47:43.337' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (362, N'8', N'delhi', N'212307', 1, CAST(N'2021-01-21 16:23:54.740' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (363, N'8', N'karchhana', N'212307', 1, CAST(N'2021-01-21 16:24:21.247' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (369, N'7', N'ghfhgj', N'2', 1, CAST(N'2021-01-21 23:07:20.413' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (378, N'21', N'Vikas Nagar', N'226022', 1, CAST(N'2021-01-24 13:22:09.250' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (371, N'15', N'prati', N'213207', 1, CAST(N'2021-01-21 23:08:53.683' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (315, N'7', N'HYDERABAD V LUCKNOW ', N'226007', 1, CAST(N'2021-01-15 16:10:10.960' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (373, N'20', N'green zone', N'2123078', 1, CAST(N'2021-01-22 13:12:02.607' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (374, N'19', N'red zone', N'134355', 1, CAST(N'2021-01-22 13:12:28.207' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (375, N'17', N'green zone', N'2326565', 1, CAST(N'2021-01-22 13:12:54.420' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (376, N'18', N'lakhiraria', N'543123', 1, CAST(N'2021-01-22 13:13:35.477' AS DateTime), N'Admin')
INSERT [dbo].[tbl_AreaMaster] ([SrNo], [CityId], [AreaName], [Pincode], [IsActive], [EntryDate], [EntryBy]) VALUES (368, N'5', N'vv', N'7889', 1, CAST(N'2021-01-21 17:39:11.923' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[tbl_AreaMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_CategoryMaster] ON 

INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (1, N'L1_1', N'L2_1', N'Beverages', N'unnamed.png', 1, CAST(N'2021-02-01 20:19:46.047' AS DateTime), N'Admin', N'Beverages')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (2, N'L1_2', N'L2_2', N'Vegetables', N'24646-6-vegetable-photos.png', 1, CAST(N'2021-02-01 20:20:14.620' AS DateTime), N'Admin', N'Vegetables')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (3, N'L1_3', N'L2_3', N'Fruits', N'4-2-fruit-png-image.png', 1, CAST(N'2021-02-01 20:20:33.900' AS DateTime), N'Admin', N'Fruits')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (4, N'L1_4', N'L2_4', N'Groceries', N'241-2413601_groceries-transparent-images-png-groceries-png-png-download.png', 1, CAST(N'2021-02-01 20:20:56.517' AS DateTime), N'Admin', N'Groceries')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (7, N'L1_9', N'L2_7', N'Electronic', N'TV.jpg', 1, CAST(N'2021-02-12 15:19:33.890' AS DateTime), N'Admin', N'Electronic')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (6, N'L1_8', N'L2_6', N'Watch', N'4.jpg', 1, CAST(N'2021-02-09 12:56:09.210' AS DateTime), N'Admin', N'Watch')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (8, N'L1_9', N'L2_8', N'Tableware And Dinnerware', N'WhatsApp Image 2021-02-05 at 4.38.29 PM (1).jpeg', 1, CAST(N'2021-02-13 14:09:38.480' AS DateTime), N'Admin', N'Tableware And Dinnerware')
INSERT [dbo].[tbl_CategoryMaster] ([SrNo], [RootCategoryId], [CategoryId], [CategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (9, N'L1_11', N'L2_9', N'Books', N'Library.jpg', 1, CAST(N'2021-02-14 13:25:00.280' AS DateTime), N'Admin', N'Books')
SET IDENTITY_INSERT [dbo].[tbl_CategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_Counter] ON 

INSERT [dbo].[tbl_Counter] ([SrNo], [RetailerCount], [RootCategoryCount], [CategoryCount], [SubCategoryCount], [ProductCount], [DeliveryExcutive], [Customer], [offerproduct]) VALUES (1, 18, 51, 3, NULL, 187, NULL, 15, 10)
SET IDENTITY_INSERT [dbo].[tbl_Counter] OFF
SET IDENTITY_INSERT [dbo].[Tbl_CustomerAddress] ON 

INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (1, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-02 17:47:21.260' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (2, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-04 00:29:30.400' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (3, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-04 14:02:15.370' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (4, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'AYODHYA', N'Uttar Pradesh', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-04 14:43:18.030' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (5, N'919919343999', N'amar', N'9919343999', N'245634', N'jkhsdk', N'kjhd', N'kjhdkh', N'Andaman & Nicobar Islands', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-04 16:49:30.667' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (6, N'+919919343999', N'amar', N'9919343999', N'245634', NULL, N'kjhd', N'kjhdkh', N'Andaman & Nicobar Islands', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-04 16:49:40.403' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (7, N'8382842791', N'sdfahsjfdh', N'fhdkgflhk', N'67856', N'sdjhkf', N'jdhgfk', N'jhfk', N'Andhra Pradesh', N'dghfj', N'dhgjgk', N'Home (All day delivery)', 1, CAST(N'2021-02-04 20:33:01.483' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (8, N'8382842791', N'sdfahsjfdh', N'fhdkgflhk', N'67856', NULL, N'jdhgfk', N'jhfk', N'Andhra Pradesh', N'dghfj', N'dhgjgk', N'Home (All day delivery)', 1, CAST(N'2021-02-04 20:33:08.490' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (9, N'Admin', N'Atul Yadav', N'9919282640', N'226016', NULL, N'Lucknow
UTTAR PRADESH', N'Lucknow', N'null', N'Ring Road', N'7380891076', N'Home (All day delivery)', 1, CAST(N'2021-02-04 21:27:53.553' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (10, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:24:11.697' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (11, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:28:04.517' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (12, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:29:17.367' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (13, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:31:21.877' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (14, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:32:18.033' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (15, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:34:49.570' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (16, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:36:31.537' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (17, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 15:39:26.117' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (26, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 23:51:56.007' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (27, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 23:59:49.437' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (28, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-06 00:12:06.180' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (29, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-06 00:19:05.460' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (30, N'6392657909', NULL, NULL, N'226010', NULL, N'Gomti nagar lucknow', N'Lucknow', NULL, N'fsgscvs', NULL, N'Home', 1, CAST(N'2021-02-06 09:57:16.027' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (31, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-06 12:06:19.697' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (32, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', NULL, NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-06 18:41:56.250' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (33, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', NULL, NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-06 18:42:07.693' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (34, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', N'Basti', N'Basti', N'Basti', NULL, NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-06 18:42:19.303' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (35, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', NULL, N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-07 00:13:21.863' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (36, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', NULL, N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-07 00:13:34.527' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (37, N'7317411671', N'Priyanka Verma', N'7317411671', N'272155', NULL, N'Basti', N'Basti', N'null', NULL, N'7317411671', N'Home (All day delivery)', 1, CAST(N'2021-02-07 00:13:54.520' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (38, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:55:52.117' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (39, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:55:57.937' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (40, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:00.020' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (41, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:00.533' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (42, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:00.580' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (43, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:01.517' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (44, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:01.833' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (45, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:02.010' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (46, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:02.160' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (47, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:02.653' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (48, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:02.803' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (49, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-08 11:56:40.393' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (50, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:47:59.097' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (51, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:02.630' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (52, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:03.427' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (53, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:03.593' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (54, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:03.760' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (55, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:03.930' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (56, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.097' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (57, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.250' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (58, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.423' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (59, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.600' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (60, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.777' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (61, N'1', N'Aniket Sharma', N'7007237006', N'233322', N'Lucknow', N'Vikas nagar', N'City', NULL, N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:04.960' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (62, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:13.797' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (63, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:24.920' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (64, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-09 19:48:27.407' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (65, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:49:01.697' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (67, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:54:28.907' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (68, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:55:03.187' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (69, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:55:07.267' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (70, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:55:12.530' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (71, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:55:16.970' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (73, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 18:24:44.853' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (18, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:26:30.910' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (19, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:28:55.720' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (20, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:28:58.873' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (21, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:29:00.527' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (22, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:29:01.070' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (23, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:29:01.567' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (24, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:29:02.167' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (25, N'6392657909', NULL, NULL, N'226010', NULL, N'rahat', N'Lucknow', NULL, N'hahahs', NULL, N'Home', 1, CAST(N'2021-02-05 20:29:02.550' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (66, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 17:51:59.793' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (72, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 18:20:17.037' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (75, N'1', NULL, NULL, N'226010', NULL, N'Gomti Nagar', N'Lucknow', NULL, N'Lucknow', NULL, N'Home', 1, CAST(N'2021-02-11 15:30:39.137' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (76, N'6392657909', NULL, NULL, N'226010', NULL, N'Near, Adarsh park', N'Lucknow', NULL, N'Punjab National Park', NULL, N'Home', 1, CAST(N'2021-02-12 01:14:15.160' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (77, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-14 15:27:45.763' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (78, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-14 15:29:40.760' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (79, N'6392657909', NULL, NULL, N'226010', NULL, N'Near, Adarsh park', N'Lucknow', NULL, N'Punjab National Park', NULL, N'Home', 1, CAST(N'2021-02-15 11:34:20.770' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (80, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-15 11:36:24.803' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (81, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-15 18:14:24.230' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (82, N'Admin', N'AMAR MISHRA', N'+919919343999', N'224001', NULL, N'AYODHYA
UTTAR PRADESH', N'City', N'null', NULL, NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-15 18:33:38.247' AS DateTime))
INSERT [dbo].[Tbl_CustomerAddress] ([srno], [Customercode], [Fullname], [Mobilenumber], [Pincode], [Locality], [Address], [City], [State], [Landmark], [Alternatemobile], [Addresstype], [Isactive], [Entrydate]) VALUES (74, N'1', N'Aniket Sharma', N'7007237006', N'233322', NULL, N'Vikas nagar', N'City', N'null', N'dgs', NULL, N'Home (All day delivery)', 1, CAST(N'2021-02-10 18:26:54.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_CustomerAddress] OFF
SET IDENTITY_INSERT [dbo].[tbl_CustomerMaster] ON 

INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (1, N'CUST0000010', N'Aniket Sharma', N'1', N'aniekt@gmail.com', NULL, 1, CAST(N'2021-02-01 21:14:39.997' AS DateTime), N'Male')
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (2, N'aniket1233', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (3, N'CUST3', N'Sharmaji', N'123', NULL, NULL, 1, CAST(N'2021-02-02 19:17:59.583' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (4, N'CUST4', N'Sharmaji', N'123', NULL, NULL, 1, CAST(N'2021-02-02 19:27:48.323' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (5, N'CUST5', N'Sharmaji', N'123', NULL, NULL, 1, CAST(N'2021-02-02 19:28:18.010' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (6, N'CUST6', N'Akash Chaurasiya', N'963', NULL, N'', 1, CAST(N'2021-02-03 00:27:53.313' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (7, N'CUST7', N'Rajkamal', N'78899889', NULL, N'', 1, CAST(N'2021-02-03 20:25:34.167' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (8, N'CUST0000011', N'AMAR MISHRA', N'+919919343999', NULL, NULL, 1, CAST(N'2021-02-04 14:45:28.027' AS DateTime), N'Male')
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (9, N'CUST0000012', N'abcd', N'8382842791', NULL, NULL, 1, CAST(N'2021-02-04 14:52:14.123' AS DateTime), N'Male')
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (10, N'CUST0000013', N'aggs', N'+916306095800', NULL, NULL, 1, CAST(N'2021-02-04 19:10:27.993' AS DateTime), N'Male')
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (11, N'CUST11', N'AkaSHcHAURASIYA', N'111', NULL, N'', 1, CAST(N'2021-02-05 15:43:22.510' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (12, N'CUST12', N'AkaSHcHAURASIYA', N'1111', NULL, N'', 1, CAST(N'2021-02-05 15:49:40.760' AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (13, N'CUST0000014', N'Priyanka Verma', N'7317411671', N'priyankaverma731741@gmail.com', NULL, 1, CAST(N'2021-02-06 18:39:04.590' AS DateTime), N'Female')
INSERT [dbo].[tbl_CustomerMaster] ([SrNo], [CustomerId], [CustomerName], [MobileNo], [EmailAddress], [ProfilePic], [IsActive], [EntryDate], [Gender]) VALUES (14, N'CUST0000015', N'aniket', N'916306095800', NULL, NULL, 1, CAST(N'2021-02-14 15:22:38.020' AS DateTime), N'Male')
SET IDENTITY_INSERT [dbo].[tbl_CustomerMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_DeliveryExcutives] ON 

INSERT [dbo].[tbl_DeliveryExcutives] ([SrNo], [DeliveryExcutivesCode], [Name], [MobileNo], [EmailAddress], [Address], [AadharNo], [PANNo], [IsActive], [EntryDate], [ZoneCode], [ImageFile], [BankAccName], [AccountNumber], [BankName], [IFSCCode], [Password]) VALUES (4, N'MDYOSDEC0000004', N'Tehpile Technology Pvt. Ltd', N'07007237006', N'rverma6555@gmail.com', N'Plot No-43, Behind H.P Petrol Pump, Tedhi Pulia Ring Rd, Sector 5, Vikas Nagar', N'789654123656', N'AVDBDBDHJDU', 1, CAST(N'2020-12-09 12:28:43.913' AS DateTime), N'0', N'Pic_637430688000000000.crdownload', N'Tehpile Technology Pvt. Ltd', N'13234567896', N'STATE BANK OF INDIA', N'BKIHJIL5', N'858108')
INSERT [dbo].[tbl_DeliveryExcutives] ([SrNo], [DeliveryExcutivesCode], [Name], [MobileNo], [EmailAddress], [Address], [AadharNo], [PANNo], [IsActive], [EntryDate], [ZoneCode], [ImageFile], [BankAccName], [AccountNumber], [BankName], [IFSCCode], [Password]) VALUES (3, N'MDYOSDEC0000003', N'Amrinder Tech ', N'961663645', N'anikert@gmail.com', N'Plot No-43, Behind H.P Petrol Pump, ', N'2536479896351', N'HTYSPSJK', 1, CAST(N'2020-12-08 17:27:28.647' AS DateTime), N'0', N'Pic_637430688000000000.crdownload', N'XGFDH', N'SDGJGJ', N'SDGJF', N'GFJSF', N'309465')
INSERT [dbo].[tbl_DeliveryExcutives] ([SrNo], [DeliveryExcutivesCode], [Name], [MobileNo], [EmailAddress], [Address], [AadharNo], [PANNo], [IsActive], [EntryDate], [ZoneCode], [ImageFile], [BankAccName], [AccountNumber], [BankName], [IFSCCode], [Password]) VALUES (6, N'MDYOSDEC0000006', N'Tehpile Technology Pvt. Ltd', N'070072370064', N'rverma6555@gmail.com', N'Plot No-43, Behind H.P Petrol Pump, Tedhi Pulia Ring Rd, Sector 5, Vikas Nagar', N'sdgadsga', N'Fdgdsgsa', 1, CAST(N'2020-12-09 12:33:19.720' AS DateTime), N'6', N'Pic_637430688000000000.crdownload', N'tqrsdcx', N'fgag', N'agga', N'sadgas', N'736485')
SET IDENTITY_INSERT [dbo].[tbl_DeliveryExcutives] OFF
SET IDENTITY_INSERT [dbo].[tbl_LoginMaster] ON 

INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (1, N'101', N'Admin', N'1', N'1', NULL, NULL, 1, N'MYDOS')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (2, N'101', N'alok.784@gmail.com', N'746157', N'2', CAST(N'2020-12-07 14:08:07.757' AS DateTime), NULL, 1, N'Anirudha Kumar & Sons Enterprises')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (3, N'101', N'alok.784@gmSFail.com', N'693710', N'2', CAST(N'2020-12-07 14:33:48.553' AS DateTime), NULL, 1, N'Anirudha Kumar & Sons Enterprises')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (4, N'102', N'07007237006', N'529787', N'3', CAST(N'2020-12-08 16:51:45.973' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (5, N'102', N'705278834', N'782800', N'3', CAST(N'2020-12-08 17:06:35.223' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (6, N'102', N'961663645', N'309465', N'3', CAST(N'2020-12-08 17:27:28.647' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (7, N'102', N'07007237006', N'858108', N'3', CAST(N'2020-12-09 12:28:43.913' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (8, N'102', N'070072370061', N'175793', N'3', CAST(N'2020-12-09 12:30:37.910' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (9, N'102', N'070072370064', N'736485', N'3', CAST(N'2020-12-09 12:33:19.720' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (10, N'102', N'070072370068990', N'134294', N'3', CAST(N'2020-12-09 12:44:58.107' AS DateTime), NULL, 1, N'DeliveryExcutives')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (11, N'101', N'LNLN', N'489752', N'2', CAST(N'2020-12-18 18:50:17.900' AS DateTime), NULL, 1, N'Busubee nMAME')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (12, N'103', N'aniketsharmagkp@gmail.com', N'1234', N'4', NULL, NULL, 1, N'Aniket Sharma')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (13, N'103', N'1234567891', N'1', N'4', CAST(N'2020-12-24 12:47:15.417' AS DateTime), NULL, 1, N'aniketsharma')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (14, N'103', N'1', N'1', N'4', CAST(N'2020-12-25 13:58:01.457' AS DateTime), NULL, 1, N'Aniket kumar')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (15, N'103', N'7380891076', N'ATUL7380', N'4', CAST(N'2020-12-27 20:03:28.773' AS DateTime), NULL, 1, N'ATUL')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (16, N'103', N'a', N'a', N'4', CAST(N'2021-01-05 14:34:31.233' AS DateTime), NULL, 1, N'a')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (17, N'103', N'test', N'1234', N'4', CAST(N'2021-01-11 20:15:52.040' AS DateTime), NULL, 1, N'Test')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (18, N'103', N'6392657909', N'Rajat@123', N'4', CAST(N'2021-01-12 23:05:45.223' AS DateTime), NULL, 1, N'Rajat Kumar Jaiswal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (19, N'101', N'Saxena@gmail.com', N'743634', N'2', CAST(N'2021-01-14 14:44:47.827' AS DateTime), NULL, 1, N'Saxena Trends')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (20, N'101', N'a@gmail.com', N'798862', N'2', CAST(N'2021-01-14 14:47:21.063' AS DateTime), NULL, 1, N'Ashok Trends')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (21, N'101', N'alok@gmail.com', N'558100', N'2', CAST(N'2021-01-14 14:49:34.783' AS DateTime), NULL, 1, N'Shankar Traders')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (22, N'101', N'vinay@gmail.com', N'641611', N'2', CAST(N'2021-01-14 14:51:43.730' AS DateTime), NULL, 1, N'Vinay Store')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (23, N'103', N'9565269648', N'rajkumarverma', N'4', CAST(N'2021-01-16 16:25:31.423' AS DateTime), NULL, 1, N'Priyanka Verma')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (24, N'104', N'1', N'1', N'4', NULL, NULL, 1, N'Aniket')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (25, N'103', N'8081443074', N'123', N'4', CAST(N'2021-01-21 15:36:00.733' AS DateTime), NULL, 1, N'Pratiksha')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (26, N'103', N'2', N'2', N'4', CAST(N'2021-01-21 15:46:51.380' AS DateTime), NULL, 1, N'fdzh')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (27, N'103', N'3', N'3', N'4', CAST(N'2021-01-21 15:48:41.277' AS DateTime), NULL, 1, N'zdg')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (28, N'103', N'9616551042', N'0', N'4', CAST(N'2021-01-21 15:52:31.223' AS DateTime), NULL, 1, N's')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (29, N'103', N'9648102799', N'12345', N'4', CAST(N'2021-01-21 17:43:39.250' AS DateTime), NULL, 1, N'rinki')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (30, N'103', N'9767502957', N'p', N'4', CAST(N'2021-01-21 19:34:15.013' AS DateTime), NULL, 1, N'shanu')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (31, N'103', N'9336159800', N'12345', N'4', CAST(N'2021-01-21 22:34:59.307' AS DateTime), NULL, 1, N'pratiksha')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (32, N'101', N'1254735773', N'924070', N'3', CAST(N'2021-01-22 12:32:02.550' AS DateTime), NULL, 1, N'fafdhnzdg')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (33, N'101', N'1254735773', N'933570', N'3', CAST(N'2021-01-22 12:32:32.193' AS DateTime), NULL, 1, N'fafdhnzdg')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (34, N'101', N'1254735773', N'970376', N'3', CAST(N'2021-01-22 12:33:36.430' AS DateTime), NULL, 1, N'fafdhnzdg')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (35, N'103', N'8004992180', N'122016', N'4', CAST(N'2021-01-22 12:37:26.347' AS DateTime), NULL, 1, N'pratiksha yadav')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (36, N'101', N'fh', N'643950', N'2', CAST(N'2021-01-22 13:29:21.093' AS DateTime), NULL, 1, N'afhf')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (37, N'101', N'weg', N'608617', N'2', CAST(N'2021-01-22 13:34:41.660' AS DateTime), NULL, 1, N'fd')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (38, N'101', N'dg', N'785276', N'2', CAST(N'2021-01-22 13:35:12.813' AS DateTime), NULL, 1, N'CXB')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (39, N'101', N'dfh', N'535254', N'2', CAST(N'2021-01-22 13:39:13.570' AS DateTime), NULL, 1, N'zvnb')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (40, N'101', N'twh', N'303232', N'2', CAST(N'2021-01-22 13:40:25.003' AS DateTime), NULL, 1, N'sfh')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (41, N'101', N'dfhsdnsdn', N'106196', N'2', CAST(N'2021-01-22 13:42:26.947' AS DateTime), NULL, 1, N'afsh')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (42, N'101', N'p@gmail.com', N'827982', N'2', CAST(N'2021-01-23 15:10:28.183' AS DateTime), NULL, 1, N'techpile')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (43, N'101', N's@gmail.com', N'960527', N'2', CAST(N'2021-01-23 15:19:44.117' AS DateTime), NULL, 1, N'Techpile Technology')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (44, N'101', N'divya@gmail.com', N'1', N'2', CAST(N'2021-01-24 13:34:01.557' AS DateTime), NULL, 1, N'Techpile Technology Pvt Ltd.')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (45, N'101', N'atulwowjinn@gmail.com', N'500181', N'2', CAST(N'2021-01-24 14:03:31.293' AS DateTime), NULL, 1, N'agdwwd')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (46, N'103', N'kjb', N'123', N'4', CAST(N'2021-01-25 18:24:07.597' AS DateTime), NULL, 1, N'kj')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (48, N'103', N'DAS', N'123', N'4', CAST(N'2021-01-25 18:29:22.337' AS DateTime), NULL, 1, N'A')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (50, N'103', N'07355606420', N'1234', N'4', CAST(N'2021-01-26 14:07:50.073' AS DateTime), NULL, 1, N'Wowjin')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (51, N'101', N'6392657908', N'368447', N'3', CAST(N'2021-01-29 02:52:13.207' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (52, N'101', N'6392657908', N'487304', N'3', CAST(N'2021-01-29 02:52:26.210' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (53, N'101', N'6392657908', N'478919', N'3', CAST(N'2021-01-29 02:52:26.700' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (54, N'101', N'6392657908', N'500485', N'3', CAST(N'2021-01-29 02:52:26.943' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (55, N'101', N'6392657908', N'497634', N'3', CAST(N'2021-01-29 02:52:27.180' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (56, N'101', N'6392657908', N'492134', N'3', CAST(N'2021-01-29 02:52:27.503' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (57, N'101', N'6392657908', N'496527', N'3', CAST(N'2021-01-29 02:52:27.743' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (58, N'101', N'9118919678', N'704315', N'3', CAST(N'2021-01-29 02:54:46.533' AS DateTime), NULL, 1, N'Rakkala')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (59, N'101', N'8853161323', N'560273', N'3', CAST(N'2021-01-29 03:01:11.627' AS DateTime), NULL, 1, N'Rajkamal jaiswal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (60, N'101', N'8853161323', N'190939', N'3', CAST(N'2021-01-29 12:26:37.560' AS DateTime), NULL, 1, N'Rajkamal jaiswal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (61, N'101', N'DSG', N'810802', N'2', CAST(N'2021-01-29 14:07:09.283' AS DateTime), NULL, 1, N'SD')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (62, N'101', N'sf', N'981423', N'2', CAST(N'2021-01-29 14:15:50.047' AS DateTime), NULL, 1, N's')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (63, N'103', N'ppp', N'ppp', N'4', CAST(N'2021-01-29 17:17:20.917' AS DateTime), NULL, 1, N'ppp')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (64, N'103', N'23', N'1', N'4', CAST(N'2021-01-29 17:19:00.553' AS DateTime), NULL, 1, N'divya')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (65, N'103', N'9919343999', N'asdf@#$1234', N'4', CAST(N'2021-01-29 17:20:43.483' AS DateTime), NULL, 1, N'Amar')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (66, N'101', N'wowjin.com@gmail.com', N'762553', N'2', CAST(N'2021-01-29 17:22:27.787' AS DateTime), NULL, 1, N'Wowjinn.com')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (67, N'101', N'9876543210', N'264551', N'3', CAST(N'2021-01-29 23:04:24.637' AS DateTime), NULL, 1, N'Rahul kumar')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (68, N'103', N'963', N'963', N'4', CAST(N'2021-02-01 15:42:45.280' AS DateTime), NULL, 1, N'2569')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (69, N'101', N'5282', N'784592', N'2', CAST(N'2021-02-01 17:44:48.610' AS DateTime), NULL, 1, N'iug')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (70, N'101', N'dhf', N'525937', N'2', CAST(N'2021-02-01 17:48:05.177' AS DateTime), NULL, 1, N'jh')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (71, N'101', N'hgx', N'808342', N'2', CAST(N'2021-02-01 17:54:30.947' AS DateTime), NULL, 1, N'gfxj')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (72, N'101', N'hgdkhdgk', N'381954', N'2', CAST(N'2021-02-01 17:56:20.333' AS DateTime), NULL, 1, N'sdxtusjsfdj')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (73, N'103', N'4567856789', N'123', N'4', CAST(N'2021-02-01 21:14:40.000' AS DateTime), NULL, 1, N'ghjk')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (74, N'101', N'123', N'502329', N'3', CAST(N'2021-02-02 19:17:59.587' AS DateTime), NULL, 1, N'Sharmaji')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (75, N'101', N'123', N'776824', N'3', CAST(N'2021-02-02 19:27:48.327' AS DateTime), NULL, 1, N'Sharmaji')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (76, N'101', N'123', N'811905', N'3', CAST(N'2021-02-02 19:28:18.013' AS DateTime), NULL, 1, N'Sharmaji')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (77, N'101', N'963', N'121380', N'3', CAST(N'2021-02-03 00:27:53.317' AS DateTime), NULL, 1, N'Akash Chaurasiya')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (78, N'101', N'priyankaverma731741@gmail.com', N'851940', N'2', CAST(N'2021-02-03 17:25:43.067' AS DateTime), NULL, 1, N'Wowjinn.com')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (79, N'101', N'78899889', N'234336', N'3', CAST(N'2021-02-03 20:25:34.170' AS DateTime), NULL, 1, N'Rajkamal')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (80, N'103', N'+919919343999', N'asdf', N'4', CAST(N'2021-02-04 14:45:28.027' AS DateTime), NULL, 1, N'AMAR MISHRA')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (81, N'103', N'8382842791', N'asdf', N'4', CAST(N'2021-02-04 14:52:14.127' AS DateTime), NULL, 1, N'abcd')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (82, N'103', N'+916306095800', N'asdf', N'4', CAST(N'2021-02-04 19:10:27.997' AS DateTime), NULL, 1, N'aggs')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (83, N'101', N'AIEKT@gMAIL.CIINC', N'759136', N'2', CAST(N'2021-02-05 00:12:14.257' AS DateTime), NULL, 0, N'TESTSHOPNAME')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (84, N'101', N'111', N'442435', N'4', CAST(N'2021-02-05 15:43:22.510' AS DateTime), NULL, 1, N'AkaSHcHAURASIYA')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (85, N'101', N'1111', N'1111', N'4', CAST(N'2021-02-05 15:49:40.763' AS DateTime), NULL, 1, N'AkaSHcHAURASIYA')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (86, N'103', N'7317411671', N'rajkumarverma', N'4', CAST(N'2021-02-06 18:39:04.600' AS DateTime), NULL, 1, N'Priyanka Verma')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (87, N'101', N'priyankawowjinn@gmail.com', N'351310', N'2', CAST(N'2021-02-06 19:17:34.800' AS DateTime), NULL, 0, N'Wowjinn.com')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (88, N'101', N'vinodverma9554@gmail.com', N'283467', N'2', CAST(N'2021-02-12 16:39:21.317' AS DateTime), NULL, 0, N'Vinod Verma')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (89, N'101', N'deepanshi7565ggpf@gmail.com', N'243753', N'2', CAST(N'2021-02-12 16:48:34.793' AS DateTime), NULL, 0, N'Rohan')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (90, N'101', N'priyankaverma@gmail.com', N'236094', N'2', CAST(N'2021-02-14 12:04:49.523' AS DateTime), NULL, 0, N'Realstate')
INSERT [dbo].[tbl_LoginMaster] ([SrNo], [BranchCode], [UserName], [Password], [RoleType], [EntryDate], [LastLoginDate], [IsActive], [Name]) VALUES (91, N'103', N'916306095800', N'123', N'4', CAST(N'2021-02-14 15:22:38.020' AS DateTime), NULL, 1, N'aniket')
SET IDENTITY_INSERT [dbo].[tbl_LoginMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_MainCart] ON 

INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (31, N'8382842791', N'MDYOSPR0000024', N'', 2, 1, CAST(N'2021-02-06 15:03:44.237' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (32, N'8382842791', N'MDYOSPR0000021', N'', 1, 1, CAST(N'2021-02-06 15:19:36.580' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (118, N'1', N'MDYOSPR0000185', N'', 1, 1, CAST(N'2021-07-30 15:33:44.713' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (35, N'8382842791', N'MDYOSPR0000023', N'', 3, 1, CAST(N'2021-02-06 20:52:38.520' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (112, NULL, N'MDYOSPR0000067', N'', 1, 1, CAST(N'2021-06-13 13:48:58.167' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (43, NULL, N'MDYOSPR0000031', N'', 1, 1, CAST(N'2021-02-09 09:38:20.210' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (44, NULL, N'MDYOSPR0000031', N'', 1, 1, CAST(N'2021-02-09 09:38:24.740' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (45, NULL, N'MDYOSPR0000027', N'', 1, 1, CAST(N'2021-02-09 09:39:16.333' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (113, NULL, N'MDYOSPR0000067', N'', 1, 1, CAST(N'2021-06-13 13:48:59.007' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (114, NULL, N'MDYOSPR0000067', N'', 1, 1, CAST(N'2021-06-13 13:49:00.150' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (115, NULL, N'MDYOSPR0000067', N'', 1, 1, CAST(N'2021-06-13 13:49:01.487' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (116, NULL, N'MDYOSPR0000067', N'', 1, 1, CAST(N'2021-06-13 13:49:01.570' AS DateTime))
INSERT [dbo].[tbl_MainCart] ([SrNo], [CustomerCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (120, N'1', N'MDYOSPR0000187', N'', 1, 1, CAST(N'2021-11-10 07:18:57.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_MainCart] OFF
SET IDENTITY_INSERT [dbo].[tbl_offermaster] ON 

INSERT [dbo].[tbl_offermaster] ([ID], [OfferName], [OfferImage], [offerdid], [Isactive], [EntryDate]) VALUES (1, N'Special offer', N'OfferSpecial offer637478208000000000pexels-artem-beliaikin-1051744.jpg', N'WOWOFFER1', 1, CAST(N'2021-02-02 12:08:07.543' AS DateTime))
INSERT [dbo].[tbl_offermaster] ([ID], [OfferName], [OfferImage], [offerdid], [Isactive], [EntryDate]) VALUES (2, N'Diwali offer', N'OfferDiwali offer637478208000000000pexels-artem-beliaikin-1114376.jpg', N'WOWOFFER2', 1, CAST(N'2021-02-02 12:14:08.127' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_offermaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_ProductMaster] ON 

INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (18, N'MDYOSPR0000063', N'alok.784@gmail.com', N'New Apple iPhone 12 Mini (64GB) - Black', N'L1_8', N'L2_6', N'L3_5', N'<ul>
	<li>5.4-inch Super Retina XDR display</li>
	<li>Ceramic Shield, tougher than any smartphone glass</li>
	<li>A14 Bionic chip, the fastest chip ever in a smartphone</li>
	<li>Advanced dual-camera system with 12MP Ultra Wide and Wide cameras; Night mode, Deep Fusion, Smart HDR 3, 4K Dolby Vision HDR recording</li>
	<li>12MP TrueDepth front camera with Night mode, 4K Dolby Vision HDR recording</li>
	<li>Industry-leading IP68 water resistance</li>
	<li>Supports MagSafe accessories for easy attach and faster wireless charging</li>
	<li>iOS with redesigned widgets on the Home screen, all-new App Library, App Clips and more</li>
</ul>
', CAST(500.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), 20, N'mainImg_6374842560000000003bc2f54b8cf942839964aa01eb52ef50.jpg', N'img1_637484256000000000702f5bea0e014054af63415c844d4adb.jpg', N'img2_6374842560000000008e73f5869ff44c0e802a7e3815e2629a.jpg', N'img3_6374842560000000009199acb2e83146379b89ad035e3fb297.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 19:42:59.887' AS DateTime), N'alok.784@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (16, N'MDYOSPR0000061', N'Admin', N'Avocado', N'L1_3', N'L2_3', N'L3_3', N'<p>The&nbsp;<strong>avocado</strong>&nbsp;(<em>Persea americana</em>), a&nbsp;<a href="https://en.wikipedia.org/wiki/Tree">tree</a>&nbsp;likely originating from southcentral&nbsp;<a href="https://en.wikipedia.org/wiki/Mexico">Mexico</a>,<a href="https://en.wikipedia.org/wiki/Avocado#cite_note-morton-2">[2]</a><a href="https://en.wikipedia.org/wiki/Avocado#cite_note-3">[3]</a><a href="https://en.wikipedia.org/wiki/Avocado#cite_note-4">[4]</a>&nbsp;is&nbsp;<a href="https://en.wikipedia.org/wiki/Biological_classification">classified</a>&nbsp;as a member of the&nbsp;<a href="https://en.wikipedia.org/wiki/Flowering_plant">flowering plant</a>&nbsp;family&nbsp;<a href="https://en.wikipedia.org/wiki/Lauraceae">Lauraceae</a>.<a href="https://en.wikipedia.org/wiki/Avocado#cite_note-morton-2">[2]</a>&nbsp;The fruit of the plant, also called an avocado (or&nbsp;<strong>avocado pear</strong>&nbsp;or&nbsp;<strong>alligator pear</strong>), is&nbsp;<a href="https://en.wikipedia.org/wiki/Botany">botanically</a>&nbsp;a large&nbsp;<a href="https://en.wikipedia.org/wiki/Berry_(botany)">berry</a>&nbsp;containing a single large seed.<a href="https://en.wikipedia.org/wiki/Avocado#cite_note-storey-5">[</a></p>
', CAST(135.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 0, N'mainImg_6374842560000000006bb36dd2ff3743dea62625b2b81bc937.jpg', N'img1_637484256000000000f8133242bac640198c3a3502ab4ecf93.jpg', N'img2_6374842560000000003caf8bab4cff49cba150883c81f335bc.jpg', N'img3_637484256000000000c7c67496236541a6ac8c9cee2c563335.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 18:18:11.137' AS DateTime), N'Admin', 0, NULL, 176, CAST(20 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (20, N'MDYOSPR0000065', N'Admin', N'Pine Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>Rich source of Vitaminn C, Contain Fibre,maganese.Vitamin C helps improving the skin health, boosts immune system and keep digestive system up to the mark.</p>
', CAST(70.00 AS Decimal(18, 2)), CAST(68.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000cf9f6f023f184fae83e8ec139bee020f.png', N'img1_63748684800000000071fc4621630048ba85e32be83aec513d.png', N'img2_637486848000000000a42b66b53995488199ef5450d05d5e55.png', N'img3_637486848000000000ba4320ab1e4e4a43b3e094ffac6d1086.png', N'img4_637486848000000000.png', N'published', 1, CAST(N'2021-02-12 12:01:31.500' AS DateTime), N'Admin', 0, NULL, 48, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (21, N'MDYOSPR0000066', N'Admin', N'Cabage', N'L1_2', N'L2_2', N'L3_2', N'<p>With a texture of crispness and juiciness the moment you take the first bite, cabbages are sweet and grassy flavoured with dense and smooth leafy layers.</p>
', CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000005f7361c916dc413c9deabaeca527bc1c.jpg', N'img1_6374868480000000003f4d0c0f8328468f81fb2f8dddbe5c1e.jpg', N'img2_6374868480000000008ec2ff8fcc5349da994dbb8d20d60933.jpg', N'img3_637486848000000000006e27a9456742908fd20d36c00024c9.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 12:11:37.550' AS DateTime), N'Admin', 0, NULL, 1, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (22, N'MDYOSPR0000067', N'Admin', N'Onion', N'L1_2', N'L2_2', N'L3_2', N'<p>Onion is a vegetable which is almost like a staple in Indian food. This is also known to be one of the essential ingredients of raw salads. They come in different colors like white, red or yellow and are quite in demand in cold salads and hot soups. You can dice, slice or cut it in rings and put it in burgers and sandwiches. Onions emit a sharp flavour and fragrance once they are fried; it is due to the sulphur compound in the vegetable.</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000030a2bf62ebea45efb63f50ff6a7547a5.jpg', N'img1_637486848000000000e0e2f9e3421445f3b22f0813dada316c.jpg', N'img2_637486848000000000ef55c1c853284c1d94d384160bbd252c.jpg', N'img3_6374868480000000000d7ee249d63e41409adbd5c1e65c1b64.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 12:20:03.673' AS DateTime), N'Admin', 0, NULL, 8, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (69, N'MDYOSPR0000114', N'SD', N'HSHSHSH', N'SD', N'7884', N'egeg', N'sggs', CAST(6464.00 AS Decimal(18, 2)), CAST(64.00 AS Decimal(18, 2)), 12, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-12 22:37:54.627' AS DateTime), N'SD', NULL, NULL, 12, CAST(50 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (70, N'MDYOSPR0000115', N'SD', N'HSHSHSH', N'SD', N'7884', N'egeg', N'sggs', CAST(6464.00 AS Decimal(18, 2)), CAST(64.00 AS Decimal(18, 2)), 12, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-12 22:38:01.540' AS DateTime), N'SD', NULL, NULL, 12, CAST(50 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (17, N'MDYOSPR0000062', N'Admin', N'Date', N'L1_3', N'L2_3', N'L3_3', N'<p>Dates have been a&nbsp;<a href="https://en.wikipedia.org/wiki/Staple_food">staple food</a>&nbsp;of the&nbsp;<a href="https://en.wikipedia.org/wiki/Middle_East">Middle East</a>&nbsp;and the&nbsp;<a href="https://en.wikipedia.org/wiki/Indus_Valley">Indus Valley</a>&nbsp;for thousands of years. They are believed to have originated around what is now Iraq. There is archaeological evidence of date cultivation in&nbsp;<a href="https://en.wikipedia.org/wiki/Mehrgarh">Mehrgarh</a>&nbsp;around 7000 BCE, a Neolithic civilization in what is now western&nbsp;<a href="https://en.wikipedia.org/wiki/Pakistan">Pakistan</a>,<a href="https://en.wikipedia.org/wiki/Date_palm#cite_note-KenoyerHeuston2005-15">[15]</a>&nbsp;and in eastern&nbsp;<a href="https://en.wikipedia.org/wiki/Arabia">Arabia</a>&nbsp;between 5530 and 5320&nbsp;<a href="https://en.wikipedia.org/wiki/Radiocarbon_dating#Calibration">calBC</a>.<a href="https://en.wikipedia.org/wiki/Date_palm#cite_note-16">[16]</a>&nbsp;and have been cultivated since ancient times from&nbsp;<a href="https://en.wikipedia.org/wiki/Mesopotamia">Mesopotamia</a>&nbsp;to&nbsp;<a href="https://en.wikipedia.org/wiki/Prehistoric_Egypt">prehistoric Egypt</a>. The&nbsp;<a href="https://en.wikipedia.org/wiki/Ancient_Egypt">ancient Egyptians</a>&nbsp;used the fruits to make date&nbsp;<a href="https://en.wikipedia.org/wiki/Wine">wine</a>, and ate them at harvest.[<em><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed">citation needed</a></em>]&nbsp;Evidence of cultivation is continually found throughout later civilizations in the Indus Valley, including the&nbsp;<a href="https://en.wikipedia.org/wiki/Harappa">Harappan</a>&nbsp;period of 2600 to 1900 BCE.<a href="https://en.wikipedia.org/wiki/Date_palm#cite_note-KenoyerHeuston2005-15">[15]</a>&nbsp;The ancient&nbsp;<a href="https://en.wikipedia.org/wiki/Hebrews">Hebrews</a>&nbsp;made the fruit into wine, vinegar, bread, and cakes, also using the fruit stones to fatten livestock and the wood to make utensils.<a href="https://en.wikipedia.org/wiki/Date_palm#cite_note-17">[17]</a></p>
', CAST(75.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 0, N'mainImg_6374842560000000003f5ce2bdc0504601815a09d3af252d51.jpg', N'img1_637484256000000000445a3cb7be094cc6bec776865a870213.jpg', N'img2_637484256000000000bcd529f35db04542ae7c7474182d8b07.jpg', N'img3_6374842560000000008af572120e934025928115e8aecaff82.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 18:37:21.143' AS DateTime), N'Admin', 0, NULL, 53, CAST(20 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (24, N'MDYOSPR0000069', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>Apples are one of the most popular fruits &mdash; and for good reason.</p>

<p>They&rsquo;re an exceptionally healthy fruit with many research-backed benefits.</p>
', CAST(100.00 AS Decimal(18, 2)), CAST(98.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000004c09ecf483404e01957d2a663478ffb7.jpg', N'img1_63748684800000000075f3704e22e34aba85f94e7d429afed5.jpg', N'img2_637486848000000000f06ee43f9d534a0fa49d6b414188e1f8.webp', N'img3_637486848000000000837459fcd0db47d1ade9bb5c58d23ce4.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:23:55.303' AS DateTime), N'Admin', 0, NULL, 98, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (33, N'MDYOSPR0000078', N'Admin', N'Palak', N'L1_2', N'L2_2', N'L3_2', N'<p>With a sweet, nutty and tangent flavour, Palaks are green leafy vegetables that are succulent and spoon shaped.<br />
<br />
&nbsp;</p>
', CAST(14.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000005faa7796d17e4003b2d536cdff659443.jpg', N'img1_6374868480000000003b90c691dcd44ea9b1e3b1c30f22e9bf.jpg', N'img2_6374868480000000003ad51d1b6d6d453e9b0904a8cfe4b580.jpg', N'img3_637486848000000000416a669acb87401f948ef43b9ca947da.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 12:38:45.550' AS DateTime), N'Admin', 0, NULL, 2, CAST(7 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (34, N'MDYOSPR0000079', N'Admin', N'ACEROLA – WEST INDIAN CHERRY', N'L1_3', N'L2_3', N'L3_3', N'<p>The fruit is similar to a&nbsp;<strong>cherry</strong>&nbsp;and is a deep red color when ripe. It is a rich source of vitamin C.&nbsp;<strong>Acerola</strong>&nbsp;is commonly used by mouth to prevent vitamin C deficiency, and to treat scurvy, a disease caused by vitamin C deficiency. It is also used for the common cold, diarrhea, liver problems, and other conditions</p>
', CAST(399.00 AS Decimal(18, 2)), CAST(397.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000057973ef195ef45b89a32dbce579583f3.gif', N'img1_63748684800000000016e290b3c0bd4191969e1c9b7c5bf31e.gif', N'img2_6374868480000000001b79304d0f3e4994bdcb159790628997.gif', N'img3_637486848000000000e56016f9eb5f49b686ea81bfd61e05f3.gif', N'System.Web.HttpPostedFileWrapper', N'published', 1, CAST(N'2021-02-12 12:41:54.327' AS DateTime), N'Admin', 0, NULL, 1584, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (73, N'MDYOSPR0000118', N'entryBy', N'FAFW', N'alok.784@gmail.com', N'gaga', N'gwgwg', N'gsgag', CAST(12.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 12, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-13 00:15:54.110' AS DateTime), N'entryBy', NULL, NULL, 1, CAST(16 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (74, N'MDYOSPR0000119', N'entryBy', N'TEST', N'alok.784@gmail.com', N'test', N'test', N'test', CAST(30.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 12, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-13 00:22:39.403' AS DateTime), N'entryBy', NULL, NULL, 12, CAST(50 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (10, N'MDYOSPR0000055', N'Admin', N'Grapes', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>grape</strong>&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>, botanically a&nbsp;<a href="https://en.wikipedia.org/wiki/Berry_(botany)">berry</a>, of the&nbsp;<a href="https://en.wikipedia.org/wiki/Deciduous">deciduous</a>&nbsp;woody&nbsp;<a href="https://en.wikipedia.org/wiki/Vine">vines</a>&nbsp;of the&nbsp;<a href="https://en.wikipedia.org/wiki/Flowering_plant">flowering plant</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Genus">genus</a>&nbsp;<em><a href="https://en.wikipedia.org/wiki/Vitis">Vitis</a></em>.</p>

<p>Grapes can be eaten fresh as&nbsp;<a href="https://en.wikipedia.org/wiki/Table_grape">table grapes</a>&nbsp;or they can be used for making&nbsp;<a href="https://en.wikipedia.org/wiki/Wine">wine</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Jam">jam</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Grape_juice">grape juice</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Jelly_(fruit_preserves)">jelly</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Grape_seed_extract">grape seed extract</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Raisin">raisins</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Vinegar">vinegar</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Grape_seed_oil">grape seed oil</a>. Grapes are a non-<a href="https://en.wikipedia.org/wiki/Climacteric_(botany)">climacteric</a>&nbsp;type of fruit, generally occurring in clusters.</p>
', CAST(33.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000838214a44853445b89060582533a6aba.jpg', N'img1_63748425600000000025575e806f274cd0b4181a9a77f1babd.jpg', N'img2_63748425600000000039121875d2e14b23938503ed6435617d.jpg', N'img3_6374842560000000004204c354b0424fe0a21d4cbbece85767.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 17:38:06.977' AS DateTime), N'Admin', 0, NULL, 10, CAST(13 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (11, N'MDYOSPR0000056', N'Admin', N'Dragon Fruit', N'L1_3', N'L2_3', N'L3_3', N'<p>Dragon fruit is a low-calorie fruit that is high in fiber and provides a good amount of several vitamins and minerals.</p>
', CAST(89.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 0, N'mainImg_6374842560000000005dbf7fa940364155a700aae22566ddb6.png', N'img1_6374842560000000001508b6fc449c4b2bbd2dc55582259304.png', N'img2_637484256000000000f229f0a5a08941cdb67ef270faf8d5d1.png', N'img3_6374842560000000001e39407bdf014252b0c461cc1f086c51.png', N'img4_637484256000000000.png', N'published', 1, CAST(N'2021-02-09 17:51:51.610' AS DateTime), N'Admin', 0, NULL, 71, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (57, N'MDYOSPR0000102', N'Admin', N'Pomegranate', N'L1_3', N'L2_3', N'L3_3', N'<ul>
	<li>The skin of the pomegranate is thick and inedible, but there are hundreds of edible seeds within. Each seed is surrounded by a red, juicy and sweet seed covering known as an aril.</li>
	<li>The seeds and arils are the edible parts of the fruit &mdash; eaten either raw or processed into pomegranate juice &mdash; but the peel is discarded</li>
</ul>
', CAST(286.00 AS Decimal(18, 2)), CAST(284.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000005aff7d34494349cbbf0e7c24a2b40b3d.jfif', N'img1_637486848000000000cb80077844e64b1ebd4aff559ab71cdf.jfif', N'img2_6374868480000000002e3f8ee1627041f59a47dfd2e321912c.jfif', N'img3_637486848000000000c9e2e949aabc4710933121a0838558e4.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 14:24:45.650' AS DateTime), N'Admin', 0, NULL, 812, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (58, N'MDYOSPR0000103', N'Admin', N'Papaya', N'L1_3', N'L2_3', N'L3_3', N'<p>Papayas are a soft, fleshy fruit that can be used in a wide variety of culinary ways. Here we will explore more on the health benefits, uses, how to incorporate more of them into your diet, and what nutritional value papayas have</p>
', CAST(40.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000052b2f7612ff54c21856dd322bf43683b.jfif', N'img1_637486848000000000257f30c7d76243f69010786b86bce13b.jfif', N'img2_637486848000000000fd45ee061d5948199800e74cc5eb7514.jfif', N'img3_6374868480000000009abc014b9bd743009ef265a276adc90b.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 14:32:10.877' AS DateTime), N'Admin', 0, NULL, 15, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (59, N'MDYOSPR0000104', N'Admin', N'Coconut', N'L1_3', N'L2_3', N'L3_3', N'<p>Coconut is the fruit of the coconut palm (<em>Cocos nucifera</em>).</p>

<p>It&rsquo;s used for its water, milk, oil, and tasty meat.</p>

<p>Coconuts have been grown in tropical regions for more than 4,500 years but recently increased in popularity for their flavor, culinary uses, and potential health benefits&nbsp;</p>
', CAST(43.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000000d0bec2a2fb544929034516e646f4c59.png', N'img1_637486848000000000fc84345841a742ff8b51d9413b9f057f.png', N'img2_63748684800000000042fb23b8020647f98728cad287cbf45d.png', N'img3_6374868480000000006a1ed49fed644fe4b8ce0c09549013cd.png', N'img4_637486848000000000.png', N'published', 1, CAST(N'2021-02-12 15:12:07.423' AS DateTime), N'Admin', 0, NULL, 17, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (75, N'MDYOSPR0000120', N'entryBy', N'TITLE', N'alok.784@gmail.com', N'Project', N'xnxn', N'nsbsnsn', CAST(96.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 15, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-13 01:33:20.890' AS DateTime), N'entryBy', NULL, NULL, 2, CAST(3 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (77, N'MDYOSPR0000122', N'Admin', N'test', N'L1_2', N'L2_2', N'L3_2', N'<p>eretryghkj</p>
', CAST(500.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 20, N'mainImg_637487712000000000b15dc869c5ca40e0b76e96b5ded4132f.jpg', N'img1_6374877120000000004c9f559b0b304f6bba23c795eb3c83b3.jpg', N'undefined', N'undefined', N'undefined', N'published', 1, CAST(N'2021-02-13 13:13:04.233' AS DateTime), N'Admin', 0, NULL, 20, CAST(20 AS Decimal(18, 0)), N'WOWOFFER2', N'1', N'OfferProduct6374877120000000001 - Copy.jpg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (12, N'MDYOSPR0000057', N'Admin', N'Banana', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>banana</strong>&nbsp;is an elongated, edible&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;&ndash; botanically a&nbsp;<a href="https://en.wikipedia.org/wiki/Berry_(botany)">berry</a><a href="https://en.wikipedia.org/wiki/Banana#cite_note-purdue1-1">[1]</a><a href="https://en.wikipedia.org/wiki/Banana#cite_note-Armstrong-2">[2]</a>&nbsp;&ndash; produced by several kinds of large&nbsp;<a href="https://en.wikipedia.org/wiki/Herbaceous">herbaceous</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Flowering_plant">flowering plants</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Genus">genus</a>&nbsp;<em><a href="https://en.wikipedia.org/wiki/Musa_(genus)">Musa</a></em>.<a href="https://en.wikipedia.org/wiki/Banana#cite_note-MW-3">[3]</a>&nbsp;In some countries,&nbsp;<a href="https://en.wikipedia.org/wiki/Cooking_banana">bananas used for cooking</a>&nbsp;may be called &quot;plantains&quot;, distinguishing them from&nbsp;<strong>dessert bananas</strong>. The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in&nbsp;<a href="https://en.wikipedia.org/wiki/Starch">starch</a>&nbsp;covered with a rind, which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant. Almost all modern edible seedless (<a href="https://en.wikipedia.org/wiki/Parthenocarpy">parthenocarp</a>) bananas come from two wild species&nbsp;&ndash;&nbsp;<em><a href="https://en.wikipedia.org/wiki/Musa_acuminata">Musa acuminata</a></em>&nbsp;and&nbsp;<em><a href="https://en.wikipedia.org/wiki/Musa_balbisiana">Musa balbisiana</a></em>. The&nbsp;<a href="https://en.wikipedia.org/wiki/Binomial_nomenclature">scientific names</a>&nbsp;of most cultivated bananas are&nbsp;<em>Musa acuminata</em>,&nbsp;<em>Musa balbisiana</em>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Musa_%C3%97_paradisiaca"><em>Musa</em>&nbsp;&times;&nbsp;<em>paradisiaca</em></a>&nbsp;for the hybrid&nbsp;<em>Musa acuminata</em>&nbsp;&times;&nbsp;<em>M.&nbsp;balbisiana</em>, depending on their&nbsp;<a href="https://en.wikipedia.org/wiki/Genome">genomic</a>&nbsp;constitution. The old scientific name for this hybrid,&nbsp;<em>Musa sapientum</em>, is no longer used.</p>
', CAST(40.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 0, N'mainImg_63748425600000000019aa23c24ff041e3a6a16db3069b11c9.jpg', N'img1_637484256000000000bfaa4be5a1a94b6ebcb3227299fd1f1f.jpg', N'img2_63748425600000000084153af9c21e4b648ee59ea87dbd42af.jpg', N'img3_63748425600000000000556dd5535043b098d9eb4a7d003433.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 17:55:12.773' AS DateTime), N'Admin', 0, NULL, 12, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (35, N'MDYOSPR0000080', N'Admin', N'Lemon', N'L1_2', N'L2_2', N'L3_2', N'<p>With a segmented flesh that has a unique pleasant aroma and a strong sour taste, lemons are round/oval and have a yellow, texturized external peel.<br />
<br />
&nbsp;</p>
', CAST(25.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000015efd7a85bf24fc697a7fd6fce3c8329.jpeg', N'img1_637486848000000000e29f7a3c7ef444a7bae5f3b388ad481e.jpeg', N'img2_637486848000000000c137bc38cded4c89959ec08231f46644.jpeg', N'img3_6374868480000000006bc9b91c1b644584883a96b63847641c.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 12:44:28.007' AS DateTime), N'Admin', 0, NULL, 6, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (28, N'MDYOSPR0000073', N'Admin', N'Tomato', N'L1_2', N'L2_2', N'L3_2', N'<p>Tomato Hybrids are high-quality fruits compared to desi, local tomatoes. They contain numerous edible seeds and are red in colour due to lycopene, an anti-oxidant.</p>
', CAST(15.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000edd8781ace704fe39a1731e41451064e.webp', N'img1_637486848000000000c2ebce22169f4dbca6e27fae0704b09a.webp', N'img2_63748684800000000070efcd2463b24a2187f8d07a83dd3e6b.webp', N'img3_6374868480000000000089fd8a8ad2455da8de5540c106ad4d.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:25:10.153' AS DateTime), N'Admin', 0, NULL, 2, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (141, N'MDYOSPR0000186', N'entryBy', N'TITLE IS HERE', N'alok.784@gmail.com', N'no maalum', N'jdjjdjd', N'hello Kathleen Wynne ja raha hu or something like I was so ja rha hai na', CAST(199.00 AS Decimal(18, 2)), CAST(201.00 AS Decimal(18, 2)), 10, N'image1', N'image2', N'image3', N'image4', N'rp.jpg', N'published', 1, CAST(N'2021-02-15 09:22:50.183' AS DateTime), N'entryBy', NULL, NULL, 3, CAST(5 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (14, N'MDYOSPR0000059', N'Admin', N'Custerd Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>The fruits vary in shape, heart-shaped, spherical, oblong or irregular. The size ranges from 7 to 12 cm (2.8 to 4.7&nbsp;in), depending on the cultivar. When ripe, the fruit is brown or yellowish, with red highlights and a varying degree of reticulation, depending again on the variety. The flesh varies from juicy and very aromatic to hard with an astringent taste.<a href="https://en.wikipedia.org/wiki/Custard_apple#cite_note-purdue-1">[1]</a>&nbsp;The flavor is sweet and pleasant, akin to the taste of &#39;traditional&#39;&nbsp;<a href="https://en.wikipedia.org/wiki/Custard">custard</a>.</p>
', CAST(140.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000d8b93e36a05d425cb36e67cacd8ac7dc.jpg', N'img1_637484256000000000d4696471cfa942daa4ae0540ef229485.jpg', N'img2_6374842560000000005c02b7f8c58f4a90919640285183dc38.jpg', N'img3_637484256000000000629fc1b19a274240b81b602657334ca5.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 18:01:55.237' AS DateTime), N'Admin', 0, NULL, 182, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (15, N'MDYOSPR0000060', N'Admin', N'Apricot', N'L1_3', N'L2_3', N'L3_3', N'<p>An&nbsp;<strong>apricot</strong>&nbsp;&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>, or the tree that bears the fruit, of several species in the genus&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus">Prunus</a></em>&nbsp;(stone fruits).</p>

<p>Usually, an apricot tree is from the species&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_armeniaca">P. armeniaca</a></em>, but the species&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_brigantina">P. brigantina</a></em>,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_mandshurica">P. mandshurica</a></em>,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_mume">P. mume</a></em>,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_zhengheensis">P. zhengheensis</a></em>, and&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_sibirica">P. sibirica</a></em>&nbsp;are closely related, have similar fruit, and are also called apricots.<a href="https://en.wikipedia.org/wiki/Apricot#cite_note-1">[1]</a></p>
', CAST(114.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000902ee8e8e84b40609b241820ce61cbf6.jpg', N'img1_637484256000000000b7dffdd948124b36b1c7344783efa778.jpg', N'img2_6374842560000000004e350534d72e4f6a8e92d23e3797eab1.jpg', N'img3_63748425600000000067e2532da7fd46429d13a9a58c1da332.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 18:08:03.800' AS DateTime), N'Admin', 0, NULL, 114, CAST(14 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (29, N'MDYOSPR0000074', N'Admin', N'Culiflower', N'L1_2', N'L2_2', N'L3_2', N'<p>Cauliflower is made up of tightly bound clusters of soft, crumbly, sweet cauliflower florets that form a dense head. Resembling a classic tree, the florets are attached to a central edible white trunk which is firm and tender.&nbsp;<a href="https://www.wowjinn.com/cookbook/recipes/2144/cauliflower-cheese-pancakes/">https://www.wowjinn.com/cookbook/recipes/2144/cauliflower-cheese-pancakes/</a></p>
', CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000003f9394b6da1f4e6a90e93deaf0bcb04b.jpg', N'img1_637486848000000000ed0f31f594704defaa170cf2d35fb1f8.jpg', N'img2_637486848000000000190be10c1748492c99b98c326f4a60d6.jpg', N'img3_637486848000000000013bc4d608ec4c7d80d0aedff6d0e5c7.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 12:27:01.723' AS DateTime), N'Admin', 0, NULL, 1, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (31, N'MDYOSPR0000076', N'Admin', N'Blackberries', N'L1_3', N'L2_3', N'L3_3', N'<p>Sweet yet tart blackberries are a summer staple. But the benefits of these berry beauties go well beyond their yummy taste. Blackberries have impressive health benefits, too.</p>
', CAST(600.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000066c1f9a27b314321ad191652005858c6.jfif', N'img1_637486848000000000c09131d77c974cc28b43c4dcdf25313e.jfif', N'img2_63748684800000000061873ecfd7b44557bab4089364deab65.jfif', N'img3_637486848000000000267ab30d75e94487bf144b2066f1a516.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 12:31:25.053' AS DateTime), N'Admin', 0, NULL, 3300, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (32, N'MDYOSPR0000077', N'Admin', N'Lady Finger', N'L1_2', N'L2_2', N'L3_2', N'<p>Ladies finger is a green vegetable with a tip at the end and a lighter green head, which is inedibe and to be thrown away. It tastes mild and slightly grassy.</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000d59b989a504e4997aee9842f1ee49a1c.webp', N'img1_637486848000000000c12f4368239d48b880afe2f64e7e8b56.webp', N'img2_63748684800000000093058dc2fe8a4fc2b75769bfd3290053.webp', N'img3_63748684800000000077487f5ff0c1484eb414c8f96dc43966.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:33:12.687' AS DateTime), N'Admin', 0, NULL, 8, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (19, N'MDYOSPR0000064', N'alok.784@gmail.com', N'Neuherbs Raw Unroasted Chia ', N'L1_8', N'L2_6', N'L3_5', N'<ul>
	<li>Certified Quality: neuherbs chia seeds are natural and raw chia grains.</li>
	<li>Packed With Nutrition: Chia is an excellent source of fibers, protein, omega3, vitamins&amp; minerals.</li>
	<li>Feel Fuller: A duo of fiber and protein that helps in keeping you satisfied all day long by curbing hunger pangs and cravings, making it suitable for all diets.</li>
	<li>A versatile kitchen staplechia seeds add a pleasant nutty flavour to your favourite meal and improve the nutrition quality of your food with various health advantages.</li>
	<li>Better You: To achieve your fitness goals easily, neuherbs experts provide you free diet recipes., Shelf Life: 270 Days, Ingredient Type: Vegetarian, Total Weight: 200 gm, Package Contents: 200 gm x 1 of Chia Seeds, Special Feature: Rich in fiber, protein, omega: 3, calcium &amp; naturally gluten free</li>
</ul>
', CAST(50.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 50, N'mainImg_6374842560000000000ca2d77ba9264a69b4808dd37fe3a337.jpg', N'img1_637484256000000000ab346b9b746042bdbf834430d4c391ac.jpg', N'img2_6374842560000000003b0d898e7f8143c0bcf768f955033f08.jpg', N'img3_63748425600000000038cfeb5244da4ddea84c2b718c651dd2.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 19:44:04.107' AS DateTime), N'alok.784@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (23, N'MDYOSPR0000068', N'Admin', N'Potato', N'L1_2', N'L2_2', N'L3_2', N'<p>Fresho Potatoes are nutrient-dense, non-fattening and have reasonable amount of calories. Include them in your regular meals so that the body receives a good supply of carbohydrates, dietary fibers and essential minerals such as copper, magnesium, and iron. In India, potatoes are probably the second-most consumed vegetables after onions.</p>
', CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000c03b0a6d728a47e5bab764e014d3d3d3.jpg', N'img1_6374868480000000001bf74ea8d0114fc8a0dd19845b9b8c51.jpg', N'img2_637486848000000000a06e597e1ed14fd9b8c4519a08883429.jpg', N'img3_6374868480000000003e20f19e797745d99ec78384bd639b0f.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 12:22:36.963' AS DateTime), N'Admin', 0, NULL, 1, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (30, N'MDYOSPR0000075', N'Admin', N'Carrot', N'L1_2', N'L2_2', N'L3_2', N'<p>A popular sweet-tasting root vegetable, Carrots are narrow and cone shaped. They have thick, fleshy, deeply colored root, which grows underground, and feathery green leaves that emerge above the ground. While these greens are fresh tasting and slightly bitter, the carrot roots are crunchy textured with a sweet and minty aromatic taste. Fresho brings you the flavour and richness of the finest crispy and juicy carrots that are locally grown and the best of the region.<br />
Do not forget to check our delicious recipe -&nbsp;<a href="https://www.bigbasket.com/cookbook/recipes/912/carrot-halwa/"><strong>https://www.bigbasket.com/cookbook/recipes/912/carrot-halwa/</strong></a></p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000a055d8b3076040958377dc390d2f7b9d.jpeg', N'img1_6374868480000000006ba0874e74264494aefbe24b496ea0af.jpeg', N'img2_6374868480000000009c831509b85d4c39aaa6fc5730118344.jpeg', N'img3_6374868480000000006cff382d2dd842038289d0c747678805.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 12:29:15.097' AS DateTime), N'Admin', 0, NULL, 4, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (36, N'MDYOSPR0000081', N'Admin', N'Coriender Leaves', N'L1_2', N'L2_2', N'L3_2', N'<p>Coriander leaves are green, fragile with a decorative appearance. They contain minimal aroma and have a spicy sweet taste. Now do not bother wasting time cutting off the roots as we value your money and time and provide you the freshest leafy edible parts .</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000005b985bcf359446658826646c72add692.webp', N'img1_63748684800000000058848ccc2dca42edae2ce8e857ec0dd5.webp', N'img2_637486848000000000f764d1decb9140d38d202cced0c5b8c8.webp', N'img3_637486848000000000ff434972c1a146f6a0a7c51556fce036.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:48:31.113' AS DateTime), N'Admin', 0, NULL, 4, CAST(7 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (37, N'MDYOSPR0000082', N'Admin', N'Masroom', N'L1_2', N'L2_2', N'L3_2', N'<p>Buttom mushrooms are very small sized mushrooms with smooth round caps and short stems. They have a mild flavour with a good texture that becomes more fragrant and meaty when cooked.<br />
<br />
&nbsp;</p>
', CAST(40.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000085ecfcfaf04430ba9321f0158e0fd36.jpeg', N'img1_63748684800000000067af307982e84e63a7843f1c3417e704.jpeg', N'img2_637486848000000000f87330f2dca444a7a297a75dc0c95d4b.jpeg', N'img3_637486848000000000aaad18074f374c96bd092e9648ce81ca.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 12:52:48.187' AS DateTime), N'Admin', 0, NULL, 15, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (38, N'MDYOSPR0000083', N'Admin', N'Green Capsicum', N'L1_2', N'L2_2', N'L3_2', N'<p>Leaving a moderately pungent taste on the tongue, Green capsicums, also known as green peppers are bell shaped, medium-sized fruit pods. They have thick and shiny skin with a fleshy texture inside</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000e0fece5b6b034fe9af5bb2dce993ded6.jpeg', N'img1_637486848000000000d19db6079fbc4e5cab2e32a841c15d1c.jpeg', N'img2_63748684800000000098430533cda64c2fb95010f71dbdba04.jpeg', N'img3_6374868480000000009c3eb5f25da7434cbc2aeac9ae5629cd.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 12:56:31.140' AS DateTime), N'Admin', 0, NULL, 8, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (39, N'MDYOSPR0000084', N'Admin', N'Cucumber', N'L1_2', N'L2_2', N'L3_2', N'<p>With high water content and crunchy flesh, Cucumbers have striped, light to dark green coloured skin that is edible.<br />
<br />
&nbsp;</p>
', CAST(15.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000a66fd7ac3afa44ac9feec6463a17b3b7.jpeg', N'img1_637486848000000000d46b7b87cb4947878c64562afd265704.webp', N'img2_6374868480000000009b98baf9e6204fc1b5a09f949f6110aa.webp', N'img3_6374868480000000002f99a5cfed7f49c99cd83a5ac589fbe6.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 13:00:48.417' AS DateTime), N'Admin', 0, NULL, 2, CAST(7 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (52, N'MDYOSPR0000097', N'Admin', N'Yellow Corn', N'L1_2', N'L2_2', N'L3_2', N'<h3>Product Description</h3>

<p>PopcornPopcorn is a type of flint corn but has its own size, shape, starch level and moisture content. &nbsp;It has a hard exterior shell and a soft starchy center. &nbsp;When heated, the natural moisture inside the kernel turns to steam and builds up enough pressure that it eventually explodes. &nbsp;Other types of dried corn may burst open slightly when heated, not like popcorn. &nbsp;Popcorn is unique in its taste and popability.</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000bdd41f953e624654b03e05eb9d32c9ff.jpg', N'img1_6374868480000000002b7428ca47324aa7acdf519ff9402d56.jpg', N'img2_6374868480000000000edcd9ab74ee4ad0b85495384a972363.jpeg', N'img3_637486848000000000789f86dca1f541ae91615a0542d517c0.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 13:40:14.557' AS DateTime), N'Admin', 0, NULL, 3, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (41, N'MDYOSPR0000086', N'Admin', N'Orange', N'L1_3', N'L2_3', N'L3_3', N'<p>.</p>

<ul>
	<li>Oranges are among the world&rsquo;s most popular fruits.</li>
	<li>Also called sweet oranges, they grow on orange trees (<em>Citrus x sinensis</em>) and belong to a large group of fruits known as citrus fruits.</li>
	<li>Their true origin is a mystery, but the cultivation of oranges is thought to have started in eastern Asia thousands of years ago.</li>
	<li>Today, they are grown in most warm regions of the world and consumed either fresh or as juice.</li>
	<li>Oranges are a healthy source of fiber, vitamin C, thiamine, folate, and antioxidants. They have multiple health benefits.</li>
</ul>
', CAST(50.00 AS Decimal(18, 2)), CAST(48.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000b62e0b4871e54146b3b1f32792b36ac1.jfif', N'img1_637486848000000000c4187b895730466e9057928498f7a735.jfif', N'img2_637486848000000000c82a52f9e0f24276aa3cb5ff20bf70bd.jfif', N'img3_637486848000000000213cec5f242e4abab6d96d436369390f.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:01:09.963' AS DateTime), N'Admin', 0, NULL, 24, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (42, N'MDYOSPR0000087', N'Admin', N'Green Chilli', N'L1_2', N'L2_2', N'L3_2', N'<p>Green chillis are the best kitchen ingredient to bring a dash of spiciness to recipes. The fresh flavour and sharp bite make them a must in almost all Indian dishes. This particular green chilli variety is big.</p>
', CAST(40.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000e96d2727857b4b1d97a329c9b56661ca.jpeg', N'img1_637486848000000000a1219b3e03f64e798dca8ebb89fc5612.jpeg', N'img2_6374868480000000002b0b274d871248fda3d890f3a74854df.jpeg', N'img3_637486848000000000f889a2ac3915480e8d0fb3aa9514f9d3.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 13:03:55.790' AS DateTime), N'Admin', 0, NULL, 15, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (43, N'MDYOSPR0000088', N'Admin', N'Beetroot', N'L1_2', N'L2_2', N'L3_2', N'<p>These edible ruby red roots are smooth and bulbous and have the highest sugar content than any other vegetable.<br />
<br />
&nbsp;</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000004389391ce87041058d967792a82e313c.webp', N'img1_637486848000000000dc10ded95b21493ab7d88046876781be.webp', N'img2_63748684800000000064d220d05c464e4fb64b660c2fe74916.webp', N'img3_6374868480000000000690e671e60f45458b53a745001cc2fd.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 13:06:25.067' AS DateTime), N'Admin', 0, NULL, 8, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (53, N'MDYOSPR0000098', N'Admin', N'Blueberries', N'L1_3', N'L2_3', N'L3_3', N'<p>Inflammation is a key driver of all chronic diseases, so blueberries have a host of benefits,&quot; says Ann Kulze, MD, of Charleston, S.C., author of&nbsp;<em>Dr. Ann&#39;s 10 Step Diet: A Simple Plan for Permanent Weight Loss and Lifelong Vitality.</em>&nbsp;When selecting berries, note that the darker they are, the more antioxidants they have. &quot;I tell everyone to have a serving (about 1/2 cup) every day,&quot; Kulze says. &quot;Frozen are just as good as fresh.&quot;&nbsp;</p>
', CAST(199.00 AS Decimal(18, 2)), CAST(197.00 AS Decimal(18, 2)), 10, N'mainImg_63748684800000000053e80d4e940b4079a5c2070e7498f1dc.jfif', N'img1_637486848000000000f9ac0713dfc844f39ecb5ab0ba7f7251.jfif', N'img2_637486848000000000f9e651fe5157477d9452593f5b3f3d3e.jfif', N'img3_637486848000000000811d1f333c0141009bf239a5d52a25d1.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:40:35.173' AS DateTime), N'Admin', 0, NULL, 392, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (44, N'MDYOSPR0000089', N'Admin', N'Pear', N'L1_3', N'L2_3', N'L3_3', N'<p>Pears are sweet, bell-shaped fruits that have been enjoyed since ancient times. They can be eaten crisp or soft.</p>

<p>They&rsquo;re not only delicious but also offer many health benefits backed by science.</p>
', CAST(185.00 AS Decimal(18, 2)), CAST(183.00 AS Decimal(18, 2)), 10, N'mainImg_637486848000000000a330b05cd22a40f2a3828ce9d247cdb4.jfif', N'img1_6374868480000000007e3f94012f2d43c785aecde521b9e796.jfif', N'img2_637486848000000000a18f91307a724c69b47a468fc710e5b1.jfif', N'img3_63748684800000000035a75b066bd349408026585fa830ba20.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:09:09.973' AS DateTime), N'Admin', 0, NULL, 339, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (45, N'MDYOSPR0000090', N'Admin', N'Ginger', N'L1_2', N'L2_2', N'L3_2', N'<p>Fresho Organic products are organically grown and handpicked by expert.<br />
Product image shown is for representation purpose only, the actually product may vary based on season, produce &amp; availability.</p>
', CAST(35.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000001b6715b26f2438ca068dcdadc7e991b.jpg', N'img1_637486848000000000481771ac30bd41f7b9577a227f30490c.jpg', N'img2_63748684800000000080fcb42c12a24e2996f915c4e79a3bcd.jpg', N'img3_63748684800000000014960c0a09714a578562b33e14e907b1.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 13:09:16.927' AS DateTime), N'Admin', 0, NULL, 11, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (46, N'MDYOSPR0000091', N'Admin', N'Beans', N'L1_2', N'L2_2', N'L3_2', N'<p>Haricot beans are small, oval, plump and creamy-white with a mild flavour and a smooth, buttery texture.</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000d3b13e05bcb24e358a3c70013f565457.jpg', N'img1_637486848000000000eb9b9ce910574127836004ee741186f9.jpg', N'img2_63748684800000000067bc144cf5d24a7392cd6a2af9a06f35.jpg', N'img3_637486848000000000648e693dca504eb5acad14e6bfd8ef00.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 13:12:33.480' AS DateTime), N'Admin', 0, NULL, 8, CAST(7 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (49, N'MDYOSPR0000094', N'Admin', N'Garlic', N'L1_2', N'L2_2', N'L3_2', N'<p>Garlic is made of several heads wrapped in thin whitish layers. They are firm and have a mild flavour. Once crushed, they emit a strong and pungent aroma.<br />
<br />
&nbsp;</p>
', CAST(110.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000062e707f545654cf69d8ab97e73b8b9b9.jpg', N'img1_637486848000000000b55335b81007439a95889d6965150774.jpg', N'img2_6374868480000000001c3bc7501116478daf30569598d210c9.jpg', N'img3_6374868480000000004468d80f52124b5b858c8f47027fce7f.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 13:16:26.983' AS DateTime), N'Admin', 0, NULL, 110, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (48, N'MDYOSPR0000093', N'Admin', N'Strawberry', N'L1_3', N'L2_3', N'L3_3', N'<p>These potent little packages protect your&nbsp;<strong>heart</strong>, increase HDL (good)&nbsp;<strong>cholesterol</strong>, lower your blood pressure, and guard against cancer. Packed with&nbsp;<strong>vitamins</strong>,&nbsp;<strong>fiber</strong>, and particularly high levels of&nbsp;<strong>antioxidants</strong>&nbsp;known as polyphenols, strawberries are a sodium-free, fat-free,&nbsp;<strong>cholesterol</strong>-free, low-calorie food.</p>
', CAST(420.00 AS Decimal(18, 2)), CAST(418.00 AS Decimal(18, 2)), 10, N'mainImg_63748684800000000090af3f503103484fbccd519c45494349.jfif', N'img1_637486848000000000d37d6429260449cc9fcb23823314bd2e.jfif', N'img2_637486848000000000362146ed185048149ebc667e05059455.jfif', N'img3_637486848000000000d1d6197e242e4dc787e046a9267015ac.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:14:22.640' AS DateTime), N'Admin', 0, NULL, 1756, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (50, N'MDYOSPR0000095', N'Admin', N'Ridge Gourd', N'L1_2', N'L2_2', N'L3_2', N'<p>Ridge Gourds are long vegetables with a ridged dark green skin and white spongy flesh that contains numerous seeds inside. They are rich in fiber and very prominent in Indian cooking.</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000c8a6935eed644326af36939abe431256.jpg', N'img1_6374868480000000005d978629511141e3bae5c697f73d7777.jpeg', N'img2_63748684800000000056ab1423bd724e5bbe3288e159ac2040.jpg', N'img3_637486848000000000ac5e63476b1d4837a9a7a3d3ebe1c954.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 13:28:39.140' AS DateTime), N'Admin', 0, NULL, 8, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (51, N'MDYOSPR0000096', N'Admin', N'Broccoli', N'L1_2', N'L2_2', N'L3_2', N'<p>With a shape resembling that of a cauliflower, Brocollis have clusters of small, tight flower heads. These heads turn bright green on cooking and tastes slightly bitter.<br />
<br />
&nbsp;</p>
', CAST(60.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000e805b2437ca343748a73d135d9f29ac7.webp', N'img1_637486848000000000917e474565d54ce8a0f7c6b7ae9833f2.jpg', N'img2_637486848000000000c090343449ef4a7fab6f13c565f0fb6c.webp', N'img3_637486848000000000cac68932b31543ee9e0accd2eed35fd0.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 13:30:47.793' AS DateTime), N'Admin', 0, NULL, 33, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (55, N'MDYOSPR0000100', N'Admin', N'Radish', N'L1_2', N'L2_2', N'L3_2', N'<p>Radishes are a root crop with a crunchy texture and a sharp, spicy, hot or sweet taste. They are juicy and sometimes have a pungent smell.</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000007b71dbcd4add4ed3b1554b2148e66904.jpg', N'img1_637486848000000000002534b9b6664e62b0f853fc5cd42815.jpg', N'img2_6374868480000000005f4c92040dcc4053afdafa417c9faabc.jpg', N'img3_637486848000000000c12ebb87ea004e19bfbf087f54423dfa.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 13:51:47.537' AS DateTime), N'Admin', 0, NULL, 4, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (56, N'MDYOSPR0000101', N'Admin', N'Mango', N'L1_3', N'L2_3', N'L3_3', N'<p>In some parts of the world, mango (<em>Mangifera indica</em>) is called the &ldquo;king of fruits.&rdquo;</p>

<p>It&rsquo;s a drupe, or stone fruit, which means that it has a large seed in the middle.</p>
', CAST(172.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), 10, N'mainImg_6374868480000000005e42bd53b6a94e1fb7ae15cfabe8297d.jfif', N'img1_63748684800000000044ee261a18e943b7adcf1439b9d37ac2.jfif', N'img2_637486848000000000b2f53853412b4baaa4c6844e287b8ad8.jfif', N'img3_63748684800000000092212ffb262c42d4ae1c5e62ea92cc49.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:54:04.950' AS DateTime), N'Admin', 0, NULL, 292, CAST(15 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (61, N'MDYOSPR0000106', N'Admin', N'Alfalfa', N'L1_2', N'L2_2', N'L3_2', N'<p>Alfalfa, also called lucerne and called Medicago sativa in binomial nomenclature, is a perennial flowering plant in the legume family Fabaceae. It is cultivated as an important forage crop in many countries around the world. It is used for grazing, hay, and silage, as well as a green manure and cover crop.</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_63748684800000000098afba8bcc54454892d66e5c8dfb6b75.jpg', N'img1_63748684800000000089a951f29bd442d09f5e0d63b6acbee8.jpg', N'img2_6374868480000000007e6f268f0ab54d4bba278c4f0c0587d2.jpg', N'img3_637486848000000000095bd7148cce4174a7b080c3add2bb0e.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 16:56:23.030' AS DateTime), N'Admin', 0, NULL, 4, CAST(5 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000Alfalfa.jpg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (62, N'MDYOSPR0000107', N'Admin', N'Jackfruit', N'L1_2', N'L2_2', N'L3_2', N'<p>Jackfruit is a tropical tree fruit native to southwest India. It belongs to the Moraceae plant family, which also includes mulberries, figs, and breadfruit.</p>

<p>A jackfruit is large, with thick, yellow flesh and edible seeds and pods.</p>
', CAST(391.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000ba0f2f4427ee47488118ec22cf1c9e62.jpg', N'img1_637486848000000000d34d6d43df5e459da2268960a1810900.jpg', N'img2_6374868480000000006cd58c9cd89e415d97b3b98a008a908a.jpg', N'img3_637486848000000000aec3fbd8cbd0482cbdb51d370c7336ba.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 17:13:18.900' AS DateTime), N'Admin', 0, NULL, 1369, CAST(15 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000jackfruit.jpg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (63, N'MDYOSPR0000108', N'Admin', N'Spring Onion', N'L1_2', N'L2_2', N'L3_2', N'<p>Spring onions come with a crisp texture and sweet flavour.<br />
They are moist with thin, white flesh and a green stem. The green stems are hollow, bitter and pungent</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000278ab23675664857889190c5027d4693.jpg', N'img1_637486848000000000998a0ff127364f7a956303bc58f80bce.jpg', N'img2_637486848000000000c6ed1c0d326f40539ffa3898c78a3d1a.jpg', N'img3_6374868480000000006218a35670c54da0ba4fabbae319dfa6.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 17:23:58.617' AS DateTime), N'Admin', 0, NULL, 6, CAST(5 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000SP.jpg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (64, N'MDYOSPR0000109', N'Admin', N'Straberries', N'L1_3', N'L2_3', N'L3_3', N'<p>It is a hybrid of two wild strawberry species from North America and Chile.</p>
', CAST(55.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000002392bd59c7b24340ac48189863fb606b.jpeg', N'img1_6374868480000000009624e81ada2740c799dedb919e3a1bbd.jpeg', N'img2_637486848000000000b952c995e6a04216bbdbb8dce5df1b0e.jpeg', N'img3_6374868480000000003a2b41ea761b41249bbe52b65cf9c07b.jpeg', N'img4_637486848000000000.jpeg', N'published', 1, CAST(N'2021-02-12 17:28:01.050' AS DateTime), N'Admin', 0, NULL, 28, CAST(15 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000Strwaberry.jpeg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (65, N'MDYOSPR0000110', N'Admin', N'Custurd Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>&nbsp;</p>

<p>Due to its creamy texture, cherimoya is also known as custard apple. It&rsquo;s often eaten with a spoon and served chilled like custard. Cherimoya has a sweet taste similar to other tropical fruits, such as banana and pineapple&nbsp;</p>
', CAST(70.00 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000ed56c5e552f34a74bff18d140a576f77.jpg', N'img1_6374868480000000002f61945f0fb544e2a8914e96e6608ffe.jpg', N'img2_637486848000000000bbec5ab8783b468c9e24b7f1c94d5079.jpg', N'img3_6374868480000000007abac0e68a1f4485ad3d2b49417ec322.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 17:31:42.317' AS DateTime), N'Admin', 0, NULL, 46, CAST(15 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000custard.jpg')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (66, N'MDYOSPR0000111', N'Admin', N'Fig', N'L1_3', N'L2_3', N'L3_3', N'<p>Figs are a unique fruit resembling a teardrop. They&rsquo;re about the size of your thumb, filled with hundreds of tiny seeds, and have an edible purple or green peel. The flesh of the fruit is pink and has a mild, sweet taste. The scientific name for the fig is&nbsp;<em>Ficus carica</em>.</p>
', CAST(180.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000dbf286d528db4ca8b2b20e9ca6cc5964.webp', N'img1_637486848000000000724e1c3cdb514acfa2b98c238c63c835.webp', N'img2_637486848000000000f6955ed5c3a243368794925f36bdfba0.webp', N'img3_6374868480000000000bd4a58d290743e0a7d086216aa15f7a.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 17:41:09.333' AS DateTime), N'Admin', 0, NULL, 270, CAST(30 AS Decimal(18, 0)), N'WOWOFFER3', N'1', N'OfferProduct637486848000000000Fig.webp')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (68, N'MDYOSPR0000113', N'Admin', N'LUZWE® 360° Degree Nylon Braided Magnetic Cord HiFi Fast Charging Data Cable, ', N'L1_10', N'L2_7', N'L3_6', N'<ul>
	<li>⚡Universal: 3in1 Design &amp; Strong Magnetic Charging Cable, Lighting Charging Wire Redesigned Absorption Nano Data Cables Compatible with Type-C, Micro USB and iProduct Devices</li>
	<li>⚡One-Hand Operation &amp; Led Light: You can use one hand to operate this phone charge cable to make charging on/off, LE</li>
</ul>
', CAST(500.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 20, N'mainImg_637486848000000000c46fd8fc9f5748d1bef4245855d49822.jpg', N'img1_6374868480000000005581b06ab5674169a5d3c419e3bb24a7.png', N'undefined', N'undefined', N'undefined', N'published', 1, CAST(N'2021-02-12 20:51:33.890' AS DateTime), N'Admin', 0, NULL, 20, CAST(20 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (76, N'MDYOSPR0000121', N'Admin', N'Brinjal', N'L1_2', N'L2_2', N'L3_2', N'<p>Eggplant, aubergine or brinjal is a plant species in the nightshade family Solanaceae. Solanum melongena is grown worldwide for its edible fruit. Most commonly purple, the spongy, absorbent fruit is used in several cuisines. Typically used as a vegetable in cooking, it is a berry by botanical definition</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000207c6f82a956450e8ec945ba3ac60d06.jpg', N'img1_637487712000000000fb1359949d6044bda0ed6f57c9d88283.jpg', N'img2_63748771200000000048a41d093c7e42b5a9c11257ff87020b.jpg', N'img3_63748771200000000074ab927b6c9a4d8ea68ffcbdad88c1a5.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 13:00:24.497' AS DateTime), N'Admin', 0, NULL, 4, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (78, N'MDYOSPR0000123', N'Admin', N'Bottle Jug', N'L1_9', N'L2_6', N'L3_5', N'<p>Divian Hammered Pure Copper Bottle. Copper has a tendency to kill Bacteria and Virus cells. Copper products have been used by our ancestors for their health benefits, let&#39;s keep the traditions alive. Our products are purely handmade and have a little rustic appearance. Steel or plastic finish may not be achieved in Pure Copper products as the metal is highly ductile. This Copper Bottle has been precisely handcrafted for the purpose of storing water. Ideal gift for various occasions and made with 99.09 percent of purest Copper. Apt Corporate Gifting Option and can be utilized on a daily basis. Leakproof and easy to clean design suitable for storage and handy to carry.</p>
', CAST(799.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000cb7b06416286476c890060fa3e594cb9.jpeg', N'img1_637487712000000000db64e3e16a514507bd118bdf3ef8bacf.jpeg', N'img2_6374877120000000008dc10383cbdf4d359e62190acc374d01.jpeg', N'img3_637487712000000000f3545d41685c4e53ad06e8de44e0b742.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 13:42:22.603' AS DateTime), N'Admin', 0, NULL, 5593, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (79, N'MDYOSPR0000124', N'Admin', N'Red Level', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:20px; vertical-align:bottom; white-space:nowrap; width:244px">Red label natural care is from the house of Brooke bond and the brand red label. Red label natural care tea contains the goodness of 5 natural ingredients - cardamom, ginger, tulsi, mulethi &amp; ashwagandha, all of them are extremely beneficial for your body as they enhance immunity while giving a unique flavour to the rich tea. Red label natural care tea is also available in tea bags!</td>
		</tr>
	</tbody>
</table>
', CAST(610.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000c3c918fd1c41448383b41ffbef505ee6.jpg', N'img1_637487712000000000b47105a8a9aa4fedbe95ae79bc6d6378.jpg', N'img2_6374877120000000008eb2a779032d4060b6328eaa4d063b7e.jpg', N'img3_637487712000000000ecf0efadcdf5443488b57279a184c0dc.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 13:49:57.970' AS DateTime), N'Admin', 0, NULL, 3660, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (84, N'MDYOSPR0000129', N'Admin', N'Bingo Mad Angles Chips - Very Peri Peri', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:121px; vertical-align:bottom; white-space:normal; width:244px">What happens when you put Indian chefs and international chefs in a room together? You get the best of both worlds. You get Bingo Peri Peri chips. The contemporary flavours of fiery yet lip-smacking international taste that leaves you craving for more.</td>
		</tr>
	</tbody>
</table>
', CAST(40.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000b7ae41ac315f4b9081b330ad62a579bc.jpg', N'img1_6374877120000000002565a61289ec40f1a451d450a76db1ea.jpg', N'img2_637487712000000000c3617444c120422cb633212031e2a2a6.jpg', N'img3_6374877120000000000e2ef9716fa34b3fab16e72857ad1b5a.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:20:52.387' AS DateTime), N'Admin', 0, NULL, 14, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (85, N'MDYOSPR0000130', N'Admin', N'WhyFryy Popped Potato Chips - Herby Sour Cream flavour', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:82px; vertical-align:bottom; white-space:normal; width:244px">WhyFryy Popped Potato Chips are de-light-ful potato chips, with 60% less fat than regular, fried potato chips.</td>
		</tr>
	</tbody>
</table>
', CAST(35.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000e9ac7393bd7b4a9f8ba7b93a1478ef25.jpg', N'img1_637487712000000000cd86bb82d72d4cfb88dee04703f598e7.jpg', N'img2_637487712000000000ca28c0696a614fc5a09dafeb7e9f67b9.jpg', N'img3_637487712000000000b014b44e98f84173946d4a8ae9a3324a.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:24:34.317' AS DateTime), N'Admin', 0, NULL, 11, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (80, N'MDYOSPR0000125', N'Admin', N' Kinely Soda', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:21px; vertical-align:bottom; white-space:nowrap; width:244px">When it comes to safety and assurance of quality, Kinley soda water is the go-to choice. Launched in 2002, the bubbly zing of Kinley soda makes a perfect mixer for your mocktails and is the perfect companion to your imagination with the extra punch! This Coca-Cola product goes through an intensive 10 Step filtration method before reaching you</td>
		</tr>
	</tbody>
</table>
', CAST(60.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000007b78603a4e2749bab66fc028d783c769.jpg', N'img1_6374877120000000001c6fc900f88c401494bf1594a2e0b8bc.jpg', N'img2_6374877120000000005c4bfc83895746ef8b719951ff0081bf.jpg', N'img3_637487712000000000a4f6ad1f4baa4487803516543d60ba20.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:02:05.687' AS DateTime), N'Admin', 0, NULL, 30, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (81, N'MDYOSPR0000126', N'Admin', N'Taj mahal Tea ', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:21px; vertical-align:bottom; white-space:nowrap; width:244px">50 Glorious years of Excellence</td>
		</tr>
	</tbody>
</table>
', CAST(700.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000cc2cf04c7ce14bd49be16a68ccc621e3.jpg', N'img1_6374877120000000002625578aa05b4099954e624feceee069.jpg', N'img2_6374877120000000008e6a4ac6df2f40269d7171a74aa108fc.jpg', N'img3_637487712000000000200bc7f99c1c413b8debfaf5e0c808c8.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:07:47.940' AS DateTime), N'Admin', 0, NULL, 4550, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (82, N'MDYOSPR0000127', N'Admin', N'Bingo Mad Angles Chips - Achaari Masti', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:157px; vertical-align:bottom; white-space:normal; width:244px">Enjoy the desi flavour of mango pickles in the form of deliciously crunchy triangle chips. Made from a corn base, they are cooked with rice and flour that gives it a unique texture. Every bite has a crunchy fun in a perfect triangular shape with the lip-smacking flavour of your Dadi&rsquo;s Achaar in a balanced flavour.</td>
		</tr>
	</tbody>
</table>
', CAST(60.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000005f7cd2e33efa43c5b197d14f2200c90b.jpg', N'img1_63748771200000000020240bac2d5d4c81b6c20b2e5bed0660.jpg', N'img2_6374877120000000000de715303c3d45078131ada05635c713.jpg', N'img3_6374877120000000008dd6ade09caa4baeb9ba8ee8581a23eb.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:12:23.393' AS DateTime), N'Admin', 0, NULL, 33, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (87, N'MDYOSPR0000132', N'Admin', N'GoodDiet Ragi Sticks - Achari Masala', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:104px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Sit back and enjoy a completely baked, non-fried bite from bb GoodDiet. Here, nutrition rich ragi and spicy achari masala flavour come together to turn your snacking into a tasty and crunchy delight.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(17.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, N'mainImg_63748771200000000004616e1c3c22463fb9ef921bd9cd62a9.jpg', N'img1_637487712000000000e76a08fab870406b884b33549edfe3a9.jpg', N'img2_6374877120000000008e9abf34270c4ee7a51484389c13fe21.jpg', N'img3_637487712000000000a93b81974770420299f743ad2403fc53.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:27:37.497' AS DateTime), N'Admin', 0, NULL, 2, CAST(7 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (88, N'MDYOSPR0000133', N'Admin', N'Designer Bowl Set ', N'L1_9', N'L2_8', N'L3_7', N'<p>Hand crafted brass silver plated bowl and tray set with design pattern comes in a blue velvet gift box.</p>
', CAST(649.00 AS Decimal(18, 2)), CAST(270.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000004da5c5196fbe4fd8975aba43d02b8954.jpeg', N'img1_6374877120000000007045d15433254d1fae612e710cadd4a0.jpeg', N'img2_637487712000000000b01b732016ec4b7da0a28787680c577a.jpeg', N'img3_637487712000000000389c29bea0a84a98a35842d8d8d49391.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 14:28:41.420' AS DateTime), N'Admin', 0, NULL, 1752, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (83, N'MDYOSPR0000128', N'Admin', N'Lays Potato Chips - Simple Classic Salted', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:172px; vertical-align:bottom; white-space:normal; width:244px">Experience the signature taste with the best quality potatoes sprinkled with salt. Each bag of Lays Classic Salted Potato Chips is a reminder of how good the simple life is. From the everyday snack to the impromptu get-togethers, LAYS chips are the perfect addition to any occasion. Whether its party time or family time, everyone loves gathering around the chip bowl.&nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(20.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000080b31ec78c19498e83635500dff2b76e.jpg', N'img1_637487712000000000099263e0ddd5423680488c41e6629d05.jpg', N'img2_63748771200000000075afa063dd324bdeb1efa9180d3e6c20.jpg', N'img3_637487712000000000f1495d3bb85c41c295447d04beccd7bb.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:16:27.377' AS DateTime), N'Admin', 0, NULL, 3, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (86, N'MDYOSPR0000131', N'Admin', N'Akira Water Jug', N'L1_9', N'L2_8', N'L3_7', N'<table>
	<tbody>
		<tr>
			<td>Sales Package</td>
			<td>
			<ul>
				<li>1 Jug with 4 glasses</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Model Number</td>
			<td>
			<ul>
				<li>AK No 3 and 4 Glass</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>More Details</p>

<ul>
	<li>
	<p>Generic Name</p>

	<ul>
		<li>Jug</li>
	</ul>
	</li>
	<li>
	<p>Country of Origin</p>

	<ul>
		<li>India</li>
	</ul>
	</li>
</ul>
', CAST(999.00 AS Decimal(18, 2)), CAST(689.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000004522f1acf211417380db9b6fa59056eb.jpeg', N'img1_6374877120000000001ba1c4d997bd4170bcaf188786621a33.jpeg', N'img2_637487712000000000b88578f020be49e78290c02b03097e24.jpeg', N'img3_63748771200000000094700b1e46eb4baaa971de9b4d1f51e7.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 14:25:14.343' AS DateTime), N'Admin', 0, NULL, 31, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (89, N'MDYOSPR0000134', N'Admin', N'Open Secret Nutty Chips - Lemon Chilli Almond, Baked Supergrain Chips, Protein Packed, Not Fried', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:189px; vertical-align:bottom; white-space:normal; width:244px">Unjunking chips with creamy Lemon Chilli Almond Butter sandwiched between Crunchy Supergrains Baked Wafers, that perfect mid-day snack. These chips will remind you of your last family vacation, by the beach, ocean breeze in your hair with your feet in the sand. No added preservatives, no artificial flavours, no added maida, and no trans fat. Making our favourite snacking moment a little bit healthier.</td>
		</tr>
	</tbody>
</table>
', CAST(40.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000007bfcc8d8944640168467c670c15b0bf6.jpg', N'img1_6374877120000000008e21530ad6d94f92b7ba1f76fec24206.jpg', N'img2_637487712000000000ef6f0904d4124a97a35d637558572313.jpg', N'img3_6374877120000000004a5152e19f24428db00c99fad4d7e3d3.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:31:04.330' AS DateTime), N'Admin', 0, NULL, 14, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (90, N'MDYOSPR0000135', N'Admin', N'Tagz Popped Potato Chips - Masala Trekkin', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:62px; vertical-align:bottom; white-space:normal; width:244px">WhyFryy Popped Potato Chips are de-lightful potato chips, with 60% less fat than regular, fried potato chips.</td>
		</tr>
	</tbody>
</table>
', CAST(50.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000f36bc310db3d462bb13a1cf894b3aa04.jpg', N'img1_6374877120000000001eca7e0e40be4cb09c89833e8320e458.jpg', N'img2_6374877120000000001bc2105b96504f7eb1d513c62aab2df5.jpg', N'img3_6374877120000000001ad7e1e94cb3499581c1cae85e455478.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:34:10.233' AS DateTime), N'Admin', 0, NULL, 20, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (94, N'MDYOSPR0000139', N'Admin', N'Tasties Nacho Chips - Jalapeno', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:70px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Tasties brings authentic Mexicano flavours with crunchy and yummy Nachos perfect for dips and toppings or just daily snacking!</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(40.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000a01c8bc355f24f40bec9bfabed810105.jpg', N'img1_637487712000000000c3c0106f3bbd4326af0cb05fee3f7908.jpg', N'img2_63748771200000000025421d4d153b46df9975acdc2b2712a1.jpg', N'img3_6374877120000000009de0eabdd53a4a3fa35e19a1f1eda6ef.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:56:14.767' AS DateTime), N'Admin', 0, NULL, 14, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (91, N'MDYOSPR0000136', N'Admin', N'Lighting Coffee Mug', N'L1_9', N'L2_8', N'L3_7', N'<p>&nbsp;</p>

<p>First there were party drinks, then there were body lights / blinkes, now we bring you our ez led light-up flashing beer mug, the ultimate light-up party and bar favor! Imagine holding a luminous beer mug in your hand, where the whole mug, and the beverage inside, spin with many colorful lights! this light-up beer mug is made of a high quality, safe, clear acrylic, with replaceable batteries The bottom cap which houses the electronics pops off for safe and easy cleaning of the mug. A great gift idea! these super-cool led beverage cups make great gifts for any occasion or party goer, and are great for that hard-to-shop-for party person Bottoms up - buy yours today! Capacity-250ml</p>
', CAST(200.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000000a95f04d147e499fa7c2042d3eb1e988.jpeg', N'img1_637487712000000000ec78eee885b14346901044f6ae4c52c9.jpeg', N'img2_637487712000000000ae070f457540437aa3d9e78a4dbad677.jpeg', N'img3_637487712000000000df2670c3c61d4326a85be5dc06d0f35e.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 14:36:16.133' AS DateTime), N'Admin', 0, NULL, 360, NULL, N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (92, N'MDYOSPR0000137', N'Admin', N'Fresho Signature Just Berries Dehydrated Candied Fruits', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:189px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Fresho! Dehydrated candied fruits are ripened fruit slices that have been dried, leaving behind a dense punch of fruit that is rich in energy. Our range of candied fruits are rich in natural flavour and colour, making it a healthy snack to munch on. They are also a delightful addition to cakes &amp; cookies and can be used as a garnish for desserts. It is 100% natural and has no added preservatives.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(125.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 0, N'mainImg_63748771200000000022f5f856b1e346b69c49f5a8d572e8c0.jpg', N'img1_637487712000000000b428a4ef0be947f6925d21801de10667.jpg', N'img2_6374877120000000009cf3ef7f20b74f5393b16fa3f38f78fe.jpg', N'img3_6374877120000000002b35bf6cc26947b99031d694669976a5.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:39:38.750' AS DateTime), N'Admin', 0, NULL, 124, CAST(26 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (93, N'MDYOSPR0000138', N'Admin', N'Fresho Signature Just Berries Dehydrated Candied Fruits', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:189px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Fresho! Dehydrated candied fruits are ripened fruit slices that have been dried, leaving behind a dense punch of fruit that is rich in energy. Our range of candied fruits are rich in natural flavour and colour, making it a healthy snack to munch on. They are also a delightful addition to cakes &amp; cookies and can be used as a garnish for desserts. It is 100% natural and has no added preservatives.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(125.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000a4d969952df748f1b1ffb3bafaa76df4.jpg', N'img1_6374877120000000002aa74dd038904233b5ec44e3c4beca85.jpg', N'img2_637487712000000000536f6f41e40c498ea29595dae57857cc.jpg', N'img3_637487712000000000911f46b609c144ffa0decac5ee01025d.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 14:39:38.883' AS DateTime), N'Admin', 0, NULL, 124, CAST(26 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (95, N'MDYOSPR0000140', N'Admin', N'Printed Designer Coffee Cup', N'L1_9', N'L2_8', N'L3_7', N'<p>Valentine is super special. So Buy this unique Valentine gifts for Boyfriend. Made this high-quality ceramic mug Husband, and now it&#39;s your turn to make him feel special by gifting online this amazing high-quality ceramic mug gift A perfect mug for Boyfriend. Send mugs gifts to India online and celebrate this festival with complete enthusiasm. Valentine Gift for Boyfriend Husband, Birthday Gift for Husband, Birthday Gifts Item.</p>
', CAST(499.00 AS Decimal(18, 2)), CAST(219.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000047a3c5708ce44b128c73f15166a7c9f7.jpeg', N'img1_637487712000000000ce83c1889ba64b738c93cf2dc7363cab.jpeg', N'img2_6374877120000000000403ff66b0214d40bb62b12075e3258d.jpeg', N'img3_637487712000000000209f0823c52b454da7f80c65402e72a1.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:01:37.993' AS DateTime), N'Admin', 0, NULL, 1093, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (96, N'MDYOSPR0000141', N'Admin', N'Aashirvaad Atta - Whole Wheat', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:42px; vertical-align:bottom; white-space:nowrap; width:244px">Aashirvaad whole wheat atta is made of zero per cent maida and 100% atta, which makes it extremely nutritious since its packed with health benefits. This also means more fluffy and soft rotis at home. Aashirvaad Atta is also made from the best grains - heavy on the palm, golden amber in colour and hard in bite. It is grounded using the chakki - grinding process for the perfect balance of colour, taste and nutrition.</td>
		</tr>
	</tbody>
</table>
', CAST(490.00 AS Decimal(18, 2)), CAST(406.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000d682489118744208ac301bddb946d461.jpg', N'img1_6374877120000000001a583cbc4cfc47c8be61cc4c38bfbcc1.jpg', N'img2_637487712000000000f4a3a487342e4b81b77cc1499c113a7d.jpg', N'img3_63748771200000000012a01fb31ab64285a44e8719af12df51.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:03:15.410' AS DateTime), N'Admin', 0, NULL, 1989, CAST(84 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (97, N'MDYOSPR0000142', N'Admin', N'bb Royal Maida', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:138px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Maida is a wonderful mix of soft and rigid wheat. It is considered as bleached flour that contains less protein compare to unbleached. Bleached flour includes less protein than unbleached, and is finest for pie crusts, rapid bread, cookies, pancakes and waffles. It is chemical-free.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(120.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000fcd1bbd3664a479e83c645c93442d6e5.jpg', N'img1_637487712000000000d558d2df18994ba490cd062bece0e154.jpg', N'img2_637487712000000000e3b021f668b446a19dd856ebb9917aa3.jpg', N'img3_6374877120000000006c2248fad7cb4de69abf9649cedd0c84.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:07:40.290' AS DateTime), N'Admin', 0, NULL, 67, CAST(64 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (98, N'MDYOSPR0000143', N'Admin', N'China Coffee Mug ', N'L1_9', N'L2_8', N'L3_7', N'<p>Enjoy your finest teas or coffees with our fine bone china mug decorated with real 24k gold line. The secret lies in the simplicity of design, the delicate gold band against pure white china is pure timeless elegance.</p>
', CAST(755.00 AS Decimal(18, 2)), CAST(589.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000004a0c22efc8904dc2892767316e908e4d.jpeg', N'img1_63748771200000000046b23c7528934b50b5cd60e33ea9f508.jpeg', N'img2_637487712000000000f99bc3e492f5442ab380977af8e01c4e.jpeg', N'img3_637487712000000000c0b6ac15433a4e1db6aa161adb5a8ecd.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:08:15.030' AS DateTime), N'Admin', 0, NULL, 4447, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (115, N'MDYOSPR0000160', N'Admin', N'Copper Hammered Design Bottle', N'L1_9', N'L2_8', N'L3_7', N'<p>General</p>

<table>
	<tbody>
		<tr>
			<td>Type</td>
			<td>
			<ul>
				<li>Bottle</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Body Material</td>
			<td>
			<ul>
				<li>Copper</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Handle with Care</td>
			<td>
			<ul>
				<li>Yes</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Model Name</td>
			<td>
			<ul>
				<li>Copper Hammered Design Bottle, 6 Set</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', CAST(6999.00 AS Decimal(18, 2)), CAST(2639.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000385d10fbd58f4703a66523a4a8344a09.jpeg', N'img1_637487712000000000d9f1d86d12c4485eb5b89fb1cdec1dcb.jpeg', N'img2_6374877120000000007add43243ee84128918a8432ac3fbcdf.jpeg', N'img3_637487712000000000531052293b1a437086acaa5ebc73e074.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:41:10.410' AS DateTime), N'Admin', 0, NULL, 184704, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (116, N'MDYOSPR0000161', N'Admin', N'Water Jug', N'L1_9', N'L2_8', N'L3_7', N'<p>M&amp;V CRAFT PURE Copper Silver Touch Jug Volume 2 Liter, BEST FOR HEALTH. PRODUCT DETAILS;- BRAND- M&amp;V CRAFT PURE, SIZE-2 LTR,MATERIEL- PURE COPPER, COLOUR-BROWN</p>
', CAST(1210.00 AS Decimal(18, 2)), CAST(610.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000000177a4f150784d8d95eb7d28d426d319.jpeg', N'img1_6374877120000000004df4e1fb35624a40aae371a770e79b40.jpeg', N'img2_63748771200000000005c62b4049f94325994b6b56e043e260.jpeg', N'img3_6374877120000000009ab4abf5ab6e4054839dc131e7a8e8ba.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:44:43.197' AS DateTime), N'Admin', 0, NULL, 7381, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (99, N'MDYOSPR0000144', N'Admin', N' Ceramic Coffee Mug  ', N'L1_9', N'L2_8', N'L3_7', N'<table>
	<tbody>
		<tr>
			<td>Opacity</td>
			<td>
			<ul>
				<li>Opaque</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Occasion</td>
			<td>
			<ul>
				<li>Wedding &amp; Engagement, Anniversary, Congratulations</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Ideal For</td>
			<td>
			<ul>
				<li>Brother, In-law, Friend, Uncle &amp; Aunt, Mother, Husband</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>With Handle</td>
			<td>
			<ul>
				<li>Yes</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Finish</td>
			<td>
			<ul>
				<li>Glossy</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Handle Material</td>
			<td>
			<ul>
				<li>Ceramic</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Weight</td>
			<td>
			<ul>
				<li>250 g</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', CAST(699.00 AS Decimal(18, 2)), CAST(251.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000006c4cef51b6a449d9b3d370c38ba8ed14.jpeg', N'img1_637487712000000000573e4690ae794128aa5f000d86660070.jpeg', N'img2_637487712000000000185052d645f74de59d941d1ac44e2d10.jpeg', N'img3_6374877120000000002228a4a0c0f3427193f81622a48505e6.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:12:39.547' AS DateTime), N'Admin', 0, NULL, 1754, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (100, N'MDYOSPR0000145', N'Admin', N'bb Royal Superior Chakki Wheat Atta - Fortified', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:240px; vertical-align:bottom; white-space:normal; width:244px">Bring home the wholesome goodness of nature with bb Royal Chakki Atta fortified with Vitamin B, Iron and Folic Acid. Made from the Superior grade of wheat grains handpicked by BB experts, directly sourced from the Farmers. These golden amber grains go through multi-quality tests to ensure only clean grains are grinded. We use the Traditional chakki process with modern technology to make the finest flour. Because it helps to preserve the nutrients and gives you the perfect balance of colour, taste and nutrition.</td>
		</tr>
	</tbody>
</table>
', CAST(250.00 AS Decimal(18, 2)), CAST(191.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000366557ed5f654e32b8f6baf718705307.jpg', N'img1_6374877120000000009f09fe6f49484fd7bda28526a1e1ad01.jpg', N'img2_637487712000000000e9849aeafea7424e9f2caf247a51e5ce.jpg', N'img3_6374877120000000005d32fab719bb49faa522bf7a731043e8.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:30:33.513' AS DateTime), N'Admin', 0, NULL, 478, CAST(59 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (101, N'MDYOSPR0000146', N'Admin', N'bb Royal Chiroti Sooji 1 kg + Ordinary Sooji 1 kg + Bansi Sooji 1 kg', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:102px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/232/flours-sooji/</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(195.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000e73cfce541f14a09a9e236ac9c24da05.jpg', N'img1_637487712000000000ecaae955c1e945d5920b1c1674706f96.jpg', N'img2_637487712000000000d986632191624b51a19b3211176b86f6.jpg', N'img3_63748771200000000050ceb58c26db40b49b4ac82f7f833e3b.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:34:03.567' AS DateTime), N'Admin', 0, NULL, 195, CAST(5 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (117, N'MDYOSPR0000162', N'Admin', N'SHCOPGLPLNSX4 Glass Set ', N'L1_9', N'L2_8', N'L3_7', N'<p>06 Months | There is a 06 Months warranty on the Product from Style Homez. If the product is damaged or has a Manufacturing Defect, the Product will be reverse picked up from the Customer&#39;s Location and the replacement will be done after a QC of the RPU product. Time taken will be approx. 7 - 10 days. There is no Warranty on the Copper Metal as this Degrades and Looses Color with the Use.</p>
', CAST(1999.00 AS Decimal(18, 2)), CAST(989.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000000f33a73441a448808d96cbfb495e3c9a.jpeg', N'img1_6374877120000000007943f294276f452e94b8157a0fece267.jpeg', N'img2_63748771200000000091342f6ac3b0413cba8c47fe1ed2c199.jpeg', N'img3_6374877120000000000d9b65b02b134adbb9a76bed797cc7db.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:49:54.703' AS DateTime), N'Admin', 0, NULL, 19770, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (102, N'MDYOSPR0000147', N'Admin', N'bb Popular Besan Flour', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:138px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Gram flour or besan is a pulse flour made from ground yellow gram lentil. It is a staple ingredient in the cuisine of the Indian. Besan or gram flour contains healthy unsaturated fats &amp; are a good source of fiber. Ideal for mixing with flour for rotis &amp; parathas or indulging your sweet tooth.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(130.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000ef17023df9e74902aeb38fb7ad82235a.jpg', N'img1_637487712000000000c084dc6359b74457b82559fda74613cb.jpg', N'img2_63748771200000000011b6cd05b263470583c81e6bd3a69ef8.jpg', N'img3_63748771200000000029b95952815a41b0986912abf899df34.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:40:10.820' AS DateTime), N'Admin', 0, NULL, 94, CAST(58 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (103, N'MDYOSPR0000148', N'Admin', N'Tata Sampann Fine Besan - 100% Chana Dal', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:62px; vertical-align:bottom; white-space:nowrap; width:244px">Every Grain Is 100-Per Cent Laser-Sorted And Graded To Ensure That Consumers Get No Impurities, Damaged Or Weevilled Grains. Indulge in the true flavours of nature with the all-natural Tata I Shakti dal. The range of Tata pulses come with a promise of superior quality and genuine flavours. Tata I Shakti pulses are cultivated in Indian farms and are grown in completely natural conditions to bring to you the purest form of health and nutrition. The Tata channa dal is free from any added chemicals, colour or any other foreign element. The unpolished I Shakti dal is not exposed to the harmful marble powder, oil polish or animal skin touch that are the base polishing elements found in polished pulses. Tata Shakti dal is power packed with nutritional essentials like protein, dietary fibre and carbohydrates. Buy Tata channa dal and take a step ahead towards a healthier lifestyle.</td>
		</tr>
	</tbody>
</table>
', CAST(125.00 AS Decimal(18, 2)), CAST(95.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000e805d35458084104930b059ff45d3612.jpeg', N'img1_63748771200000000024bdf7cee6a74bb2911ab99d52cc96c4.jpeg', N'img2_6374877120000000006a1267643e254315a5b76f36db3b5899.jpeg', N'img3_63748771200000000048550a6217b745a185e2458dbda39813.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:50:20.730' AS DateTime), N'Admin', 0, NULL, 119, CAST(30 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (107, N'MDYOSPR0000152', N'Admin', N'Double Horse Rava - Roasted', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:22px; vertical-align:bottom; white-space:nowrap; width:244px">&nbsp;Only customers who purchase this product from bigbasket can rate and review</td>
		</tr>
	</tbody>
</table>
', CAST(65.00 AS Decimal(18, 2)), CAST(64.35 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000170bae6a6f2b40bb80321b832251706f.jpg', N'img1_637487712000000000d0cae9dd704e49319e41734234516653.jpg', N'img2_637487712000000000842c34ffca8b472282f067ef1a39c5df.jpg', N'img3_637487712000000000b92c318c64214c21ba7fd8757d0ae274.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:59:19.120' AS DateTime), N'Admin', 0, NULL, 42, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (109, N'MDYOSPR0000154', N'Admin', N'Elite Broken Wheat - Fine', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:87px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Adding cracked wheat, as well as other whole grains, to your diet in place of low-nutrient fare could provide some protection from serious health conditions.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(34.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000005e87a52ed2484561aaf40045f996c992.jpg', N'img1_637487712000000000817a8089d294493c90f76d2964656325.jpg', N'img2_63748771200000000027a7c75fda694a7683852bf30218bedc.jpg', N'img3_63748771200000000080d5184c969847d387be8f8149e3eb29.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 16:04:22.647' AS DateTime), N'Admin', 0, NULL, 10, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (104, N'MDYOSPR0000149', N'Admin', N'Copper Water Bottle ', N'L1_9', N'L2_8', N'L3_7', N'<p>Dr. Copper Pure Copper Water Bottle with New Stylish and Advanced Leak Proof Cap - 500 ml Bottle ,Copper Water Bottle 500ml , best use for Kids for school and Adults for Yoga and Ayurvedic Treatment: Copper has the significance of being able to kill bacteria which in turn protects you against various health risks associated with bacteria. Water is vital of all the different food items you consume and has to be taken with care. Hence, if you decide to store water in a bottle and consume it from the same container, it will improve your body&rsquo;s immune system. This is because the copper ion present in the bottle will actually dissolve in the water which is stored in it, and will help your body gain all the goodness it contains. Benefits include a better functioning metabolism too which is very important. If you opt for this perfect Dr. Copper stylish water bottle with advanced leak-proof cap- 500 ml Bottle, you will be able to enjoy all the ayurvedic health benefits associated with it, on a regular basis. This copper bottle contains particles which act as a natural purification system which has the ability to kill various harmful particles present in the water. The particles include microorganisms, molds, fungi, algae and bacteria. These substances are absolutely harmful to a human being. Hence, the bottle fights all the germs and provides you with the water your body requires. Copper is such a mineral which is vital for our health, and so if you store the water in the bottle overnight, or for a period of more than 4 hours and then consume it, you will gain a lot of good qualities from the mineral. Keeping the health prospect in mind, we have manufactured &quot;Dr. Copper water bottle&quot; with a new stylish and advanced leak-proof cap which is made up of pure copper.</p>
', CAST(699.00 AS Decimal(18, 2)), CAST(599.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000efc526c1039c4bc28253ea55753d8925.jpeg', N'img1_6374877120000000000366e413765e4d6e837c08856a93e0d6.jpeg', N'img2_637487712000000000c8b0f841d1854b64b340df518c895bd8.jpeg', N'img3_637487712000000000dd721618a34745b4aa786fb11603556b.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:53:22.083' AS DateTime), N'Admin', 0, NULL, 4187, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (119, N'MDYOSPR0000164', N'Admin', N'Traditional Design Pooja', N'L1_9', N'L2_8', N'L3_7', N'<table>
	<tbody>
		<tr>
			<td>Model Name</td>
			<td>
			<ul>
				<li>Products Traditional Design Pooja Thali Copper Thali Bhog Thali Arti Thali Rakhi Thali Pooja Plate Size - 7.5 inch Approx Copper (1 Pieces, Brown)</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Model Number</td>
			<td>
			<ul>
				<li>LPO</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Sales Package</td>
			<td>
			<ul>
				<li>1 pooja thali set</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', CAST(599.00 AS Decimal(18, 2)), CAST(222.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000380cb54e1ba746029ed06b7c21b74594.jpeg', N'img1_637487712000000000142a58e352a24dcc8bc1ac746b473ca2.jpeg', N'img2_6374877120000000003bed11acde274eaa922aef5a23b8e91b.jpeg', N'img3_63748771200000000011d164d5fc9c45069117daf3af35c23e.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:55:30.557' AS DateTime), N'Admin', 0, NULL, 1330, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (121, N'MDYOSPR0000166', N'Admin', N'Metal Tie Pin', N'L1_9', N'L2_8', N'L3_7', N'<p>What you get : (1) one tie bar as shown in the pictures. (2) hard case Branded finish storage box . (3) Luck Stone Brand trust Quality: additional Gold plating for durability Made of specially formulated brass Made using top grade enamel and natural stones You can have anything you want if your are dressed for it -edith head. We at Luck Stone by this mantra and hence, Luck Stone is committed to manufacture only quality products Size: xmm. Suitable for standard neck ties where the maximum width of neck tie 3 inch. set of 2 pcs</p>
', CAST(999.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000007afe67772e94832bc4c708998af6b8e.jpeg', N'img1_637487712000000000b3d1529444d34fe8bc80c659bca66476.jpeg', N'img2_6374877120000000006053776fba9e494f96fc8c93d5bb7e38.jpeg', N'img3_637487712000000000632f7b1b662a48ab90458963b9d91583.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 17:12:01.563' AS DateTime), N'Admin', 0, NULL, 4985, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (105, N'MDYOSPR0000150', N'Admin', N'bb Royal Organic - Sooji/Rawa', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:206px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Sooji Ravva is a staple in the Indian diet. It&rsquo;s nutritious and can be easily digested. It has a rich flavour and aroma and provides essential amino acids for complete protein. It comes to use as the key ingredient in different dishes as it is used in a variety of soups, salads, sweets and savouries, Sooji Ravva is essential in every household. It is rich in fibre and very wholesome. It makes a very healthful and is very strong and good for people who are on diet.</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(88.00 AS Decimal(18, 2)), CAST(74.00 AS Decimal(18, 2)), 0, N'mainImg_637487712000000000d592514568cc4f0299af3e29b53781ca.jpg', N'img1_637487712000000000c024fe333d4c45708d8c872d92ebd898.jpg', N'img2_637487712000000000745d4633453442858bf87b02280c01ad.jpg', N'img3_637487712000000000c8e1bf7b34ed4566b2fa8071b8e2ea43.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 15:54:04.410' AS DateTime), N'Admin', 0, NULL, 65, CAST(14 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (108, N'MDYOSPR0000153', N'Admin', N'copper bottle laquer set', N'L1_9', N'L2_8', N'L3_7', N'<p>Highlights Copper is an essential trace mineral that is vital to human health Our ancestors used to store water in containers made of copper Copper from the container leached into the water &amp; helped in purification Water is the most essential element to sustain life on this planet. 70 per cent of human body is made up of water. You may have not known this but in ancient times, our ancestors and even our grandmothers followed the practice of storing water in containers made of copper. Their aim was probably to safeguard drinking water but there&#39;s more to the story. In today&#39;s modern world where we have UV filters and RO purifiers to purify water, the storage of water in metal containers may sound old-fashioned and not needed. However, this age-old practice referenced in ancient texts of Ayurveda is now supported by several. Keeps Skin Healthy and Good for Travelling Purpose :- Copper is the key component in the production of new cells that help replenish the top layers of your skin and keep it fresh and glowing. Copper is considered an essential mineral for our body. Ayurveda recommends storing water overnight in a copper jug and drinking it first thing in the morning for maintaining good health. Experts say that drinking from a copper water bottle on a regular basis, especially early in the morning, can make a very significant difference to the health of your skin.</p>
', CAST(1900.00 AS Decimal(18, 2)), CAST(799.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000005019bd8e5d9b4e5b97abc12dedf867de.jpeg', N'img1_63748771200000000061ae9030b2534e2585a0c1d49cfc4346.jpeg', N'img2_6374877120000000007c45cdd53e124ab398b5d085cbea80c1.jpeg', N'img3_63748771200000000063614ce1bdae42efbc2bb27dd694f906.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:02:25.077' AS DateTime), N'Admin', 0, NULL, 15181, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (127, N'MDYOSPR0000172', N'Admin', N'Surf Excel Detergent Powder - Matic, Front Load', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:39px; vertical-align:bottom; white-space:nowrap; width:209px">Presenting, Surf Excel Matic front-load the machine specialist laundry detergent from the Surf excel Matic family that gives you 100 percentage Tough Stain Removal in machines. Surf exc</td>
		</tr>
	</tbody>
</table>
', CAST(1000.00 AS Decimal(18, 2)), CAST(924.00 AS Decimal(18, 2)), 10, N'mainImg_63748857600000000056244c55b61d4e0e9b7a23e974ab9c65.jpg', N'img1_637488576000000000a1d7a1f47f3d4e209729cdf6885ca803.jpg', N'img2_6374885760000000000b50a3c516d64c6fa56c1dd05614935f.jpg', N'img3_63748857600000000079798b68361b487c8845af13f8af7c61.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:21:16.450' AS DateTime), N'Admin', 0, NULL, 9240, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (106, N'MDYOSPR0000151', N'Admin', N'Bedrooms Bottle', N'L1_9', N'L2_8', N'L3_7', N'<p>&quot;Product Material :- Copper/ Brass Product Size :- (Height X Width) 7X5 &quot;&quot;Inch (Inbuilt Lid Tumbler Size 3.5 Inch) Product Volume :- 1100 ML Product Weight :- 450 Grams Product Design :- Hammered Product Quantity :- 1 Piece Product Color :- Brown Copper Hammered Finish Bedroom Jug With Inbuilt Glass, Modern Design HEALTH BENEFITS : Copper items has properties that help kill harmful bacteria and reduces inflammation within the stomach, making it a great remedy for ulcers, indigestion and infection. Must haves for leading a healthy lifestyle. Keep water overnight in the copper pot and it will imbibe all the medicinal and Ayurveda benefits to the water. Drink it empty stomach every morning and see the benefit.&quot;&quot; REDUCES WEIGHT, JOINT PAIN &amp; IMPROVES DIGESTION :- Water stored overnight in Copper Bottle helps in reducing weight, prevents obesity, reduces joint pain, maintains good digestion &amp; make your life healthy UNIQUE GIFT ITEM :- These cool, hand crafted Copper drinking bottle make excellent gifts for both Men and Women; great for weddings, anniversary gifts for Mom and Dad or Husband/Wife, or simply as a fun novelty addition to your current Home Decor collection. Many Customers Love the Vintage/Antique Tarnished Look, but Care Instructions for Minimizing and Removing Tarnish are Provided with Order. Instructions: Copper utensils needs to be cleaned at regular interval for removing the dark marks. Dark marks are formed due to oxidization process. It is the basic nature of a Pure Copper that it oxidizes when it comes in the contact of air and water. CARE TIPS:- 1- Clean your copper ware by hand and avoid dishwasher as the detergent can cause oxidation leading to permanent damage. 2- Use a solution of equal quantities vinegar or lemon juice and salt diluted with some water at such times but don&#39;t use it regularly. Avoid scratchy cleaners like steel wool. 3- A simple, soft cleaning liquid on soap base, hot water and a soft washing cloth is best for daily use. 4- Use Copper Shining Powder for cleaning the copper utensils. Completely safe and gentle on hands. 5- Copper Utensils Tarnish from time to time. This is Normal for an Authentic Copper utensils. &quot;</p>
', CAST(1899.00 AS Decimal(18, 2)), CAST(1109.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000027cb2146b4874cb28fbf1150f3978ae8.jpeg', N'img1_637487712000000000cccc6ed5699343118555e7be41b0dbea.jpeg', N'img2_637487712000000000d6b7172c152241c380238c2db8a58aa4.jpeg', N'img3_637487712000000000cea171539d0e456692209c461b1f9478.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 15:58:43.200' AS DateTime), N'Admin', 0, NULL, 21060, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (132, N'MDYOSPR0000177', N'Admin', N'bb Popular Almond/Badam - Californian, Giri', N'L1_1', N'L2_1', N'L3_1', N'<p>Almonds are light brown skinned, tough, edible seeds of the almond fruit. They have a wealthy yet subtle bitter-sweet flavor. These are assets of nutrients, especially protein, dietary fibre, mono-unsaturated fatty acids and B complex vitamins. Also, it is wealthy in vitamin E and minerals such as potassium, calcium, manganese, zinc, iron and selenium.</p>
', CAST(600.00 AS Decimal(18, 2)), CAST(298.00 AS Decimal(18, 2)), 10, N'mainImg_6374885760000000005f640d1ca4ad41b380dd10f0c9ff90dc.jpg', N'img1_6374885760000000009e72926f65634d8abaf7210add81c5b8.jpg', N'img2_6374885760000000004fe740d044a34579acbc1f63ddfb91ad.jpg', N'img3_6374885760000000002d9a7b62bde64308a22d73703b33e4d7.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:54:23.970' AS DateTime), N'Admin', 0, NULL, 1788, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (138, N'MDYOSPR0000183', N'Admin', N'Daawat Basmati Rice - Super', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:27px; vertical-align:bottom; white-space:nowrap; width:209px">Versatile, fine, long-grained and perfectly textured. &sbquo;&nbsp;Basmati rice fit for a King. Daawat Super is aged to perfection.</td>
		</tr>
	</tbody>
</table>
', CAST(845.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), 10, N'mainImg_63748857600000000085589baa57d74cf6a0c0f43d890c7633.jpg', N'img1_63748857600000000001ec4a491fa34d3289e747863290368e.jpg', N'img2_637488576000000000a8b8af63c5a0441f97919aa49bf4fe01.jpg', N'img3_6374885760000000003918213f07064378a8ad6754595d4724.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:40:06.010' AS DateTime), N'Admin', 0, NULL, 6338, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (110, N'MDYOSPR0000155', N'Admin', N'bb Combo Saffola Active-Pro Weight Watchers Edible Oil 3x1L + Tata Sampann Besan 1kg', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:268px; vertical-align:bottom; white-space:normal; width:244px">Reducing the quantity of oil in food to maintain your weight may be an obvious choice, just like the 64% Indians who do the same. But guess what, it&rsquo;s not the only choice! Because it&rsquo;s not only about less oil but also about the right oil. Choose the right oil when you push to manage your weight. Saffola Active blended cooking oil absorbs up to 25% lesser fat as compared to other single seed oils, hence making it the healthy choice of Weight Watchers.</td>
		</tr>
	</tbody>
</table>
', CAST(574.96 AS Decimal(18, 2)), CAST(570.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000c5bcd52b13d344a3bf6456bfc9a42740.jpg', N'img1_637487712000000000b3289840220d4c3a85e2d16cb532560b.jpg', N'img2_63748771200000000047ef41c2f2e04ea8a5263230465caca8.jpg', N'img3_63748771200000000039b2a67b13eb4589a2831d715fc30451.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 16:07:38.327' AS DateTime), N'Admin', 0, NULL, 3277, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
GO
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (111, N'MDYOSPR0000156', N'Admin', N'MUGHLAI  Bottle', N'L1_9', N'L2_8', N'L3_7', N'<p>QUBIC INC This Bottle is Made of Pure Copper Metal Your Search for the Perfect GIFT is Finally Over! BENEFITS: &bull; Connoisseur&#39;s choice for alternative to conventional ice - Do not melt ice and water down your drinks! &bull; Impress your friends and family - Enjoy the amazement of your guests when you serve up their favorite drinks with your whiskey/ wiskey chillin stone! &bull; Our extraordinary box provides an awesome DECORATION in every home. &bull; And these drinking rocks are a lot cheaper than buying ice every time ! &bull; A fantastic &quot;ice breaker&quot; during parties and gatherings. These whiskey stones are cool in every way! FEATURES: ✓ Cool Your Drink Perfectly - No watering down ✓ FDA Approved &amp; BPA Free ✓ Rounded Edges Won&#39;t Scratch Glasses ✓ Easy to Clean - Rinse with Water when done For most pleasurable experience: 1. Make sure ice cubes are well rinsed. 2. Dry the stone, and keep them in the freezer for at least 2-3 hours. 3. Place cold ice cube in a glass, pour the beverage of your choice and enjoy your perfectly cooled drink. 4. After use, rinse and dry the drinking stones and store in the freezer. Chill Rocks are not meant to cool a drink as quickly or as much as ice. They are intended to provide a slight chill-between 8 and 15 degrees - that will protect the taste without drowning the quality. Never ingest or chew on the ice stones ! Keep out of reach of children as they may be a choking hazard. Material: 100% Pure Large Soapstone Gift set Includes: (9) Premium Whiskey Cubes/ Sipping Stones/ Chilling stones (1) Black Velvet Pouch</p>
', CAST(1299.00 AS Decimal(18, 2)), CAST(1049.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000542734f103724561b5e65a52c30475b1.jpeg', N'img1_63748771200000000055a4905abc144f068ce68a4cec365710.jpeg', N'img2_637487712000000000fc957920600843f6a174768abc1b095b.jpeg', N'img3_637487712000000000544514b3bb6b4d2e8a2d4c1558967d6d.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:08:59.950' AS DateTime), N'Admin', 0, NULL, 13627, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (140, N'MDYOSPR0000185', N'Admin', N'bb Royal Organic - Kismis', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:49px; vertical-align:bottom; white-space:normal; width:209px">Raisins or kismis are a wholesome addition to your diet. The organic kismis are a preserved and dried version of grapes. They are known to be extremely healthy for consumption on a daily basis. These dry fruits can give relief from constipation, anemia, acidosis and fever.</td>
		</tr>
	</tbody>
</table>
', CAST(690.00 AS Decimal(18, 2)), CAST(475.00 AS Decimal(18, 2)), 10, N'mainImg_6374885760000000005b40df9cf12b4e20ba95f6dbf47cd92c.jpg', N'img1_6374885760000000004cfd5ce9aab34ae99af9b9ccc28f42c9.jpg', N'img2_637488576000000000ca830f000448407095e5deed306dd554.jpg', N'img3_637488576000000000808092db26544e8da019900aded353c1.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:59:26.700' AS DateTime), N'Admin', 0, NULL, 3278, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (112, N'MDYOSPR0000157', N'Admin', N'Water bottle set', N'L1_9', N'L2_8', N'L3_7', N'<p>About bottle : 1000 ml | 100% pure copper | Seamless | Sealed cap design Copper Products Tarnish/oxidize Over time, this Is Natural for Copper products. Please follow the Care Instruction manual for cleaning Copper products. Sample Copper cleaning powder and Instruction manual Is provided with every order Copper Products Tarnish/oxidize Over time, this Is Natural for Copper products. Please follow the Care Instruction manual for cleaning Copper products. Sample Copper cleaning powder and Instruction manual Is provided with every order Fights with cancer, cholesterol and its a great brain stimulant- copper helps in formation of myelin sheaths, making your brain work much faster and more efficiently. It fights with cancer if used regularly. Plus its continuous use helps in reducing bad cholesterol and increase good cholesterol Makes you look younger and have healthy skin- the copper bottle water is anti-aging. It helps reduce fine lines, wrinkles, and patchy skin. Drinking water from copper pot can thus help you look younger and fitter</p>
', CAST(1499.00 AS Decimal(18, 2)), CAST(1139.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000d9484726d9b8463ba9268e1ab033b20c.jpeg', N'img1_637487712000000000cd059b04a5cf474c864c97f060dba34f.jpeg', N'img2_63748771200000000063019281f1844a34b2ae44ff18a8512f.jpeg', N'img3_6374877120000000006bb8b9b7074f4d1cbfb03585300f0c0f.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:19:42.380' AS DateTime), N'Admin', 0, NULL, 17074, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (113, N'MDYOSPR0000158', N'Admin', N'Mathura Flour - Adai', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:244px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:70px; vertical-align:bottom; white-space:normal; width:244px">
			<p>Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/232/flours-sooji/</p>
			</td>
		</tr>
	</tbody>
</table>
', CAST(80.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000008f62d8eecb1f4db69a20a0148825f1ad.jpg', N'img1_6374877120000000006ca1b46201f34ef1acc337aec2f9adbe.jpg', N'img2_6374877120000000000684b35026944134804637a31c7abfa2.jpg', N'img3_637487712000000000b704bc9dc64f4c15bcde9a9894bbb8cf.jpg', N'img4_637487712000000000.jpg', N'published', 1, CAST(N'2021-02-13 16:28:39.250' AS DateTime), N'Admin', 0, NULL, 56, CAST(10 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (114, N'MDYOSPR0000159', N'Admin', N'Copper Water Bottle Set', N'L1_9', N'L2_8', N'L3_7', N'<p>According to Ayurveda water stored in a copper vessel has the ability to balance all the three doshas in your body, (vata, kapha and pitta) and it does so by positively charging the water.Here are the health benefits:Can kill bacteria;Stimulates your brain;Beats arthritis and inflamed joints;Helps the digestive system perform better;Beats anaemia;Helps heal wounds faster.Washing:Do not use a coarse scrub to wash the inside of the vessel as it will tend to scrape away copper from the vessel.Instead, use one half of a lemon (you can squeeze out the juice) and rub it on the inside of the vessel. Allow it to stand for a few minutes and then wash off with plain water. Alternatively you could also try using baking soda with water. Use this mixture to coat the inside of the vessel and allow it to stand for a few minutes and then rinse away the excess baking soda.</p>
', CAST(1599.00 AS Decimal(18, 2)), CAST(1249.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000066a2c65edcc54f3383494c6543bc0504.jpeg', N'img1_6374877120000000003be2f70cbbec487490f5a82568d8f51d.jpeg', N'img2_6374877120000000008242d3f7cb9e4303af1698b6e577bb75.jpeg', N'img3_63748771200000000062126ed0dd23407890e96a27fe4b6954.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:28:50.817' AS DateTime), N'Admin', 0, NULL, 19972, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (142, N'MDYOSPR0000187', N'Admin', N'dsfgh', N'L1_1', N'L2_1', N'L3_1', N'<p>fsadfhgf</p>
', CAST(500.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, N'mainImg_637490304000000000beb14bdec6d849899d2e62e0dfa1a9eb.jpg', N'img1_637490304000000000c5ec40b2fc38401bbe33340ebf773051.jpg', N'img2_637490304000000000dae94bbf7d22495b99a73fba28c8902c.jpg', N'img3_63749030400000000040677e5d9da048c0b72e81bf047938dc.jpg', N'img4_637490304000000000.jpg', N'published', 1, CAST(N'2021-02-16 12:29:02.490' AS DateTime), N'Admin', 0, NULL, 2, CAST(20 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (118, N'MDYOSPR0000163', N'Admin', N'Water Jug', N'L1_9', N'L2_8', N'L3_7', N'<p>&nbsp;</p>

<p>Prisha India High Quality Hammered Pure Mughlai Jug From India You Will Not Only Get A Indian Artistic Touch In Prisha India Collection But Also A International Artistic Touch. This Artistic Semi Pear Shaped Brass Pitcher Is A Amalgamation Of Indian And Persian Art.Its Not Only Give A Traditional Look But Very Convenient For Using. Its Solid Copper Interior , Convenient Twist Exterior And Cap Type Pouring Outlet Is Gives A Unique Look To The Jug. Solid Handle And A Strong Base Are Beautifully Joined To The Body Of This Jug And Solid Handles Makes Pouring Easier . The Golden Polished Handle, Golden Polished Base And Golden Polished Pouring Outlet With Zinc Coloured Body Is A Perfect Colour Combination And Giving A Royal Look To The Pitcher . It Is A Unique Product For Using As Water Storage. The Repatriation Of These Artefacts Assures Us That Afghanistan Will Once Again Thrive As A Cultural And Artistic Hub.</p>
', CAST(1750.00 AS Decimal(18, 2)), CAST(1700.00 AS Decimal(18, 2)), 10, N'mainImg_637487712000000000b26d28050a9f4dc4b14e6026f978822f.jpeg', N'img1_63748771200000000078e47611215645c1b7aa8e4f2a6331a8.jpeg', N'img2_6374877120000000002eea94c35c0d45a1abcf2f1eac21cfb9.jpeg', N'img3_637487712000000000496b7d74d8e54714b0a0c1cfc4d58ff7.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:52:40.737' AS DateTime), N'Admin', 0, NULL, 29750, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (120, N'MDYOSPR0000165', N'Admin', N'Pendants Ceiling Lamp', N'L1_9', N'L2_8', N'L3_7', N'<p>PLUS PRODUCTS is a brand which offers you a vast range of decorative lighting solutions.we have different designs according to different tastes like crystal chandeliers , modern lights and vintage lights. our product range fulfill the requirements of all individuals which includes a small wall light to a huge size chandelier.This Hanging Light With Elegant and beautiful shape room lighting which creates create a romantic atmosphere and give sparkle to brilliant evenings. Country, Rustic, Primitive, Industrial or Shabby Chic Decor. Have a high gloss contemporary look.The Hanging Light adds luxurious touch to your home decor with this classy Shape.Designed with the traditional classic style, this captivating Hanging Light is a great lighting fixture to add a beautiful and natural element to any room.it casts a warm and soothing light.</p>
', CAST(2498.00 AS Decimal(18, 2)), CAST(1520.00 AS Decimal(18, 2)), 10, N'mainImg_63748771200000000068f0f6011c1344e8ac71b18ab4929dd5.jpeg', N'img1_637487712000000000767149d7caee40f4b0768ed5d48d7538.jpeg', N'img2_637487712000000000a24b0372aa254603aaf661e0aacea018.jpeg', N'img3_6374877120000000000fb8635276814dbd8acf67dcfd942ce4.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 16:59:24.670' AS DateTime), N'Admin', 0, NULL, 37970, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (122, N'MDYOSPR0000167', N'Admin', N'Dinner Set', N'L1_9', N'L2_8', N'L3_7', N'<p>Reviving ancient Ayurvedic wisdom through contemporary design, this elegant Kansa /Bronze Thali Set is a perfect blend of aesthetics, healing and convenience. Called Kanh or Kansa this special copper-tin alloy has been termed as Healing Metal by Ayurveda, due to its nutritive and hygiene values. This metal was used to make eating utensils in the olden times. It helps in inflammation and improving hemoglobin &amp; digestion. A Sanskrit saying - Kansyam Buddhivardhakam - Kansa sharpens our intellect pays tribute to its therapeutic powers.This Product Contains 82% Copper &amp; 18% Tin Set Contents : 1 Pc. Thali (11.5 Inch) , 2 Pcs. Katori (3.5 Inch), 1 Pc. Desert Bowl (4 Inch) , 1 Pc. Spoon &amp; 1 Pc. Glass (275 ml) Wt : 1.600Kg. Usage &amp; Cleaning Tips: 1. Keep bronze pieces as clean as possible. 2. Store in an even, low humidity area. 3. The recommended method of cleaning bronze is by using all natural, universal cleaning agents : A solution of 1 tablespoon of salt and 3 1/2 quarts of water, lightly scrub, rinse well &amp; Cleaning with tamarind or lemon.</p>
', CAST(5999.00 AS Decimal(18, 2)), CAST(3539.00 AS Decimal(18, 2)), 10, N'mainImg_6374877120000000002830b8dff62748c0bf3809058977e5cb.jpeg', N'img1_6374877120000000006d6aab0401304a4bbf590dca88f7767e.jpeg', N'img2_6374877120000000000b0c31d5e4a54977957710ff7bac1897.jpeg', N'img3_637487712000000000451b766729044287a6a47d82afd696e3.jpeg', N'img4_637487712000000000.jpeg', N'published', 1, CAST(N'2021-02-13 17:59:21.670' AS DateTime), N'Admin', 0, NULL, 212305, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (123, N'MDYOSPR0000168', N'Admin', N'Sunfeast Farmlite Digestive High Fibre Biscuits', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:86px; vertical-align:bottom; white-space:normal; width:209px">Farmlite Digestive High Fibre is a wholesome snack with the goodness of oats, Jowar, Corn, Wheat and Ragi that takes care of all your dietary requirements with great taste. Helps you stay active all day long. It is made from the high quality Aashirvaad Atta. It has no trans fat and no maida. The digestive biscuits are part of Sunfeast Farmlite range which promises No Maida, No Cholesterol, No Trans Fat and are made from Aashirvaad Atta.</td>
		</tr>
	</tbody>
</table>
', CAST(118.00 AS Decimal(18, 2)), CAST(115.00 AS Decimal(18, 2)), 10, N'mainImg_6374885760000000009a538b6bb7a943939d725ac10d018ddf.jpg', N'img1_6374885760000000005d9fad5d6c3745128b9398b8cb732ffc.jpg', N'img2_63748857600000000004998d347fd143bfb245524e8d9f8b3e.jpg', N'img3_637488576000000000e8dd8bca9e6a405f808edfa146aa0fb1.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:08:42.023' AS DateTime), N'Admin', 0, NULL, 136, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (125, N'MDYOSPR0000170', N'Admin', N'Mcvities Digestive', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:60px; vertical-align:bottom; white-space:normal; width:209px">Treat yourself to a pack of McVities Digestive biscuits. Besides maida, it has the goodness of wholewheat wrapped in great taste.</td>
		</tr>
	</tbody>
</table>
', CAST(50.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 10, N'mainImg_6374885760000000003dab22f33438483cb0f680b9be0f3697.jpg', N'img1_637488576000000000e5cc7505ce16494687a8df80bf50d8a0.jpg', N'img2_6374885760000000004ded4274575e4cf1b8e8a79a25bf7c69.jpg', N'img3_63748857600000000014477daee2014a4bb556edd03b50e583.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:17:05.157' AS DateTime), N'Admin', 0, NULL, 25, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (126, N'MDYOSPR0000171', N'Admin', N'Copper Bottom Kitchen Serving', N'L1_9', N'L2_8', N'L3_7', N'<ul>
	<li>Copper Bottom Kitchen Serving 1200 ML, 1000 ML, 700 ML Bowl With Lids</li>
	<li>Smart design provides even heat distribution while cooking</li>
	<li>Sturdy utensils with capacities of 1.1ltr, ltr, 1.4ltr, 2.1ltr</li>
	<li>Made from strong and durable 100% food-grade stainless steel with copper bottom</li>
	<li>TREKZO Set of Three copper handis for everyday use This cookware Set comes with 3 different sizes With 3 LID and it is ideally used to Serve Food like Curries, Dals, Biryani and other Indian Dining Experience for Dinnerware products.</li>
</ul>
', CAST(1999.00 AS Decimal(18, 2)), CAST(795.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000412a03a4635e44518994429d698a0337.jpg', N'img1_637488576000000000e22d23db72ba4b2992de266f45f8178f.jpg', N'img2_63748857600000000005c1bd5d070e41b3a404128910ab992b.jpg', N'img3_637488576000000000a8c15b3c736a4934890f12e4d0f3fa09.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:18:39.160' AS DateTime), N'Admin', 0, NULL, 15892, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (124, N'MDYOSPR0000169', N'Admin', N'Walkers Walkers Shortbread Round 150Gm', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:69px; vertical-align:bottom; white-space:normal; width:209px">Walker Butter Shortbread is baked in the secluded village of Aberlour, Speyside, in the heart of the Scottish Highlands. The shortbread is produced to a traditional recipe which has been handed down through generations of the Walker family. Walkers personally guarantee that this product is made using only the finest ingredients possible to obtain and contains no artificial colours, flavourings or preservatives.</td>
		</tr>
	</tbody>
</table>
', CAST(349.00 AS Decimal(18, 2)), CAST(349.00 AS Decimal(18, 2)), 10, N'mainImg_6374885760000000007751b87e993f45d0be5c1d7bc3a459b3.jpg', N'img1_637488576000000000f2cdc172458d479897174a688da736cb.jpg', N'img2_6374885760000000005aaa4afb83294382acc72577c435bbc1.jpg', N'img3_637488576000000000e55ccf694c0d4307b6b8299dc6e8d3be.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:13:04.293' AS DateTime), N'Admin', 0, NULL, 1218, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (128, N'MDYOSPR0000173', N'Admin', N'Ariel Complete Detergent Washing Powder', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:41px; vertical-align:bottom; white-space:nowrap; width:209px">New Ariel Complete Detergent Washing Powder gives you tough stain removal in just 1 wash. Designed to work in semi-automatic washing machine, Ariel gives brilliant results in both semi-automatic washing machine as well as in hand wash.</td>
		</tr>
	</tbody>
</table>
', CAST(280.00 AS Decimal(18, 2)), CAST(280.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000e9ffc87cbb5d474db2e659ab1e0edb24.jpg', N'img1_637488576000000000b369727597f94180b4b9e2695a9adf5a.jpg', N'img2_6374885760000000005ec4edfbf2a046aeb7a151175454ba73.jpg', N'img3_63748857600000000058360783b2b644dcb40b0f28867c11b7.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:23:48.847' AS DateTime), N'Admin', 0, NULL, 784, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (129, N'MDYOSPR0000174', N'Admin', N'Copper Serving Handi with Glass Lid', N'L1_9', N'L2_8', N'L3_7', N'<ul>
	<li>Set of 2 Steel Copper Handi with Glass Lid, Color: Copper &amp; Silver, Material: Copper &amp; Stainless Steel, Weight: approx 430 gram, Height -3.2&quot;, Width/Diameter &ndash; 5.8&quot;, Capacity - 500 ML</li>
	<li>FUNCTIONAL &amp; FASHIONABLE - Stainless steel surface preserves the taste and nutritional qualities of foods and is safe for food contact; Copper bottom adds style - Easy to Clean - no re-tinning</li>
	<li>An Essential Indian Dinnerware to present Indian Foods like Curries, Daal, Biryani &amp; Condiments for Authentic Indian Dining Experience</li>
	<li>Cleaning Instrucations:- Clean your copperware by hand and avoid dishwasher. Use pitambri powder to clean copper utensils and wipe with soft cotton cloth.</li>
	<li>Copper products tarnish/oxidize over time, this is natural for copper products. Please follow the care instruction manual for cleaning copper products. Sample copper cleaning powder is provided with every order</li>
</ul>
', CAST(4870.00 AS Decimal(18, 2)), CAST(1355.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000290981d58c194ad98bbb2fcadb9adcbc.jpg', N'img1_637488576000000000b6197f3c44c3465390248db3213fcefb.jpg', N'img2_637488576000000000f5bd155d18df457da237989ca17737ba.jpg', N'img3_6374885760000000003a61db4c630f4bd584139cd2fb02154b.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:24:04.490' AS DateTime), N'Admin', 0, NULL, 65989, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'--Select--', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (130, N'MDYOSPR0000175', N'Admin', N'Dove Cream Beauty Bathing Bar', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:82px; vertical-align:bottom; white-space:normal; width:209px">Dove Cream Beauty Bar combines a gentle cleansing formula with Dove&rsquo;s signature &frac14; moisturising cream to give you softer, smoother and more glowing skin. The mild cleansers help your skin to retain its natural moisture rather than stripping it away. &nbsp;This Dove bar even helps to replenish nutrients that are lost during the cleansing process &ndash; where a regular soap bar might leave your skin feeling dry and tight, a Dove White Bar leaves it feeling soft and smooth. It&rsquo;s not a soap &ndash; it&rsquo;s a beauty bar.&nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(160.00 AS Decimal(18, 2)), CAST(149.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000bedcbc21d5a3409998aa8795d2069b03.jpg', N'img1_637488576000000000a2a156b6c73a49a49a5fde6c0413cf93.jpg', N'img2_637488576000000000193613a0f6294627bf1e1d51a27d5440.jpg', N'img3_63748857600000000012131758b761420b9b57b87cfddf6323.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:27:27.280' AS DateTime), N'Admin', 0, NULL, 238, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (131, N'MDYOSPR0000176', N'Admin', N'Pedigree Dry Dog Food - Chicken & Vegetables, For Adult Dogs', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:120px; vertical-align:bottom; white-space:normal; width:209px">Pedigree is a complete and balanced food for dogs. Prepared with high-quality ingredients, Pedigree is rich in proteins and nutrition. Pedigree pet food provides dogs with the 5 Signs of Good Health - healthy skin and coat, strong bones and teeth, digestive health, strong muscles and strong immune system. It also contains the optimal blend of Omega 6 and Zinc, which are proven to provide a healthier and shinier coat to puppies and adult dogs.</td>
		</tr>
	</tbody>
</table>
', CAST(2650.00 AS Decimal(18, 2)), CAST(2252.50 AS Decimal(18, 2)), 10, N'mainImg_63748857600000000033d9bbfbe4744ae594f5b0c336c53164.jpg', N'img1_637488576000000000bba0c9331aef4afba97fa91688bb648f.jpg', N'img2_6374885760000000001082ffe3cd3b43a89b3e8e65809027df.jpg', N'img3_63748857600000000096b92d4a759546d08b77aa46e52107ef.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 11:38:21.110' AS DateTime), N'Admin', 0, NULL, 59691, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (133, N'MDYOSPR0000178', N'Admin', N'Bournvita Chocolate Health Drink', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:63px; vertical-align:bottom; white-space:normal; width:209px">This Cadbury&Acirc;&nbsp;Bournvita now with inner strength formula packed with nutrients that are known for maintaining strong bones, strong muscles and a healthy brain. Cadbury&Acirc;&nbsp;Bournvita provides the same great tasty&Acirc;&nbsp;and delicious&Acirc;&nbsp;chocolate drink enriched with vitamin D, iodine, iron, protein, and phosphorus. Your kids will enjoy the chocolate flavour, which is loaded with yummy taste and a lot of goodness.</td>
		</tr>
	</tbody>
</table>
', CAST(410.00 AS Decimal(18, 2)), CAST(369.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000407e168efa58411988718a0a3f69575b.jpg', N'img1_637488576000000000fd87e3d3482d41df9bd474a151136d72.jpg', N'img2_637488576000000000080436889609457a8df5805bc1759037.jpg', N'img3_637488576000000000999f8fc7c04b495a8b80d6f90d5ff1ce.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:00:08.390' AS DateTime), N'Admin', 0, NULL, 1513, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (134, N'MDYOSPR0000179', N'Admin', N'Horlicks Health & Nutrition Drink - Chocolate Flavour', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:84px; vertical-align:bottom; white-space:normal; width:209px">Health Drink that has nutrients to support immunity.Horlicks is Clinically proven to improve 5 signs of growth. Clinically proven to make kids Taller, Stronger &amp; Sharper. Scientifically proven to improve Power of Milk</td>
		</tr>
	</tbody>
</table>
', CAST(380.00 AS Decimal(18, 2)), CAST(330.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000b68f8bbae5f54764bbe3597b49085ab4.jpg', N'img1_63748857600000000054b70aac27734c9d9db568c2c5dd06bc.jpg', N'img2_637488576000000000b9767273944c4653a9efdecfbe2a170f.jpg', N'img3_637488576000000000da21c493b0e647a58f66cf6ace45b55e.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:06:12.687' AS DateTime), N'Admin', 0, NULL, 1254, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (135, N'MDYOSPR0000180', N'Admin', N'Fabelle Soft Centres Chocolate - Choco Mousse', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:77px; vertical-align:bottom; white-space:normal; width:209px">Break the milk chocolate shell to discover the luxurious choco mousse, Fabelle Soft Centres &ndash; Choco Mousse has been inspired by center-filled desserts. Expertly crafted by Master Chocolatiers from the House of ITC, these premium milk chocolate bars have been created with premium ingredients in India. It gives you 4 reasons to indulge in them; Awaken Your Senses,&nbsp; Feel the smooth and silky texture of the chocolate. Listen to the distinct snap as you break a piece of this chocolate bar.&nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(170.00 AS Decimal(18, 2)), CAST(127.50 AS Decimal(18, 2)), 10, N'mainImg_63748857600000000043a47f3a6de34c23ad305d086193f809.jpg', N'img1_63748857600000000053802b76cc764fd299c6c5f10bb4217b.jpg', N'img2_63748857600000000024521f91c49945909654eafd81fffd94.jpg', N'img3_63748857600000000016788b53b720415fb85b91ea3cd0fcec.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:21:40.180' AS DateTime), N'Admin', 0, NULL, 217, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (136, N'MDYOSPR0000181', N'Admin', N'Cadbury Dairy Milk Silk - Hazelnut Chocolate Bar', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:77px; vertical-align:bottom; white-space:normal; width:209px">Deliciously crunchy, whole hazelnuts covered in smooth Cadbury Dairy Milk Silk, this offering is all about regaling in the richness and creaminess of the chocolate. Crack open a delicious block to release the sweet nutty crunch. Take a sweet break with the hazelnut chocolate bar.</td>
		</tr>
	</tbody>
</table>
', CAST(176.00 AS Decimal(18, 2)), CAST(166.25 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000bf42e8ceedbf453cbff3db421d79ac85.jpg', N'img1_63748857600000000091e1c501b4c3429c82767762f673e66d.jpg', N'img2_637488576000000000c1e1740089774113bb302b385b87b210.jpg', N'img3_637488576000000000716827907cb34949a2a75dbdf19edec4.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:30:18.053' AS DateTime), N'Admin', 0, NULL, 293, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (137, N'MDYOSPR0000182', N'Admin', N'Nescafe Classic Coffee', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:49px; vertical-align:bottom; white-space:normal; width:209px">To take your coffee experiences to the next level, NESCAFE, the world&#39;s favourite instant coffee brand, brings forth a rich and aromatic coffee in the form of NESCAFE Classic. The unmistakable flavour of NESCAFE Classic is what makes this signature coffee so loved all over the world. Start your day right with the first sip of this classic 100% pure coffee and let the intense taste and wonderfully refreshing aroma of NESCAFE instant coffee awaken your senses to new opportunities. With over 75 years of experience and working with coffee farmers, to help them grow more sustainable coffee through improved crop techniques, we deliver the best coffee produced by the best selecting, roasting and blending methods.&nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(490.00 AS Decimal(18, 2)), CAST(440.00 AS Decimal(18, 2)), 10, N'mainImg_63748857600000000083c632dda28c427c9d807aa5586b7f08.jpg', N'img1_637488576000000000647cc65824314123adf2ff3a8db6b7f9.jpg', N'img2_63748857600000000084df042713dd49a3b42c8324fb55d474.jpg', N'img3_637488576000000000fef6512d6e3c48eb81636c89274a2483.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:33:23.723' AS DateTime), N'Admin', 0, NULL, 2156, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
INSERT [dbo].[tbl_ProductMaster] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [percentage], [deliverycharge], [offerproductid], [Isofferproduct], [Offerimage]) VALUES (139, N'MDYOSPR0000184', N'Admin', N'bb Popular Cashew/Kaju - Whole', N'L1_1', N'L2_1', N'L3_1', N'<table cellspacing="0" style="border-collapse:collapse; width:209px">
	<tbody>
		<tr>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:89px; vertical-align:bottom; white-space:normal; width:209px">Cashews&nbsp;are a kidney-shaped seed sourced from the&nbsp;cashew&nbsp;tree. Cashews provide an excellent source of protein. Cashews are cholesterol-free and a great supply of antioxidants that will keep you away from heart diseases. The fat content in cashew nuts is low.</td>
		</tr>
	</tbody>
</table>
', CAST(300.00 AS Decimal(18, 2)), CAST(190.00 AS Decimal(18, 2)), 10, N'mainImg_637488576000000000052f4e61631e43d7a92d3b60cba325cd.jpg', N'img1_63748857600000000066dc6bc6f5574d37b2a141474378eed4.jpg', N'img2_637488576000000000b9cd2f0e9d624618bfb0ad52ef675fe5.jpg', N'img3_637488576000000000c51a520492fa4f08a7dd8eaa660e2af8.jpg', N'img4_637488576000000000.jpg', N'published', 1, CAST(N'2021-02-14 12:45:02.783' AS DateTime), N'Admin', 0, NULL, 570, CAST(50 AS Decimal(18, 0)), N'WOWOFFER1', N'0', N'undefined')
SET IDENTITY_INSERT [dbo].[tbl_ProductMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_ProductMasterHistory] ON 

INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (1, N'MDYOSPR0000001', N'Admin', N'Tata Tea Premium, 1kg', N'L1_1', N'L2_1', NULL, N'<h1>About this item</h1>

<ul>
	<li>Tata Tea Premium - Desh ki chai, sourced solely from India, understands the varying taste preferences of people across India. That&#39;s why our tea experts have crafted blends for &lsquo;chai&rsquo; lovers from all over India. Relish the exquisite taste of the &#39;Chai&#39; crafted for India</li>
	<li>India ke liye Anokha Swad - A unique blend that &#39;Chai&#39; lovers across India will enjoy</li>
	<li>Blended since 1985</li>
	<li>Available in Leaf, Dust and Tea Bag formats</li>
	<li>Prepare with Fresh boiling water / Milk</li>
</ul>
', CAST(650.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 5, N'mainImg_6374617920000000009be3bd2bd7bd46a8982810fc47ab33c0.jpg', N'img1_637461792000000000109b7da3a8c54ee696f88693f4046693.jpg', N'img2_63746179200000000077d1354f475b48c6825112e27cc38f09.jpg', N'img3_63746179200000000007390a85ec5c4afc94b95ef8dc193a08.jpg', N'img4_637461792000000000.jpg', N'published', 1, CAST(N'2021-01-14 12:58:58.220' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (2, N'MDYOSPR0000001', N'Admin', N'testing', N'L1_43', N'L2_5', N'L3_1', N'<p>testing mishion</p>
', CAST(500.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 10, N'mainImg_637467840000000000e03da84866c1465f949e433e394fbf20.jpg', N'img1_63746784000000000071a609e0fe324400bfcc5892291ee319.png', N'img2_63746784000000000069bec42df9da4f568f7034a6240b3025.jpg', N'img3_637467840000000000d2cb7d01a8d243f5879787ac2c898046.jpg', N'img4_637467840000000000.jpg', N'published', 1, CAST(N'2021-01-21 18:33:48.303' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (3, N'MDYOSPR0000001', N'Admin', N'techpile', N'L1_43', N'L2_5', N'L3_15', N'<p>teyghb jnmcxn jhdfjfd ehriuher ksak lAJSK</p>
', CAST(787.00 AS Decimal(18, 2)), CAST(435.00 AS Decimal(18, 2)), 454, N'mainImg_637467840000000000979fafa0035444c791b1204d05e92080.jpg', N'img1_6374678400000000003dffe405ed814d28a5ee7accc57b0e89.jpg', N'img2_63746784000000000030c19b7a47164baba1597ad1effcecfc.jpg', N'img3_6374678400000000006b3f12399e044b0cab4c00a9c62c93db.jpg', N'img4_637467840000000000.jpg', N'published', 1, CAST(N'2021-01-21 18:51:14.817' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (4, N'MDYOSPR0000001', N'Admin', N'techpile', N'L1_43', N'L2_5', N'L3_15', N'<p>teyghb jnmcxn jhdfjfd ehriuher ksak lAJSK</p>
', CAST(787.00 AS Decimal(18, 2)), CAST(435.00 AS Decimal(18, 2)), 454, N'mainImg_637467840000000000167e00a8259d4d4c90745cd664d7374b.jpg', N'img1_637467840000000000e17fe5e4e06545f0a0109698fd30f881.jpg', N'img2_637467840000000000b796db880acf499a94c7d412913334df.jpg', N'img3_637467840000000000d89a651709404f7a9eeeebbe2394463f.jpg', N'img4_637467840000000000.jpg', N'published', 1, CAST(N'2021-01-21 18:51:15.153' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (5, N'MDYOSPR0000001', N'Admin', N'techpile', N'L1_43', N'L2_5', N'L3_15', N'<p>teyghb jnmcxn jhdfjfd ehriuher ksak lAJSK</p>
', CAST(787.00 AS Decimal(18, 2)), CAST(435.00 AS Decimal(18, 2)), 454, N'mainImg_6374678400000000005dfe2788b37043ffb4156dccd970b915.jpg', N'img1_63746784000000000030cba0965c074397b56c14e162f45c78.jpg', N'img2_637467840000000000d850508daf894240884bbfb8bb373245.jpg', N'img3_637467840000000000f667ec59d53641c59e13d68c18a817e9.jpg', N'img4_637467840000000000.jpg', N'published', 1, CAST(N'2021-01-21 18:51:15.663' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (6, N'MDYOSPR0000001', N'Admin', N'techpile', N'L1_43', N'L2_5', N'L3_15', N'<p>teyghb jnmcxn jhdfjfd ehriuher ksak lAJSK</p>
', CAST(787.00 AS Decimal(18, 2)), CAST(435.00 AS Decimal(18, 2)), 454, N'mainImg_63746784000000000096be1b28665b43518cf353551aaa5e69.jpg', N'img1_637467840000000000ef653d428cf14998beadc8155aeb80c3.jpg', N'img2_63746784000000000098bfaa6e100f4b55a0ad7a213b75abf9.jpg', N'img3_63746784000000000072779b2ae0c54b02846f42976f39dfa9.jpg', N'img4_637467840000000000.jpg', N'published', 1, CAST(N'2021-01-21 18:51:16.157' AS DateTime), N'Admin', CAST(N'2021-01-21 19:22:14.750' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (7, N'MDYOSPR0000002', N'Admin', N'Tide Plus Extra Power Detergent Washing Powder - 7 kg', N'L1_1', N'L2_1', NULL, N'<ul>
	<li>Removes dirt from even washed clothes to give you brilliant whiteness</li>
	<li>Has built in &quot;power of bar&quot;</li>
	<li>Gives you brighter whiteness in only half the dosage vs that of ordinary detergents</li>
	<li>Easily dissolves in water and quickly generates foam to give you brilliant whiteness</li>
	<li>If extra power Tide, then extra power white</li>
	<li>&nbsp;</li>
</ul>
', CAST(729.00 AS Decimal(18, 2)), CAST(729.00 AS Decimal(18, 2)), 2, N'mainImg_637461792000000000039606db571d43d685413b871f37a517.jpg', N'img1_637461792000000000703bf15254da42d0bdb3aeff839bec03.jpg', N'img2_637461792000000000c1dcb7ba04fa4d1cba326bd3e28d5bd2.jpg', N'img3_637461792000000000309087b3e3984ee88ae75077f1d81377.jpg', N'img4_637461792000000000.jpg', N'published', 1, CAST(N'2021-01-14 13:51:43.590' AS DateTime), N'Admin', CAST(N'2021-01-22 14:37:18.027' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (8, N'MDYOSPR0000002', N'Admin', N'success', N'L1_48', N'L2_27', N'L3_17', N'<p>good job</p>
', CAST(600.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, N'mainImg_63746870400000000075c5889b259747fabbceadc7a3d614a9.jpg', N'img1_637468704000000000c12776ef9ae54d7ca64cfdea09e3cadd.png', N'img2_63746870400000000023758e5c58ab4372b42529e428991f8e.jpg', N'img3_6374687040000000007a2191aee0964ca68aa0b0f4e52df5e1.jpg', N'img4_637468704000000000.jpg', N'published', 1, CAST(N'2021-01-22 13:57:31.820' AS DateTime), N'Admin', CAST(N'2021-01-22 14:37:18.027' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (9, N'MDYOSPR0000003', N'Admin', N'Fresh Apple Shimla, 4 Pieces', N'L1_2', N'L2_2', NULL, N'<h1>About this item</h1>

<ul>
	<li>100% Wax Free</li>
	<li>Pack contains 4 pieces</li>
	<li>Good source of Vitamin C, Dietary Fiber, Flavonoids and antioxidants</li>
	<li>Store at cool and dry place under 8 degree celsius</li>
</ul>
', CAST(400.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 10, N'mainImg_6374687040000000007b04a3710a7946ea8885f3453926317f.jpg', N'img1_6374687040000000006c9862fac30d404f92888e51704af33c.jpg', N'img2_6374687040000000006341290bf2df4a5797f90e96ee3eb616.jpg', N'img3_637468704000000000a9f1ae4742d046ca8c84dc892b0ff07d.jpg', N'img4_637468704000000000.jpg', N'published', 1, CAST(N'2021-01-22 15:51:36.290' AS DateTime), N'Admin', CAST(N'2021-01-22 15:52:08.110' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (14, N'MDYOSPR0000032', N'divya@gmail.com', N'YUIO', N'L1_1', N'L2_4', N'L3_3', N'<p>Idsdfdb</p>
', CAST(78.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 89, N'mainImg_6374833920000000008a0714e3b24e48ebb4a9b421dd937d4b.jpg', N'undefined', N'undefined', N'undefined', N'undefined', N'published', 1, CAST(N'2021-02-08 20:22:01.227' AS DateTime), N'divya@gmail.com', CAST(N'2021-02-09 12:11:12.190' AS DateTime), N'')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (18, N'MDYOSPR0000029', N'Admin', N'test', N'L1_1', N'L2_1', N'L3_1', N'<p>safdsfg</p>
', CAST(50.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 20, N'mainImg_637483392000000000830b45adc874438f9c03f8fa7b1fd66a.jpg', N'img1_6374833920000000002d7316933e0047c9be723d96b41e7c12.jpg', N'undefined', N'undefined', N'undefined', N'published', 1, CAST(N'2021-02-08 11:50:30.777' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:28.200' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (10, N'MDYOSPR0000006', N'Admin', N'Cadbury Oreo Choco Crème Biscuit Family Pack, 300g', N'L1_5', N'L2_6', N'L3_5', N'<p>This is a&nbsp;<strong>Vegetarian</strong>&nbsp;product.</p>

<ul>
	<li>Rich, smooth Choco cr&egrave;me sandwiched between two crunchy chocolatey cookies</li>
	<li>Give yourself a delicious treat today and twist, lick and dunk an Oreo</li>
	<li>The perfect pack for snacking at home or sharing with your family or friends</li>
	<li>This family pack comprises of 3 packs of Oreo choco cr&egrave;me biscuits 100g, each</li>
	<li>Country of Origin: India</li>
</ul>
', CAST(75.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), 20, N'mainImg_637468704000000000409e1126367e43a9954519121625a525.jpg', N'img1_637468704000000000fe3d0a1955f2462b9c46f394ce43e92d.jpg', N'img2_63746870400000000071058da4c14d4f498f053aac0e6d6e97.jpg', N'img3_6374687040000000007ecc325cd05c4e6c9a5509d3b7674825.jpg', N'img4_637468704000000000.jpg', N'published', 1, CAST(N'2021-01-22 16:40:03.237' AS DateTime), N'Admin', CAST(N'2021-01-22 16:40:34.427' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (11, N'MDYOSPR0000026', N'Admin', N'Diwali Special Dhamaka', N'L1_1', N'L2_1', N'L3_1', N'<p>This is only use for Morning time dies</p>
', CAST(23.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 13, N'mainImg_63748080000000000077e9fbf4e1834f2d9a324f66c0bb0c8d.jpg', N'img1_637480800000000000959cf6db35af4689a04923f6cd80b912.jpeg', N'img2_6374808000000000009424710ad5214bf497b0dea5901e0aa7.jpg', N'img3_63748080000000000017c2d77b82fd4bbc9f0fb876c0598bf0.jpg', N'img4_637480800000000000.jpg', N'published', 1, CAST(N'2021-02-05 14:46:05.420' AS DateTime), N'Admin', CAST(N'2021-02-05 15:14:39.933' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (12, N'MDYOSPR0000020', N'Admin', N'Fresho Sapota, 500 g', N'L1_2', N'L2_2', N'L3_2', N'<p>Brown skinned sapotas are smooth to grainy textured, musky-scented and deliciously sweet in taste. The flesh generally contains 2-3 large and inedible black seeds. Fresho sapotas are freshly plucked by our farmers and the best quality is delivered to you.</p>
', CAST(37.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 12, N'mainImg_637477344000000000044a68324e9a4369814e84d3860049e7.jpg', N'img1_6374773440000000002167edd67904455a83134e4185c866a7.jpg', N'img2_637477344000000000290aa9eca8ac49db91638eaa6229f811.jpg', N'img3_637477344000000000180b04f55c8c40ca972949d7e23448ad.jpg', N'img4_637477344000000000.jpg', N'published', 1, CAST(N'2021-02-01 20:31:28.420' AS DateTime), N'Admin', CAST(N'2021-02-08 14:08:23.653' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (13, N'MDYOSPR0000024', N'Admin', N'Test', N'L1_2', N'L2_2', N'L3_2', N'<p>kjafsdgkbjewfngvlwarkw</p>
', CAST(500.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 30, N'mainImg_6374799360000000009012e52257b641e9a6d42355dfaa4730.jpg', N'img1_637479936000000000761fffc5ed4e4ca89039ca9b1368ab4e.jpg', N'img2_637479936000000000b2695c12c4d94c84927ed3a8cc0dc1e4.jpg', N'img3_63747993600000000002183600f2534e8b9232d3f1c575f863.jpg', N'img4_637479936000000000.jpg', N'Out of Stock', 1, CAST(N'2021-02-04 14:26:42.330' AS DateTime), N'Admin', CAST(N'2021-02-09 11:24:16.590' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (15, N'MDYOSPR0000045', N'Admin', N'Cabbage', N'L1_2', N'L2_2', N'L3_2', N'<p>With a texture of crispness and juiciness the moment you take the first bite, cabbages are sweet and grassy flavoured with dense and smooth leafy layers.</p>
', CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000e6dfc67791ac4de78bca9408254f3c27.jpg', N'img1_637484256000000000774ab1a5b0bb483787924fd8b0920c97.jpg', N'img2_63748425600000000047af33fab4f14bcb80cb882ad57391d4.jpeg', N'img3_637484256000000000f9c6c87e9b87454381b1c5ca1430aef3.jpeg', N'img4_637484256000000000.jpeg', N'published', 1, CAST(N'2021-02-09 11:45:40.763' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:15.983' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (16, N'MDYOSPR0000031', N'Admin', N'Tomato', N'L1_2', N'L2_2', N'L3_2', N'<p>Tomato Hybrids are high-quality fruits compared to desi, local tomatoes. They contain numerous edible seeds and are red in colour due to lycopene, an anti-oxidant.<br />
&nbsp;</p>
', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, N'mainImg_6374833920000000008b73897984894f3984d40a8afa8421b7.webp', N'img1_6374833920000000007c19697fdf994c95a679faeb57462f5a.jpg', N'img2_6374833920000000009d018781a97d44319156702a2a1a237e.jpeg', N'img3_637483392000000000f7ba260ff6c4496ab8f47a19fd9591c3.jpeg', N'img4_637483392000000000.jpeg', N'published', 1, CAST(N'2021-02-08 14:18:34.547' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:20.373' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (17, N'MDYOSPR0000030', N'Admin', N'Potato', N'L1_2', N'L2_2', N'L3_2', N'<p>Fresho Potatoes are nutrient-dense, non-fattening and have reasonable amount of calories. Include them in your regular meals so that the body receives a good supply of carbohydrates, dietary fibers and essential minerals such as copper, magnesium, and iron. In India, potatoes are probably the second-most consumed vegetables after onions.<br />
&nbsp;</p>
', CAST(15.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 0, N'mainImg_6374833920000000004c38231a80e444acb37435ab19b587e1.jpg', N'img1_637483392000000000c5af2b8908004fed9b30c710cde877e5.webp', N'img2_637483392000000000485ee447dcce401e9bae02e36e9a4053.jpg', N'img3_637483392000000000ab63eb8cc8914bb587b71bfeab13da2b.jpg', N'img4_637483392000000000.jpg', N'published', 1, CAST(N'2021-02-08 14:07:21.187' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:23.963' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (19, N'MDYOSPR0000028', N'Admin', N'Onion', N'L1_2', N'L2_2', N'L3_2', N'<p>Onion is a vegetable which is almost like a staple in Indian food. This is also known to be one of the essential ingredients of raw salads. They come in different colors like white, red or yellow and are quite in demand in cold salads and hot soups. You can dice, slice or cut it in rings and put it in burgers and sandwiches. Onions emit a sharp flavour and fragrance once they are fried; it is due to the sulphur compound in the vegetable.</p>
', CAST(30.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), 0, N'mainImg_6374833920000000005d025cddb7764127b8b1caabc4edbbca.jpg', N'img1_637483392000000000f3cab5651a3b4736ae54adf94a7c844a.jpg', N'img2_6374833920000000005bbcfff3625f4892b08aab8e10ad2507.webp', N'img3_6374833920000000009db2d646ea03462991e66bf53b7d8b14.webp', N'undefined', N'published', 1, CAST(N'2021-02-08 11:45:52.123' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:32.260' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (20, N'MDYOSPR0000027', N'Admin', N'hhjkth', N'L1_3', N'L2_3', N'L3_3', N'<h2>Cultivation</h2>
', CAST(2443.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 4, N'mainImg_637481664000000000352e33f225e043c1a175fa18ae7093f3.jpg', N'img1_63748166400000000013c39d2ceb4d4a2f810a5207db25f9ce.jpeg', N'img2_6374816640000000000d3f4e1478564f9dae48eb7c30d8fc24.jpeg', N'img3_63748166400000000052eb6383ba44499184e876099e8a37d1.jpeg', N'img4_637481664000000000.jpeg', N'published', 1, CAST(N'2021-02-06 19:21:30.310' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:35.943' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (21, N'MDYOSPR0000025', N'Admin', N'Vegetable', N'L1_6', N'L2_2', N'L3_2', N'<p>bkghfskhkjhfsjl</p>
', CAST(55.00 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), 536, N'mainImg_637479936000000000c889bf1266144e9c967d5e0952321794.jpg', N'img1_63747993600000000022efb725462f476fab0c68114abd7d41.png', N'img2_637479936000000000855dbbe982e44697b40e2e42eff0ec9e.png', N'img3_637479936000000000977866a351b04688a003e021add4cf7b.png', N'img4_637479936000000000.png', N'published', 1, CAST(N'2021-02-04 14:40:00.820' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:39.420' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (22, N'MDYOSPR0000023', N'Admin', N'Nutraj Super Raisin 500g (Long)', N'L1_3', N'L2_3', N'L3_3', N'<h1>About this item</h1>

<ul>
	<li>Super Raisins ( Kishmish )</li>
	<li>Raisin Grade: Long</li>
	<li>Net Weight: 500gm</li>
	<li>Storage information- Store in cool and dry place in an airtight container.</li>
</ul>
', CAST(1200.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 20, N'mainImg_6374782080000000004d2c14e950a9416da2428f5fe1960e29.jpg', N'img1_637478208000000000d55378084424439db6edc484700cf416.jpg', N'img2_6374782080000000004db6a9ba1de54d8197ad2c6db75e4bbc.jpg', N'img3_637478208000000000c2dc32c7da3e46df9e74a7a23349b4f6.jpg', N'img4_637478208000000000.jpg', N'published', 1, CAST(N'2021-02-02 12:46:51.070' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:42.810' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (23, N'MDYOSPR0000022', N'Admin', N'Nutraj Signature Daily Needs Dry Fruits Combo Pack 1 Kg', N'L1_3', N'L2_3', N'L3_3', N'<ul>
	<li>Mixed Dry Fruits Combo of Almonds, Walnuts, Cashews, Pista &amp; Raisins - 200g each</li>
	<li>Fulfill your daily nutrients, fiber and antioxidents needs at one place</li>
	<li>May reduce the risk of certain diseases</li>
	<li>Perfect Dry Fruits Mixed Combo 1 Kg Pack</li>
	<li>Disclaimer: The packaging of Mono Cartons is being changed and during this transition, any of these packs may be dispatched to you.</li>
</ul>
', CAST(1200.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 80, N'mainImg_63747820800000000094e2120c0a9a4758b8f1a6d876b63418.jpg', N'img1_637478208000000000ca6b6eef711f4021a24e7ec329e944f8.jpg', N'img2_637478208000000000deedb61248b64278bfc183c2c0a34893.jpg', N'img3_6374782080000000003f78768100304247bdb34f11049a8c86.jpg', N'img4_637478208000000000.jpg', N'published', 1, CAST(N'2021-02-02 12:28:05.970' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:47.473' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (24, N'MDYOSPR0000021', N'Admin', N'Coca-Cola 6 x 300 ml', N'L1_1', N'L2_1', N'L3_1', N'<ul>
	<li>The original cola flavoured refreshment enjoyed around the world</li>
	<li>Coca-Cola refreshing flavour is delicious and uplifting</li>
	<li>Refreshment that brings enjoyment and positivity with every sip</li>
	<li>Enjoy coca-cola&rsquo;s delicious taste with meals, on the go, or to share</li>
	<li>Create refreshing moments for yourself with a can of coke</li>
</ul>
', CAST(450.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 20, N'mainImg_63747734400000000057622dc5f9794b35a6ac7476ffb3b563.jpg', N'img1_6374773440000000004e04eec5f7104060ab0070cd27f9c3f6.jpg', N'img2_6374773440000000008d5c03142e2d4dfbb8761a268d75e1ff.jpg', N'img3_637477344000000000420edff6743b47c9a6ac9189b3232b06.jpg', N'img4_637477344000000000.jpg', N'published', 1, CAST(N'2021-02-01 20:35:57.850' AS DateTime), N'Admin', CAST(N'2021-02-09 12:12:51.933' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (34, N'MDYOSPR0000072', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>Apples are one of the most popular fruits &mdash; and for good reason.</p>

<p>They&rsquo;re an exceptionally healthy fruit with many research-backed benefits.</p>
', CAST(100.00 AS Decimal(18, 2)), CAST(98.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000f8200743f09f44c291f1979978c86699.jpg', N'img1_637486848000000000c7b20f61e7784c288bf3b8d2ef53662b.jpg', N'img2_6374868480000000006c2f9ad380cc4f59a383ebe1d2e988d0.webp', N'img3_6374868480000000003fd6871295d348c29508fc5978548f48.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:23:55.803' AS DateTime), N'Admin', CAST(N'2021-02-12 12:34:53.613' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (35, N'MDYOSPR0000070', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>Apples are one of the most popular fruits &mdash; and for good reason.</p>

<p>They&rsquo;re an exceptionally healthy fruit with many research-backed benefits.</p>
', CAST(100.00 AS Decimal(18, 2)), CAST(98.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000843189c337c444c09c42bc9548ec59f8.jpg', N'img1_637486848000000000492f6caf78c04624946720852744d15b.jpg', N'img2_637486848000000000b5e6c9c7df5d4dd9845c26ce7cb71fb1.webp', N'img3_637486848000000000b4992040f90b49b78627679b9906763b.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:23:55.520' AS DateTime), N'Admin', CAST(N'2021-02-12 12:35:00.157' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (36, N'MDYOSPR0000071', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>Apples are one of the most popular fruits &mdash; and for good reason.</p>

<p>They&rsquo;re an exceptionally healthy fruit with many research-backed benefits.</p>
', CAST(100.00 AS Decimal(18, 2)), CAST(98.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000bc1f5d2432454cf5bd9685efbcedec4c.jpg', N'img1_637486848000000000911184e1e0b549daa0ea3e9db2c20551.jpg', N'img2_637486848000000000adde83eba370490393bdbb07e17324b4.webp', N'img3_637486848000000000a9c2c6e679e94b928268e1c79d238684.webp', N'img4_637486848000000000.webp', N'published', 1, CAST(N'2021-02-12 12:23:55.617' AS DateTime), N'Admin', CAST(N'2021-02-12 12:35:07.300' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (25, N'MDYOSPR0000047', N'Admin', N'Smart Watch, FirYawee Smartwatch for Android Phones', N'L1_8', N'L2_6', N'L3_5', N'<ul>
	<li>【New Upgraded Bright &amp; Clear Display】 Equipped with 1.4 inch full touch screen and TFT-LCD clear display,this New upgraded Smart watch personalized interactive interfacecan easily catch your eyes and follow your heart.Strong and durable 2.5D glass makes your smart watch much more scratch-resistant. It is easy to operate and is smooth and responsive.</li>
</ul>
', CAST(500.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 90, N'mainImg_637484256000000000350c4535b9864bca9db95d907fdb235f.jpg', N'img1_6374842560000000001e9b22b8fdd9401fa0aac879f0b910df.jpg', N'img2_637484256000000000e431a90b8e924cebb85cec2531ab920e.jpg', N'img3_6374842560000000008cfc78f0055643378b31714dfb25ce21.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 14:22:44.583' AS DateTime), N'Admin', CAST(N'2021-02-09 15:51:31.210' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (26, N'MDYOSPR0000046', N'Admin', N'Ajanta Quartz Wall Clock', N'L1_8', N'L2_6', N'L3_5', N'<h1>About this item</h1>

<ul>
	<li>Wall Clock Size: 13x13 Inches (33 x 33 cm)</li>
	<li>Care instructions: Wipe clean with a damp cloth.</li>
	<li>Material: Dial is made of imported high quality acrylic while hands are of imported metals, Gloss finish</li>
</ul>
', CAST(465.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 20, N'mainImg_637484256000000000675298f05b554dc38c3810cf16e56d0c.jpg', N'img1_63748425600000000099bcfb99110649668e9e1453f8e54d43.jpg', N'img2_6374842560000000000db54a07ebab4ef6bd61c7baf6283791.jpg', N'img3_63748425600000000053af40df6d9642f785f73181075ff9e5.jpg', N'System.Web.HttpPostedFileWrapper', N'published', 1, CAST(N'2021-02-09 12:58:05.540' AS DateTime), N'Admin', CAST(N'2021-02-09 15:51:37.060' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (27, N'MDYOSPR0000048', N'Admin', N'testing', N'L1_8', N'L2_6', N'L3_5', N'<p>fgfjfj</p>
', CAST(2343.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 20, N'mainImg_637484256000000000369a8382a23641e19a7268cc3c602035.png', N'img1_6374842560000000009173278463e8460e8c13aa7477ca3c6b.png', N'img2_63748425600000000016d73ca1c479493c8bd802b6920f1de2.png', N'img3_637484256000000000dcadaeccf826451ba76def92e4869e19.png', N'img4_637484256000000000.png', N'published', 1, CAST(N'2021-02-09 15:53:18.490' AS DateTime), N'Admin', CAST(N'2021-02-09 16:00:44.880' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (28, N'MDYOSPR0000050', N'Admin', N'Cherry', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>cherry</strong>&nbsp;is the&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;of many plants of the genus&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus">Prunus</a></em>, and is a fleshy&nbsp;<a href="https://en.wikipedia.org/wiki/Drupe">drupe</a>&nbsp;(stone fruit).</p>

<p>Commercial cherries are obtained from&nbsp;<a href="https://en.wikipedia.org/wiki/Cultivar">cultivars</a>&nbsp;of several species, such as the sweet&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_avium">Prunus avium</a></em>&nbsp;and the sour&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_cerasus">Prunus cerasus</a></em>. The name &#39;cherry&#39; also refers to the cherry tree and its wood, and is sometimes applied to&nbsp;<a href="https://en.wikipedia.org/wiki/Almond">almonds</a>&nbsp;and visually similar flowering trees in the genus&nbsp;<em>Prunus</em>, as in &quot;ornamental cherry&quot; or &quot;<a href="https://en.wikipedia.org/wiki/Cherry_blossom">cherry blossom</a>&quot;.&nbsp;<strong>Wild cherry</strong>&nbsp;may refer to any of the cherry species growing outside cultivation, although&nbsp;<em>Prunus avium</em>&nbsp;is often referred to specifically by the name &quot;wild cherry&quot; in the British Isles.</p>
', CAST(145.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)), 0, N'mainImg_63748425600000000058d6bac00b314c3f86b714eb7c84ea1f.jpg', N'img1_637484256000000000e423abf1863b4e3a88841a705e5cbf1e.jpg', N'img2_637484256000000000e746e040324344a3b7578adaee6374d8.webp', N'img3_6374842560000000007e5c9bf8c17c4c0aa60cf637297bbf46.webp', N'img4_637484256000000000.webp', N'published', 1, CAST(N'2021-02-09 16:00:07.027' AS DateTime), N'Admin', CAST(N'2021-02-09 16:07:39.890' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (39, N'MDYOSPR0000099', N'Admin', N'Blueberries', N'L1_3', N'L2_3', N'L3_3', N'<p>Inflammation is a key driver of all chronic diseases, so blueberries have a host of benefits,&quot; says Ann Kulze, MD, of Charleston, S.C., author of&nbsp;<em>Dr. Ann&#39;s 10 Step Diet: A Simple Plan for Permanent Weight Loss and Lifelong Vitality.</em>&nbsp;When selecting berries, note that the darker they are, the more antioxidants they have. &quot;I tell everyone to have a serving (about 1/2 cup) every day,&quot; Kulze says. &quot;Frozen are just as good as fresh.&quot;&nbsp;</p>
', CAST(199.00 AS Decimal(18, 2)), CAST(197.00 AS Decimal(18, 2)), 10, N'mainImg_6374868480000000004234baedba394c2da47ddf370877c821.jfif', N'img1_6374868480000000004bbfc2c5d6514209a318088debf1560c.jfif', N'img2_637486848000000000ad3e8be4855e43d3ba71f3ef2187a41e.jfif', N'img3_637486848000000000fc7dbe4e3d8e4596a67f40b1b6d595c6.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:40:35.670' AS DateTime), N'Admin', CAST(N'2021-02-12 13:48:41.073' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (29, N'MDYOSPR0000052', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>An&nbsp;<strong>apple</strong>&nbsp;is an edible&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;produced by an&nbsp;<strong>apple tree</strong>&nbsp;(<em><strong>Malus domestica</strong></em>). Apple&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit_tree">trees</a>&nbsp;are&nbsp;<a href="https://en.wikipedia.org/wiki/Agriculture">cultivated</a>&nbsp;worldwide and are the most widely grown species in the&nbsp;<a href="https://en.wikipedia.org/wiki/Genus">genus</a>&nbsp;<em><a href="https://en.wikipedia.org/wiki/Malus">Malus</a></em>. The tree originated in&nbsp;<a href="https://en.wikipedia.org/wiki/Central_Asia">Central Asia</a>, where its wild ancestor,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Malus_sieversii">Malus sieversii</a></em>, is still found today. Apples have been grown for thousands of years in&nbsp;<a href="https://en.wikipedia.org/wiki/Asia">Asia</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Europe">Europe</a>&nbsp;and were brought to North America by&nbsp;<a href="https://en.wikipedia.org/wiki/European_colonization_of_the_Americas">European colonists</a>. Apples have&nbsp;<a href="https://en.wikipedia.org/wiki/Religion">religious</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Mythology">mythological</a>&nbsp;significance in many cultures, including&nbsp;<a href="https://en.wikipedia.org/wiki/Norse_mythology">Norse</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Greek_mythology">Greek</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Christianity_in_Europe">European Christian</a>&nbsp;tradition.</p>
', CAST(99.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000317866906d0f48ec9787a6a7bb543944.jpg', N'img1_637484256000000000f864dde98fbe4f44a52618a6ca0970be.jpg', N'img2_637484256000000000471a8c6f809c43598345f1c2d819be73.jpg', N'img3_637484256000000000cbd896a7f92245f7ade84791964475cb.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 16:38:28.543' AS DateTime), N'Admin', CAST(N'2021-02-09 16:38:57.773' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (31, N'MDYOSPR0000054', N'Admin', N'Plum', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>plum</strong>&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;of some species in&nbsp;<a href="https://en.wikipedia.org/wiki/Prunus_subg._Prunus"><em>Prunus</em>&nbsp;subg.&nbsp;<em>Prunus</em></a><em>.</em>&nbsp;Mature plum fruit may have a dusty-white waxy coating that gives them a&nbsp;<a href="https://en.wikipedia.org/wiki/Glaucous">glaucous</a>&nbsp;appearance. This is an&nbsp;<a href="https://en.wikipedia.org/wiki/Epicuticular_wax">epicuticular wax</a>&nbsp;coating and is known as &quot;wax bloom&quot;. Dried plum fruits are called &quot;dried plums&quot; or&nbsp;<a href="https://en.wikipedia.org/wiki/Prune">prunes</a>, although, in many countries, prunes are a distinct type of dried plum having a wrinkled appearance</p>
', CAST(140.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 0, N'mainImg_63748425600000000012058ee10ce4484bb75fc5ff075f933e.jpg', N'img1_6374842560000000005ce8b6a4c93441e19f2d2e7745cf8db5.jpg', N'img2_637484256000000000a26452f5df024fd3b3befea1d51f2309.jpg', N'img3_63748425600000000013492681bb6643b5a2f8a8bf3fc809c3.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 16:45:51.113' AS DateTime), N'Admin', CAST(N'2021-02-09 18:20:21.570' AS DateTime), N'admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (30, N'MDYOSPR0000049', N'Admin', N'Litchi', N'L1_3', N'L2_3', N'L3_3', N'<p>It is a&nbsp;<a href="https://en.wikipedia.org/wiki/Tropical">tropical</a>&nbsp;tree native to the&nbsp;<a href="https://en.wikipedia.org/wiki/Guangdong">Guangdong</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Fujian">Fujian</a>&nbsp;provinces of southeastern&nbsp;<a href="https://en.wikipedia.org/wiki/China">China</a>, where cultivation is documented from the 11th century.<a href="https://en.wikipedia.org/wiki/Lychee#cite_note-Purdue-3">[3]</a>&nbsp;China is the main producer of lychees, followed by India, other countries in&nbsp;<a href="https://en.wikipedia.org/wiki/Southeast_Asia">Southeast Asia</a>, the&nbsp;<a href="https://en.wikipedia.org/wiki/Indian_Subcontinent">Indian Subcontinent</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Madagascar">Madagascar</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/South_Africa">South Africa</a>. A tall&nbsp;<a href="https://en.wikipedia.org/wiki/Evergreen">evergreen</a>&nbsp;tree, the lychee bears small fleshy&nbsp;<a href="https://en.wikipedia.org/wiki/Drupe">fruits</a>. The outside of the fruit is pink-red, roughly textured and inedible, covering sweet flesh eaten in many different dessert dishes.</p>
', CAST(155.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000ecc77a4dd7274b62868566e2b7f115b2.jpeg', N'img1_63748425600000000007bc537fdef24540a2a75becef531f90.jpg', N'img2_637484256000000000a0e6ee0882824379bbefdcc77631f8bd.jpeg', N'img3_6374842560000000003aaa5762c45641549a3a3948386f5a1e.jpeg', N'img4_637484256000000000.jpeg', N'published', 1, CAST(N'2021-02-09 15:57:08.737' AS DateTime), N'Admin', CAST(N'2021-02-09 17:18:01.350' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (32, N'MDYOSPR0000051', N'Admin', N'Cherry', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>cherry</strong>&nbsp;is the&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;of many plants of the genus&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus">Prunus</a></em>, and is a fleshy&nbsp;<a href="https://en.wikipedia.org/wiki/Drupe">drupe</a>&nbsp;(stone fruit).</p>

<p>Commercial cherries are obtained from&nbsp;<a href="https://en.wikipedia.org/wiki/Cultivar">cultivars</a>&nbsp;of several species, such as the sweet&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_avium">Prunus avium</a></em>&nbsp;and the sour&nbsp;<em><a href="https://en.wikipedia.org/wiki/Prunus_cerasus">Prunus cerasus</a></em>. The name &#39;cherry&#39; also refers to the cherry tree and its wood, and is sometimes applied to&nbsp;<a href="https://en.wikipedia.org/wiki/Almond">almonds</a>&nbsp;and visually similar flowering trees in the genus&nbsp;<em>Prunus</em>, as in &quot;ornamental cherry&quot; or &quot;<a href="https://en.wikipedia.org/wiki/Cherry_blossom">cherry blossom</a>&quot;.&nbsp;<strong>Wild cherry</strong>&nbsp;may refer to any of the cherry species growing outside cultivation, although&nbsp;<em>Prunus avium</em>&nbsp;is often referred to specifically by the name &quot;wild cherry&quot; in the British Isles.</p>
', CAST(145.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)), 0, N'mainImg_6374842560000000002d64d2c65b254425b92a4645e3afa79e.jpg', N'img1_637484256000000000db28dd2cdf3d48e9a347241978a63d9f.jpg', N'img2_637484256000000000c199684e9b4f40a184506e7d1c4cffb9.webp', N'img3_637484256000000000422bcbcd87714f4c8308dd9eb158c027.webp', N'img4_637484256000000000.webp', N'published', 1, CAST(N'2021-02-09 16:00:08.307' AS DateTime), N'Admin', CAST(N'2021-02-09 18:22:05.657' AS DateTime), N'admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (33, N'MDYOSPR0000053', N'Admin', N'Apple', N'L1_3', N'L2_3', N'L3_3', N'<p>An&nbsp;<strong>apple</strong>&nbsp;is an edible&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruit</a>&nbsp;produced by an&nbsp;<strong>apple tree</strong>&nbsp;(<em><strong>Malus domestica</strong></em>). Apple&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit_tree">trees</a>&nbsp;are&nbsp;<a href="https://en.wikipedia.org/wiki/Agriculture">cultivated</a>&nbsp;worldwide and are the most widely grown species in the&nbsp;<a href="https://en.wikipedia.org/wiki/Genus">genus</a>&nbsp;<em><a href="https://en.wikipedia.org/wiki/Malus">Malus</a></em>. The tree originated in&nbsp;<a href="https://en.wikipedia.org/wiki/Central_Asia">Central Asia</a>, where its wild ancestor,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Malus_sieversii">Malus sieversii</a></em>, is still found today. Apples have been grown for thousands of years in&nbsp;<a href="https://en.wikipedia.org/wiki/Asia">Asia</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Europe">Europe</a>&nbsp;and were brought to North America by&nbsp;<a href="https://en.wikipedia.org/wiki/European_colonization_of_the_Americas">European colonists</a>. Apples have&nbsp;<a href="https://en.wikipedia.org/wiki/Religion">religious</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Mythology">mythological</a>&nbsp;significance in many cultures, including&nbsp;<a href="https://en.wikipedia.org/wiki/Norse_mythology">Norse</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Greek_mythology">Greek</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Christianity_in_Europe">European Christian</a>&nbsp;tradition.</p>
', CAST(99.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000477152f0471744da8947c5309de2c501.jpg', N'img1_637484256000000000b0f362e1110540babc8bfe63791ec9e4.jpg', N'img2_6374842560000000005560dfad48564171a030c4cf8151ee27.jpg', N'img3_6374842560000000004db88c50b86b4cee8a66fd27f10cc6d8.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 16:38:30.503' AS DateTime), N'Admin', CAST(N'2021-02-09 18:23:05.987' AS DateTime), N'admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (37, N'MDYOSPR0000092', N'Admin', N'Strawberry', N'L1_3', N'L2_3', N'L3_3', N'<p>These potent little packages protect your&nbsp;<strong>heart</strong>, increase HDL (good)&nbsp;<strong>cholesterol</strong>, lower your blood pressure, and guard against cancer. Packed with&nbsp;<strong>vitamins</strong>,&nbsp;<strong>fiber</strong>, and particularly high levels of&nbsp;<strong>antioxidants</strong>&nbsp;known as polyphenols, strawberries are a sodium-free, fat-free,&nbsp;<strong>cholesterol</strong>-free, low-calorie food.</p>
', CAST(420.00 AS Decimal(18, 2)), CAST(418.00 AS Decimal(18, 2)), 10, N'mainImg_6374868480000000003b01ad11496645cf810b374bab047d10.jfif', N'img1_637486848000000000fb727a5a1e8245f9bda7fa52a0d43105.jfif', N'img2_6374868480000000005eefdbd8486c4793b93b92f300d326b7.jfif', N'img3_6374868480000000006dc66fc3b8804d8e81c5352819ac4dca.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:14:22.163' AS DateTime), N'Admin', CAST(N'2021-02-12 13:14:47.850' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (38, N'MDYOSPR0000085', N'Admin', N'Orange', N'L1_3', N'L2_3', N'L3_3', N'<p>.</p>

<ul>
	<li>Oranges are among the world&rsquo;s most popular fruits.</li>
	<li>Also called sweet oranges, they grow on orange trees (<em>Citrus x sinensis</em>) and belong to a large group of fruits known as citrus fruits.</li>
	<li>Their true origin is a mystery, but the cultivation of oranges is thought to have started in eastern Asia thousands of years ago.</li>
	<li>Today, they are grown in most warm regions of the world and consumed either fresh or as juice.</li>
	<li>Oranges are a healthy source of fiber, vitamin C, thiamine, folate, and antioxidants. They have multiple health benefits.</li>
</ul>
', CAST(50.00 AS Decimal(18, 2)), CAST(48.00 AS Decimal(18, 2)), 0, N'mainImg_637486848000000000f9b4d5345085461fa27edcea42746d71.jfif', N'img1_63748684800000000074fcee9044b240e9a858f9bc1ac431d5.jfif', N'img2_637486848000000000f23377b90c5d4aeb88a51a655e5b6f33.jfif', N'img3_637486848000000000b2452d7a4ff94b4b827623f8e6184643.jfif', N'img4_637486848000000000.jfif', N'published', 1, CAST(N'2021-02-12 13:01:09.423' AS DateTime), N'Admin', CAST(N'2021-02-12 13:37:48.927' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (40, N'MDYOSPR0000058', N'Admin', N'Mango', N'L1_3', N'L2_3', N'L3_3', N'<p>A&nbsp;<strong>mango</strong>&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/Drupe">stone fruit</a>&nbsp;produced from numerous species of tropical&nbsp;<a href="https://en.wikipedia.org/wiki/Tree">trees</a>&nbsp;belonging to the&nbsp;<a href="https://en.wikipedia.org/wiki/Flowering_plant">flowering plant</a>&nbsp;genus&nbsp;<em><a href="https://en.wikipedia.org/wiki/Mangifera">Mangifera</a></em>, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the&nbsp;<a href="https://en.wikipedia.org/wiki/Cashew">cashew</a>&nbsp;family&nbsp;<a href="https://en.wikipedia.org/wiki/Anacardiaceae">Anacardiaceae</a>. Mangoes are&nbsp;<a href="https://en.wikipedia.org/wiki/Indigenous_(ecology)">native</a>&nbsp;to&nbsp;<a href="https://en.wikipedia.org/wiki/South_Asia">South Asia</a>,<a href="https://en.wikipedia.org/wiki/Mango#cite_note-Morton-1">[1]</a><a href="https://en.wikipedia.org/wiki/Mango#cite_note-mango-2">[2]</a>&nbsp;from where the &quot;common mango&quot; or &quot;Indian mango&quot;,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Mangifera_indica">Mangifera indica</a></em>, has been distributed worldwide to become one of the most widely cultivated&nbsp;<a href="https://en.wikipedia.org/wiki/Fruit">fruits</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Tropics">tropics</a>. Other&nbsp;<em>Mangifera</em>&nbsp;species (e.g. horse mango,&nbsp;<em><a href="https://en.wikipedia.org/wiki/Mangifera_foetida">Mangifera foetida</a></em>) are grown on a more localized basis.</p>
', CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, N'mainImg_637484256000000000492849f3c810427ab60a2cfa5a7329c3.jpg', N'img1_63748425600000000052714fa5aab348b4825e692088423294.jpg', N'img2_63748425600000000041103fd3ec2c49489660728adb7d7f4f.jpg', N'img3_637484256000000000b6dbc0755d1345e1a507caf3335952f2.jpg', N'img4_637484256000000000.jpg', N'published', 1, CAST(N'2021-02-09 17:58:10.897' AS DateTime), N'Admin', CAST(N'2021-02-12 14:01:55.027' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductMasterHistory] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [DeleteDate], [DeleteBy]) VALUES (41, N'MDYOSPR0000105', N'Admin', N'LG Smart TV', N'L1_9', N'L2_7', N'L3_6', N'<p>Resolution: HD Ready (1366x768) | Refresh Rate: 50 hertz<br />
Connectivity: 2 HDMI ports to connect set top box, Blu Ray players, gaming console | 1 USB ports to connect hard drives and other USB devices<br />
Sound output: 10 Watts Output I 2 Speakers | DTS Virtual:X | Sound Type : Down Firing<br />
Smart TV Features: Web OS Smart TV | Wi-Fi | Home Dashboard | Screen Mirroring | Mini TV Browser | Multi-Tasking | Office 365<br />
Display: Active HDR | Display Type: Flat | BackLight Module: Slim LED<br />
Warranty Information: 1 Year LG India Comprehensive Warranty and additional 1 year Warranty is applicable on panel/module from the date of purchase<br />
Installation: For requesting installation/wall mounting/demo of this product once delivered, please directly call LG support on 1800 180 9999/1800 315 9999 and provide product&#39;s model name as well as seller&#39;s details mentioned on the invoice<br />
Easy Returns: This product is eligible for replacement within 10 days of delivery in case of any product defects, damage or features not matching the description provided</p>
', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'mainImg_6374868480000000007334b4ccc8914362b0687be8c39be7e7.png', N'img1_6374868480000000009251cbf29136484ebd46e7dbf7060243.jpg', N'img2_63748684800000000055139d90796c47d7b3ddbd6229b8769f.jpg', N'img3_6374868480000000000724961f61a74cfd9941617a75cafbbd.jpg', N'img4_637486848000000000.jpg', N'published', 1, CAST(N'2021-02-12 15:40:30.913' AS DateTime), N'Admin', CAST(N'2021-02-12 16:03:55.840' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[tbl_ProductMasterHistory] OFF
SET IDENTITY_INSERT [dbo].[tbl_ProductMasterOffer] ON 

INSERT [dbo].[tbl_ProductMasterOffer] ([SrNo], [ProductCode], [RetailerCode], [ProductTitle], [RootCatId], [CatId], [SubCatId], [ProductDescription], [ProductMRP], [SaleRate], [CommQty], [MainImgFile], [Img1], [Img2], [Img3], [Img4], [Status], [IsActive], [EntryDate], [EntryBy], [IsMultiVariant], [IsExchangeble], [Offertype]) VALUES (1, N'MDYOSPR0000010', N'Admin', N'Sunfeast Mom''s Magic Cashew and Almond, 600g', N'L1_5', N'L2_6', N'L3_5', N'<h1>About this item</h1>

<ul>
	<li>Rich butter cookies with nuts - just the way Mom would make it</li>
	<li>Loaded with roasted cashews and almonds lending a nourishing, nutty flavour</li>
	<li>Prepared in roasted butter with sweet caramelly notes for a rich aroma and a wholesome crunch</li>
	<li>A favourite tea time snack, which is baked to golden perfection - with love</li>
	<li>An abundance of good, high quality ingredients for a cookie that is enveloped in Mom&#39;s hugs and Magical taste</li>
</ul>
', CAST(105.00 AS Decimal(18, 2)), CAST(77.00 AS Decimal(18, 2)), 10, N'offerImg_637468704000000000caa4ee88421e495e864ecf0118ade9b9.jpg', N'img1_6374687040000000006fbce6290fff49e5a5e8fcaf55e43c03.jpg', N'img2_6374687040000000009085830b48794f2c8a81d2605325150d.jpg', N'img3_6374687040000000003649c7207e294206b81d202ebe223c59.jpg', N'img4_637468704000000000.jpg', N'published', 1, CAST(N'2021-01-22 17:51:58.980' AS DateTime), N'Admin', 0, NULL, N'new')
SET IDENTITY_INSERT [dbo].[tbl_ProductMasterOffer] OFF
SET IDENTITY_INSERT [dbo].[tbl_ProductQuantityManage] ON 

INSERT [dbo].[tbl_ProductQuantityManage] ([SrNo], [ProductId], [variationId], [Quantity], [EntryDate], [EntryBy]) VALUES (1, N'MDYOSPR0000008', NULL, 10, CAST(N'2021-01-24 13:51:52.927' AS DateTime), N'divya@gmail.com')
INSERT [dbo].[tbl_ProductQuantityManage] ([SrNo], [ProductId], [variationId], [Quantity], [EntryDate], [EntryBy]) VALUES (2, N'MDYOSPR0000025', NULL, 45, CAST(N'2021-02-05 14:41:34.650' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductQuantityManage] ([SrNo], [ProductId], [variationId], [Quantity], [EntryDate], [EntryBy]) VALUES (3, N'MDYOSPR0000020', NULL, 12, CAST(N'2021-02-05 14:42:23.680' AS DateTime), N'Admin')
INSERT [dbo].[tbl_ProductQuantityManage] ([SrNo], [ProductId], [variationId], [Quantity], [EntryDate], [EntryBy]) VALUES (4, N'MDYOSPR0000032', NULL, 250, CAST(N'2021-02-08 22:57:36.277' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[tbl_ProductQuantityManage] OFF
SET IDENTITY_INSERT [dbo].[tbl_ProductVariations] ON 

INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (1, N'MDYOSPR0000013', N'12', N'1', CAST(12.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 100, 1, CAST(N'2020-12-13 21:43:03.497' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (2, N'MDYOSPR0000013', N'22', N'1', CAST(22.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 100, 1, CAST(N'2020-12-13 21:43:03.497' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (3, N'MDYOSPR0000015', N'20', N'1', CAST(20.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 1, CAST(N'2020-12-15 14:54:18.940' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (4, N'MDYOSPR0000015', N'40', N'1', CAST(40.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), 0, 1, CAST(N'2020-12-15 14:54:18.940' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (5, N'MDYOSPR0000016', N'20', N'3', CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, 1, CAST(N'2020-12-15 15:01:35.410' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (6, N'MDYOSPR0000016', N'30', N'2', CAST(30.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, 1, CAST(N'2020-12-15 15:01:35.410' AS DateTime))
INSERT [dbo].[tbl_ProductVariations] ([SrNo], [ProductId], [VariationValue], [UnitId], [MRP], [SaleRate], [Quantity], [IsActive], [EntryDate]) VALUES (7, N'MDYOSPR0000018', N'000', N'1', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, CAST(N'2020-12-18 19:17:03.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ProductVariations] OFF
SET IDENTITY_INSERT [dbo].[tbl_Retailers] ON 

INSERT [dbo].[tbl_Retailers] ([SrNo], [RetailerCode], [RetailerName], [MobileNo], [EmailAddress], [StateId], [CityId], [Address], [GSTINNo], [CINNo], [PANNo], [IsActive], [EntryDate], [BusinessName], [ZoneCode], [KYCDocumentType], [KYCDocumentNo], [KYCDocFile], [PanDoc], [TANNo], [TANDoc], [BankAccName], [AccountNumber], [BankName], [IFSCCode]) VALUES (1, N'MDYOSRT0000012', N'Rashid Husain siddiiki', N'7317411671', N'priyankaverma731741@gmail.com', NULL, NULL, N'D-233 gomti nagar vibhutikhand lucknow', N'null', N'null', N'764568727754', 1, CAST(N'2021-02-03 17:25:43.060' AS DateTime), N'Wowjinn.com', N'undefined', N'GSTIN Registration', N'876453458754', N'kyc_637479072000000000.docx', N'pan_637479072000000000.docx', N'876475636', N'tan_637479072000000000.docx', N'Priyanka verma', N'645366287435', N'ICICI', N'HJG8745476')
INSERT [dbo].[tbl_Retailers] ([SrNo], [RetailerCode], [RetailerName], [MobileNo], [EmailAddress], [StateId], [CityId], [Address], [GSTINNo], [CINNo], [PANNo], [IsActive], [EntryDate], [BusinessName], [ZoneCode], [KYCDocumentType], [KYCDocumentNo], [KYCDocFile], [PanDoc], [TANNo], [TANDoc], [BankAccName], [AccountNumber], [BankName], [IFSCCode]) VALUES (2, N'WOWJINN0000012', N'ASHIOK VERMA', N'9633696323', N'alok.784@gmail.com', NULL, NULL, N'This is trh sklfv ', N'null', N'null', N'olfgo', 1, CAST(N'2021-02-05 00:12:14.257' AS DateTime), N'TESTSHOPNAME', N'undefined', N'Firm Registration', N'KYC Registaratgaikma', N'kyc_637479936000000000.jpg', N'pan_637479936000000000.jpg', N'sdvkjbfv', N'tan_637479936000000000.jpg', N'Aanikrt sharma gkgp!@Gmailc.com', N'7412589335', N'Bank of baroda ', N'CNRBINFHY12I ')
INSERT [dbo].[tbl_Retailers] ([SrNo], [RetailerCode], [RetailerName], [MobileNo], [EmailAddress], [StateId], [CityId], [Address], [GSTINNo], [CINNo], [PANNo], [IsActive], [EntryDate], [BusinessName], [ZoneCode], [KYCDocumentType], [KYCDocumentNo], [KYCDocFile], [PanDoc], [TANNo], [TANDoc], [BankAccName], [AccountNumber], [BankName], [IFSCCode]) VALUES (3, N'WOWJINN0000015', N'Priyanka', N'7317411671', N'priyankawowjinn@gmail.com', NULL, NULL, N'd-233 vibhuti khand', N'null', N'null', N'768453453', 1, CAST(N'2021-02-06 19:17:34.770' AS DateTime), N'Wowjinn.com', N'undefined', N'Select KYC Document', N'445376578', N'kyc_637481664000000000.pdf', N'pan_637481664000000000.pdf', N'645545', N'tan_637481664000000000.pdf', N'Priyanka', N'87534523', N'icici', N'jheswrgdkuy5')
INSERT [dbo].[tbl_Retailers] ([SrNo], [RetailerCode], [RetailerName], [MobileNo], [EmailAddress], [StateId], [CityId], [Address], [GSTINNo], [CINNo], [PANNo], [IsActive], [EntryDate], [BusinessName], [ZoneCode], [KYCDocumentType], [KYCDocumentNo], [KYCDocFile], [PanDoc], [TANNo], [TANDoc], [BankAccName], [AccountNumber], [BankName], [IFSCCode]) VALUES (4, N'WOWJINN0000016', N'Aryan', N'9554145039', N'vinodverma9554@gmail.com', NULL, NULL, N' D-233, vibhutikhand, Lucknow, Uttar Pradesh', N'null', N'null', N'7317895643645', 1, CAST(N'2021-02-12 16:39:21.313' AS DateTime), N'Vinod Verma', N'undefined', N'Select KYC Document', N'63900462875345', N'kyc_637486848000000000.pdf', N'pan_637486848000000000.pdf', N'954367274538', N'tan_637486848000000000.pdf', N'Vinod Verma', N'65632483', N'BOB', N'BOB05436')
INSERT [dbo].[tbl_Retailers] ([SrNo], [RetailerCode], [RetailerName], [MobileNo], [EmailAddress], [StateId], [CityId], [Address], [GSTINNo], [CINNo], [PANNo], [IsActive], [EntryDate], [BusinessName], [ZoneCode], [KYCDocumentType], [KYCDocumentNo], [KYCDocFile], [PanDoc], [TANNo], [TANDoc], [BankAccName], [AccountNumber], [BankName], [IFSCCode]) VALUES (5, N'WOWJINN0000017', N'Rohit', N'7317411671', N'deepanshi7565ggpf@gmail.com', NULL, NULL, N'Amedkr nagar,  faizabad, uttar pradesh', N'null', N'null', N'635643562', 1, CAST(N'2021-02-12 16:48:34.793' AS DateTime), N'Rohan', N'undefined', N'Select KYC Document', N'953567435', N'kyc_637486848000000000.pdf', N'pan_637486848000000000.pdf', N'983863456', N'tan_637486848000000000.pdf', N'Rohan', N'65433256', N'BOB', N'BOB064343')
SET IDENTITY_INSERT [dbo].[tbl_Retailers] OFF
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] ON 

INSERT [dbo].[tbl_RoleMaster] ([SrNo], [RoleId], [RoleName], [IsActive]) VALUES (1, N'1', N'Admin', 1)
INSERT [dbo].[tbl_RoleMaster] ([SrNo], [RoleId], [RoleName], [IsActive]) VALUES (2, N'2', N'Retailer', 1)
INSERT [dbo].[tbl_RoleMaster] ([SrNo], [RoleId], [RoleName], [IsActive]) VALUES (3, N'3', N'Delivery Executive', 1)
INSERT [dbo].[tbl_RoleMaster] ([SrNo], [RoleId], [RoleName], [IsActive]) VALUES (4, N'4', N'Customer', 1)
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_RootCategoryMaster] ON 

INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (1, N'L1_1', N'Beverages', N'unnamed.png', 1, CAST(N'2021-02-01 20:16:34.147' AS DateTime), N'Admin', N'Beverages')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (2, N'L1_2', N'Vegetables ', N'24646-6-vegetable-photos.png', 1, CAST(N'2021-02-01 20:17:33.477' AS DateTime), N'Admin', N'Vegetables ')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (3, N'L1_3', N'Fruits', N'4-2-fruit-png-image.png', 1, CAST(N'2021-02-01 20:18:34.120' AS DateTime), N'Admin', N'Fruits')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (4, N'L1_4', N'Groceries', N'241-2413601_groceries-transparent-images-png-groceries-png-png-download.png', 1, CAST(N'2021-02-01 20:19:22.810' AS DateTime), N'Admin', N'Groceries')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (9, N'L1_9', N'Home Appliances', N'TV.jpg', 1, CAST(N'2021-02-12 15:17:52.740' AS DateTime), N'Admin', N'Electronic')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (10, N'L1_10', N'Electronic', N'Arduino_ftdi_chip-1.jpg', 1, CAST(N'2021-02-12 20:50:12.060' AS DateTime), N'Admin', N'Electronic')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (11, N'L1_11', N'Library', N'Library.jpg', 1, CAST(N'2021-02-14 13:23:52.500' AS DateTime), N'Admin', N'Books')
INSERT [dbo].[tbl_RootCategoryMaster] ([SrNo], [RootCategoryId], [RootCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (12, N'L1_12', N'Health Care & Medicines', N'medicine-removebg-preview.png', 1, CAST(N'2021-02-14 13:30:22.493' AS DateTime), N'Admin', N'Medicines')
SET IDENTITY_INSERT [dbo].[tbl_RootCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_SubCategoryMaster] ON 

INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (1, N'1', N'L3_1', N'Beverages', N'unnamed.png', 1, CAST(N'2021-02-01 20:23:02.430' AS DateTime), N'Admin', N'Beverages')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (2, N'2', N'L3_2', N'Vegetables', N'24646-6-vegetable-photos.png', 1, CAST(N'2021-02-01 20:23:18.043' AS DateTime), N'Admin', N'Vegetables')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (3, N'3', N'L3_3', N'Fruits', N'4-2-fruit-png-image.png', 1, CAST(N'2021-02-01 20:23:36.710' AS DateTime), N'Admin', N'Fruits')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (4, N'4', N'L3_4', N'Groceries', N'241-2413601_groceries-transparent-images-png-groceries-png-png-download.png', 1, CAST(N'2021-02-01 20:23:55.497' AS DateTime), N'Admin', N'Groceries')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (9, N'10', N'L3_9', N'Medicines', N'medicine-removebg-preview.png', 1, CAST(N'2021-02-14 13:39:14.613' AS DateTime), N'Admin', N'Medicines')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (6, N'7', N'L3_6', N'Electronic', N'TV.jpg', 1, CAST(N'2021-02-12 15:20:03.187' AS DateTime), N'Admin', N'Electronic')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (7, N'8', N'L3_7', N'Tableware And Dinnerware', N'WhatsApp Image 2021-02-05 at 4.38.32 PM.jpeg', 1, CAST(N'2021-02-13 14:11:36.640' AS DateTime), N'Admin', N'Tableware And Dinnerware')
INSERT [dbo].[tbl_SubCategoryMaster] ([SrNo], [CategoryId], [SubCategoryId], [SubCategoryName], [Cat_Image], [IsActive], [EntryDate], [EntryBy], [SlugName]) VALUES (8, N'9', N'L3_8', N'Books', N'Library.jpg', 1, CAST(N'2021-02-14 13:25:32.207' AS DateTime), N'Admin', N'Books')
SET IDENTITY_INSERT [dbo].[tbl_SubCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_tempCart] ON 

INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (33, N'637454459867026207603cf832a75040b08abcf417a1e39ad1', N'MDYOSPR0000008', NULL, 1, 1, CAST(N'2021-01-15 11:38:17.953' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (2, N'637444171081384931752fc00990fd4660aa30d606ea9e0f95', N'MDYOSPR0000030', NULL, 3, 1, CAST(N'2020-12-30 14:16:33.360' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (3, N'637444171081384931752fc00990fd4660aa30d606ea9e0f95', N'MDYOSPR0000024', NULL, 1, 1, CAST(N'2020-12-30 14:20:25.837' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (4, N'637444171081384931752fc00990fd4660aa30d606ea9e0f95', N'MDYOSPR0000025', NULL, 1, 1, CAST(N'2020-12-30 14:43:25.763' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (5, N'637449345020237839a6d551f014d242a7b892b0cacfc952a1', N'MDYOSPR0000030', NULL, 1, 1, CAST(N'2020-12-30 14:51:39.107' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (6, N'637449345020237839a6d551f014d242a7b892b0cacfc952a1', N'MDYOSPR0000029', NULL, 1, 1, CAST(N'2020-12-30 14:51:47.107' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (7, N'637449345020237839a6d551f014d242a7b892b0cacfc952a1', N'MDYOSPR0000024', NULL, 1, 1, CAST(N'2020-12-30 14:52:34.140' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (34, N'63746306170372641770d6d163819b445bb53d7288ca705abe', N'MDYOSPR0000008', NULL, 32, 1, CAST(N'2021-01-15 11:56:44.477' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (11, N'6374444820032472492fba3a22c10f46f597d9108c6f88f92e', N'MDYOSPR0000029', NULL, 1, 1, CAST(N'2020-12-31 00:15:50.840' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (13, N'6374511419437054867ad32e7db07c44a88334efc8bcef1b1f', N'MDYOSPR0000030', NULL, 1, 1, CAST(N'2021-01-01 16:10:17.503' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (14, N'6374444820032472492fba3a22c10f46f597d9108c6f88f92e', N'MDYOSPR0000030', NULL, 1, 1, CAST(N'2021-01-02 16:10:20.190' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (23, N'637453896369398775d2150720fb794bfab42e9ef4ff95439a', N'MDYOSPR0000002', NULL, 7, 1, CAST(N'2021-01-06 01:55:37.110' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (68, N'6374744016752405804dde5e11b4ba49cd9936ca967eb10b4e', N'MDYOSPR0000007', NULL, 1, 1, CAST(N'2021-01-28 18:14:28.067' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (42, N'637459926841189078bd9c7db41bbb494cae408227df9cf133', N'MDYOSPR0000001', NULL, 1, 1, CAST(N'2021-01-20 23:45:22.277' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (43, N'637459926841189078bd9c7db41bbb494cae408227df9cf133', N'MDYOSPR0000008', NULL, 1, 1, CAST(N'2021-01-20 23:46:08.017' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (69, N'6374744016752405804dde5e11b4ba49cd9936ca967eb10b4e', N'MDYOSPR0000010', NULL, 2, 1, CAST(N'2021-01-28 18:14:44.307' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (72, N'6374640193109137067f5185cc4f4e4b04aeee664a66447256', N'MDYOSPR0000007', NULL, 1, 1, CAST(N'2021-01-29 17:42:12.140' AS DateTime))
INSERT [dbo].[tbl_tempCart] ([SrNo], [IpCode], [ProductId], [VariationId], [Quantity], [IsActive], [EntryDate]) VALUES (73, N'6374755030929784492ccc175e3fa74b9887e264722f4e12f6', N'MDYOSPR0000007', NULL, 1, 1, CAST(N'2021-01-29 20:51:54.593' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_tempCart] OFF
SET IDENTITY_INSERT [dbo].[tbl_UnitMaster] ON 

INSERT [dbo].[tbl_UnitMaster] ([SrNo], [UnitName], [IsActive], [EntryDate]) VALUES (1, N'Gram', 1, CAST(N'2020-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_UnitMaster] ([SrNo], [UnitName], [IsActive], [EntryDate]) VALUES (2, N'KG', 1, CAST(N'2020-12-13 21:08:42.323' AS DateTime))
INSERT [dbo].[tbl_UnitMaster] ([SrNo], [UnitName], [IsActive], [EntryDate]) VALUES (3, N'ML', 1, CAST(N'2020-12-13 21:08:42.380' AS DateTime))
INSERT [dbo].[tbl_UnitMaster] ([SrNo], [UnitName], [IsActive], [EntryDate]) VALUES (4, N'Pcs', 1, CAST(N'2020-12-13 21:08:42.450' AS DateTime))
INSERT [dbo].[tbl_UnitMaster] ([SrNo], [UnitName], [IsActive], [EntryDate]) VALUES (5, N'Packs', 1, CAST(N'2020-12-13 21:08:42.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_UnitMaster] OFF
SET IDENTITY_INSERT [wowuser].[tbl_venderposition] ON 

INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (1, N'priyankaverma731741@gmail.com', N'Platinum', N'1', CAST(N'2021-01-13 15:20:16.333' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (2, N'Saxena@gmail.com', N'Gold', N'1', CAST(N'2021-01-13 15:25:46.537' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (3, N'aniket@gmail.com', N'Silver', N'1', CAST(N'2021-01-13 15:26:07.650' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (7, N'Saxena@gmail.com', N'Platinum', N'1', CAST(N'2021-01-18 21:32:46.677' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (5, N'alok.784@gmail.com', N'Platinum', N'1', CAST(N'2021-01-13 15:26:25.497' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (6, N'Saxena@gmail.com', N'Platinum', N'1', CAST(N'2021-01-13 15:27:12.303' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (8, N'priyankawowjinn@gmail.com', N'Gold', N'1', CAST(N'2021-01-21 17:50:49.730' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (9, N'Saxena@gmail.com', N'Platinum', N'1', CAST(N'2021-01-21 23:16:11.490' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (10, N'vinay@gmail.com', N'Platinum', N'1', CAST(N'2021-01-21 23:16:31.353' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (11, N'vinay@gmail.com', N'Platinum', N'1', CAST(N'2021-01-21 23:16:44.410' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (12, N'divya@gmail.com', N'Silver', N'1', CAST(N'2021-02-01 12:15:14.217' AS DateTime))
INSERT [wowuser].[tbl_venderposition] ([id], [vendername], [venderposation], [isactive], [Entrydate]) VALUES (13, N'priyankaverma731741@gmail.com', N'Silver', N'1', CAST(N'2021-02-01 12:15:14.217' AS DateTime))
SET IDENTITY_INSERT [wowuser].[tbl_venderposition] OFF
/****** Object:  StoredProcedure [dbo].[Activeproc]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Activeproc]
(
@RespoCode varchar(50),
@Action int
)
as begin 
if @Action='1' 
begin  
update  dbo.tbl_LoginMaster set IsActive='1' where UserName=@RespoCode
--update tbl_Retailers set IsActive='1' where EmailAddress=@RespoCode
end
if @Action='2' 
begin  
update  dbo.tbl_LoginMaster set IsActive='0' where UserName=@RespoCode
--update tbl_Retailers set IsActive='0' where EmailAddress=@RespoCode
end
end


GO
/****** Object:  StoredProcedure [dbo].[APIBanner]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[APIBanner]
(
@Action int
)as begin 
if(@Action='1')
begin
select t.*,'../OfferImage/'+t.OfferImage as OfferImages  from  tbl_offermaster t where Isactive=1
 end
end
GO
/****** Object:  StoredProcedure [dbo].[APIGetOrderDetails]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[APIGetOrderDetails]
(
@Action int =null,
@emailid varchar(50)=null,
@srno varchar(50)=null
)as begin 
if(@Action='1')
begin 

select distinct  p.Entrydate, p.Fullname,p.Mobilenumber,(p.Address+','+p.City+'-'+p.Pincode) as deliveryaddress,o.orderid 
from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode 
inner join dbo.view_venderlist r on pm.RetailerCode=r.vcode
 where p.orderid in (select orderid from  dbo.orderlisttable where ProductCode in (Select ProductCode
  from tbl_ProductMaster where RetailerCode=isnull(@emailid,RetailerCode)))  order by p.Entrydate desc 


end
if(@Action='2')
begin 

select o.status  as orderstatus, o.Orderaccepted,o.Dileverydate,o.DispatchdDate,o.ProductId,'' EmailAddress, p.status,p.Entrydate, p.Fullname,
p.Mobilenumber,(p.Address+','+p.City+','+p.Pincode) as deliveryaddress,pm.ProductTitle,('../ProductImages/'+pm.Img1)as path,
r.vName RetailerName,o.Qty, o.orderid,o.SaleRate,o.unitrate as PerProducrPrice 
from placeoperlist p 
inner join dbo.orderlisttable o on o.orderid=p.orderid
 inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode 
inner join dbo.view_venderlist r on pm.RetailerCode=r.vcode
 where o.orderid=isnull(@srno,o.orderid) 
 and r.vcode= ISNULL(@emailid,r.vcode)
end

end

GO
/****** Object:  StoredProcedure [dbo].[APIGetReailerLogin]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[APIGetReailerLogin]
(
@Action int=null,
@username varchar(50)=null,
@password varchar(50)=null
)
as
begin 
if(@Action='1')
begin 
if(exists (select * from tbl_LoginMaster where  UserName=@username and Password=@password ))
begin 
select * from tbl_LoginMaster where  RoleType='2' and UserName=@username and Password=@password
end
else
begin 
select 'Record Not Found' as msg
end
end
end

GO
/****** Object:  StoredProcedure [dbo].[getsearchauto]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getsearchauto]
(
@Action int,
@catid varchar(50)=null,
@value varchar(50)=null
)as begin 
if @Action='1'
begin 
select p.ProductCode,p.ProductTitle,p.ProductMRP,p.SaleRate from tbl_ProductMaster p  where p.CatId=@catid order by SrNo desc 
end
if(@Action='2')
begin 
if exists(select CatId from tbl_ProductMaster  where CatId=@value)
begin
select * from tbl_ProductMaster where (ProductTitle like '%'+@catid+'%' or  ProductTitle=@catid) and CatId=ISNULL(@value,CatId)
end
else
begin 
select * from tbl_ProductMaster where (ProductTitle like '%'+@catid+'%' or  ProductTitle=@catid) 

end
end
end





GO
/****** Object:  StoredProcedure [dbo].[GetSearchProcduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSearchProcduct]
(
@Search varchar(50)=null

)as
 begin
 select * from tbl_ProductMaster where ProductTitle like @Search+'%'
 end

GO
/****** Object:  StoredProcedure [dbo].[orderreport]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[orderreport]		--	exec orderreport '2',null,'alok.784@gmail.com','01-Nov-2020','30-Dec-2020',null
(
@Action varchar(50)=null,
@srno  varchar(50)=null,
@emailid varchar(100)=null,
@fromdate date=null,
@todate date=null,
@orderid varchar(100)=null
)
as begin 
if @Action='1'
begin 
select distinct  p.Entrydate, p.Fullname,p.Mobilenumber,(p.Address+','+p.City+'-'+p.Pincode) as deliveryaddress,o.orderid 
from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode 
inner join dbo.view_venderlist r on pm.RetailerCode=r.vcode
 where p.orderid in (select orderid from  dbo.orderlisttable where ProductCode in (Select ProductCode
  from tbl_ProductMaster where RetailerCode=isnull(@emailid,RetailerCode)))  order by p.Entrydate desc 

select o.status  as orderstatus, o.Orderaccepted,o.Dileverydate,o.DispatchdDate,o.ProductId,'' EmailAddress, p.status,p.Entrydate, p.Fullname,
p.Mobilenumber,(p.Address+','+p.City+','+p.Pincode) as deliveryaddress,pm.ProductTitle,('../ProductImages/'+pm.Img1)as path,
r.vName RetailerName,o.Qty, o.orderid,o.SaleRate,o.unitrate as PerProducrPrice 
from placeoperlist p 
inner join dbo.orderlisttable o on o.orderid=p.orderid
 inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode 
inner join dbo.view_venderlist r on pm.RetailerCode=r.vcode
 where o.orderid=isnull(@srno,o.orderid) 
 and r.vcode= ISNULL(@emailid,r.vcode)

end
if(@Action='2')
begin 
select distinct  p.Entrydate, p.Fullname,p.Mobilenumber,(p.Address+','+p.City+'-'+p.Pincode) as deliveryaddress,o.orderid
 from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
 inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode inner join tbl_Retailers r 
 on pm.RetailerCode=r.EmailAddress where r.EmailAddress=ISNULL(@emailid,r.EmailAddress) and  
cast(p.Entrydate as date)>=isnull(cast(@fromdate as date),cast(p.Entrydate as date))
and cast(p.Entrydate as date)<=isnull(cast(@todate as date),CAST(p.Entrydate as date)) and p.orderid=isnull(@orderid,p.orderid)

end
if(@Action='3')
begin 
select distinct  p.Entrydate, p.Fullname,p.Mobilenumber,(p.Address+','+p.City+'-'+p.Pincode) as deliveryaddress,o.orderid
 from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
 inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode inner join tbl_Retailers r 
 on pm.RetailerCode=r.EmailAddress where --r.EmailAddress=ISNULL(@emailid,r.EmailAddress)and 
  
cast(p.Entrydate as date)>=isnull(cast(@fromdate as date),cast(p.Entrydate as date))
and cast(p.Entrydate as date)<=isnull(cast(@todate as date),CAST(p.Entrydate as date)) and p.orderid=isnull(@orderid,p.orderid)
end
end



--select * from  dbo.orderlisttable

--select * from dbo.placeoperlist

--select * from tbl_ProductMaster


--select * from dbo.view_venderlist

--create view dbo.view_venderlist
--as 
--select CompanyId vcode,CompanyName vname from dbo.tbl_CompanyMaster
--union all 
--select RetailerCode as vcode,RetailerName as vname from tbl_Retailers

--select * from tbl_ProductMaster
select * from dbo.orderlisttable

select * from placeoperlist
GO
/****** Object:  StoredProcedure [dbo].[poccustomerlist]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[poccustomerlist]
(
@Action varchar(50)
)as begin 
if @Action='1'
begin 
select * from tbl_CustomerMaster c inner join Tbl_CustomerAddress p on p.Customercode=c.MobileNo
end
end
GO
/****** Object:  StoredProcedure [dbo].[proc_AddProduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_AddProduct]
@Productcodes VARCHAR(20)=NULL,
@Action VARCHAR(20),
@retailercode VARCHAR(50)=NULL,
@producttitle VARCHAR(500)=NULL,
@rootcatid VARCHAR(20)=NULL,
@catid VARCHAR(20)=NULL,
@subcatid VARCHAR(20)=NULL,
@productdescription NVARCHAR(max)=NULL,
@productmrp DECIMAL(18,2)=NULL,
@salerate DECIMAL(18,2)=NULL,
@commqty BIGINT=NULL,
@mainimgfile VARCHAR(1000)=NULL,
@img1 VARCHAR(1000)=NULL,
@img2 VARCHAR(1000)=NULL,
@img3 VARCHAR(1000)=NULL,
@img4 VARCHAR(1000)=NULL,
@entryby VARCHAR(50)=NULL,
@ProductType BIT=NULL,
@IsExchangeble BIT=NULL,
@tbl_VariationList tbl_VariationList readonly,
@Offertype varchar(100)=null,
@percentage decimal(18, 0)=null,
@deliverycharge decimal(18, 0)=null,
@offerproductid varchar(50)=null,
@Isofferproduct varchar(50)=null,
@Offerimage varchar(max)=null

AS
BEGIN

	IF(@Action='1')
		BEGIN
		DECLARE @productcode VARCHAR(20);		
		
		
				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(ProductCount),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				SET @productcode='MDYOSPR'+convert(VARCHAR,@CountNo)	 
		
		
			INSERT INTO dbo.tbl_ProductMaster (ProductCode,RetailerCode, ProductTitle, RootCatId, CatId, SubCatId, ProductDescription,
			 ProductMRP, SaleRate, CommQty, MainImgFile, Img1, Img2, Img3, Img4, Status, IsActive, EntryDate, EntryBy,IsMultiVariant,IsExchangeble,percentage,deliverycharge,offerproductid,Isofferproduct,Offerimage)
			 
			VALUES (@productcode,@retailercode, @producttitle, @rootcatid, @catid, @subcatid, @productdescription, @productmrp,
			 @salerate, @commqty, @mainimgfile, @img1, @img2, @img3, @img4, 'published', 1, getdate(), @entryby,@ProductType,@IsExchangeble,@percentage,@deliverycharge,@offerproductid,@Isofferproduct,@Offerimage)  
			 
			 
			 IF(EXISTS(SELECT * FROM @tbl_VariationList)) 
			 BEGIN
			 	INSERT INTO dbo.tbl_ProductVariations (ProductId, VariationValue,UnitId, MRP, SaleRate, Quantity,
			 	 IsActive, EntryDate)
				SELECT @productcode,VariationValue,UnitId, MRP, SaleRate, Quantity,1,getdate() FROM @tbl_VariationList
			 END 
			 
			 UPDATE tbl_Counter SET ProductCount=@Count			 
			 
			 SELECT 1 AS id,'Product Details Successfully Saved.'msg;
		
		END 

IF(@Action='2')
		BEGIN
		UPDATE dbo.tbl_ProductMaster set ProductTitle=@producttitle,RootCatId=@rootcatid, CatId=@catid, SubCatId=@subcatid, ProductDescription=@productdescription,
			 ProductMRP=@productmrp, SaleRate=@salerate, CommQty=@commqty,percentage=@percentage,deliverycharge=@deliverycharge where ProductCode=@Productcodes
		 SELECT 1 AS id,'Product Details Updated Successfully.'msg;
		END

END


select * from dbo.tbl_ProductMaster
GO
/****** Object:  StoredProcedure [dbo].[proc_AddProductoffer]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_AddProductoffer]
@Action VARCHAR(20),
@retailercode VARCHAR(50)=NULL,
@producttitle VARCHAR(500)=NULL,
@rootcatid VARCHAR(20)=NULL,
@catid VARCHAR(20)=NULL,
@subcatid VARCHAR(20)=NULL,
@productdescription NVARCHAR(max)=NULL,
@productmrp DECIMAL(18,2)=NULL,
@salerate DECIMAL(18,2)=NULL,
@commqty BIGINT=NULL,
@mainimgfile VARCHAR(1000)=NULL,
@img1 VARCHAR(1000)=NULL,
@img2 VARCHAR(1000)=NULL,
@img3 VARCHAR(1000)=NULL,
@img4 VARCHAR(1000)=NULL,
@entryby VARCHAR(50)=NULL,
@ProductType BIT=NULL,
@IsExchangeble BIT=NULL,
@Offertype varchar(100)=null,


@tbl_VariationList tbl_VariationList readonly
AS
BEGIN

	IF(@Action='1')
		BEGIN
		DECLARE @productcode VARCHAR(20);		
		
		
				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(offerproduct),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				SET @productcode='MDYOSPR'+convert(VARCHAR,@CountNo)	 
		
		
			INSERT INTO [dbo].[tbl_ProductMasterOffer] (RetailerCode,offertype,ProductCode, ProductTitle, RootCatId, CatId, SubCatId, ProductDescription,
			 ProductMRP, SaleRate, CommQty, MainImgFile, Img1, Img2, Img3, Img4, Status, IsActive, EntryDate, EntryBy,IsMultiVariant,IsExchangeble)
			 
			VALUES ('Admin',@Offertype,@productcode, @producttitle, @rootcatid, @catid, @subcatid, @productdescription, @productmrp,
			 @salerate, @commqty, @mainimgfile, @img1, @img2, @img3, @img4, 'published', 1, getdate(), 'Admin',@ProductType,@IsExchangeble)  
			 
			 
			 IF(EXISTS(SELECT * FROM @tbl_VariationList)) 
			 BEGIN
			 	INSERT INTO dbo.tbl_ProductVariations (ProductId, VariationValue,UnitId, MRP, SaleRate, Quantity,
			 	 IsActive, EntryDate)
				SELECT @productcode,VariationValue,UnitId, MRP, SaleRate, Quantity,1,getdate() FROM @tbl_VariationList
			 END 
			 
			 UPDATE tbl_Counter SET offerproduct=@Count			 
			 
			 SELECT 1 AS id,'Product Details Successfully Saved.'msg;
		
		END 
if (@Action='2')
begin 

select top 2  m.*,t.CategoryName from [dbo].[tbl_ProductMasterOffer] m  join tbl_CategoryMaster t on t.CategoryId=m.CatId where m.IsActive='1' order by m.SrNo desc


select   m.*,t.CategoryName,r.RootCategoryName from [dbo].[tbl_ProductMasterOffer] m  join tbl_CategoryMaster t on t.CategoryId=m.CatId inner join tbl_RootCategoryMaster r on m.RootCatId=r.RootCategoryId  where m.IsActive='1' 
end

IF @ACTION='3'
BEGIN 
DELETE FROM [dbo].[tbl_ProductMasterOffer] WHERE ProductCode=@retailercode
select 1 as id,'Record Deleted Succcessfully ! ! !' as msg
END
END




GO
/****** Object:  StoredProcedure [dbo].[proc_AddToCart]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_AddToCart]
@Action VARCHAR(20),
@IpAddress VARCHAR(100)=NULL,
@CustomerCode VARCHAR(50)=NULL,
@ProductId VARCHAR(50)=NULL,
@VariationId VARCHAR(50)=NULL,
@Quantity BIGINT=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
	  
			IF(NOT EXISTS(SELECT * FROM tbl_tempCart WHERE IpCode=@IpAddress AND ProductId=@ProductId AND isnull(VariationId,'')=isnull(@VariationId,'')))
			BEGIN
				INSERT INTO dbo.tbl_tempCart (IpCode, ProductId, VariationId, Quantity, IsActive, EntryDate)
				VALUES (@IpAddress, @ProductId, @VariationId, @Quantity, 1, getdate())	 
				SELECT 1 AS id		
			END 
			ELSE
			BEGIN
				UPDATE tbl_tempCart SET Quantity=isnull(Quantity,0)+@Quantity WHERE IpCode=@IpAddress AND ProductId=@ProductId
				SELECT 1 AS id		
			END 
		END
	IF(@Action='2')
		BEGIN 
					
			SELECT a.SrNo,a.IpCode,a.ProductId,a.VariationId,a.Quantity,b.ProductTitle,'../ProductImages/'+b.MainImgFile AS Path,
			c.VariationValue+' '+d.UnitName AS VarName
			,
			CASE WHEN isnull(b.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductId AND SrNo=a.VariationId) ELSE b.SaleRate END
			  AS UnitRate,
			  	(a.Quantity*(CASE WHEN isnull(b.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductId AND SrNo=a.VariationId) ELSE b.SaleRate END))
			  AS SaleRate
			 FROM tbl_tempCart a 
			JOIN tbl_ProductMaster b ON a.ProductId=b.ProductCode
			LEFT JOIN tbl_ProductVariations c ON a.VariationId=c.SrNo
			LEFT JOIN tbl_UnitMaster d ON c.UnitId=d.SrNo
			WHERE IpCode=@IpAddress 
			 				
		END 
	IF(@Action='3')
		BEGIN
			DELETE FROM tbl_tempCart WHERE SrNo=@ProductId AND IpCode=@IpAddress
			
			SELECT 1 AS id		
		END
	IF(@Action='4')
		BEGIN	  
			IF(NOT EXISTS(SELECT * FROM tbl_MainCart WHERE CustomerCode=@CustomerCode AND ProductId=@ProductId AND isnull(VariationId,'')=isnull(@VariationId,'')))
			BEGIN
				INSERT INTO dbo.tbl_MainCart (CustomerCode, ProductId, VariationId, Quantity, IsActive, EntryDate)
				VALUES (@CustomerCode, @ProductId, isnull (@VariationId,''), @Quantity, 1, getdate())	 
				SELECT 1 AS id		
			END 
			ELSE
			BEGIN
				UPDATE tbl_MainCart SET Quantity=isnull(Quantity,0)+@Quantity WHERE CustomerCode=@CustomerCode AND ProductId=@ProductId
				SELECT 1 AS id		
			END 
		END
	IF(@Action='5')
		BEGIN	  
			IF(EXISTS(SELECT * FROM tbl_tempCart WHERE IpCode=@IpAddress))
			BEGIN
			  IF(NOT EXISTS(SELECT b.* FROM tbl_MainCart a JOIN tbl_tempCart b ON a.ProductId=b.ProductId AND isnull(a.VariationId,'')=isnull(b.VariationId,'') AND b.IpCode=@IpAddress))
				BEGIN
					INSERT INTO dbo.tbl_MainCart (CustomerCode, ProductId, VariationId, Quantity, IsActive, EntryDate)
					SELECT @CustomerCode,ProductId,VariationId,Quantity,1,getdate() FROM tbl_tempCart WHERE IpCode=@IpAddress
					SELECT 1 AS id	
				END	
				
			 IF(EXISTS(SELECT b.* FROM tbl_MainCart a JOIN tbl_tempCart b ON a.ProductId=b.ProductId AND isnull(a.VariationId,'')=isnull(b.VariationId,'') AND b.IpCode=@IpAddress))
				BEGIN
					UPDATE a SET a.Quantity=(a.Quantity+b.Quantity) FROM tbl_MainCart a JOIN tbl_tempCart b ON a.ProductId=b.ProductId 
					AND isnull(a.VariationId,'')=isnull(b.VariationId,'') AND b.IpCode=@IpAddress AND a.CustomerCode=@CustomerCode
					SELECT 1 AS id		
				END
				
				DELETE FROM tbl_tempCart WHERE IpCode=@IpAddress			   
			END 
			
		END
	IF(@Action='6')
		BEGIN
			DELETE FROM tbl_MainCart WHERE ProductId=@ProductId AND CustomerCode=@CustomerCode	
			
			SELECT 1 AS id		
		END
	IF(@Action='7')
		BEGIN 
					
			SELECT a.SrNo,a.CustomerCode IpCode,a.ProductId,a.VariationId,a.Quantity,b.ProductTitle,b.ProductMRP,b.ProductDescription,'../ProductImages/'+b.MainImgFile AS Path,
			c.VariationValue+' '+d.UnitName AS VarName
			,
			CASE WHEN isnull(b.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductId AND SrNo=a.VariationId) ELSE b.SaleRate END
			  AS UnitRate,r.RetailerName,r.RetailerCode,
			  	(a.Quantity*(CASE WHEN isnull(b.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductId AND SrNo=a.VariationId) ELSE b.SaleRate END))
			  AS SaleRate
			 FROM tbl_MainCart a 
			JOIN tbl_ProductMaster b ON a.ProductId=b.ProductCode
			LEFT JOIN tbl_ProductVariations c ON isnull(a.VariationId,'')=c.SrNo
			LEFT JOIN tbl_UnitMaster d ON c.UnitId=d.SrNo 
			left join tbl_Retailers r on b.RetailerCode=r.RetailerCode
			WHERE CustomerCode=@CustomerCode

			select top 1 * from Tbl_CustomerAddress where Customercode=@CustomerCode
		END 

END


GO
/****** Object:  StoredProcedure [dbo].[proc_api_addaddress]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[proc_api_addaddress]
(
@srno int=null,
@Customercode varchar(50)=null,
@Fullname varchar(200)=null,
@Mobilenumber varchar(20)=null,
@address varchar(max)=null,
@stateid varchar(15)=null,
@cityid varchar(15)=null,
@zoneid varchar(15)=null,
@pincode varchar(15)=null,
@landmark varchar(max)=null,
@addresstype varchar(20)=null
)as begin 

insert into tbl_customeraddress (Customercode,Fullname,Mobilenumber,address,stateid,cityid,zoneid,pincode,landmark,addresstype,isdefault,Entrydate,isactive)
                             select @Customercode,@Fullname,@Mobilenumber,@address,@stateid,@cityid,@zoneid,@pincode,@landmark,@addresstype,1,GETDATE(),1

select 1 as srno,'Address Add Successfully'as msg 
end



GO
/****** Object:  StoredProcedure [dbo].[proc_api_addresslist]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_api_addresslist]
(
@Mobilenumber varchar(20)=null
)
as begin 
select * from tbl_customeraddress where Mobilenumber=@Mobilenumber
end



GO
/****** Object:  StoredProcedure [dbo].[proc_api_customerregistration]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_api_customerregistration]
(
@Action int,
@CustomerName varchar(100)=null,
@MobileNo varchar(20)=null,
@EmailAddress varchar(200)=null,
@ProfilePic varchar(200)=null,
@password VARCHAR(20)=null
) as
begin 
IF(@Action=1)
begin 
                 DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(Customer),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				--set @password=(SELECT CAST((RAND() * (899999) + 100000) as int))
                DECLARE @CustomerId VARCHAR(50) SET @CustomerId='CUST'+CAST((SELECT isnull(max(SrNo),0)+1 FROM tbl_CustomerMaster) AS VARCHAR) 



insert into tbl_CustomerMaster(CustomerId,CustomerName,MobileNo,EmailAddress,ProfilePic,IsActive,EntryDate)values
(@CustomerId,@CustomerName,@MobileNo,@EmailAddress,isnull('',''),1,GETDATE());
UPDATE tbl_Counter SET RetailerCount=@Count

INSERT INTO dbo.tbl_LoginMaster (BranchCode, UserName, Password, RoleType, EntryDate, IsActive, Name)
				VALUES ('101', @MobileNo, @password, '4', getdate(), 1, @CustomerName)

 SELECT 1 AS id,'Great!  Account Successfully Created.'msg
end
else
begin 
SELECT 0 AS id,'error'msg
end
end



GO
/****** Object:  StoredProcedure [dbo].[proc_api_customerverification]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_api_customerverification]
(
@mobile varchar(20)
) as
begin 
IF(EXISTS(SELECT * FROM tbl_CustomerMaster WHERE MobileNo=@mobile))
begin 
select 1 as Srno
end
else
begin 
select 0 as Srno
end
end



GO
/****** Object:  StoredProcedure [dbo].[proc_api_deleteaddresslist]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_api_deleteaddresslist]
(
@Mobilenumber varchar(20)=null,
@srno varchar (20)=null
)
as begin 
delete from tbl_customeraddress where Mobilenumber=@Mobilenumber and srno=@srno
select 'Record Delete Successfully' as msg
end


GO
/****** Object:  StoredProcedure [dbo].[proc_api_getcustomerprofile]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_api_getcustomerprofile]
(
@mobile varchar(20)
)
as begin 
 
select * from  dbo.tbl_CustomerMaster where MobileNo=@mobile and IsActive=1
end



GO
/****** Object:  StoredProcedure [dbo].[proc_AssignProductToRetailer]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_AssignProductToRetailer]
@RetailerId VARCHAR(50),
@type_ProductAssignList type_ProductAssignList readonly
AS
BEGIN

		INSERT INTO dbo.tbl_RetailersProductList (RetailerId, ProductId, VariationId, MRP, SaleRate, AvailableStock, IsActive, EntryDate)
		SELECT @RetailerId,ProductId,VariationId,MRP,SaleRate,AvlStock,1,getdate() FROM @type_ProductAssignList
		
		SELECT 1 AS id,'Product Successfully assigned to Retailer.'msg
	
END


GO
/****** Object:  StoredProcedure [dbo].[PROC_BannerListing]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_BannerListing]
(
@Srno int=null,
@Categoryid varchar(50)=null,
@Title varchar (200)=null,
@ButtonText varchar(200)=null,
@BannerType varchar(200)=null,
@TagLine varchar(200)=null,
@BannerFor varchar(200)=null,
@BannerImagePath varchar(max)=null,
@Action int,
@Ref varchar(50)
)
as begin 
if(@Action='1')
begin 
insert into Tbl_BannerListing (Categoryid,Title,ButtonText,BannerType,TagLine,BannerFor,BannerImagePath,EntryDate,IsActive,EntryBy)
select @Categoryid,@Title,@ButtonText,@BannerType,@TagLine,@BannerFor,@BannerImagePath,GETDATE(),'1','Admin'
select 1 as Srno ,'Banner  add Successfully !!'as msg
end
if(@Action='2')
begin 
SELECT * FROM Tbl_BannerListing WHERE IsActive='1'
end
if(@Action='3')
begin 
SELECT * FROM Tbl_BannerListing WHERE IsActive='1' and Srno=@Ref
end

if(@Action='4')
begin 
UPDATE  Tbl_BannerListing SET 
Categoryid=@Categoryid,Title=@Title,ButtonText=@ButtonText,BannerType=@BannerType,TagLine=@TagLine,BannerFor=@BannerFor,BannerImagePath=@BannerImagePath  WHERE  Srno=@Ref
end

if(@Action='5')
begin 
DELETE FROM Tbl_BannerListing WHERE IsActive='1' and Srno=@Ref
end
end


GO
/****** Object:  StoredProcedure [dbo].[proc_BindHomePoge]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_BindHomePoge]
@Action VARCHAR(20)
AS
BEGIN

	IF(@Action='1')
		BEGIN
			SELECT RootCategoryId CategoryId,RootCategoryName CategoryName FROM tbl_RootCategoryMaster WHERE IsActive=1
			UNION ALL 
			SELECT CategoryId,CategoryName CategoryName FROM tbl_CategoryMaster WHERE IsActive=1
			UNION ALL 
			SELECT SubCategoryId CategoryId,SubCategoryName CategoryName FROM tbl_SubCategoryMaster WHERE IsActive=1
		END 

END


GO
/****** Object:  StoredProcedure [dbo].[proc_CategoryMaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_CategoryMaster]
(
@SrNo int=null,
@CategoryName varchar(200)=null,
@Cat_Image varchar(200)=null,
@Action int ,
@SlugName varchar(200)=null,
@RootCategoryId varchar(20)=null
)
as begin 
if @Action='1'
	BEGIN
			IF(NOT EXISTS(SELECT * FROM tbl_CategoryMaster WHERE CategoryName=@CategoryName AND SlugName=@SlugName))
			BEGIN 	     
		   		DECLARE @CategoryId VARCHAR(20)
                SET @CategoryId='L2_'+CAST((SELECT ISNULL(max(SrNo),0)+1 FROM tbl_CategoryMaster)AS VARCHAR)


				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(CategoryCount),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				


				INSERT INTO dbo.tbl_CategoryMaster (RootCategoryId,CategoryId,CategoryName,Cat_Image,EntryDate,EntryBy,SlugName,IsActive)
				SELECT @RootCategoryId, @CategoryId,@CategoryName ,@Cat_Image,getdate(),'Admin',@SlugName,1
				
				SELECT 1 AS id,'Category Successfully Added.'msg

				UPDATE tbl_Counter SET CategoryCount=@Count
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,' Category or Slug already added.'msg
			END 
		
		END

		if @Action='2'
		begin 
	
		--select *,b.RootCategoryName  from tbl_CategoryMaster c inner join tbl_RootCategoryMaster b on c.RootCategoryId=b.RootCategoryId   where c.IsActive=1
			select c.*,b.RootCategoryName,'../categorydoc/'+c.Cat_Image ImgPath from tbl_CategoryMaster c  inner join tbl_RootCategoryMaster b on c.RootCategoryId=b.RootCategoryId
		end

		if @Action='3'
		begin 
		select * from tbl_CategoryMaster where IsActive=1 and SrNo=@SrNo
		end

		if @Action='4'
		begin 
		update tbl_CategoryMaster  set RootCategoryId=@RootCategoryId, CategoryName=@CategoryName,Cat_Image=isnull (@Cat_Image,Cat_Image),SlugName=@SlugName  where  SrNo=@SrNo
		SELECT 1 AS id,' Category update successfully !!!.'msg
		end

		if @Action='5'
		begin 
		delete from  tbl_CategoryMaster    where  SrNo=@SrNo
		END
		if @Action='6'
		BEGIN 
			SELECT CategoryId,CategoryName,'../categorydoc/'+Cat_Image ImgPath FROM tbl_CategoryMaster WHERE IsActive=1
		END
		IF @Action='7'
		begin 
			SELECT RootCategoryId,RootCategoryName,'../categorydoc/'+Cat_Image ImgPath FROM tbl_RootCategoryMaster WHERE IsActive=1
		end

		IF @Action='8'
		BEGIN 
			SELECT CategoryId,CategoryName FROM tbl_CategoryMaster
		END

end



GO
/****** Object:  StoredProcedure [dbo].[proc_cducatcatewise]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[proc_cducatcatewise]
(
@Action int,
@id varchar(50)
)
as begin 
if @Action='1'
begin 
select p.*,c.* from tbl_ProductMaster p  inner join tbl_CategoryMaster c on p.CatId=c.CategoryId where c.CategoryId=@id and p.isActive=1
end
end
GO
/****** Object:  StoredProcedure [dbo].[proc_customerAddress]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_customerAddress]
(
@srno int=null,
@Customercode varchar(50)=null,
@Fullname varchar(200)=null,
@Mobilenumber varchar(20)=null,
@Pincode varchar(10)=null,
@Locality varchar(100)=null,
@Address varchar(max)=null,
@City varchar(100)=null,
@State varchar(100)=null,
@Landmark varchar(100)=null,
@Alternatemobile varchar(20)=null,
@Addresstype varchar(100)=null,
@Action int
)as begin

if @Action='1'
begin 
if  not exists(select * from Tbl_CustomerAddress where Customercode=@Customercode) 
begin
 insert into Tbl_CustomerAddress
  (Customercode,Fullname,Mobilenumber,Pincode,Locality,Address,City,State,Landmark,Alternatemobile,Addresstype,Isactive,Entrydate) 
  values
  (@Customercode,@Fullname,@Mobilenumber,@Pincode,@Locality,@Address,@City,@State,@Landmark,@Alternatemobile,@Addresstype,1,GETDATE())
  end
  else
  begin   
   update Tbl_CustomerAddress set Fullname=@Fullname,Mobilenumber=@Mobilenumber,Pincode=@Pincode,Locality=@Locality,
   Address=@Address,City=@City,State=@State,Landmark=@Landmark,Alternatemobile=@Alternatemobile,Addresstype=@Addresstype  
  where Customercode=@Customercode
  end
end
end 


GO
/****** Object:  StoredProcedure [dbo].[proc_customerregistration]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_customerregistration]
(
@Action int=null,
@MobileNo varchar(20)=null,
@emailid varchar(200)=null,
@custmername varchar(100)=null,
@gender varchar(50)=null,
@password VARCHAR(20)=null
) 
as
begin 
IF(@Action=1)
begin 

	IF(NOT EXISTS(SELECT * FROM tbl_LoginMaster WHERE UserName=@MobileNo))
	BEGIN
		
					DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 				SET @Count=(SELECT isnull(max(Customer),0)+1 FROM tbl_Counter)														   
					SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
					--set @password=(SELECT CAST((RAND() * (899999) + 100000) as int))
					
                	DECLARE @CustomerId VARCHAR(50) SET @CustomerId='CUST'+@CountNo
                
					insert into tbl_CustomerMaster(CustomerId,CustomerName,MobileNo,IsActive,EntryDate,EmailAddress,Gender)values
					(@CustomerId,@custmername,@MobileNo,1,GETDATE(),@emailid,@gender);
					  
					
					INSERT INTO dbo.tbl_LoginMaster (BranchCode, UserName, Password, RoleType, EntryDate, IsActive, Name)
					VALUES ('103', @MobileNo, @password, '4', getdate(), 1, @custmername)	 
									
					UPDATE tbl_Counter SET Customer=@Count		   
							
					 SELECT 1 AS id,'Great!  Account Successfully Created.'msg,@password AS Pwd,@MobileNo AS UserName,'Guest' AS Name,'4' AS RoleType
	
	END
	ELSE
	BEGIN
		SELECT 0 AS id,'This Mobile No. already exists.'msg
	END  
		 
end
else
begin 
SELECT 0 AS id,'error'msg
end
end


GO
/****** Object:  StoredProcedure [dbo].[proc_DistrictMaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_DistrictMaster]
@Action VARCHAR(20)=NULL,
@CityName VARCHAR(100)=NULL,
@StateId VARCHAR(20)=NULL,
@RefID VARCHAR(10)=NULL,
@EntryBy VARCHAR(50)=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
			IF(NOT EXISTS(SELECT * FROM MasterCity WHERE City=@CityName AND Stateid=@StateId))
			BEGIN 	     
		   		
				INSERT INTO dbo.MasterCity (Stateid,City,EntryDate,IsActive)
				SELECT @StateId,@CityName,getdate(),1
				
				SELECT 1 AS id,'City Successfully Added.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'City already added.'msg
			END 
		
		END
	IF(@Action='2')
		BEGIN
			SELECT a.*,format(a.EntryDate,'dd-MMM-yyyy hh:mm tt')AddedOn,b.State AS StateName FROM MasterCity a 
			JOIN MasterState b ON a.Stateid=b.Stateid ORDER BY City
			
			
			
		END 
	IF(@Action='3')
		BEGIN
			SELECT * FROM MasterCity WHERE Cityid=@RefID
		END 
	IF(@Action='4')
		BEGIN
			IF(EXISTS(SELECT * FROM MasterCity WHERE Cityid=@RefID))
			BEGIN
				UPDATE MasterCity SET Stateid=@StateId,City=@CityName WHERE Cityid=@RefID
			   
				
				SELECT 1 AS id,'City Successfully updated.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'City details not found.'msg
			END 
		
		END
	IF(@Action='5')
		BEGIN
			IF(EXISTS(SELECT * FROM MasterCity WHERE Cityid=@RefID))
			BEGIN
				DELETE FROM MasterCity WHERE Cityid=@RefID
			   
				
				SELECT 1 AS id,'City Successfully deleted.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'City details not found.'msg
			END 
		
		END
END


GO
/****** Object:  StoredProcedure [dbo].[proc_GetListedProduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_GetListedProduct]		--  EXEC proc_GetListedProduct '7',NULL,'L1_1'			
@Action VARCHAR(20),
@ProductId VARCHAR(2000)=NULL,
@Category VARCHAR(200)=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
			SELECT a.ProductCode,e.BusinessName+'('+a.RetailerCode+')' AS Saller,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId
			JOIN tbl_Retailers e ON a.RetailerCode=e.RetailerCode
			ORDER BY a.EntryDate DESC
		END 
	IF(@Action='2')
		BEGIN
	
			SELECT a.ProductCode,e.BusinessName AS Saller,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN CAST(round(((a.ProductMRP-a.SaleRate)/((a.ProductMRP+a.SaleRate)/2))*100,0) AS DECIMAL(18,0)) ELSE 0 END AS DiscPer,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '0' ELSE '1' END	IsMultiVariant,
			 CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 MRP FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) ELSE a.ProductMRP END
			  AS ProductMRP	,
			   CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) 
			 ELSE a.SaleRate END AS SaleRate
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId
			JOIN tbl_Retailers e ON a.RetailerCode=e.RetailerCode WHERE a.IsActive=1
			ORDER BY a.EntryDate DESC
		END
	IF(@Action='3')
		BEGIN
			SELECT a.ProductCode,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsExchangeble,0)=0 THEN '' ELSE 'Exchange Available' END AS ExchangeStatus,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '' ELSE 'Multiple Options Available' END AS MultiVar
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId			
			ORDER BY a.EntryDate DESC
		END
	IF(@Action='4')
		BEGIN
			SELECT a.SrNo,a.ProductId,a.VariationValue+' '+b.UnitName +'- Rs '+CAST(a.SaleRate AS VARCHAR)ProductVar,a.MRP,a.SaleRate
			 FROM tbl_ProductVariations a 
			JOIN tbl_UnitMaster b ON a.UnitId=b.SrNo WHERE a.IsActive=1 ORDER BY a.VariationValue ASC
		END
	IF(@Action='5')
		BEGIN
				SELECT a.ProductCode,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsExchangeble,0)=0 THEN '' ELSE 'Exchange Available' END AS ExchangeStatus,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '' ELSE 'Multiple Options Available' END AS MultiVar,
			 '../ProductImages/'+a.MainImgFile AS Path,CASE WHEN isnull(a.Img1,'')='' OR a.Img1='undefined' THEN '' 
			 ELSE  '../ProductImages/'+a.Img1 END AS Path1,
			 CASE WHEN isnull(a.Img2,'')='' OR a.Img2='undefined' THEN '' ELSE '../ProductImages/'+a.Img2 end AS Path2
			,CASE WHEN isnull(a.Img3,'')='' OR a.Img3='undefined' THEN '' ELSE'../ProductImages/'+a.Img3 END AS Path3,
			CASE WHEN isnull(a.Img4,'')='' OR a.Img4='undefined' THEN '' ELSE '../ProductImages/'+a.Img4 END AS Path4,
				 CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 MRP FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) ELSE a.ProductMRP END
			  AS ProductMRP	,
			   CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) 
			 ELSE a.SaleRate END AS SaleRate
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId	 
			WHERE a.ProductCode=@ProductId
		END
   
	IF(@Action='6')
		BEGIN
			SELECT a.SrNo,a.ProductId,a.VariationValue+' '+b.UnitName VarName
			 FROM tbl_ProductVariations a 
			JOIN tbl_UnitMaster b ON a.UnitId=b.SrNo WHERE a.IsActive=1 ORDER BY a.VariationValue ASC
		END
	IF(@Action='7')
		BEGIN
				SELECT a.ProductCode,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsExchangeble,0)=0 THEN '' ELSE 'Exchange Available' END AS ExchangeStatus,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '' ELSE 'Multiple Options Available' END AS MultiVar,
			 '../ProductImages/'+a.MainImgFile AS Path,CASE WHEN isnull(a.Img1,'')='' OR a.Img1='undefined' THEN '' 
			 ELSE  '../ProductImages/'+a.Img1 END AS Path1,
			 CASE WHEN isnull(a.Img2,'')='' OR a.Img2='undefined' THEN '' ELSE '../ProductImages/'+a.Img2 end AS Path2
			,CASE WHEN isnull(a.Img3,'')='' OR a.Img3='undefined' THEN '' ELSE'../ProductImages/'+a.Img3 END AS Path3,
			CASE WHEN isnull(a.Img4,'')='' OR a.Img4='undefined' THEN '' ELSE '../ProductImages/'+a.Img4 END AS Path4,
				 CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 MRP FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) ELSE a.ProductMRP END
			  AS ProductMRP	,
			   CASE WHEN isnull(a.IsMultiVariant,0)=1 THEN 
			 (SELECT TOP 1 SaleRate FROM tbl_ProductVariations WHERE ProductId=a.ProductCode ORDER BY VariationValue ASC) 
			 ELSE a.SaleRate END AS SaleRate,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN CAST(round(((a.ProductMRP-a.SaleRate)/((a.ProductMRP+a.SaleRate)/2))*100,0) AS DECIMAL(18,0)) ELSE 0 END AS DiscPer,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '0' ELSE '1' END	IsMultiVariant
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId	 
			WHERE (a.RootCatId=@Category OR isnull(a.CatId,'')=isnull(@Category,'') OR isnull(a.SubCatId,'')=isnull(@Category,''))
		END   
		IF(@Action='8')
		begin 
		SELECT b.RootCategoryName,d.SubCategoryId,a.percentage, c.CategoryId,b.RootCategoryId,a.Isofferproduct,a.offerproductid,a.deliverycharge,a.percentage,a.ProductCode,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsExchangeble,0)=0 THEN '' ELSE 'Exchange Available' END AS ExchangeStatus,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '' ELSE 'Multiple Options Available' END AS MultiVar
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId	where a.ProductCode=@ProductId
		end

END


GO
/****** Object:  StoredProcedure [dbo].[proc_GetLoginDetails]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_GetLoginDetails]
@Action VARCHAR(20)=NULL,
@UserName VARCHAR(50)=NULL,
@Password VARCHAR(50)=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_LoginMaster WHERE UserName=@UserName AND Password=@Password AND IsActive=1))
			BEGIN
				SELECT * FROM tbl_LoginMaster WHERE UserName=@UserName AND Password=@Password AND IsActive=1
			END
			ELSE
			BEGIN
				SELECT 2 AS id,'Invalid UserName or Password.'msg
			END 
		END 	
	END


GO
/****** Object:  StoredProcedure [dbo].[proc_InsertUpdateDeliveryExcutives]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_InsertUpdateDeliveryExcutives]
@Action VARCHAR(10),
@Name VARCHAR (200)=NULL,
@mobileno VARCHAR(20)=NULL,
@emailaddress VARCHAR(200)=NULL,
@address VARCHAR(1000)=NULL,
@panno VARCHAR(20)=NULL,
@zonecode VARCHAR(20)=NULL,
@AadharNo VARCHAR(20)=NULL,
@ImageFile VARCHAR(200)=NULL,
@bankaccname VARCHAR(200)=NULL,
@accountnumber VARCHAR(200)=NULL,
@bankname VARCHAR(200)=NULL,
@ifsccode VARCHAR(200)=NULL,
@RefId VARCHAR(200)=NULL

AS
BEGIN

	IF(@Action='1')
		BEGIN
			BEGIN TRY			
			BEGIN TRAN 
			
			IF(NOT EXISTS(SELECT * FROM [dbo].[tbl_DeliveryExcutives] WHERE MobileNo=@mobileno))
			BEGIN
				
				DECLARE @DeliveryExcutivesCode VARCHAR(20),@password VARCHAR(20);
				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(DeliveryExcutive),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				SET @DeliveryExcutivesCode='MDYOSDEC'+convert(VARCHAR,@CountNo)	  				
				set @password=(SELECT CAST((RAND() * (899999) + 100000) as int)) 			
		  		
				INSERT INTO [dbo].[tbl_DeliveryExcutives] (
				 DeliveryExcutivesCode, Name, MobileNo, EmailAddress, Address,
				 AadharNo, PANNo, IsActive, EntryDate, ZoneCode, ImageFile,
				 BankAccName, AccountNumber, BankName, IFSCCode,Password)
				  
				VALUES (
				@DeliveryExcutivesCode, @Name, @mobileno, @emailaddress, @address,@AadharNo,
			 	@panno, 1, getdate(), @zonecode,@ImageFile, @bankaccname, @accountnumber, @bankname, @ifsccode,@password)			  	
			  	
			  	INSERT INTO dbo.tbl_LoginMaster (BranchCode, UserName, Password, RoleType, EntryDate, IsActive, Name)
				VALUES ('102', @mobileno, @password, '3', getdate(), 1, 'DeliveryExcutives')
			  
			  UPDATE tbl_Counter SET DeliveryExcutive=@Count
			  
			  SELECT 1 AS id,'Great! Delivery Excutive Account Successfully Created.'msg
			
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! this Mobile already registered with us.'msg
			
			END 
			COMMIT	
			
			END TRY
			BEGIN CATCH
			
			ROLLBACK
			
			END CATCH
		
		
		END 
	IF(@Action='2')
		BEGIN
			IF(EXISTS(SELECT * FROM dbo.[tbl_DeliveryExcutives] WHERE  DeliveryExcutivesCode =@RefId))
			BEGIN
				DELETE FROM dbo.[tbl_DeliveryExcutives] WHERE DeliveryExcutivesCode=@RefId
				
				DELETE FROM tbl_LoginMaster WHERE UserName=(SELECT TOP 1 MobileNo FROM [tbl_DeliveryExcutives] WHERE DeliveryExcutivesCode=@RefId)		
				
				SELECT 1 AS id,'Great! Delivery Excutives Account Successfully Deleted.'msg	
			END
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! Account can not be deleted.'msg
			
			END  
		
		END 


IF(@Action='3')
		BEGIN
			IF(EXISTS(SELECT * FROM dbo.[tbl_DeliveryExcutives]  WHERE DeliveryExcutivesCode=@RefId))
			BEGIN			  	
				
				UPDATE dbo.[tbl_DeliveryExcutives]
SET
	Name = @Name,
	MobileNo = @mobileno,
	EmailAddress = @emailaddress,   
	Address = @address,	
	PANNo = @panno,		
	ZoneCode = @zonecode,	
	BankAccName = @bankaccname,
	AccountNumber = @accountnumber,
	BankName = @bankname,
	IFSCCode = @ifsccode,
	ImageFile=isnull(@ImageFile,ImageFile)
	WHERE DeliveryExcutivesCode=@RefId

				SELECT 1 AS id,'Great! Delivery Excutives Account Successfully Updated.'msg	
			END
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! Account can not be Updated.'msg
			
			END  
		
		END 
 IF @Action='4'
 Begin 

 SELECT a.*, b.AreaName FROM [dbo].[tbl_DeliveryExcutives] a LEFT join dbo.tbl_AreaMaster b on a.ZoneCode=b.SrNo where a.IsActive=1
 
 end
 IF @Action='5'
 BEGIN 
  SELECT a.*, b.AreaName FROM [dbo].[tbl_DeliveryExcutives] a LEFT join dbo.tbl_AreaMaster b on a.ZoneCode=b.SrNo where a.IsActive=1 
  and DeliveryExcutivesCode=@RefId
 END
 
END


GO
/****** Object:  StoredProcedure [dbo].[proc_InsertUpdateRetailers]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- *** SqlDbx Personal Edition ***
-- !!! Not licensed for commercial use beyound 90 days evaluation period !!!
-- For version limitations please check http://www.sqldbx.com/personal_edition.htm
-- Number of queries executed: 722, number of rows retrieved: 2359

CREATE PROC[dbo].[proc_InsertUpdateRetailers]
@Action VARCHAR(10),
@retailername VARCHAR (200)=NULL,
@mobileno VARCHAR(20)=NULL,
@emailaddress VARCHAR(200)=NULL,
@address VARCHAR(1000)=NULL,
@gstinno VARCHAR(20)=NULL,
@cinno VARCHAR(20)=NULL,
@panno VARCHAR(20)=NULL,
@businessname VARCHAR(200)=NULL,
@zonecode VARCHAR(20)=NULL,
@kycdocumenttype VARCHAR(200)=NULL,
@kycdocumentno VARCHAR(20)=NULL,
@kycdocfile VARCHAR(200)=NULL,
@pandoc VARCHAR(200)=NULL,
@tanno VARCHAR(20)=NULL,
@tandoc VARCHAR(200)=NULL,
@bankaccname VARCHAR(200)=NULL,
@accountnumber VARCHAR(200)=NULL,
@bankname VARCHAR(200)=NULL,
@ifsccode VARCHAR(200)=NULL,
@RefId VARCHAR(200)=NULL

AS
BEGIN

	IF(@Action='1')
		BEGIN
			BEGIN TRY			
			BEGIN TRAN 
			
			IF(NOT EXISTS(SELECT * FROM tbl_LoginMaster WHERE UserName=@emailaddress))
			BEGIN
				
				DECLARE @retailercode VARCHAR(20),@password VARCHAR(20);
				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(RetailerCount),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				SET @retailercode='WOWJINN'+convert(VARCHAR,@CountNo)	  
				
				set @password=(SELECT CAST((RAND() * (899999) + 100000) as int)) 			
		  		
				INSERT INTO dbo.tbl_Retailers (RetailerCode, RetailerName, MobileNo, EmailAddress, Address,
				 GSTINNo, CINNo, PANNo, IsActive, EntryDate, BusinessName, ZoneCode, KYCDocumentType, KYCDocumentNo,
				  KYCDocFile, PanDoc, TANNo, TANDoc, BankAccName, AccountNumber, BankName, IFSCCode)
				  
				VALUES (@retailercode, @retailername, @mobileno, @emailaddress, @address, @gstinno, @cinno,
			 	@panno, 1, getdate(), @businessname, @zonecode, @kycdocumenttype, @kycdocumentno, @kycdocfile, @pandoc,
			  	@tanno, @tandoc, @bankaccname, @accountnumber, @bankname, @ifsccode)			  	
			  	
			  	INSERT INTO dbo.tbl_LoginMaster (BranchCode, UserName, Password, RoleType, EntryDate, IsActive, Name)
				VALUES ('101', @emailaddress, @password, '2', getdate(), 0, @businessname)
			  
			  UPDATE tbl_Counter SET RetailerCount=@Count
		
			
			  
			  SELECT 1 AS id,'Great! Retailers Account Successfully Created.'msg
			
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! this Email already registered with us.'msg
			
			END 
			COMMIT	
			
			END TRY
			BEGIN CATCH
			
			ROLLBACK
			
			END CATCH
		
		
		END 
	IF(@Action='2')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_Retailers WHERE RetailerCode=@RefId))
			BEGIN
				DELETE FROM tbl_Retailers WHERE RetailerCode=@RefId
				
				DELETE FROM tbl_LoginMaster WHERE UserName=(SELECT TOP 1 EmailAddress FROM tbl_Retailers WHERE RetailerCode=@RefId)		
				
				SELECT 1 AS id,'Great! Retailers Account Successfully Deleted.'msg	
			END
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! Account can not be deleted.'msg
			
			END  
		
		END 


IF(@Action='3')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_Retailers WHERE RetailerCode=@RefId))
			BEGIN
			  	
				
				UPDATE dbo.tbl_Retailers
SET
	RetailerName = @retailername,
	MobileNo = @mobileno,
	EmailAddress = @emailaddress,
   
	Address = @address,
	GSTINNo = @gstinno,
	CINNo = @cinno,
	PANNo = @panno,	
	BusinessName = @businessname,
	ZoneCode = @zonecode,
	KYCDocumentType = @kycdocumenttype,
	KYCDocumentNo = @kycdocumentno,
	KYCDocFile = isnull(@kycdocfile,KYCDocFile),
	PanDoc = isnull(@pandoc,PanDoc),
	TANNo = @tanno,
	TANDoc = isnull(@tandoc,TANDoc),
	BankAccName = @bankaccname,
	AccountNumber = @accountnumber,
	BankName = @bankname,
	IFSCCode = @ifsccode 
	 WHERE RetailerCode=@RefId

				SELECT 1 AS id,'Great! Retailers Account Successfully Updated.'msg	
			END
			ELSE
			BEGIN
				SELECT 2 AS id,'Sorry! Account can not be Updated.'msg
			
			END  
		
		END 

		IF(@Action='4')
		begin 
		select * from tbl_Retailers where RetailerCode=@RefId
		end
END


GO
/****** Object:  StoredProcedure [dbo].[proc_ManageProduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_ManageProduct]
@Action VARCHAR(20),
@ProductId VARCHAR(50),
@DeleteBy VARCHAR(100)=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_ProductMaster WHERE ProductCode=@ProductId))
				BEGIN
					INSERT INTO dbo.tbl_ProductMasterHistory (ProductCode, RetailerCode, ProductTitle, RootCatId, CatId,
					 SubCatId, ProductDescription, ProductMRP, SaleRate, CommQty, MainImgFile, Img1, Img2, Img3, Img4,
					  Status, IsActive, EntryDate, EntryBy, DeleteDate, DeleteBy)
					  
					SELECT ProductCode, RetailerCode, ProductTitle, RootCatId, CatId, SubCatId, ProductDescription, ProductMRP,
					 SaleRate, CommQty, MainImgFile, Img1, Img2, Img3, Img4, Status, IsActive, EntryDate, EntryBy,getdate(),@DeleteBy
					FROM dbo.tbl_ProductMaster WHERE ProductCode=@ProductId
					
					DELETE FROM tbl_ProductMaster WHERE ProductCode=@ProductId
					
					SELECT 1 AS id,'Product Details Successfully Deleted.'msg

					
				END 
			ELSE
				BEGIN
				
					SELECT 2 AS id,'Oops! Product Detail not found.'msg
				
				END 
		END 
	IF(@Action='2')
		BEGIN
			
			IF(EXISTS(SELECT * FROM tbl_ProductMaster WHERE ProductCode=@ProductId))
				BEGIN
					UPDATE tbl_ProductMaster SET Status='Out of Stock' WHERE ProductCode=@ProductId					
					SELECT 1 AS id,'Product Status Successfully Updated.'msg
					
				END 
			ELSE
				BEGIN
				
					SELECT 2 AS id,'Oops! Product Detail not found.'msg
				
				END 
			
			
		END 
	IF(@Action='3')
		BEGIN
			
			IF(EXISTS(SELECT * FROM tbl_ProductMaster WHERE ProductCode=@ProductId))
				BEGIN
					UPDATE tbl_ProductMaster SET Status='published' WHERE ProductCode=@ProductId					
					SELECT 1 AS id,'Product Status Successfully Updated.'msg					
				END 
			ELSE
				BEGIN
				
					SELECT 2 AS id,'Oops! Product Detail not found.'msg
				
				END 
			
			
		END 
IF(@Action='4')
		BEGIN
			
			IF(EXISTS(SELECT * FROM tbl_ProductMaster WHERE ProductCode=@ProductId))
				BEGIN
					UPDATE tbl_ProductMaster SET  Status=IIF (Status='published','Out of Stock','published') WHERE ProductCode=@ProductId					
					SELECT 1 AS id,'Product Status Successfully Updated.'msg					
				END 
			ELSE
				BEGIN
				
					SELECT 2 AS id,'Oops! Product Detail not found.'msg
				
				END 
			
			
		END 

END


GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsForRetailerAssign]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_ProductsForRetailerAssign]	--	EXEC proc_ProductsForRetailerAssign '1','MDYOSRT0000002',NULL,NULL
@Action VARCHAR(20),
@RetailerId VARCHAR(50)=NULL,
@RootCategoryId VARCHAR(20)=NULL,
@CategoryId VARCHAR(20)=NULL
AS
BEGIN	
	IF(@Action='1')
		BEGIN 
		;WITH cte AS 
		(		
			SELECT a.ProductCode,c.SrNo varId,
			CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN a.ProductTitle ELSE a.ProductTitle+', '+c.VariationValue+' '+d.UnitName END 
			AS ProductTitle,
			b.RootCategoryName,0 AS Assigned,'../ProductImages/'+a.MainImgFile AS ProductImage			
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_ProductVariations c ON a.ProductCode=c.ProductId
			LEFT JOIN tbl_UnitMaster d ON c.UnitId=d.SrNo
			 WHERE a.IsActive=1	
		)
		SELECT b.*,(SELECT ProductId FROM tbl_RetailersProductList WHERE ProductId=b.ProductCode
		 AND RetailerId=@RetailerId AND isnull(VariationId,'')=isnull(b.varId,'')) AS assignStatus FROM cte b
		END
END


GO
/****** Object:  StoredProcedure [dbo].[proc_RootCategoryMaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_RootCategoryMaster]
(
@SrNo int=null,
@RootCategoryName varchar(200)=null,
@Cat_Image varchar(200)=null,
@Action int ,
@SlugName varchar(200)=null
)
as begin 
if @Action='1'
	BEGIN
			IF(NOT EXISTS(SELECT * FROM tbl_RootCategoryMaster WHERE RootCategoryName=@RootCategoryName AND SlugName=@SlugName))
			BEGIN 	     
		   		DECLARE @RootCategoryId VARCHAR(20)
                SET @RootCategoryId='L1_'+CAST((SELECT ISNULL(max(SrNo),0)+1 FROM tbl_RootCategoryMaster)AS VARCHAR)


				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(RootCategoryCount),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				


				INSERT INTO dbo.tbl_RootCategoryMaster (RootCategoryId,RootCategoryName,Cat_Image,EntryDate,EntryBy,SlugName,IsActive)
				SELECT @RootCategoryId,@RootCategoryName,@Cat_Image,getdate(),'Admin',@SlugName,1
				
				SELECT 1 AS id,'Root Category Successfully Added.'msg

				UPDATE tbl_Counter SET RootCategoryCount=@Count
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Root Category or Slug already added.'msg
			END 
		
		END

		if @Action='2'
		begin 
		select *,'../RootCategorydoc/'+Cat_Image AS Img,format(EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate from tbl_RootCategoryMaster where IsActive=1
		end

		if @Action='3'
		begin 
		select * from tbl_RootCategoryMaster where IsActive=1 and SrNo=@SrNo
		end

		if @Action='4'
		begin 
		update tbl_RootCategoryMaster  set RootCategoryName=@RootCategoryName,Cat_Image=isnull(Cat_Image,@Cat_Image),SlugName=@SlugName  where  SrNo=@SrNo
		SELECT 2 AS id,'Root Category Successfully Updated.'msg
		end

		if @Action='5'
		begin 
		delete from tbl_RootCategoryMaster     where  SrNo=@SrNo
		end

end


GO
/****** Object:  StoredProcedure [dbo].[proc_SubCategoryMaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_SubCategoryMaster]
(
@SrNo int=null,
@subCategoryName varchar(200)=null,
@Cat_Image varchar(200)=null,
@Action int ,
@SlugName varchar(200)=null,
@CategoryId varchar(20)=null
)
as begin 
if @Action='1'
	BEGIN
			IF(NOT EXISTS(SELECT * FROM tbl_SubCategoryMaster WHERE SubCategoryName=@SubCategoryName AND SlugName=@SlugName))
			BEGIN 	     
		   		DECLARE @SubCategoryId VARCHAR(20)
                SET @SubCategoryId='L3_'+CAST((SELECT ISNULL(max(SrNo),0)+1 FROM tbl_SubCategoryMaster)AS VARCHAR)


				DECLARE @Count BIGINT,@CountNo VARCHAR(100);
	 			SET @Count=(SELECT isnull(max(SubCategoryCount),0)+1 FROM tbl_Counter)														   
				SET @CountNo=(RIGHT('000000'+CONVERT(VARCHAR,isnull(@Count,0)),7))
				
				INSERT INTO dbo.tbl_SubCategoryMaster (SubCategoryId,SubCategoryName,CategoryId,Cat_Image,EntryDate,EntryBy,SlugName,IsActive)
				SELECT @SubCategoryId, @subCategoryName,@CategoryId,@Cat_Image,getdate(),'Admin',@SlugName,1
				
				SELECT 1 AS id,'Sub Category Successfully Added.'msg

				UPDATE tbl_Counter SET CategoryCount=@Count
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,' Sub Category or Slug already added.'msg
			END 
		
		END

		if @Action='2'
		begin 
		--select *,b.CategoryName  from tbl_SubCategoryMaster c inner join tbl_CategoryMaster b on c.CategoryId=b.CategoryId   where c.IsActive=1
		select * from tbl_SubCategoryMaster    where IsActive=1
		end

		if @Action='3'
		begin 
		select * from tbl_SubCategoryMaster where IsActive=1 and SrNo=@SrNo
		end

		if @Action='4'
		begin 
		update tbl_SubCategoryMaster  set CategoryId=@CategoryId, SubCategoryName=@SubCategoryName,Cat_Image=@Cat_Image,SlugName=@SlugName  where  SrNo=@SrNo
		SELECT 1 AS id,'Sub Category Update Successfully ! ! ! 'msg
		end

		if @Action='5'
		begin 
		delete from tbl_SubCategoryMaster      where  SrNo=@SrNo
		end

end


GO
/****** Object:  StoredProcedure [dbo].[proc_UpdateProductQuantity]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[proc_UpdateProductQuantity]
@Action VARCHAR(20),
@ProductId VARCHAR(20)=NULL,
@Quantity BIGINT=NULL,
@EntryBy VARCHAR(100)=NULL
AS
BEGIN
	IF(@Action='1')
		BEGIN
		   	INSERT INTO dbo.tbl_ProductQuantityManage (ProductId, variationId, Quantity, EntryDate, EntryBy)
				SELECT @ProductId,NULL,@Quantity,getdate(),@EntryBy	 
				
				SELECT 1 AS id,'Congratulations! Quantity for Product successfully Updated.'msg	 			
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[proc_ZoneMaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- *** SqlDbx Personal Edition ***
-- !!! Not licensed for commercial use beyound 90 days evaluation period !!!
-- For version limitations please check http://www.sqldbx.com/personal_edition.htm
-- Number of queries executed: 722, number of rows retrieved: 2359


CREATE PROC[dbo].[proc_ZoneMaster]
@Action VARCHAR(20)=NULL,
@ZoneName VARCHAR(100)=NULL,
@CityId VARCHAR(20)=NULL,
@RefID VARCHAR(10)=NULL,
@EntryBy VARCHAR(50)=NULL,
@Pincode varchar(50)=null
AS
BEGIN
	IF(@Action='1')
		BEGIN
			IF(NOT EXISTS(SELECT * FROM tbl_AreaMaster WHERE CityId=@CityId AND AreaName=@ZoneName))
			BEGIN 
						   	  
		   		
				INSERT INTO dbo.tbl_AreaMaster (CityId,AreaName,Pincode,EntryDate,EntryBy,IsActive)
				SELECT @CityId,@ZoneName,@Pincode,getdate(),'Admin',1
				
				SELECT 1 AS id,'Zone Successfully Added.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Zone already added.'msg
			END 
		
		END
	IF(@Action='2')
		BEGIN
			SELECT a.*,format(a.EntryDate,'dd-MMM-yyyy hh:mm tt')AddedOn,b.City AS Cityname FROM tbl_AreaMaster a 
			JOIN MasterCity b ON a.CityId=b.Cityid ORDER BY AreaName		
			
			
		END 
	IF(@Action='3')
		BEGIN
			SELECT *,City FROM tbl_AreaMaster join MasterCity on tbl_AreaMaster.CityId= MasterCity.Cityid where SrNo=@RefID
		END 
	IF(@Action='4')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_AreaMaster WHERE SrNo=@RefID))
			BEGIN
				UPDATE tbl_AreaMaster SET CityId=@CityId,AreaName=@ZoneName,Pincode=@Pincode WHERE SrNo=@RefID
			   
				
				SELECT 1 AS id,'Zone Successfully updated.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Zone details not found.'msg
			END 
		
		END
	IF(@Action='5')
		BEGIN
			IF(EXISTS(SELECT * FROM tbl_AreaMaster WHERE SrNo=@RefID))
			BEGIN
				DELETE FROM tbl_AreaMaster WHERE SrNo=@RefID
			   
				
				SELECT 1 AS id,'Zone Successfully deleted.'msg
			END 
			ELSE
			BEGIN
				SELECT 2 AS id,'Zone details not found.'msg
			END 
		
		END
END


GO
/****** Object:  StoredProcedure [dbo].[procallcustomer]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[procallcustomer]
(
@Action int,
@username varchar (50)=null
)as begin
if(@Action='1')
begin
select * from tbl_CustomerMaster  c inner join tbl_LoginMaster l on c.MobileNo=l.UserName where l.RoleType='4'
end

if(@Action='2')
begin
delete from tbl_CustomerMaster where MobileNo=@username 
 delete from tbl_LoginMaster where UserName=@username and RoleType='4'
end
end


GO
/****** Object:  StoredProcedure [dbo].[ProcBannerListing]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ProcBannerListing]
(
@Action int=null,
@SmallTitle varchar(50)=null,
@Title varchar(100)=null,
@BannerType varchar(100)=null,
@Image varchar(max)=null,
@SrNo int=null
)as begin 

if(@Action='1')
begin 
insert into Tbl_BannerListing (Image,SmallTitle,Title,BannerType,Entrydate,IsActive)
 select @Image,@SmallTitle,@Title,@BannerType,GETDATE(),'1'
end
if(@Action='2')
begin 
select * from Tbl_BannerListing
end
if(@Action='3')
begin 
update Tbl_BannerListing set Image=ISNULL(@Image,Image),SmallTitle=@SmallTitle,Title=@Title,BannerType=@BannerType
end
if(@Action='4')
begin 
select * from Tbl_BannerListing where SrNo=@SrNo
end
end
GO
/****** Object:  StoredProcedure [dbo].[ProcBestSeller]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcBestSeller]
(
@Action int
)as begin 
if @Action='1'
begin 
select * from tbl_Retailers order by SrNo desc
end
end


GO
/****** Object:  StoredProcedure [dbo].[proccategorywiseproduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[proccategorywiseproduct]
(
@Action varchar(50)=null,
@id varchar(50)=null
)
as begin 
if @Action='1'
Begin 
SELECT P.* FROM tbl_ProductMaster P   where p.CatId=@id
select * from tbl_SubCategoryMaster where CategoryId=@id
end
end


GO
/****** Object:  StoredProcedure [dbo].[PROCCONTACTUS]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[PROCCONTACTUS]
(
@Action VARCHAR(50)=NULL,
@SRNO int =NULL,
@NAME VARCHAR(100)=NULL,
@EMAILADDRESS VARCHAR(100)=NULL,
@TITLE VARCHAR(100)=NULL,
@COMMENTS VARCHAR(MAX)=NULL
)AS BEGIN 
IF(@Action='1')
BEGIN 
INSERT INTO dbo.contactus (NAME,EMAILADDRESS,TITLE,COMMENTS,ENTRYDATE,STATUS) VALUES(@NAME,@EMAILADDRESS,@TITLE,@COMMENTS,GETDATE(),1)
select 'Thank You for your Enquiry!!!' as msg
END
if @Action='2'
begin 
select * from dbo.contactus
end

END


GO
/****** Object:  StoredProcedure [dbo].[ProcgetListedproductVenderwise]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProcgetListedproductVenderwise]
(
@id varchar(50),
@Action int
)as begin 
if @Action='1'
begin 
		SELECT a.RetailerCode,a.ProductCode,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,a.RetailerCode,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status,
			 CASE WHEN isnull(a.IsExchangeble,0)=0 THEN '' ELSE 'Exchange Available' END AS ExchangeStatus,
			 CASE WHEN isnull(a.IsMultiVariant,0)=0 THEN '' ELSE 'Multiple Options Available' END AS MultiVar
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId		where   a.RetailerCode=@id	
			ORDER BY a.EntryDate DESC
end

end

GO
/****** Object:  StoredProcedure [dbo].[procmanagegif]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[procmanagegif]
(
@id int=null ,
@logoname varchar(100)=null,
@Action int,
@gif varchar(max)=null
)as begin 
if(@Action='1')
begin 
insert into  dbo.managelogo (logoname,Isactive,Entrydate,gif) 
select @logoname,1,GETDATE(),@gif
select 'your Gif add successfully ! ! !' as msg
end
if(@Action='2')
begin 
select id,logoname,Isactive,Entrydate,('../GIFIMAGE/'+gif)as gif from [dbo].managelogo
end
if(@Action='3')
begin 
select * from dbo.managelogo  where id=@id
end

if(@Action='4')
begin 
update dbo.managelogo set logoname=@logoname,gif=isnull(@gif,gif)  where id=@id
select 'Record Update Successfully! !!!' as msg
end
if(@Action='5')
begin 
delete from dbo.managelogo where id=@id
end
end



GO
/****** Object:  StoredProcedure [dbo].[procofferdetails]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[procofferdetails]
(
@Action int=null,
@Offerid varchar(50)=null
)as begin 
if(@Action='1')
begin
select p.* from tbl_ProductMaster p inner join tbl_offermaster o on p.offerproductid=o.offerdid where o.offerdid=@Offerid
end
end

GO
/****** Object:  StoredProcedure [dbo].[Procoffermaster]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Procoffermaster]
(
@ID int=NULL,
@OfferName varchar(100)=null,
@OfferImage varchar(max)=null,
@Action int
)
as begin
if(@Action='1')
begin 
declare @offerid varchar (50)
set @offerid='WOWOFFER'+CAST((SELECT ISNULL(MAX(ID),0)+1  FROM [dbo].tbl_offermaster) AS VARCHAR)
INSERT INTO [dbo].tbl_offermaster (OfferName,OfferImage,offerdid,Isactive,EntryDate)
VALUES(@OfferName,@OfferImage,@offerid,'1',GETDATE())
SELECT 1 AS ID ,'Offer Add Successfully'
end
if(@Action='2')
begin 
select m.ID,m.offerdid,m.OfferName,('../OfferImage/'+m.OfferImage) as OfferImage from [dbo].tbl_offermaster m
end
if(@Action='3')
begin 
select * from [dbo].tbl_offermaster  where id=@ID
end
if(@Action='4')
begin 
update [dbo].tbl_offermaster set OfferName=@OfferName,OfferImage=isnull(@OfferImage,OfferImage) where id=@ID
end

if(@Action='5')
begin 
DELETE FROM [dbo].tbl_offermaster where id=@ID
end
 end
GO
/****** Object:  StoredProcedure [dbo].[procordercustomerwise]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[procordercustomerwise]
(
@id varchar(100)=null,
@Action varchar(50)=null,
@CustomerName varchar (50)=null,
@email varchar (50)=null

)
as begin 


if(@Action='1')
begin

--select top 1 c.*,p.Address from tbl_CustomerMaster c inner join placeoperlist p on c.MobileNo=p.Customercode where p.Mobilenumber=@id
select top 1 * from tbl_CustomerMaster c  where MobileNo=@id



select  p.Entrydate,o.Orderaccepted,pm.MainImgFile, p.Customercode, p.Fullname,o.status  as orderstatus, o.Orderaccepted,o.Dileverydate,o.DispatchdDate,o.ProductId,r.EmailAddress, p.status,p.Entrydate,
 p.Fullname,p.Mobilenumber,(p.Address+','+p.City+','+p.Pincode) as deliveryaddress,pm.ProductTitle,('../ProductImages/'+pm.Img1)as path,r.RetailerName,o.Qty,
  o.orderid,o.SaleRate,o.unitrate as PerProducrPrice from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
  inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode left join tbl_Retailers r on pm.RetailerCode=r.EmailAddress 
 where p.Customercode=@id order by p.Entrydate desc

 
end
if(@Action='2')
begin 
select  p.Customercode, p.Fullname,o.status  as orderstatus, o.Orderaccepted,o.Dileverydate,o.DispatchdDate,o.ProductId,r.EmailAddress, p.status,p.Entrydate,
 p.Fullname,p.Mobilenumber,(p.Address+','+p.City+','+p.Pincode) as deliveryaddress,pm.ProductTitle,('../ProductImages/'+pm.Img1)as path,r.RetailerName,o.Qty,
   o.orderid,o.SaleRate,o.unitrate as PerProducrPrice from placeoperlist p inner join dbo.orderlisttable o on o.orderid=p.orderid 
  inner join tbl_ProductMaster pm on o.ProductId=pm.ProductCode left join tbl_Retailers r on pm.RetailerCode=r.EmailAddress
 where p.Customercode=@id
end
if(@Action='3')
begin 
update tbl_CustomerMaster set CustomerName=@CustomerName,EmailAddress=@email where MobileNo=@id
select 'Record Update Successfully ' as msg
end
end







GO
/****** Object:  StoredProcedure [dbo].[procplaceorder]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[procplaceorder]
(
@srno varchar(50)=null,
@Customercode varchar(50)=null,
@Fullname varchar(200)=null,
@Mobilenumber varchar(20)=null,
@Pincode varchar(10)=null,
@Locality varchar(100)=null,
@Address varchar(max)=null,
@City varchar(100)=null,
@State varchar(100)=null,
@Landmark varchar(100)=null,
@Alternatemobile varchar(20)=null,
@Addresstype varchar(100)=null,
@Action int,
@paymentmethod varchar(100)=null,
@totalpaidamt decimal(18,2)=null,
@dicountamt decimal(18,2)=null,
@deliveryamt decimal(18,2)=null,
@tbl_orderitems tbl_orderitems readonly
)
as begin select * from dbo.placeoperlist
if (@Action='1')
begin 
DECLARE @orderid VARCHAR(50) 
SET @orderid='ORDER'+CAST((SELECT isnull(max(srno),0)+1 FROM dbo.placeoperlist) AS VARCHAR) 

insert into  dbo.placeoperlist (Customercode,Fullname,Mobilenumber,Pincode,Locality,Address,City,State,Landmark,Alternatemobile,
Addresstype,paymentmethod,totalpaidamt,dicountamt,deliveryamt,orderid,status,Entrydate)
select @Customercode,@Fullname,@Mobilenumber,@Pincode,@Locality,@Address,@City,@State,@Landmark,@Alternatemobile,@Addresstype,
@paymentmethod,@totalpaidamt,@dicountamt,@deliveryamt,@orderid,'Order Placed',GETDATE()

insert into  dbo.orderlisttable (ProductId,unitrate,Qty,SaleRate,orderid)
select ProductId,unitrate,Qty,SaleRate,@orderid from @tbl_orderitems

insert into Tbl_CustomerAddress(Customercode,Fullname,Mobilenumber,Pincode,Address,City,State,Landmark,Alternatemobile,Addresstype,Isactive,Entrydate)
values                         (@Customercode,@Fullname,@Mobilenumber,@Pincode,@Address,@City,@State,@Landmark,@Alternatemobile,@Addresstype,'1',Getdate())

 
 select 'Order Place Scuccessfully' as msg
 delete from tbl_MainCart where CustomerCode=@Customercode

end

end




GO
/****** Object:  StoredProcedure [dbo].[procshowindex]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[procshowindex]			--	exec [procshowindex] 1,null,null
(
@Action int=null,
@id varchar(100)=null,
@catid varchar(50)=null
)
 as begin 
 if(@Action='1')
 begin 
           SELECT * FROM tbl_CategoryMaster where IsActive=1 ORDER BY SrNo desc  --0

 		     SELECT a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			  c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status --1
			  FROM tbl_ProductMaster a 
			 JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			 LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			 LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where a.EntryBy='Admin' and  A.Isofferproduct='0' order by a.EntryDate desc


			SELECT * FROM dbo.tbl_Retailers r  left join[wowuser].[tbl_venderposition]  v on isnull(v.vendername,'')=isnull(r.EmailAddress,'')
 where r.IsActive=1 and v.venderposation='Platinum' --2


--select top 3  m.*,t.CategoryName from [dbo].[tbl_ProductMasterOffer] m  join tbl_CategoryMaster t on t.CategoryId=m.CatId where m.IsActive='1' order by m.SrNo desc
SELECT TOP 2 a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS MainImgFile,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where A.Isofferproduct='1' order by a.EntryDate desc
			 --3




SELECT  a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS MainImgFile,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where A.Isofferproduct='1' order by a.EntryDate desc --4


SELECT '../OfferImage/'+O.OfferImage as OfferImage, o.OfferName,O.offerdid  FROM tbl_offermaster  O where o.Isactive='1'--5
select * from  tbl_offermaster where Isactive=1 --6

SELECT * FROM dbo.tbl_Retailers r  left join[wowuser].[tbl_venderposition]  v on isnull(v.vendername,'')=isnull(r.EmailAddress,'')where r.IsActive=1 and v.venderposation='Gold'
  --7

 SELECT * FROM dbo.tbl_Retailers r  left join[wowuser].[tbl_venderposition]  v on isnull(v.vendername,'')=isnull(r.EmailAddress,'')
 where r.IsActive=1 and v.venderposation='Silver' --8

 SELECT * FROM dbo.tbl_Retailers r  left join[wowuser].[tbl_venderposition]  v on isnull(v.vendername,'')=isnull(r.EmailAddress,'')
 where r.IsActive=1 --9

  SELECT * FROM tbl_CategoryMaster where IsActive=1 
 end 
 if (@Action='2')
 begin 
 

    SELECT a.ProductCode,a.Img1,a.Img2,a.Img3,a.Img4,a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where  a.ProductCode=@id order by a.EntryDate desc

select   m.*,t.CategoryName,r.RootCategoryName from [dbo].[tbl_ProductMasterOffer] m  join tbl_CategoryMaster t on t.CategoryId=m.CatId inner join tbl_RootCategoryMaster r on m.RootCatId=r.RootCategoryId  where m.IsActive='1' 
 end
 if(@Action='3')
 begin 
 
  SELECT   * FROM tbl_CategoryMaster where IsActive=1
 	         SELECT a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where a. RetailerCode=@id order by a.EntryDate desc
 end
 end





 

GO
/****** Object:  StoredProcedure [dbo].[ProcupdateCart]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROC [dbo].[ProcupdateCart]
(

@productid varchar(50)=null,
@qty int=null,
@Action int=null,
@CustomerCode varchar(50)=null
)
as begin 
if(@Action='1')
begin 
update  tbl_MainCart set Quantity=@qty where ProductId=@productid and CustomerCode=@CustomerCode
select (p.SaleRate*m.Quantity) as totalamt, (p.ProductMRP*m.Quantity) as discount,p.ProductMRP,p.SaleRate,m.* from tbl_ProductMaster p inner join tbl_MainCart m on p.ProductCode=m.ProductId where m.CustomerCode=@CustomerCode and m.ProductId=@productid

end
end

GO
/****** Object:  StoredProcedure [dbo].[tbl_GetRetailersList]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC[dbo].[tbl_GetRetailersList]
@Action VARCHAR(50),
@RetId VARCHAR(30)=NULL
AS
BEGIN
   IF(@Action='1')
   	BEGIN
   			SELECT a.RetailerCode,a.RetailerName,a.MobileNo,a.EmailAddress,a.Address,a.BusinessName,
		CASE WHEN a.IsActive=1 THEN 'Active' ELSE 'DeActive' END AS AccountStatus  FROM tbl_Retailers a ORDER BY EntryDate DESC

   	END 
   
   IF(@Action='2')
   	BEGIN
   		SELECT a.RetailerCode,a.RetailerName,a.MobileNo,a.EmailAddress,a.Address,a.BusinessName,
		CASE WHEN a.IsActive=1 THEN 'Active' ELSE 'DeActive' END AS AccountStatus 
		 FROM tbl_Retailers a WHERE a.IsActive=1 ORDER BY EntryDate DESC 

   	END 
   	IF(@Action='3')
   	BEGIN
   		SELECT a.RetailerCode,a.RetailerName,a.MobileNo,a.EmailAddress,a.Address,a.BusinessName,
		CASE WHEN a.IsActive=1 THEN 'Active' ELSE 'DeActive' END AS AccountStatus 
		 FROM tbl_Retailers a WHERE a.IsActive=0 ORDER BY EntryDate DESC 

   	END 
   	IF(@Action='4')
   	BEGIN
   	
   			SELECT a.IsActive,a.RetailerCode,a.RetailerName,a.MobileNo,a.EmailAddress,a.Address,a.BusinessName,
		CASE WHEN a.IsActive=1 THEN 'Active' ELSE 'DeActive' END AS AccountStatus,format(a.EntryDate,'MMM dd, yyyy hh:mm tt') AS CreateDate,
		a.KYCDocumentType,a.KYCDocumentNo,CASE WHEN a.KYCDocFile IS NOT NULL THEN '../RetailerDocs/'+a.KYCDocFile ELSE '' END AS KycDocFile,
		a.PANNo,CASE WHEN a.PanDoc IS NOT NULL THEN '../RetailerDocs/'+a.PanDoc ELSE '' END AS PanDoc,a.TANNo,
		CASE WHEN a.TANDoc IS NOT NULL THEN '../RetailerDocs/'+a.TANDoc ELSE '' END AS TANDoc,a.BankAccName,a.AccountNumber,a.BankName,
		a.IFSCCode
		 FROM tbl_Retailers a WHERE a.RetailerCode=@RetId   		
    END 	
   IF(@Action='5')
   begin    
   update tbl_Retailers set IsActive=IIF(IsActive='1','0','1')where RetailerCode=@RetId
   end

END





GO
/****** Object:  StoredProcedure [dbo].[updateorderlist]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateorderlist]
(
@orderid varchar(50)=null,
@Stringvalue varchar(100)=null,
@Productid varchar(100)=null,
@Action varchar(50)
)
as begin 
if(@Action='1')
BEGIN 
UPDATE dbo.orderlisttable SET status=@Stringvalue,Orderaccepted=GETDATE() where ProductId=@Productid and orderid=@orderid
select * from dbo.orderlisttable where ProductId=@Productid and orderid=@orderid
END 

if(@Action='2')
BEGIN 
UPDATE dbo.orderlisttable SET status=@Stringvalue,DispatchdDate=GETDATE() where ProductId=@Productid and orderid=@orderid
select * from dbo.orderlisttable where ProductId=@Productid and orderid=@orderid
END 
if(@Action='3')
BEGIN 
UPDATE dbo.orderlisttable SET status=@Stringvalue,Dileverydate=GETDATE() where ProductId=@Productid and orderid=@orderid
select * from dbo.orderlisttable where ProductId=@Productid and orderid=@orderid
END 
end

GO
/****** Object:  StoredProcedure [dbo].[viewcategory]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewcategory]
(
@Action int=null,
@catid varchar(50)=null
)as begin 
if @Action=1
begin 
select  top 20 * from tbl_SubCategoryMaster where IsActive=1 order by SrNo desc

SELECT a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where a.EntryBy='Admin' order by a.EntryDate desc
end
if @Action=2
begin 
select  top 20 * from tbl_SubCategoryMaster where IsActive=1 order by SrNo desc

SELECT a.SubCatId, a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where a.EntryBy='Admin' and a.SubCatId=@catid order by a.EntryDate desc
end
end




GO
/****** Object:  StoredProcedure [wowuser].[APICAREGORYMASTER]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [wowuser].[APICAREGORYMASTER]
(
@Action int=null
)as
begin 
if @Action='1'
begin 
SELECT top 4 c.SrNo,c.RootCategoryId,c.CategoryId,('../categorydoc/'+c.Cat_Image) as path,c.CategoryName,c.SlugName  FROM tbl_CategoryMaster c where IsActive=1
end
end
GO
/****** Object:  StoredProcedure [wowuser].[APICategorywiseproduct]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [wowuser].[APICategorywiseproduct]
(
@Action int,
@id varchar(50)
)as begin 
if(@Action='1')
begin 
select c.CategoryId,c.CategoryName,p.ProductCode,p.ProductTitle,p.ProductMRP,p.SaleRate,'../ProductImages/'+p.MainImgFile as MainImgFile ,p.Status from tbl_ProductMaster p  inner join tbl_CategoryMaster c on p.CatId=c.CategoryId where c.CategoryId=@id and p.isActive=1
end
end



GO
/****** Object:  StoredProcedure [wowuser].[APIGETADMINPRODUCT]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [wowuser].[APIGETADMINPRODUCT]
(
@Action int
)as begin 
if @Action='1'
begin 
SELECT a.EntryBy,a.ProductCode ,a.ProductTitle,b.RootCategoryName,
			c.CategoryName,d.SubCategoryName,a.ProductMRP,a.SaleRate,a.CommQty,a.ProductDescription,
			 '../ProductImages/'+a.MainImgFile AS Path,format(a.EntryDate,'MMM dd, yyyy hh:mm tt')AddedDate,a.Status
			 FROM tbl_ProductMaster a 
			JOIN tbl_RootCategoryMaster b ON a.RootCatId=b.RootCategoryId
			LEFT JOIN tbl_CategoryMaster c ON a.CatId=c.CategoryId
			LEFT JOIN tbl_SubCategoryMaster d ON a.SubCatId=d.SubCategoryId where a.EntryBy='Admin' order by a.EntryDate desc
end 
end
GO
/****** Object:  StoredProcedure [wowuser].[APIGETOFERLIST]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [wowuser].[APIGETOFERLIST]
(
@Action int
)
as begin
if @Action='1'
begin 

select   m.*,t.CategoryName,r.RootCategoryName from [dbo].[tbl_ProductMasterOffer] m 
 join tbl_CategoryMaster t on t.CategoryId=m.CatId inner join tbl_RootCategoryMaster r on 
 m.RootCatId=r.RootCategoryId  where m.IsActive='1' 
end
 end


GO
/****** Object:  StoredProcedure [wowuser].[APIOFFERLIST]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [wowuser].[APIOFFERLIST]
(
@Action int=null
)as begin 
if(@Action='1')
begin 
select l.ProductCode,l.ProductTitle,l.ProductMRP,l.SaleRate,'../ProductImages/'+l.MainImgFile as Mainmage,'../ProductImages/'+l.Img1 AS IMAGE from [dbo].[tbl_ProductMasterOffer] l
end 
end
GO
/****** Object:  StoredProcedure [wowuser].[APIVENDERCATEGORYWISE]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [wowuser].[APIVENDERCATEGORYWISE]
(

@Action int
)
as begin 
if(@Action='1')
begin 
select r.TANDoc as image,r.Address,r.EmailAddress,r.RetailerName,p.venderposation from tbl_venderposition p inner join tbl_Retailers r on r.EmailAddress=p.vendername where p.venderposation='Gold'
end
if(@Action='2')
begin 
select r.TANDoc as image, r.Address,r.EmailAddress,r.RetailerName,p.venderposation from tbl_venderposition p inner join tbl_Retailers r on r.EmailAddress=p.vendername where p.venderposation='Silver'
end
if(@Action='3')
begin 
select r.TANDoc as image,r.Address,r.EmailAddress,r.RetailerName,p.venderposation from tbl_venderposition p inner join tbl_Retailers r on r.EmailAddress=p.vendername where p.venderposation='Platinum'
end
if(@Action='4')
begin 
select r.TANDoc as image,r.Address,r.EmailAddress,r.RetailerName,p.venderposation from tbl_venderposition p inner join tbl_Retailers r on r.EmailAddress=p.vendername 
end
end





GO
/****** Object:  StoredProcedure [wowuser].[procvenderposition]    Script Date: 2/7/2022 12:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [wowuser].[procvenderposition]
(
@id int =null,
@vendername varchar(100)=null,
@venderposation varchar(100)=null,
@Action int
) as begin 
if (@Action='1')
begin 
insert into tbl_venderposition(venderposation,vendername,isactive,Entrydate)
select @venderposation,@vendername,'1' ,getdate()
end
if (@Action='2')
begin 
select * from tbl_venderposition
end
if (@Action='3')
begin 
select * from tbl_venderposition where id=@id
end
if (@Action='4')
begin 
update tbl_venderposition set vendername=@vendername,venderposation=@venderposation where id=@id
end
end
GO
