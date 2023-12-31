USE [DealCart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/17/2023 12:29:06 AM ******/
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
/****** Object:  Table [dbo].[tblAdmins]    Script Date: 8/17/2023 12:29:06 AM ******/
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
/****** Object:  Table [dbo].[tblCategories]    Script Date: 8/17/2023 12:29:06 AM ******/
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
/****** Object:  Table [dbo].[tblCompanies]    Script Date: 8/17/2023 12:29:06 AM ******/
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
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 8/17/2023 12:29:06 AM ******/
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
/****** Object:  Table [dbo].[tblOrders]    Script Date: 8/17/2023 12:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[OrderTotal] [real] NOT NULL,
	[OrderType] [nvarchar](max) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderName] [nvarchar](max) NOT NULL,
	[OrderEmail] [nvarchar](max) NOT NULL,
	[OrderContact] [nvarchar](max) NOT NULL,
	[OrderAddress] [nvarchar](max) NOT NULL,
	[Emirates] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 8/17/2023 12:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ShortDescription] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[VAT] [real] NOT NULL,
	[RealPrice] [real] NOT NULL,
	[DiscountPrice] [real] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[IsOffer] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[DiscountPercent] [int] NOT NULL,
	[MinumQuantity] [int] NOT NULL,
	[MaximumQuantity] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuantities]    Script Date: 8/17/2023 12:29:06 AM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221204071221_AddTablestoDealCart', N'6.0.0-preview.7.21378.4')
GO
SET IDENTITY_INSERT [dbo].[tblAdmins] ON 

INSERT [dbo].[tblAdmins] ([ID], [FirstName], [LastName], [UserName], [Password], [Email], [Address], [PhoneNumber], [ImageURL], [CreatedDate], [UpdatedDate]) VALUES (1, N'Majid', N'Ali', N'majidali', N'12345', N'alimughal@gmail.com', N'Jinnah Road H#139 Gujranwala', N'971554400042', N'\Images\9bcce191-500a-4371-9222-a2e347d47937.png', CAST(N'2023-05-07T09:52:33.8224019' AS DateTime2), NULL)
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

INSERT [dbo].[tblCompanies] ([ID], [Name], [Logo], [Facebook], [Contact], [Instagram], [Email], [Twitter], [Address], [CreatedDate], [UpdatedDate]) VALUES (1, N'DealCart', N'\Images\8487cb20-7830-4fce-8142-191822970351.jpg', N'dealcart', N'+971 55 301 1207', N'dealcart', N'dealcart@outlook.com', N'dealcart', N'Dubai', CAST(N'2022-12-09T22:10:12.9491726' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[tblCompanies] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (1, 1, 25, 715, 9)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (2, 2, 2, 715, 9)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (3, 2, 9, 298, 5)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (4, 3, 4, 357, 6)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (5, 3, 19, 394, 5)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (6, 4, 14, 102, 4)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (7, 4, 16, 544, 6)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (8, 5, 7, 305, 3)
INSERT [dbo].[tblOrderDetails] ([ID], [OrderID], [ProductID], [SalePrice], [Quantity]) VALUES (9, 5, 5, 91, 2)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [OrderTotal], [OrderType], [OrderStatus], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaymentDate]) VALUES (1, CAST(N'2022-12-05T21:14:43.1169124' AS DateTime2), CAST(N'2022-12-10T21:14:43.1169124' AS DateTime2), 7154, N'Sale', N'Cash on Delivery', N'Zainab', N'zaianb@gmail.com', N'14516178191', N'Jinnah Road', N'Ajman', N'Active', N'6c28b147-c72a-4c78-b7ce-a9f41ea4edb95511', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [OrderTotal], [OrderType], [OrderStatus], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaymentDate]) VALUES (2, CAST(N'2022-12-05T21:24:26.3820813' AS DateTime2), CAST(N'2022-12-10T21:24:26.3820813' AS DateTime2), 17291, N'Sale', N'Cash on Delivery', N'Majid Ali', N'alimughal@outlook.com', N'12345678', N'House No 24', N'Abu  Dhabi ', N'Active', N'88d4b006-3d08-4ac2-a6e7-f06ef323b4577113', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [OrderTotal], [OrderType], [OrderStatus], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaymentDate]) VALUES (3, CAST(N'2022-12-05T21:31:48.3738365' AS DateTime2), CAST(N'2022-12-10T21:31:48.3738365' AS DateTime2), 758, N'Sale', N'Cash on Delivery', N'Majid Ali', N'alimughal@yahoo.com', N'12345678', N'House No 36 Street 2', N'Abu  Dhabi ', N'Active', N'87b98886-10e2-4a50-9d38-770d3875a0c58369', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [OrderTotal], [OrderType], [OrderStatus], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaymentDate]) VALUES (4, CAST(N'2022-12-09T22:35:05.9132092' AS DateTime2), CAST(N'2022-12-14T22:35:05.9132092' AS DateTime2), 653, N'Sale', N'Cash by PayPal', N'Murad', N'murad.ali.rajpoot@gmai.com', N'234567889', N'Mall Road', N'Ajman', N'Active', N'e87a25fa-ddaf-43e2-b53b-c07ee17a86639435', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblOrders] ([ID], [OrderDate], [ShippingDate], [OrderTotal], [OrderType], [OrderStatus], [OrderName], [OrderEmail], [OrderContact], [OrderAddress], [Emirates], [Status], [TrackingNumber], [PaymentDate]) VALUES (5, CAST(N'2023-05-07T17:59:09.8391056' AS DateTime2), CAST(N'2023-05-12T17:59:09.8391056' AS DateTime2), 403, N'Sale', N'Cash on Delivery', N'Rimsha Imran', N'rimsha.imran.ess@outlook.com', N'03055174001', N'www.abc.com
Address', N'Sharjaah', N'Active', N'd94a854e-2ede-4505-bd4b-afe4b2503b989529', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (1, N'Jet3D Screen', N'10 inch or 12 inch 3D Screen Enlarger', N'<p>Best 3D Screen Magnifier of 10 inches or 12 inches, Foldable and easy to carry Note: This product is Refurbished So there might be small scratches on the material.</p>', 1, 99, 29, N'\Images\ef912b5d-c6bb-4f7d-9017-d7da1f26155f.jpeg', 21, 1, 0, 1, 29, 1, 2, CAST(N'2022-12-04T18:07:44.9138393' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (2, N'IVD Glucometer', N'IVD Glucometer Set', N'<p>IVD Branded Glucometer with Free 50 Strips and 50 Lancets plus Plastic Carry Box</p>', 4, 139, 79, N'\Images\d640db71-1f63-4d04-b66e-d5f3de7507f2.jpeg', 13, 1, 0, 1, 57, 1, 2, CAST(N'2022-12-04T18:10:37.6116237' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (3, N'M4 Smartband', N'M4 Smartband Health Tracker', N'<p>M4 Smartband Health Tracker</p>', 3, 79, 39, N'\Images\3fb8c47d-25d2-48db-8bef-7ecf5ac1c310.jpeg', 13, 1, 0, 1, 49, 1, 2, CAST(N'2022-12-04T18:13:52.0586639' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (4, N'HTC 3in1 Trimmer', N'HTC AT-1322 3in1 Professional Trimmer', N'<p>HTC AT-1322 Professional 3in1 Rechargeable Trimmer</p>', 3, 129, 59, N'\Images\111378e3-94dc-40de-a4a4-0a34fe4874ae.jpeg', 40, 1, 0, 1, 46, 1, 10, CAST(N'2022-12-04T18:16:53.6537919' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (5, N'Car Lamp', N'USB Rechargeable Car Disco Lamp', N'<p>Rechargeable USB Car Disco Light of multiple colors. Number of colors may depend on model to model. This light comes without Remote.</p>', 2, 129, 49, N'\Images\e2762883-95fa-4f43-b6e2-59691f3bf6d0.jpeg', 33, 1, 0, 1, 38, 2, 4, CAST(N'2022-12-04T18:18:43.9106872' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (6, N'Washing Machine Pills', N'Washing Machine Pills 12 pcs', N'<p><a class="title" href="https://jetronics.ae/store">Washing Machine Pills 12 pcs</a></p>', 2, 99, 39, N'\Images\1af10677-f047-4516-bb6f-617f89b1491b.jpeg', 41, 1, 0, 1, 39, 12, 24, CAST(N'2022-12-04T18:50:13.9759894' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (7, N'Car Washer', N'Wireless High-Pressure Car washer', N'<p>Wireless High-Pressure Car washer with Powerful Li-on Rechargeable Battery and Carry Box</p>', 5, 249, 100, N'\Images\d41a7d18-c85b-424e-9fda-b5162d86c4cb.jpeg', 42, 1, 0, 1, 40, 1, 10, CAST(N'2022-12-04T18:53:59.6407121' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (8, N'RM Cookware Set', N'RoyalMark 13 pcs Cook Ware Set', N'<p>Royal Mark 13 Pcs Non-Stick Cookware Set with Glass Tops</p>', 3, 129, 68, N'\Images\2e86987b-4cf8-4dc4-aafd-4fe5a63e4004.jpeg', 43, 1, 0, 1, 53, 1, 10, CAST(N'2022-12-04T18:56:26.5631475' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (9, N'RC Bike', N'Remote Control Speed Bike', N'<p>Remote Controlled 2.4Ghz Speed Lightening Motorcycle is best toy this year for all ages</p>', 3, 109, 59, N'\Images\5e9f2c09-4b20-4d0a-9869-bf18126fac08.jpeg', 20, 1, 0, 1, 54, 1, 10, CAST(N'2022-12-04T19:08:35.1035461' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (11, N'Tasbih', N'Digital Rotating Tasbih Counter', N'<p>Rotating Digital Tasbih</p>', 1, 59, 29, N'\Images\42988f81-c787-4e6e-804e-a27d37c98a7e.jpeg', 44, 1, 0, 1, 49, 1, 2, CAST(N'2022-12-04T19:29:19.8222440' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (12, N'Keychain Light', N'2 Pcs Rechargeable Keychain Light', N'<p>Mini LED flashlight keychain is small, simple and easy to use, perfect flashlight for many scenarios. night walks, fishing, camping or emergency use.</p>', 2, 89, 39, N'\Images\140ec217-b919-43f9-b8df-ac21bbe4415e.jpeg', 45, 1, 0, 1, 44, 2, 4, CAST(N'2022-12-04T19:31:39.7487414' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (13, N'Cyber Gold Trimmer', N'Cyber Gold Digital Trimmer', N'<p>Cyber Made in Japan Vintage Metal Digital Heavy Duty Trimmer with One Year Warranty</p>', 4, 129, 79, N'\Images\63f651a6-bc06-4c51-88b5-54299d2bf8b5.jpeg', 40, 1, 0, 1, 61, 1, 10, CAST(N'2022-12-04T19:33:15.1504325' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (14, N'Big Solar Lights', N'Big 162 LED Solar Lights', N'<p>Big Motion Detection Solar Lights with 162 Bright LEDs</p>', 3, 99, 59, N'\Images\3ec9df1e-8ecd-458e-a2f1-00cd0061aad4.jpeg', 46, 1, 0, 1, 60, 2, 6, CAST(N'2022-12-04T19:59:15.3581011' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (15, N'J7 Smartband', N'J7 Smart Bracelet Health Tracker', N'<p>J7 Health Tracking Bracelet, Heart Monitor with Bluetooth. Watch exactly as shown in the Video. Full Black.</p>', 2, 99, 49, N'\Images\01a571e4-fb43-4ed5-ae98-8eeb7c54d8bf.jpeg', 1, 1, 0, 1, 49, 2, 4, CAST(N'2022-12-04T20:00:42.0034746' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (16, N'Cyber PRO Trimmer', N'Cyber Professional Heavy Duty Trimmer', N'<p>Rechargeable Cyber PRO Model Heavy Duty Trimmer with Big LCD Screen. Made in Japan and One Year Warranty</p>', 4, 179, 90, N'\Images\77858c8d-4a0e-482f-b95e-89ea0d2e67f8.jpeg', 40, 1, 0, 1, 50, 1, 10, CAST(N'2022-12-04T20:05:15.6712402' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (17, N'Cyber Trimmer', N'Cyber Brand Vintage Trimmer', N'<p>Cyber Brand Rechargeable Professional Vintage Trimmer with 2 Year Warranty and MADE IN JAPAN.Power button may be appear at the botton of the trimmer</p>', 2, 109, 49, N'\Images\00dd198e-721b-4b5c-953e-6c9aa3aa58f3.png', 40, 1, 0, 1, 45, 1, 10, CAST(N'2022-12-04T20:03:39.8854094' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (18, N'Wardrobe', N'Big Size Double Storage Wardrobe', N'<p>105x45x175cms Big Size Storage Wardrobe of random colors in elegant and stylish design</p>', 4, 129, 79, N'\Images\7862b46e-912e-4920-bd98-3adc4523817e.jpeg', 47, 1, 0, 1, 61, 1, 10, CAST(N'2022-12-04T20:10:22.9365823' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (19, N'Stunt Car', N'RC Double Sided Stunt Car', N'<p>Rechargeable Remote Controlled Double Sided 2.4Ghz Stun Car 4x4 is Off Road Heavy Duty</p>', 4, 109, 78, N'\Images\3693efa0-20ad-4162-b164-bc1d8e1e552b.jpeg', 20, 1, 0, 1, 72, 1, 10, CAST(N'2022-12-04T20:12:00.7489140' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (20, N'Military Watch', N'Only the Brave Military Chrono Watch', N'<p>Military Chronograph Steel Watch is big in dial and most stylish. Available in Black and Gold Colors</p>', 4, 149, 79, N'\Images\87767580-a8ad-4f3b-ae6d-19725058ecd8.jpeg', 1, 1, 0, 1, 53, 1, 10, CAST(N'2022-12-04T20:14:39.1679044' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (21, N'Night Projector', N'Wireless Projector with Remote', N'<p>Remote Controlled, Rechargeable Night Light Projector with 6 Films and Bluetooth Connectivity</p>', 4, 129, 79, N'\Images\0cd0c09c-c973-42cd-8a1d-c3395d382c5c.jpeg', 33, 1, 0, 1, 61, 1, 10, CAST(N'2022-12-04T20:16:59.5891157' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (22, N'Lenovo LP1 with T500 Smartwatch', N'Lenovo LP1 with T500 Smartwatch', N'<p>Black Friday Pre-Sale of Lenovo LP1 Bluetooth and T500 Latest Smartwatch</p>', 5, 149, 98, N'\Images\cf8bcf5d-b1a7-454b-a229-16008d83ae7e.jpeg', 1, 1, 0, 1, 66, 1, 10, CAST(N'2022-12-04T20:19:33.1237069' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (23, N'Kettle Juicer Combo', N'Cyber Electric Kettle plus HTC Juicer', N'<p>&nbsp;Brands Combo: Cyber Electric Kettle plus HTC Rechargeable Juicer</p>', 3, 119, 60, N'\Images\ba2a13f8-876d-4190-89fe-89fe176ae46e.jpeg', 43, 1, 0, 1, 50, 1, 10, CAST(N'2022-12-04T20:43:18.3957481' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (24, N'Solar Lights', N'HTC 20 LED Motion Detection Solar Light ', N'<p>HTC Brand Rechargeable Waterproof 20 LED Solar Lights with Motion Detection</p>', 2, 99, 49, N'\Images\594a8793-78bb-4ab0-9bd1-2ab7e1a79180.jpeg', 46, 1, 0, 1, 49, 4, 8, CAST(N'2022-12-04T20:44:32.7433388' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (25, N'CK Blood Pressure', N'Automatic Blood Pressure Machine', N'<p>CK Automatic Big Size Blood Pressure Monitor with One Year Warranty. Battery Operated</p>', 4, 149, 79, N'\Images\5c4a2e48-8602-4e53-98c2-e67f5dd8640f.jpeg', 13, 1, 0, 1, 53, 4, 8, CAST(N'2022-12-04T20:46:04.3956160' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblProducts] ([ID], [Name], [ShortDescription], [Description], [VAT], [RealPrice], [DiscountPrice], [ImageUrl], [CategoryID], [IsAvailable], [IsOffer], [IsDiscount], [DiscountPercent], [MinumQuantity], [MaximumQuantity], [CreatedDate], [UpdatedDate]) VALUES (26, N'Luggage Bag', N'Luggage Bag and Suit Case', N'<p>Luggage Bag and Suit Case of High Quality</p>', 2, 99, 49, N'\Images\68964a8e-dc4d-4f6c-a5f2-c1183a05cafe.jpeg', 34, 1, 0, 1, 49, 1, 10, CAST(N'2022-12-05T22:05:24.6641691' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuantities] ON 

INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 29)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 2, 45)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (4, 2, 2, 158)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (5, 2, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (6, 2, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (7, 2, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (8, 2, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (9, 2, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (10, 2, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (11, 2, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (12, 2, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (13, 3, 1, 39)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (14, 3, 2, 59)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (15, 4, 1, 59)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (16, 4, 2, 118)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (17, 4, 3, 177)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (18, 4, 4, 236)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (19, 4, 5, 295)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (20, 4, 6, 354)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (21, 4, 7, 413)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (22, 4, 8, 472)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (23, 4, 9, 531)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (24, 4, 10, 590)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (25, 5, 1, 49)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (26, 5, 2, 89)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (27, 6, 12, 39)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (28, 6, 24, 59)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (29, 7, 1, 100)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (30, 7, 2, 200)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (31, 7, 3, 300)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (32, 7, 4, 400)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (33, 7, 5, 500)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (34, 7, 6, 600)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (35, 7, 7, 700)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (36, 7, 8, 800)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (37, 7, 9, 900)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (38, 7, 10, 10000)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (39, 8, 1, 68)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (40, 8, 2, 136)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (41, 8, 3, 204)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (42, 8, 4, 272)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (43, 8, 5, 340)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (44, 8, 6, 408)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (45, 8, 7, 476)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (46, 8, 8, 544)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (47, 8, 9, 612)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (48, 8, 10, 680)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (49, 9, 1, 59)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (50, 9, 2, 118)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (51, 9, 3, 177)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (52, 9, 4, 236)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (53, 9, 5, 295)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (54, 9, 6, 354)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (55, 9, 7, 413)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (56, 9, 8, 472)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (57, 9, 9, 531)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (58, 9, 10, 590)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (59, 11, 1, 29)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (60, 11, 2, 39)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (61, 12, 2, 39)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (62, 12, 4, 69)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (63, 13, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (64, 13, 2, 158)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (65, 13, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (66, 13, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (67, 13, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (68, 13, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (69, 13, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (70, 13, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (71, 13, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (72, 13, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (73, 14, 2, 59)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (74, 14, 4, 99)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (75, 14, 6, 129)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (76, 14, 2, 49)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (77, 14, 4, 95)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (78, 16, 1, 90)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (79, 16, 2, 180)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (80, 16, 3, 270)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (81, 16, 4, 360)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (82, 16, 5, 450)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (83, 16, 6, 540)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (84, 16, 7, 630)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (85, 16, 8, 720)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (86, 16, 9, 810)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (87, 16, 10, 900)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (88, 17, 1, 49)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (89, 17, 2, 98)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (90, 17, 3, 147)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (91, 17, 4, 196)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (92, 17, 5, 245)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (93, 17, 6, 294)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (94, 17, 7, 343)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (95, 17, 8, 392)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (96, 17, 9, 441)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (97, 17, 10, 490)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (98, 18, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (99, 18, 2, 158)
GO
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (100, 18, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (101, 18, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (102, 18, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (103, 18, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (104, 18, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (105, 18, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (106, 18, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (107, 18, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (108, 19, 1, 78)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (109, 19, 2, 156)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (110, 19, 3, 234)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (111, 19, 4, 312)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (112, 19, 5, 390)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (113, 19, 6, 468)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (114, 19, 7, 546)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (115, 19, 8, 624)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (116, 19, 9, 702)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (117, 19, 10, 780)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (118, 20, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (119, 20, 2, 158)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (120, 20, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (121, 20, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (122, 20, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (123, 20, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (124, 20, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (125, 20, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (126, 20, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (127, 20, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (128, 21, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (129, 21, 2, 158)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (130, 21, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (131, 21, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (132, 21, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (133, 21, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (134, 21, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (135, 21, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (136, 21, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (137, 21, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (138, 22, 1, 98)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (139, 22, 2, 196)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (140, 22, 3, 294)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (141, 22, 4, 392)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (142, 22, 5, 490)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (143, 22, 6, 588)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (144, 22, 7, 686)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (145, 22, 8, 784)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (146, 22, 9, 882)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (147, 22, 10, 980)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (148, 23, 1, 60)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (149, 23, 2, 120)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (150, 23, 3, 180)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (151, 23, 4, 240)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (152, 23, 5, 300)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (153, 23, 6, 360)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (154, 23, 7, 420)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (155, 23, 8, 480)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (156, 23, 9, 540)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (157, 23, 10, 600)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (158, 24, 4, 49)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (159, 24, 8, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (160, 25, 1, 79)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (161, 25, 2, 158)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (162, 25, 3, 237)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (163, 25, 4, 316)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (164, 25, 5, 395)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (165, 25, 6, 474)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (166, 25, 7, 553)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (167, 25, 8, 632)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (168, 25, 9, 711)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (169, 25, 10, 790)
INSERT [dbo].[tblQuantities] ([ID], [ProductID], [Quantity], [Price]) VALUES (170, 26, 1, 49)
SET IDENTITY_INSERT [dbo].[tblQuantities] OFF
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
