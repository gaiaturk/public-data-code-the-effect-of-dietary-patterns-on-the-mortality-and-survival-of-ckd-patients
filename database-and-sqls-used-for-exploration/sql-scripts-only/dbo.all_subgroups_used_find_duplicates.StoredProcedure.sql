USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[all_subgroups_used_find_duplicates]    Script Date: 2019-07-03 11:40:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[all_subgroups_used_find_duplicates] 
AS
BEGIN
	
	-- check if any food code is used for multiple subgroups that should not happen

	(select usda_subgroup_code_1 as x from food_groups_shift_recommendation where usda_subgroup_code_1 is not null)
	union all
	(select usda_subgroup_code_2 as x from food_groups_shift_recommendation where usda_subgroup_code_2 is not null)
	union all
	select usda_subgroup_code_3  as x  from food_groups_shift_recommendation where usda_subgroup_code_3 is not null 
	union all
	select usda_subgroup_code_4  as x from food_groups_shift_recommendation where usda_subgroup_code_4 is not null 
	union all
	select usda_subgroup_code_5  as x from food_groups_shift_recommendation where usda_subgroup_code_5 is not null 
	union all
	select usda_subgroup_code_6  as x from food_groups_shift_recommendation where usda_subgroup_code_6 is not null 
	union all
	select usda_subgroup_code_7  as x from food_groups_shift_recommendation where usda_subgroup_code_7 is not null 
	union all
	select usda_subgroup_code_8  as x from food_groups_shift_recommendation where usda_subgroup_code_8 is not null
	order by x



END
GO
