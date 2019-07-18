USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[assign_subgroup_to_food_items]    Script Date: 2019-07-03 11:40:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[assign_subgroup_to_food_items]
AS
BEGIN

    -- No longer used

	truncate table map_food_to_groups_sub_groups

	insert into map_food_to_groups_sub_groups (usda_food_code, food_name)
	SELECT cast([DRXFDCD] as int), cast([DRXFCSD] as varchar)
	from [2015-2016-support-food-codes-DRXFCD_I]

	select * 
	from map_food_to_groups_sub_groups

	--Assign primary food group id
	--match code with usda code using usda_food_groups
	--insert id from food_groups_shift_recommendation

	---test to find the correct id
	select map.*, recom.usda_group_id, recom.food_group_name, substring(map.usda_food_code,1,1) , recom.id
	from map_food_to_groups_sub_groups map
	inner join food_groups_shift_recommendation recom on 
	(recom.usda_group_id = substring(map.usda_food_code,1,1)) and (recom.is_in_usda = 1) --and (recom.is_parent=1)
	--where substring(map.usda_food_code,1,1)  = 3
	where recom.id is not null

	update map_food_to_groups_sub_groups 
	set group_id = (	
		select  recom.id
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where group_id is not null

	update map_food_to_groups_sub_groups 
	set map_food_to_groups_sub_groups.group_name = (	
		select  recom.food_group_name
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where group_name is not null



	--update map_food_to_groups_sub_groups
	--set group_name = (select recom.food_group_name
	--from map_food_to_groups_sub_groups map
	--inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map.usda_food_code,1,1) and recom.is_in_usda = 1)

	--select * 
	--from map_food_to_groups_sub_groups

	---- SUB Group ---
	---test to find the correct id
	select map.id, map.usda_food_code, map.food_name, map.group_id
	,recom.usda_group_id, recom.food_group_name, substring(map.usda_food_code,1,2) as subgroup_code, recom.id, recom.[usda_subgroup_code_1]
	from map_food_to_groups_sub_groups map
	inner join food_groups_shift_recommendation recom on 
	
	recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,2) 
	--or cast (recom.usda_subgroup_code_1 as int) = cast (substring(map.usda_food_code,1,1)  as int)
	or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,2) 
	or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1,2) 
	or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,2) 
	or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1,2) 
	or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1,2) 
	
	--where substring(map.usda_food_code,1,1)  = 7
	--order by usda_food_code
	where recom.id is not null

	--set subgroup id
	update map_food_to_groups_sub_groups 
	set sub_group_id = (	
		select  recom.id
		from map_food_to_groups_sub_groups map
		inner join food_groups_shift_recommendation recom on 
		
		
		recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1,2)

		
		
		where map.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where sub_group_id is not null
	order by sub_group_id desc

	--update subgroup name
	update map_food_to_groups_sub_groups 
	set map_food_to_groups_sub_groups.subgroup_name = (	
		select  recom.food_group_name
		from map_food_to_groups_sub_groups map
		inner join food_groups_shift_recommendation recom on 


		recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1,2) 
		or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1,2)

		where map.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where group_id=4

	select * 
	from map_food_to_groups_sub_groups
	where subgroup_name is not null
	order by sub_group_id --desc

	--find all legumes and peas
	select * from map_food_to_groups_sub_groups
	where group_id = 4 and sub_group_id=4

	--manually assign vegetable group to legumes -- beans and peas
	update map_food_to_groups_sub_groups
	set group_id = 4 , sub_group_id=6, group_name = 'Vegetables'
	where group_id = 4 and sub_group_id=4

	update map_food_to_groups_sub_groups
	set group_name = 'Protein'
	where group_id = 4 and sub_group_id=15


	---missing groups and subgroups
	select * 
	from map_food_to_groups_sub_groups
	where subgroup_name is  null
	order by sub_group_id --desc





	



END
GO
