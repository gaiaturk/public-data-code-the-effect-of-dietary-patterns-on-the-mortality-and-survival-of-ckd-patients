USE [mrp_experiment_phase_data_process]
GO
/****** Object:  Table [dbo].[age_combined_subgroup_recommended_age]    Script Date: 2019-07-17 5:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[age_combined_subgroup_recommended_age](
	[age_from] [int] NOT NULL,
	[age_to] [int] NOT NULL,
	[dark_green_taken] [float] NOT NULL,
	[dark_green_low] [float] NOT NULL,
	[dark_green_high] [float] NOT NULL,
	[legumes_beans_peas_taken] [float] NOT NULL,
	[legumes_beans_peas__low] [float] NOT NULL,
	[legumes_beans_peas_high] [float] NOT NULL,
	[meat_poultry_eggs_taken] [int] NOT NULL,
	[meat_poultry_eggs_low] [int] NOT NULL,
	[meat_poultry_eggs_high] [int] NOT NULL,
	[nuts_seeds_taken] [int] NOT NULL,
	[nuts_seeds_low] [int] NOT NULL,
	[nuts_seeds_high] [int] NOT NULL,
	[other_vegetables_taken] [float] NOT NULL,
	[other_vegetables_low] [float] NOT NULL,
	[other_vegetables_high] [float] NOT NULL,
	[red_orange_vegetables_taken] [float] NOT NULL,
	[red_orange_vegetables_low] [float] NOT NULL,
	[red_orange_vegetables_high] [float] NOT NULL,
	[seafood_taken] [int] NOT NULL,
	[seafood_low] [int] NOT NULL,
	[seafood_high] [int] NOT NULL,
	[starchy_vegetables_taken] [float] NOT NULL,
	[starchy_vegetables_low] [float] NOT NULL,
	[starchy_vegetables_high] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (1, 3, 37.5, 75, 150, 60, 60, 90, 2400, 1500, 2850, 300, 300, 450, 172.5, 225, 375, 217.5, 375, 450, 150, 450, 900, 232.5, 300, 525)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (4, 8, 60, 150, 225, 60, 75, 225, 3300, 2100, 3750, 450, 300, 675, 202.5, 375, 600, 270, 450, 825, 150, 600, 1200, 330, 525, 750)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (9, 13, 60, 187.5, 337.5, 75, 112.5, 337.5, 4050, 3225, 4500, 525, 525, 750, 270, 450, 787.5, 307.5, 525, 975, 225, 1050, 1425, 405, 562.5, 975)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (14, 18, 67.5, 225, 337.5, 75, 225, 375, 4800, 3750, 4875, 450, 675, 825, 367.5, 600, 900, 360, 825, 1012.5, 225, 1200, 1500, 427.5, 750, 1050)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (19, 30, 97.5, 262.5, 337.5, 112.5, 262.5, 375, 5400, 4125, 4875, 525, 675, 825, 547.5, 675, 900, 435, 862.5, 1012.5, 2475, 900, 1500, 450, 825, 1050)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (31, 50, 135, 262.5, 337.5, 135, 262.5, 375, 5475, 3975, 4725, 825, 675, 825, 615, 675, 900, 442.5, 862.5, 1012.5, 675, 1275, 1425, 495, 825, 1050)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (51, 70, 180, 225, 337.5, 105, 187.5, 337.5, 4950, 3750, 4725, 825, 675, 825, 697.5, 562.5, 787.5, 435, 712.5, 975, 675, 1200, 1425, 510, 675, 975)
INSERT [dbo].[age_combined_subgroup_recommended_age] ([age_from], [age_to], [dark_green_taken], [dark_green_low], [dark_green_high], [legumes_beans_peas_taken], [legumes_beans_peas__low], [legumes_beans_peas_high], [meat_poultry_eggs_taken], [meat_poultry_eggs_low], [meat_poultry_eggs_high], [nuts_seeds_taken], [nuts_seeds_low], [nuts_seeds_high], [other_vegetables_taken], [other_vegetables_low], [other_vegetables_high], [red_orange_vegetables_taken], [red_orange_vegetables_low], [red_orange_vegetables_high], [seafood_taken], [seafood_low], [seafood_high], [starchy_vegetables_taken], [starchy_vegetables_low], [starchy_vegetables_high]) VALUES (71, 120, 127.5, 225, 337.5, 97.5, 187.5, 337.5, 4050, 3750, 4725, 825, 675, 825, 562.5, 562.5, 787.5, 405, 712.5, 975, 600, 1200, 1425, 502.5, 675, 975)
