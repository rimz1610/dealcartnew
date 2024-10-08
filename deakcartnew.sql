USE [DealCart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElmahError]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElmahError](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](max) NOT NULL,
	[Host] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Source] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[User] [nvarchar](max) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime2](7) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AllXml] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ElmahError] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdmins]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_tblAdmins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompanies]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompanies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NOT NULL,
	[Contact] [nvarchar](max) NOT NULL,
	[Instagram] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Twitter] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_tblCompanies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SalePrice] [real] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderPayments]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderPayments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentType] [nvarchar](max) NOT NULL,
	[CreditCard] [nvarchar](max) NOT NULL,
	[OrderAmount] [real] NOT NULL,
	[PaidAmount] [real] NULL,
	[TxnRef] [nvarchar](max) NOT NULL,
	[PaidDate] [datetime2](7) NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblOrderPayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[TotalAmount] [real] NOT NULL,
	[OrderType] [nvarchar](max) NOT NULL,
	[PaymentType] [nvarchar](max) NOT NULL,
	[OrderName] [nvarchar](max) NOT NULL,
	[OrderEmail] [nvarchar](max) NOT NULL,
	[OrderContact] [nvarchar](max) NOT NULL,
	[OrderAddress] [nvarchar](max) NOT NULL,
	[Emirates] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[PaidAmount] [real] NULL,
	[OrderNo] [nvarchar](max) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductImages]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblProductImages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ShortDescription] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[VAT] [real] NOT NULL,
	[RealPrice] [real] NOT NULL,
	[DiscountPrice] [real] NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsShippingFree] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[DiscountPercent] [int] NOT NULL,
	[MinumQuantity] [int] NOT NULL,
	[MaximumQuantity] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[Inventory] [int] NOT NULL,
	[ShippingCharges] [real] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuantities]    Script Date: 5/6/2024 11:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuantities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [real] NOT NULL,
 CONSTRAINT [PK_tblQuantities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221209160500_AddDealCartTables', N'6.0.0-preview.7.21378.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826204145_AddProductImages', N'6.0.0-preview.7.21378.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230828083228_AddOrderPayment', N'6.0.0-preview.7.21378.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830175313_addordernumberindb', N'6.0.0-preview.7.21378.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830182601_InitialCreate', N'6.0.0-preview.7.21378.4')
GO
SET IDENTITY_INSERT [dbo].[ELMAH_Error] ON 

INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'5a1abeaa-6c10-450c-b5c4-0e6aa3b084f3', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T11:29:04.543' AS DateTime), 1, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T11:29:04.5422039Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="961" />
    </item>
    <item
      name="StreamId">
      <value
        string="99" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUIU7R33LVB:00000063" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Admin/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'9c9d835f-0366-414f-a14d-cf8511645150', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T11:33:18.190' AS DateTime), 2, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T11:33:18.1899662Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="961" />
    </item>
    <item
      name="StreamId">
      <value
        string="107" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUIU7R33LVB:0000006B" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Admin/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'6af07a23-8ccf-4d33-909d-58ce45db88ae', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T11:33:41.290' AS DateTime), 3, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T11:33:41.2887122Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="961" />
    </item>
    <item
      name="StreamId">
      <value
        string="119" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUIU7R33LVB:00000077" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Admin/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'c1929d84-501b-402a-8a91-6e41bc345862', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T11:33:51.280' AS DateTime), 4, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T11:33:51.2804428Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="961" />
    </item>
    <item
      name="StreamId">
      <value
        string="133" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUIU7R33LVB:00000085" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Admin/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'46195b13-72ef-4e31-a27f-f9ba8cd04224', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T11:34:15.323' AS DateTime), 5, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T11:34:15.3224520Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="971" />
    </item>
    <item
      name="StreamId">
      <value
        string="139" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUIU7R33LVB:0000008B" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/CompanyLogos/kjdkas" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/CompanyLogos/kjdkas" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Company/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUIU7R33LVB" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="50635" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'8fcdc334-72cd-48c7-b54b-fe47bce858f9', N'DealCart', N'DESKTOP-NKTPT7E', N'System.NullReferenceException', N'DealCart.BLL', N'Object reference not set to an instance of an object.', N'', 500, CAST(N'2023-10-22T13:46:35.633' AS DateTime), 6, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="DealCart.BLL"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at DealCart.BLL.Services.CartService.AddToBag(Int32 QuantityID, Int32 ProductID, List`1 list) in D:\My Projects\DealCart\dealcartnew\DealCart.BLL\Services\CartService.cs:line 258&#xD;&#xA;   at DealCart.Controllers.CartController.AddToBag(OrderVM o, Int32 QuantityID, Int32 ProductID)&#xD;&#xA;   at lambda_method138(Closure , Object , Object[] )&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResourceFilter&gt;g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Routing.EndpointMiddleware.&lt;Invoke&gt;g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)&#xD;&#xA;   at ElmahCore.Mvc.ErrorLogMiddleware.InvokeAsync(HttpContext context)"
  time="2023-10-22T13:46:35.6343225Z"
  statusCode="500">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="1431" />
    </item>
    <item
      name="StreamId">
      <value
        string="21" />
    </item>
    <item
      name="InputRemaining">
      <value
        string="0" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="True" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUJ0JQS9FVF:00000015" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Post" />
    </item>
    <item
      name="MethodText">
      <value
        string="POST" />
    </item>
    <item
      name="Path">
      <value
        string="/Cart/AddToBag" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Cart/AddToBag" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="POST" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cache-Control">
      <value
        string="max-age=0" />
    </item>
    <item
      name="Header_Content-Type">
      <value
        string="application/x-www-form-urlencoded" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H,.AspNetCore.Mvc.CookieTempDataProvider=CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
    <item
      name="Header_Origin">
      <value
        string="https://localhost:7295" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Cart/Order/1" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_Content-Length">
      <value
        string="260" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="200" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="500" />
    </item>
  </serverVariables>
  <form>
    <item
      name="OrderName">
      <value
        string="" />
    </item>
    <item
      name="OrderEmail">
      <value
        string="" />
    </item>
    <item
      name="OrderContact">
      <value
        string="" />
    </item>
    <item
      name="OrderAddress">
      <value
        string="" />
    </item>
    <item
      name="email">
      <value
        string="" />
    </item>
    <item
      name="pid">
      <value
        string="258" />
    </item>
    <item
      name="ProductID">
      <value
        string="1" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9qqZrgP_vqz61d45xxlzl5BkPc5OQ25ad0t2vRPPjXmTZ8V0Fx0O5tpf_2fjWtpu_FNfuLcrS3eqPrmKfURUlJIphML77VNOtGe7dmIvN__5LErCocwdUP4rS1ee4ewn0" />
    </item>
    <item
      name="$request-body">
      <value
        string="OrderName=&amp;OrderEmail=&amp;OrderContact=&amp;OrderAddress=&amp;email=&amp;pid=258&amp;ProductID=1&amp;__RequestVerificationToken=CfDJ8AZq4R4jO3NHrj1MnuFmFw9qqZrgP_vqz61d45xxlzl5BkPc5OQ25ad0t2vRPPjXmTZ8V0Fx0O5tpf_2fjWtpu_FNfuLcrS3eqPrmKfURUlJIphML77VNOtGe7dmIvN__5LErCocwdUP4rS1ee4ewn0" />
    </item>
  </form>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
    <item
      name=".AspNetCore.Mvc.CookieTempDataProvider">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
  </cookies>
  <messageLog>
    <message
      level="Information"
      time-stamp="2023-10-22T13:45:53.1822363Z"
      message="Entity Framework Core 6.0.0-preview.7.21378.4 initialized ''DealCartContext'' using provider ''Microsoft.EntityFrameworkCore.SqlServer'' with options: None" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:45:53.2057339Z"
      message="Executed DbCommand (3ms) [Parameters=[@__ProductID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT [t0].[ID], [t0].[CategoryID], [t0].[CreatedDate], [t0].[Description], [t0].[DiscountPercent], [t0].[DiscountPrice], [t0].[Inventory], [t0].[IsDiscount], [t0].[IsShippingFree], [t0].[MaximumQuantity], [t0].[MinumQuantity], [t0].[Name], [t0].[RealPrice], [t0].[ShippingCharges], [t0].[ShortDescription], [t0].[Status], [t0].[UpdatedDate], [t0].[VAT], [t1].[ID], [t1].[ImagePath], [t1].[ProductID], [t1].[SortOrder]&#xD;&#xA;FROM (&#xD;&#xA;    SELECT TOP(1) [t].[ID], [t].[CategoryID], [t].[CreatedDate], [t].[Description], [t].[DiscountPercent], [t].[DiscountPrice], [t].[Inventory], [t].[IsDiscount], [t].[IsShippingFree], [t].[MaximumQuantity], [t].[MinumQuantity], [t].[Name], [t].[RealPrice], [t].[ShippingCharges], [t].[ShortDescription], [t].[Status], [t].[UpdatedDate], [t].[VAT]&#xD;&#xA;    FROM [tblProducts] AS [t]&#xD;&#xA;    WHERE [t].[ID] = @__ProductID_0&#xD;&#xA;) AS [t0]&#xD;&#xA;LEFT JOIN [tblProductImages] AS [t1] ON [t0].[ID] = [t1].[ProductID]&#xD;&#xA;ORDER BY [t0].[ID], [t1].[ID]" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:45:53.2728664Z"
      message="Executed DbCommand (1ms) [Parameters=[@__QuantityID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT TOP(1) [t].[ID], [t].[Price], [t].[ProductID], [t].[Quantity]&#xD;&#xA;FROM [tblQuantities] AS [t]&#xD;&#xA;WHERE [t].[ID] = @__QuantityID_0" />
  </messageLog>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'51660628-ef58-49a5-aa3d-8ed3082ee2ff', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2023-10-22T13:46:35.940' AS DateTime), 7, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2023-10-22T13:46:35.9407867Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="1200" />
    </item>
    <item
      name="StreamId">
      <value
        string="27" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUJ0JQS9FVF:0000001B" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/favicon.ico" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/favicon.ico" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H,.AspNetCore.Mvc.CookieTempDataProvider=CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Cart/AddToBag" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
    <item
      name=".AspNetCore.Mvc.CookieTempDataProvider">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'5dd38f0d-77d0-4e91-ad43-9e172984ff68', N'DealCart', N'DESKTOP-NKTPT7E', N'System.MethodAccessException', N'DealCart', N'Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+<ExecuteAsync>d__32..ctor()'' failed.', N'', 500, CAST(N'2023-10-22T13:46:40.850' AS DateTime), 8, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="System.MethodAccessException"
  message="Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+&lt;ExecuteAsync&gt;d__32..ctor()'' failed."
  source="DealCart"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;System.MethodAccessException: Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+&lt;ExecuteAsync&gt;d__32..ctor()'' failed.&#xD;&#xA;   at AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResultFilterAsync&gt;g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResourceFilter&gt;g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeFilterPipelineAsync&gt;g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Routing.EndpointMiddleware.&lt;Invoke&gt;g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)&#xD;&#xA;   at ElmahCore.Mvc.ErrorLogMiddleware.InvokeAsync(HttpContext context)"
  time="2023-10-22T13:46:40.8494353Z"
  statusCode="500">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="1301" />
    </item>
    <item
      name="StreamId">
      <value
        string="29" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUJ0JQS9FVF:0000001D" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Cart/Order/1" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Cart/Order/1" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H,.AspNetCore.Mvc.CookieTempDataProvider=CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Cart/Order/1" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="200" />
    </item>
    <item
      name="ResponseHeaders_Content-Type">
      <value
        string="text/html; charset=utf-8" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="500" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
    <item
      name=".AspNetCore.Mvc.CookieTempDataProvider">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
  </cookies>
  <messageLog>
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:40.6284143Z"
      message="Entity Framework Core 6.0.0-preview.7.21378.4 initialized ''DealCartContext'' using provider ''Microsoft.EntityFrameworkCore.SqlServer'' with options: None" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:40.6426102Z"
      message="Executed DbCommand (10ms) [Parameters=[@__id_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT [t1].[Name], [t1].[Description], [t1].[ID], [t1].[ShortDescription], [t1].[Name0], [t1].[c], [t1].[DiscountPercent], [t1].[ShippingCharges], [t1].[IsShippingFree], [t1].[CategoryID], [t1].[CreatedDate], [t1].[Inventory], [t1].[IsDiscount], [t1].[RealPrice], [t1].[DiscountPrice], [t1].[c0], [t1].[ID0], [t4].[ID], [t4].[ImagePath], [t4].[ProductID], [t4].[SortOrder], [t1].[c1], [t1].[c2], [t1].[c3], [t5].[ImagePath], [t5].[SortOrder], [t5].[ID], [t1].[c4], [t1].[MaximumQuantity], [t1].[MinumQuantity]&#xD;&#xA;FROM (&#xD;&#xA;    SELECT TOP(1) [t].[Name], [t].[Description], [t].[ID], [t].[ShortDescription], [t0].[Name] AS [Name0], CASE&#xD;&#xA;        WHEN [t].[IsDiscount] = CAST(0 AS bit) THEN [t].[RealPrice] + [t].[VAT]&#xD;&#xA;        ELSE [t].[DiscountPrice] + [t].[VAT]&#xD;&#xA;    END AS [c], [t].[DiscountPercent], [t].[ShippingCharges], [t].[IsShippingFree], [t].[CategoryID], [t].[CreatedDate], [t].[Inventory], [t].[IsDiscount], [t].[RealPrice], [t].[DiscountPrice], CASE&#xD;&#xA;        WHEN (&#xD;&#xA;            SELECT COUNT(*)&#xD;&#xA;            FROM [tblProductImages] AS [t2]&#xD;&#xA;            WHERE [t].[ID] = [t2].[ProductID]) &gt; 0 THEN CAST(1 AS bit)&#xD;&#xA;        ELSE CAST(0 AS bit)&#xD;&#xA;    END AS [c0], (&#xD;&#xA;        SELECT TOP(1) [t3].[ImagePath]&#xD;&#xA;        FROM [tblProductImages] AS [t3]&#xD;&#xA;        WHERE ([t].[ID] = [t3].[ProductID]) AND ([t3].[SortOrder] = 1)) AS [c1], N''/Cart/Order?id='' + CAST([t].[ID] AS nvarchar(max)) AS [c2], LTRIM(RTRIM([t].[Status])) AS [c3], CASE&#xD;&#xA;        WHEN [t].[IsDiscount] = CAST(0 AS bit) THEN [t].[RealPrice]&#xD;&#xA;        ELSE [t].[DiscountPrice]&#xD;&#xA;    END AS [c4], [t].[MaximumQuantity], [t].[MinumQuantity], [t0].[ID] AS [ID0]&#xD;&#xA;    FROM [tblProducts] AS [t]&#xD;&#xA;    INNER JOIN [tblCategories] AS [t0] ON [t].[CategoryID] = [t0].[ID]&#xD;&#xA;    WHERE ([t].[ID] = @__id_0) AND (LTRIM(RTRIM([t].[Status])) &lt;&gt; N''Inactive'')&#xD;&#xA;) AS [t1]&#xD;&#xA;LEFT JOIN [tblProductImages] AS [t4] ON [t1].[ID] = [t4].[ProductID]&#xD;&#xA;LEFT JOIN [tblProductImages] AS [t5] ON [t1].[ID] = [t5].[ProductID]&#xD;&#xA;ORDER BY [t1].[ID], [t1].[ID0], [t4].[ID], [t5].[ID]" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:40.6481531Z"
      message="Executed DbCommand (2ms) [Parameters=[@__productID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT [t].[ID], [t].[Price], [t].[ProductID], [t].[Quantity]&#xD;&#xA;FROM [tblQuantities] AS [t]&#xD;&#xA;WHERE [t].[ProductID] = @__productID_0" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:40.6545157Z"
      message="Executed DbCommand (2ms) [Parameters=[@__product_ID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT COUNT(*)&#xD;&#xA;FROM [tblOrderDetails] AS [t]&#xD;&#xA;WHERE [t].[ID] = @__product_ID_0" />
  </messageLog>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'4d0147b1-dc77-4b13-ba2a-8ec03e388d77', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2024-05-06T18:29:26.910' AS DateTime), 11, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2024-05-06T18:29:26.9091940Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="828" />
    </item>
    <item
      name="StreamId">
      <value
        string="1" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HN3DV9IVGJ7L:00000001" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/account/login" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/account/login" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br, zstd" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.Klw23tBSDdI=CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;124&quot;, &quot;Google Chrome&quot;;v=&quot;124&quot;, &quot;Not-A.Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="none" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="Header_priority">
      <value
        string="u=0, i" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.Klw23tBSDdI">
      <value
        string="CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'935f6d9f-3ef8-4109-ac1f-f8e08c4ccd13', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2024-05-06T18:29:33.557' AS DateTime), 12, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2024-05-06T18:29:33.5577110Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="825" />
    </item>
    <item
      name="StreamId">
      <value
        string="3" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HN3DV9IVGJ7L:00000003" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/home/login" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/home/login" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br, zstd" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.Klw23tBSDdI=CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;124&quot;, &quot;Google Chrome&quot;;v=&quot;124&quot;, &quot;Not-A.Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="none" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="Header_priority">
      <value
        string="u=0, i" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.Klw23tBSDdI">
      <value
        string="CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'23a45712-499a-4e5d-bc6c-29bd2483022b', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2024-05-06T18:29:40.110' AS DateTime), 13, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2024-05-06T18:29:40.1088226Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="827" />
    </item>
    <item
      name="StreamId">
      <value
        string="5" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HN3DV9IVGJ7L:00000005" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/home/account" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/home/account" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br, zstd" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.Klw23tBSDdI=CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;124&quot;, &quot;Google Chrome&quot;;v=&quot;124&quot;, &quot;Not-A.Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="none" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="Header_priority">
      <value
        string="u=0, i" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HN3DV9IVGJ7L" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="58160" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.Klw23tBSDdI">
      <value
        string="CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'1b66fcbc-0715-4bd9-9778-8e4ee4760482', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2024-05-06T18:30:26.190' AS DateTime), 14, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2024-05-06T18:30:26.1905963Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="989" />
    </item>
    <item
      name="StreamId">
      <value
        string="17" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HN3DV9IVGJ7M" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HN3DV9IVGJ7M:00000011" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="58197" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/CompanyLogos/kjdkas" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/CompanyLogos/kjdkas" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br, zstd" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.Klw23tBSDdI=CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg,.AspNetCore.Session=CfDJ8C8G3m01yj1KlR%2F%2Bf4WS9aMA3o0XdkFnL93rEhY3ygRFV91D%2BgstvRw6KX6icFVdX%2BSeGdtPw62TsKiwyABB1C8XTH%2BLafYvVTSIXXkXhTxis3%2BZq%2FurEOMDk4NF3fYAumu1jYgEa081lbHnPoKCytCDSPuWKCo8iwRCgxRXk1Se" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Company/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;124&quot;, &quot;Google Chrome&quot;;v=&quot;124&quot;, &quot;Not-A.Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="Header_priority">
      <value
        string="u=2, i" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HN3DV9IVGJ7M" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="58197" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.Klw23tBSDdI">
      <value
        string="CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8C8G3m01yj1KlR/+f4WS9aMA3o0XdkFnL93rEhY3ygRFV91D+gstvRw6KX6icFVdX+SeGdtPw62TsKiwyABB1C8XTH+LafYvVTSIXXkXhTxis3+Zq/urEOMDk4NF3fYAumu1jYgEa081lbHnPoKCytCDSPuWKCo8iwRCgxRXk1Se" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'4009906a-4dca-4a5a-9309-015254b86cda', N'DealCart', N'DESKTOP-NKTPT7E', N'HTTP', N'', N'NotFound', N'', 404, CAST(N'2024-05-06T18:30:27.607' AS DateTime), 15, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="HTTP"
  message="NotFound"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;ElmahCore.HttpException: NotFound"
  time="2024-05-06T18:30:27.6061329Z"
  statusCode="404">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="979" />
    </item>
    <item
      name="StreamId">
      <value
        string="25" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HN3DV9IVGJ7M" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HN3DV9IVGJ7M:00000019" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="58197" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Store/UserImages/" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br, zstd" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.Klw23tBSDdI=CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg,.AspNetCore.Session=CfDJ8C8G3m01yj1KlR%2F%2Bf4WS9aMA3o0XdkFnL93rEhY3ygRFV91D%2BgstvRw6KX6icFVdX%2BSeGdtPw62TsKiwyABB1C8XTH%2BLafYvVTSIXXkXhTxis3%2BZq%2FurEOMDk4NF3fYAumu1jYgEa081lbHnPoKCytCDSPuWKCo8iwRCgxRXk1Se" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/Admin/Index" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;124&quot;, &quot;Google Chrome&quot;;v=&quot;124&quot;, &quot;Not-A.Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="no-cors" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="image" />
    </item>
    <item
      name="Header_priority">
      <value
        string="u=2, i" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="404" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HN3DV9IVGJ7M" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="58197" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="404" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.Klw23tBSDdI">
      <value
        string="CfDJ8C8G3m01yj1KlR_-f4WS9aNdeYzARx7GFOsyvKhM4EGYGQzSKPf9z6RtzG-arsVagFfu9ecpGs_13_KCVrM3SIo9mEcy9ANBgSYAcf3i784DFJffgPtpFMOx9M85Au1htNBz8t5ukbc6DfmeaGIYYvg" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8C8G3m01yj1KlR/+f4WS9aMA3o0XdkFnL93rEhY3ygRFV91D+gstvRw6KX6icFVdX+SeGdtPw62TsKiwyABB1C8XTH+LafYvVTSIXXkXhTxis3+Zq/urEOMDk4NF3fYAumu1jYgEa081lbHnPoKCytCDSPuWKCo8iwRCgxRXk1Se" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'7899cf43-ffe6-4846-a68c-c5ea8153edaf', N'DealCart', N'DESKTOP-NKTPT7E', N'System.MethodAccessException', N'DealCart', N'Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+<ExecuteAsync>d__32..ctor()'' failed.', N'', 500, CAST(N'2023-10-22T13:46:43.783' AS DateTime), 9, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="System.MethodAccessException"
  message="Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+&lt;ExecuteAsync&gt;d__32..ctor()'' failed."
  source="DealCart"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;System.MethodAccessException: Attempt by method ''AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()'' to access method ''AspNetCoreGeneratedDocument.Views_Cart_Order+&lt;ExecuteAsync&gt;d__32..ctor()'' failed.&#xD;&#xA;   at AspNetCoreGeneratedDocument.Views_Cart_Order#1.ExecuteAsync()&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResultFilterAsync&gt;g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResourceFilter&gt;g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeFilterPipelineAsync&gt;g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Routing.EndpointMiddleware.&lt;Invoke&gt;g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)&#xD;&#xA;   at ElmahCore.Mvc.ErrorLogMiddleware.InvokeAsync(HttpContext context)"
  time="2023-10-22T13:46:43.7834335Z"
  statusCode="500">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="1305" />
    </item>
    <item
      name="StreamId">
      <value
        string="37" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUJ0JQS9FVF:00000025" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/Cart/Order/1" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/Cart/Order/1" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H,.AspNetCore.Mvc.CookieTempDataProvider=CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
    <item
      name="Header_Referer">
      <value
        string="https://localhost:7295/" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="same-origin" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="200" />
    </item>
    <item
      name="ResponseHeaders_Content-Type">
      <value
        string="text/html; charset=utf-8" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUJ0JQS9FVF" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="62503" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="500" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
    <item
      name=".AspNetCore.Mvc.CookieTempDataProvider">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
  </cookies>
  <messageLog>
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:43.7637147Z"
      message="Entity Framework Core 6.0.0-preview.7.21378.4 initialized ''DealCartContext'' using provider ''Microsoft.EntityFrameworkCore.SqlServer'' with options: None" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:43.7699509Z"
      message="Executed DbCommand (2ms) [Parameters=[@__id_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT [t1].[Name], [t1].[Description], [t1].[ID], [t1].[ShortDescription], [t1].[Name0], [t1].[c], [t1].[DiscountPercent], [t1].[ShippingCharges], [t1].[IsShippingFree], [t1].[CategoryID], [t1].[CreatedDate], [t1].[Inventory], [t1].[IsDiscount], [t1].[RealPrice], [t1].[DiscountPrice], [t1].[c0], [t1].[ID0], [t4].[ID], [t4].[ImagePath], [t4].[ProductID], [t4].[SortOrder], [t1].[c1], [t1].[c2], [t1].[c3], [t5].[ImagePath], [t5].[SortOrder], [t5].[ID], [t1].[c4], [t1].[MaximumQuantity], [t1].[MinumQuantity]&#xD;&#xA;FROM (&#xD;&#xA;    SELECT TOP(1) [t].[Name], [t].[Description], [t].[ID], [t].[ShortDescription], [t0].[Name] AS [Name0], CASE&#xD;&#xA;        WHEN [t].[IsDiscount] = CAST(0 AS bit) THEN [t].[RealPrice] + [t].[VAT]&#xD;&#xA;        ELSE [t].[DiscountPrice] + [t].[VAT]&#xD;&#xA;    END AS [c], [t].[DiscountPercent], [t].[ShippingCharges], [t].[IsShippingFree], [t].[CategoryID], [t].[CreatedDate], [t].[Inventory], [t].[IsDiscount], [t].[RealPrice], [t].[DiscountPrice], CASE&#xD;&#xA;        WHEN (&#xD;&#xA;            SELECT COUNT(*)&#xD;&#xA;            FROM [tblProductImages] AS [t2]&#xD;&#xA;            WHERE [t].[ID] = [t2].[ProductID]) &gt; 0 THEN CAST(1 AS bit)&#xD;&#xA;        ELSE CAST(0 AS bit)&#xD;&#xA;    END AS [c0], (&#xD;&#xA;        SELECT TOP(1) [t3].[ImagePath]&#xD;&#xA;        FROM [tblProductImages] AS [t3]&#xD;&#xA;        WHERE ([t].[ID] = [t3].[ProductID]) AND ([t3].[SortOrder] = 1)) AS [c1], N''/Cart/Order?id='' + CAST([t].[ID] AS nvarchar(max)) AS [c2], LTRIM(RTRIM([t].[Status])) AS [c3], CASE&#xD;&#xA;        WHEN [t].[IsDiscount] = CAST(0 AS bit) THEN [t].[RealPrice]&#xD;&#xA;        ELSE [t].[DiscountPrice]&#xD;&#xA;    END AS [c4], [t].[MaximumQuantity], [t].[MinumQuantity], [t0].[ID] AS [ID0]&#xD;&#xA;    FROM [tblProducts] AS [t]&#xD;&#xA;    INNER JOIN [tblCategories] AS [t0] ON [t].[CategoryID] = [t0].[ID]&#xD;&#xA;    WHERE ([t].[ID] = @__id_0) AND (LTRIM(RTRIM([t].[Status])) &lt;&gt; N''Inactive'')&#xD;&#xA;) AS [t1]&#xD;&#xA;LEFT JOIN [tblProductImages] AS [t4] ON [t1].[ID] = [t4].[ProductID]&#xD;&#xA;LEFT JOIN [tblProductImages] AS [t5] ON [t1].[ID] = [t5].[ProductID]&#xD;&#xA;ORDER BY [t1].[ID], [t1].[ID0], [t4].[ID], [t5].[ID]" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:43.7739572Z"
      message="Executed DbCommand (0ms) [Parameters=[@__productID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT [t].[ID], [t].[Price], [t].[ProductID], [t].[Quantity]&#xD;&#xA;FROM [tblQuantities] AS [t]&#xD;&#xA;WHERE [t].[ProductID] = @__productID_0" />
    <message
      level="Information"
      time-stamp="2023-10-22T13:46:43.7776507Z"
      message="Executed DbCommand (0ms) [Parameters=[@__product_ID_0=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']&#xD;&#xA;SELECT COUNT(*)&#xD;&#xA;FROM [tblOrderDetails] AS [t]&#xD;&#xA;WHERE [t].[ID] = @__product_ID_0" />
  </messageLog>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'282668f0-8407-48ff-bec1-5f792105c226', N'DealCart', N'DESKTOP-NKTPT7E', N'Microsoft.CSharp.RuntimeBinder.RuntimeBinderException', N'Anonymously Hosted DynamicMethods Assembly', N'''System.Dynamic.DynamicObject'' does not contain a definition for ''Message''', N'', 500, CAST(N'2023-10-22T14:25:22.560' AS DateTime), 10, N'<error
  application="DealCart"
  host="DESKTOP-NKTPT7E"
  type="Microsoft.CSharp.RuntimeBinder.RuntimeBinderException"
  message="''System.Dynamic.DynamicObject'' does not contain a definition for ''Message''"
  source="Anonymously Hosted DynamicMethods Assembly"
  detail="# caller: @C:\Sources\ElmahCore\ElmahCore\ElmahCore\Internal$\CallerInfo.cs:9&#xD;&#xA;Microsoft.CSharp.RuntimeBinder.RuntimeBinderException: ''System.Dynamic.DynamicObject'' does not contain a definition for ''Message''&#xD;&#xA;   at CallSite.Target(Closure , CallSite , Object )&#xD;&#xA;   at System.Dynamic.UpdateDelegates.UpdateAndExecute1[T0,TRet](CallSite site, T0 arg0)&#xD;&#xA;   at AspNetCoreGeneratedDocument.Views_Admin_Login.&lt;ExecuteAsync&gt;b__28_9()&#xD;&#xA;   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)&#xD;&#xA;   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.&lt;RunAsync&gt;g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)&#xD;&#xA;   at AspNetCoreGeneratedDocument.Views_Admin_Login.&lt;ExecuteAsync&gt;b__28_1()&#xD;&#xA;   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()&#xD;&#xA;   at AspNetCoreGeneratedDocument.Views_Admin_Login.ExecuteAsync()&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResultFilterAsync&gt;g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeNextResourceFilter&gt;g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State&amp; next, Scope&amp; scope, Object&amp; state, Boolean&amp; isCompleted)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()&#xD;&#xA;--- End of stack trace from previous location ---&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.&lt;InvokeAsync&gt;g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)&#xD;&#xA;   at Microsoft.AspNetCore.Routing.EndpointMiddleware.&lt;Invoke&gt;g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)&#xD;&#xA;   at ElmahCore.Mvc.ErrorLogMiddleware.InvokeAsync(HttpContext context)"
  time="2023-10-22T14:25:22.5585423Z"
  statusCode="500">
  <serverVariables>
    <item
      name="TotalParsedHeaderSize">
      <value
        string="1267" />
    </item>
    <item
      name="StreamId">
      <value
        string="329" />
    </item>
    <item
      name="RequestBodyStarted">
      <value
        string="False" />
    </item>
    <item
      name="EndStreamReceived">
      <value
        string="True" />
    </item>
    <item
      name="ReceivedEmptyRequestBody">
      <value
        string="True" />
    </item>
    <item
      name="CanReuse">
      <value
        string="False" />
    </item>
    <item
      name="ConnectionIdFeature">
      <value
        string="0HMUJ0LHS6PKD" />
    </item>
    <item
      name="HasStartedConsumingRequestBody">
      <value
        string="False" />
    </item>
    <item
      name="MaxRequestBodySize">
      <value
        string="30000000" />
    </item>
    <item
      name="MinRequestBodyDataRate">
      <value
        string="Bytes per second: 240, Grace Period: 00:00:05" />
    </item>
    <item
      name="AllowSynchronousIO">
      <value
        string="False" />
    </item>
    <item
      name="TraceIdentifier">
      <value
        string="0HMUJ0LHS6PKD:00000149" />
    </item>
    <item
      name="IsUpgradableRequest">
      <value
        string="False" />
    </item>
    <item
      name="IsUpgraded">
      <value
        string="False" />
    </item>
    <item
      name="RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="RemotePort">
      <value
        string="62557" />
    </item>
    <item
      name="LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="Scheme">
      <value
        string="https" />
    </item>
    <item
      name="Method">
      <value
        string="Get" />
    </item>
    <item
      name="MethodText">
      <value
        string="GET" />
    </item>
    <item
      name="Path">
      <value
        string="/ADMIN/LOGIN" />
    </item>
    <item
      name="QueryString">
      <value
        string="" />
    </item>
    <item
      name="RawTarget">
      <value
        string="/ADMIN/LOGIN" />
    </item>
    <item
      name="HttpVersion">
      <value
        string="HTTP/2" />
    </item>
    <item
      name="Header_Accept">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" />
    </item>
    <item
      name="Header_Host">
      <value
        string="localhost:7295" />
    </item>
    <item
      name="Header_User-Agent">
      <value
        string="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" />
    </item>
    <item
      name="Header_:method">
      <value
        string="GET" />
    </item>
    <item
      name="Header_Accept-Encoding">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="Header_Accept-Language">
      <value
        string="en-US,en;q=0.9" />
    </item>
    <item
      name="Header_Cookie">
      <value
        string=".AspNetCore.Antiforgery.o8Rful7sI4Q=CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM,.AspNetCore.Session=CfDJ8AZq4R4jO3NHrj1MnuFmFw%2FULMj8%2Bafq9TOCRUXDF48psnlSc5q9n%2BabSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi%2FxEuboyY%2BFT4hi8NGxe0xhW7FlL2kST%2BMvE8sQCTVb%2Bkw3fNWUDDouomZwh2dsyKgvz05kPlfqt%2F7H,.AspNetCore.Mvc.CookieTempDataProvider=CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
    <item
      name="Header_Upgrade-Insecure-Requests">
      <value
        string="1" />
    </item>
    <item
      name="Header_sec-ch-ua">
      <value
        string="&quot;Chromium&quot;;v=&quot;118&quot;, &quot;Google Chrome&quot;;v=&quot;118&quot;, &quot;Not=A?Brand&quot;;v=&quot;99&quot;" />
    </item>
    <item
      name="Header_sec-ch-ua-mobile">
      <value
        string="?0" />
    </item>
    <item
      name="Header_sec-ch-ua-platform">
      <value
        string="&quot;Windows&quot;" />
    </item>
    <item
      name="Header_sec-fetch-site">
      <value
        string="none" />
    </item>
    <item
      name="Header_sec-fetch-mode">
      <value
        string="navigate" />
    </item>
    <item
      name="Header_sec-fetch-user">
      <value
        string="?1" />
    </item>
    <item
      name="Header_sec-fetch-dest">
      <value
        string="document" />
    </item>
    <item
      name="RequestTrailersAvailable">
      <value
        string="True" />
    </item>
    <item
      name="StatusCode">
      <value
        string="200" />
    </item>
    <item
      name="ResponseHeaders_Content-Type">
      <value
        string="text/html; charset=utf-8" />
    </item>
    <item
      name="HasResponseStarted">
      <value
        string="False" />
    </item>
    <item
      name="HasFlushedHeaders">
      <value
        string="False" />
    </item>
    <item
      name="HasResponseCompleted">
      <value
        string="False" />
    </item>
    <item
      name="Connection_Id">
      <value
        string="0HMUJ0LHS6PKD" />
    </item>
    <item
      name="Connection_RemoteIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_RemotePort">
      <value
        string="62557" />
    </item>
    <item
      name="Connection_LocalIpAddress">
      <value
        string="::1" />
    </item>
    <item
      name="Connection_LocalPort">
      <value
        string="7295" />
    </item>
    <item
      name="HttpStatusCode">
      <value
        string="500" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name=".AspNetCore.Antiforgery.o8Rful7sI4Q">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw82Kl3oAKg9vUDQGkxJDyRMv2EkPOFVx_LO7zvRWXS9m0BqS5nDmSoxCtoV8kulRkrFVB1zeWdoEXBMC2x2QA3XCNuAO81XPDTNwSD9_COUhVzR2kDVYoLeVgQYv0FQeFM" />
    </item>
    <item
      name=".AspNetCore.Session">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw/ULMj8+afq9TOCRUXDF48psnlSc5q9n+abSNYf9bmOc7KICOJ4OGOYh3ZmBsFZXbxNbe8DLi/xEuboyY+FT4hi8NGxe0xhW7FlL2kST+MvE8sQCTVb+kw3fNWUDDouomZwh2dsyKgvz05kPlfqt/7H" />
    </item>
    <item
      name=".AspNetCore.Mvc.CookieTempDataProvider">
      <value
        string="CfDJ8AZq4R4jO3NHrj1MnuFmFw9zJqbFpuLbgw3NdaFC76mw-PmFwHnL6nFenQnroeei6BVRZ8XgrrVi7epTqDTO32AXf7CXrwYRhRRfvqw3nsgYGjuh_lrCWast44fNtfb7Av5jbV1gy6B7_FEBAnAANCH4PRYiETVai8yj3iYx2PBYqamG7sN3upKJwGvU_U503A" />
    </item>
  </cookies>
</error>')
SET IDENTITY_INSERT [dbo].[ELMAH_Error] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAdmins] ON 

INSERT [dbo].[tblAdmins] ([ID], [FirstName], [LastName], [UserName], [Password], [Email], [Address], [PhoneNumber], [ImageURL], [CreatedDate], [UpdatedDate]) VALUES (1, N'Fahid', N'Mughal', N'fahidmughal6@gmail.com', N'Admin@123', N'fahidmughal6@gmail.com', N'Dubai', N'+97150826927', NULL, CAST(N'2023-10-22T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[tblAdmins] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (1, N'Men''s Watches', N'<p>Watches&nbsp;</p>', CAST(N'2022-12-04T14:14:11.2972441' AS DateTime2), CAST(N'2022-12-04T14:14:11.2974442' AS DateTime2))
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (2, N'Bags', N'<p>Bags</p>', CAST(N'2022-12-04T14:02:14.4170222' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (3, N'Beverages', N'<p>Coffee Tee</p>', CAST(N'2022-12-04T14:11:54.2454199' AS DateTime2), CAST(N'2022-12-04T14:11:54.2456614' AS DateTime2))
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (4, N'Fragances', N'<p>For Men and Women</p>', CAST(N'2022-12-04T14:08:22.4780356' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (5, N'Bath and Body', N'<p>Health and Beauty Products</p>', CAST(N'2022-12-04T14:09:37.3497562' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (6, N'Hair Care', N'<p>Hair Oils and Serums</p>', CAST(N'2022-12-04T14:09:58.0872493' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (7, N'Skin Care', N'<p>Serums</p>
<p>SunScreens</p>
<p>Facial</p>', CAST(N'2022-12-04T14:11:08.1897727' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (8, N'Women''s Watches', N'<p>Women''s Watches</p>', CAST(N'2022-12-04T14:14:32.1902226' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (9, N'Women''s Jewellery', N'<p>Women''s Jewellery</p>', CAST(N'2022-12-04T14:15:09.1527711' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (10, N'SunGlasses and EyeWear', N'<p>SunGlasses and EyeWear</p>', CAST(N'2022-12-04T14:15:41.6273066' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (11, N'Beauty Tools', N'<p>Hair Dryers etc</p>', CAST(N'2022-12-04T14:16:22.1914248' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (12, N'MakeUp', N'<p>Nails Lips Eyes Foundation etc</p>', CAST(N'2022-12-04T14:17:16.2266395' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (13, N'Medical Supplies', N'<p>Blood Pressure Monitors</p>
<p>Surgical Masks etc</p>', CAST(N'2022-12-04T14:18:05.6901489' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (14, N'Men''s Kurta Shalwar Kameez', N'<p>Men''s Kurta Shalwar Kameez</p>', CAST(N'2022-12-04T14:21:31.6021823' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (15, N'Mobile Accessories', N'<p>Phone Cover</p>', CAST(N'2022-12-04T14:22:27.7403340' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (16, N'HeadPhones and HeadSet', N'<p>HeadPhones and HeadSet</p>', CAST(N'2022-12-04T14:22:57.5161780' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (17, N'Smart Phones', N'<p>Apple and Android</p>', CAST(N'2022-12-04T14:26:08.7046076' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (18, N'Men''s Jewellery', N'<p>Men''s Jewellery</p>', CAST(N'2022-12-04T14:27:02.2868364' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (19, N'Kitchen Appliances', N'<p>Kitchen Appliances</p>', CAST(N'2022-12-04T14:27:49.9757799' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (20, N'Babies Toys', N'<p>Babies and Toys</p>', CAST(N'2022-12-04T18:24:36.2893299' AS DateTime2), CAST(N'2022-12-04T18:24:36.2905429' AS DateTime2))
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (21, N'Laptops', N'<p>Laptops</p>', CAST(N'2022-12-04T14:29:15.3840445' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (22, N'Gaming Console', N'<p>Xbox Playstation</p>', CAST(N'2022-12-04T14:30:09.5816622' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (23, N'Wearables', N'<p>Fitness Tracker</p>', CAST(N'2022-12-04T14:30:58.0002950' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (24, N'Stationary Craft', N'<p>Stationary Craft</p>', CAST(N'2022-12-04T14:31:24.9181934' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (25, N'Women''s Kurta Shalwar Kameez', N'<p>Women''s Kurta Shalwar Kameez</p>', CAST(N'2022-12-04T14:32:21.5064540' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (26, N'Televisions', N'<p>LED&nbsp;</p>
<p>TV</p>
<p>LCD</p>', CAST(N'2022-12-04T14:33:03.1037526' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (27, N'Bedding', N'<p>BedSheets</p>', CAST(N'2022-12-04T14:33:51.5961380' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (28, N'Women''s Muslim Wear', N'<p>Women''s Muslim Wear</p>', CAST(N'2022-12-04T14:34:31.3684620' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (29, N'Women''s Top', N'<p>Tops</p>', CAST(N'2022-12-04T14:34:50.4944059' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (30, N'Women''s Pents Jeans Leggings', N'<p>Pents Jeans Leggings</p>', CAST(N'2022-12-04T14:35:27.3524732' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (31, N'Women''s Shoes', N'<p>Sports Heels</p>', CAST(N'2022-12-04T14:36:18.5667072' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (32, N'Home Decor', N'<p>Decoratyion Pieces</p>', CAST(N'2022-12-04T14:36:57.8065604' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (33, N'Home Lighting', N'<p>Bulbs</p>', CAST(N'2022-12-04T14:37:22.7112755' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (34, N'Luggage and SuitCase', N'<p>Luggage and SuitCase</p>', CAST(N'2022-12-04T14:37:49.8474403' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (35, N'Men''s Pents and Jeans', N'<p>Men''s Pents and Jeans</p>', CAST(N'2022-12-04T14:38:28.6838097' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (36, N'Men''s T-shirts and Tanks', N'<p>Men''s T-shirts and Tanks</p>', CAST(N'2022-12-04T14:39:05.2194073' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (37, N'Men''s Shoes', N'<p>Shoes</p>', CAST(N'2022-12-04T14:39:28.0590932' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (38, N'Media , Musics and Books', N'<p>Magazines ,</p>
<p>Ebooks</p>
<p>Musical Instruments</p>', CAST(N'2022-12-04T14:40:40.0648828' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (39, N'Security Cameras', N'<p>Security Cameras</p>', CAST(N'2022-12-04T14:40:59.4683718' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (40, N'Men''s Care and Shaving', N'<p>Trimmer</p>', CAST(N'2022-12-04T15:06:36.6211041' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (41, N'Cleaning Tools', N'<p>Washing and other machines and Home cleaning tools</p>', CAST(N'2023-05-07T11:33:34.1837014' AS DateTime2), CAST(N'2023-05-07T11:33:35.6374970' AS DateTime2))
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (42, N'Outdoor and Gardening Power Tools', N'<p>Lawn and Garden Outdoor and Gardening Power Tools</p>', CAST(N'2022-12-04T18:22:36.8539175' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (43, N'Kitchen and Dining', N'<p>Cookwear Mug Set</p>', CAST(N'2022-12-04T18:23:29.7258814' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (44, N'Religious Items', N'<p>Tasbeeh Counter PrayerMatt</p>', CAST(N'2022-12-04T18:38:56.3965808' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (45, N'Keychians', N'<p>Interior Accessories</p>', CAST(N'2022-12-04T18:40:14.8089748' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (46, N'Outdoor Lighting', N'<p>Outdoor Lighting</p>', CAST(N'2022-12-04T18:41:11.7677125' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (47, N'Bedroom Furniture', N'<p>BedRoom Furnitures</p>', CAST(N'2022-12-04T18:42:27.8405253' AS DateTime2), NULL)
INSERT [dbo].[tblCategories] ([ID], [Name], [Description], [CreatedDate], [UpdatedDate]) VALUES (48, N'Baby Heakth Care', N'<p>Baby and Mother Health Care</p>', CAST(N'2022-12-04T18:43:58.1761791' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompanies] ON 

INSERT [dbo].[tblCompanies] ([ID], [Name], [Logo], [Facebook], [Contact], [Instagram], [Email], [Twitter], [Address], [CreatedDate], [UpdatedDate]) VALUES (2, N'DealCart', N'kjdkas', N'DealCart', N'+97150826927', N'DealCart', N'admin@dealcart.com', N'DealCart', N'Address', CAST(N'0202-10-22T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[tblCompanies] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (1, 1, 1, 200, 2)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (2, 2, 1, 200, 2)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (3, 3, 1, 200, 2)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (4, 3, 1, 400, 4)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (5, 4, 1, 200, 2)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (6, 4, 1, 400, 4)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [TotalAmount], [OrderType], [PaymentType], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaidAmount], [OrderNo], [Remarks]) VALUES (1, CAST(N'2023-10-22T19:05:34.8469196' AS DateTime2), CAST(N'2023-10-27T19:05:34.8469196' AS DateTime2), 212, N'Sale', N'Cash on Delivery', N'Andre Lubin', N'admin@bonjanjob.com', N'5096512000', N'www.abc.com
Address', N'Ajman', N'UnPaid', N'3f4e8db5-9c71-4ef1-8cd1-33fc3c54bd586513', 0, N'DC-000001', N'')
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [TotalAmount], [OrderType], [PaymentType], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaidAmount], [OrderNo], [Remarks]) VALUES (2, CAST(N'2023-10-22T19:05:34.8469196' AS DateTime2), CAST(N'2023-10-27T19:05:34.8469196' AS DateTime2), 212, N'Sale', N'Cash on Delivery', N'Andre Lubin', N'admin@bonjanjob.com', N'5096512000', N'www.abc.com
Address', N'Ajman', N'UnPaid', N'3f4e8db5-9c71-4ef1-8cd1-33fc3c54bd586513', 0, N'DC-000002', N'')
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [TotalAmount], [OrderType], [PaymentType], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaidAmount], [OrderNo], [Remarks]) VALUES (3, CAST(N'2023-10-22T19:27:56.4877330' AS DateTime2), CAST(N'2023-10-27T19:27:56.4877330' AS DateTime2), 624, N'Sale', N'Cash on Delivery', N'Jackson Fowler Inc', N'employer@demo.com', N'03055174001', N'Stephenson Knapp Plc
test1
test2', N'Umm Al Quwain', N'UnPaid', N'b0d54063-7abb-463b-8bae-96b9634b82c75721', 0, N'DC-000003', N'')
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [TotalAmount], [OrderType], [PaymentType], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaidAmount], [OrderNo], [Remarks]) VALUES (4, CAST(N'2023-10-22T19:27:56.4877330' AS DateTime2), CAST(N'2023-10-27T19:27:56.4877330' AS DateTime2), 624, N'Sale', N'Cash on Delivery', N'Jackson Fowler Inc', N'employer@demo.com', N'03055174001', N'Stephenson Knapp Plc
test1
test2', N'Umm Al Quwain', N'UnPaid', N'b0d54063-7abb-463b-8bae-96b9634b82c75721', 0, N'DC-000004', N'')
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductImages] ON 

INSERT [dbo].[tblProductImages] ([ID], [ProductID], [SortOrder], [ImagePath]) VALUES (1, 1, 1, N'10cee92a-12d0-4ac1-a41d-119b6eb5e416.jpeg')
INSERT [dbo].[tblProductImages] ([ID], [ProductID], [SortOrder], [ImagePath]) VALUES (2, 1, 2, N'dc263395-591e-4e85-92cb-7116cd2a501c.jpeg')
SET IDENTITY_INSERT [dbo].[tblProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [Status], [CategoryID], [IsShippingFree], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate], [Inventory], [ShippingCharges]) VALUES (1, N'3D Screen Enlarger', N'10 inch or 12 inch 3D Screen Enlarger', N'<p>10 inch or 12 inch 3D Screen Enlarger</p>', 0, 200, 122, N'Active', 21, 0, 1, 39, 1, 10, CAST(N'2023-10-22T17:02:59.2867861' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200, 12)
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuantities] ON 

INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 2, 200)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 4, 400)
SET IDENTITY_INSERT [dbo].[tblQuantities] OFF
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 5/6/2024 11:31:53 PM ******/
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
ALTER TABLE [dbo].[tblOrders] ADD  DEFAULT (N'') FOR [OrderNo]
GO
ALTER TABLE [dbo].[tblOrders] ADD  DEFAULT (N'') FOR [Remarks]
GO
ALTER TABLE [dbo].[tblProducts] ADD  DEFAULT ((0)) FOR [Inventory]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders_OrderID]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts_ProductID]
GO
ALTER TABLE [dbo].[tblOrderPayments]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderPayments_tblOrders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderPayments] CHECK CONSTRAINT [FK_tblOrderPayments_tblOrders_OrderID]
GO
ALTER TABLE [dbo].[tblProductImages]  WITH CHECK ADD  CONSTRAINT [FK_tblProductImages_tblProducts_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProductImages] CHECK CONSTRAINT [FK_tblProductImages_tblProducts_ProductID]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategories_CategoryID]
GO
ALTER TABLE [dbo].[tblQuantities]  WITH CHECK ADD  CONSTRAINT [FK_tblQuantities_tblProducts_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblQuantities] CHECK CONSTRAINT [FK_tblQuantities_tblProducts_ProductID]
GO
