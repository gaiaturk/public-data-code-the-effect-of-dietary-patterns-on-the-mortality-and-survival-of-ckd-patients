USE [mrp_experiment_phase_data_process]
GO
/****** Object:  Table [dbo].[usda_food_groups]    Script Date: 2019-07-17 5:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usda_food_groups](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[id_to_use] [smallint] NULL,
	[food_group_name] [varchar](500) NOT NULL,
	[food_group_name_to_use] [nvarchar](500) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_food_groups_subgroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usda_food_groups] ON 

INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (1, 1, N'Milk and milk products', N'Dairy', N'Milk and milk products')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (2, 2, N'Meat, poultry, fish, and mixtures', N'Protein', N'Meat, poultry, fish, and mixtures')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (3, 2, N'Eggs', N'Protein', N'Eggs')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (4, 4, N'Legumes, nuts, and seeds', N'Vegetables', N'Legumes, nuts, and seeds')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (5, 5, N'Grain products', N'Grain products', N'Grain products')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (6, 6, N'Fruits', N'Fruits', N'Fruits')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (7, 7, N'Vegetables', N'Vegetables', N'Vegetables')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (8, 8, N'Fats, oils, and salad dressings', N'Fats, oils, and salad dressings', N'Fats, oils, and salad dressings')
INSERT [dbo].[usda_food_groups] ([id], [id_to_use], [food_group_name], [food_group_name_to_use], [description]) VALUES (9, 9, N'Sugars, sweets, and beverages', N'Sugars, sweets, and beverages', N'Sugars, sweets, and beverages')
SET IDENTITY_INSERT [dbo].[usda_food_groups] OFF
