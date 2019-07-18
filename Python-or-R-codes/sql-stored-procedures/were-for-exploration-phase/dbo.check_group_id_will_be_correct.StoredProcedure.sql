USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[check_group_id_will_be_correct]    Script Date: 2019-07-03 11:40:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[check_group_id_will_be_correct] 
AS
BEGIN

-- all food groups possible
-- verify they match : shift recommendation and map and usda
select shift.is_in_usda, shift.usda_group_id, shift.*
from food_groups_shift_recommendation shift
where is_in_usda = 1
order by shift.usda_group_id

-- all the food subgroups possible
-- verify they match : shift recommendation and map and usda
select shift.is_in_usda, shift.usda_group_id, shift.*
from food_groups_shift_recommendation shift
where shift.usda_subgroup_code_1 is not null
order by shift.usda_group_id


END
GO
