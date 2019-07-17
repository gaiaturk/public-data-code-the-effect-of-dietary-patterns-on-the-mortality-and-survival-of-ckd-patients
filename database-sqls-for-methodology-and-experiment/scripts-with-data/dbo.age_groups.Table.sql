USE [mrp_experiment_phase_data_process]
GO
/****** Object:  Table [dbo].[age_groups]    Script Date: 2019-07-17 5:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[age_groups](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[from] [smallint] NOT NULL,
	[to] [smallint] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[age_groups] ON 

INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (1, 0, 4)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (2, 5, 9)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (3, 10, 13)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (4, 14, 17)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (5, 18, 21)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (6, 22, 24)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (7, 25, 29)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (8, 30, 34)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (9, 35, 39)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (10, 40, 44)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (11, 45, 49)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (12, 50, 54)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (13, 55, 59)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (14, 60, 64)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (15, 65, 69)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (16, 70, 74)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (17, 75, 79)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (18, 80, 84)
INSERT [dbo].[age_groups] ([id], [from], [to]) VALUES (19, 85, 150)
SET IDENTITY_INSERT [dbo].[age_groups] OFF
