USE [LetShare]
GO
/****** Object:  StoredProcedure [dbo].[removeshare]    Script Date: 4/6/2018 7:37:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[removeshare]
 as
 begin
    update Share set sell=1 
	begin
	 update Product set GiaMoi = b.Sell * a.DonGia , DemShare =0 from Product a, Share b where b.ID_SProduct = a.ID_SanPham
	end
 end
GO
/****** Object:  StoredProcedure [dbo].[Updatesell]    Script Date: 4/6/2018 7:37:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Updatesell]
 as
 begin
 Select * from Product
 end
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/6/2018 7:37:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID_Bill] [int] NOT NULL,
	[Customer_ID] [int] NULL,
	[TongTien] [int] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID_Bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 4/6/2018 7:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[ID_BillDetail] [int] NOT NULL,
	[ID_BDSanPham] [int] NULL,
	[ID_BDBill] [int] NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[ID_BillDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/6/2018 7:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[PassWord] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomSP]    Script Date: 4/6/2018 7:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSP](
	[ID_NhomSp] [int] NOT NULL,
	[TenNhom] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomSP] PRIMARY KEY CLUSTERED 
(
	[ID_NhomSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/6/2018 7:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_SanPham] [int] NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[GiaMoi] [int] NULL,
	[DemShare] [int] NULL,
	[Mota] [nvarchar](50) NULL,
	[Image] [image] NULL,
	[TrangThai] [int] NULL,
	[ID_NhomSP] [int] NULL,
	[ID_BillDetail] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID_SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Share]    Script Date: 4/6/2018 7:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[ID_Share] [int] NOT NULL,
	[Sell] [int] NOT NULL,
	[ID_SProduct] [int] NULL,
 CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED 
(
	[ID_Share] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bill] FOREIGN KEY([ID_BDBill])
REFERENCES [dbo].[Bill] ([ID_Bill])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bill]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Product] FOREIGN KEY([ID_BDSanPham])
REFERENCES [dbo].[Product] ([ID_SanPham])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_NhomSP] FOREIGN KEY([ID_NhomSP])
REFERENCES [dbo].[NhomSP] ([ID_NhomSp])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_NhomSP]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_Product] FOREIGN KEY([ID_SProduct])
REFERENCES [dbo].[Product] ([ID_SanPham])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_Product]
GO
