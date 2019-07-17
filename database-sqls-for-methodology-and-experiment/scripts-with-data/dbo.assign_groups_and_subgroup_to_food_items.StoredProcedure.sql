USE [mrp_experiment_phase_data_process]
GO
/****** Object:  StoredProcedure [dbo].[assign_groups_and_subgroup_to_food_items]    Script Date: 2019-07-17 5:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[assign_groups_and_subgroup_to_food_items]
AS
BEGIN

   -- very important. Assign food groups and subgroups correctly.
   -- Groups/SubGroups are based on Shift Recommendation Article

    -- delete data from the table map_food_to_groups_sub_groups 
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
	select map.food_name, map.usda_food_code, substring(map.usda_food_code,1,1) as first_digit_usda_food_code, recom.usda_group_id as recom_usda_group_id
	,  recom.id, recom.id_to_use --, recom.usda_group_id_to_use
	, recom.food_group_name as recom_food_group_name, 
	 recom.id
	, map.*
	from map_food_to_groups_sub_groups map
	inner join food_groups_shift_recommendation recom on substring(map.usda_food_code,1,1) = recom.usda_group_id  and  (recom.is_in_usda = 1) -- and (recom.is_in_usda = 1)
	--left join food_groups_shift_recommendation recom on substring(map.usda_food_code,1,1) = recom.usda_group_id_to_use   and (recom.is_in_usda = 1)
	--where substring(map.usda_food_code,1,1)  = 3
	--where  recom.food_group_name = 'Egg'
	--order by recom.food_group_name
	order by recom.usda_group_id

	--left join food_groups_shift_recommendation recom on case
	--	when  substring(map.usda_food_code,1,1) in (4) and recom.usda_group_id_to_use = substring(map.usda_food_code,1,1) /*and (recom.is_in_usda = 1)*/  then 1
	--	when  substring(map.usda_food_code,1,1) not in (4) and recom.usda_group_id = substring(map.usda_food_code,1,1) and (recom.is_in_usda = 1) then 1
	--	ELSE 0
 --       END = 1


	update map_food_to_groups_sub_groups 
	set group_id = (	
		select  recom.id_to_use
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	--check all group assignment
	select * 
	from map_food_to_groups_sub_groups

	--test group assignment one by one
	-- Group id in the output will be id_to_use from shift_recommendation table
	-- food code starting with 1 -> shift id_t_use = 11 = Dairy -- though verify with the table as well 

	--Shift: 11 = dairy, 12 = Protein, 1 = Vegetable, 8 = Grain, 7 = fruits, 17 = Fats, oils, and salad dressings, 16 = Sugars, sweets, and beverages

	--scan by eye
	select * 
	from map_food_to_groups_sub_groups
	where substring(usda_food_code,1,1) = 9

	--find distinct group ids
	select distinct(map.group_id) as unique_group_ids 
	from map_food_to_groups_sub_groups map
	where substring(map.usda_food_code,1,1) = 9


	update map_food_to_groups_sub_groups 
	set map_food_to_groups_sub_groups.group_name = (	
		--select  recom.food_group_name
		select  recom.name_to_use
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	order by food_name

	--scan by eye
	--has to match as follows
	--1	= Milk and milk products = dairy, 2	= Meat, poultry, fish, and mixtures = Protein, 3	= Eggs = Protein, 4	= Legumes, nuts, and seeds = Vegetables
	-- 5	== Grain products, 6	= Fruits, 7	= Vegetables, 8	= Fats, oils, and salad dressings, 9	= Sugars, sweets, and beverages


	select * 
	from map_food_to_groups_sub_groups
	where substring(usda_food_code,1,1) = 9

	--find distinct group names
	select distinct(map.group_name) as unique_group_names 
	from map_food_to_groups_sub_groups map
	where substring(map.usda_food_code,1,1) = 9

	-- see how many distinct group names
	select distinct(map.group_name) as unique_group_names 
	from map_food_to_groups_sub_groups map
	order by unique_group_names

	--update map_food_to_groups_sub_groups
	--set group_name = (select top(1) recom.food_group_name
	--from map_food_to_groups_sub_groups map
	--left join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map.usda_food_code,1,1) and recom.is_parent = 1)

	--select * 
	--from map_food_to_groups_sub_groups


	---- SUB Group ---
	-- does not give complete picture as I used subgroup codes that are 4 or 5 char long
	select distinct(substring(map.usda_food_code, 1, 2) ) as code
	from map_food_to_groups_sub_groups map
	order by code


	---test to find the correct id
	select len(recom.usda_subgroup_code_1) length_code_1, map.id, map.usda_food_code, map.food_name, map.group_id /*group id in map table*/
	,recom.usda_group_id, recom.food_group_name, substring(map.usda_food_code,1,2) as subgroup_code, recom.id as recom_id, recom.id_to_use as recom_id_to_use,  recom.[usda_subgroup_code_1]
	from map_food_to_groups_sub_groups map
	inner join food_groups_shift_recommendation recom on 
	
	recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,  len(recom.usda_subgroup_code_1)  ) 	
	or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_2)) 
	or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_3)) 
	or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_4)) 
	or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_5) ) 
	or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_6) ) 
	or recom.usda_subgroup_code_7 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_7) ) 
	or recom.usda_subgroup_code_8 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_8) ) 
	
	--where substring(map.usda_food_code,1,1)  = 7
	--order by usda_food_code
	--where recom.is_parent =0 
	where recom.id is  not null
	--where food_name like '%Egg%'
	order by usda_food_code

	--set subgroup id
	update map_food_to_groups_sub_groups 
	set sub_group_id = (	
		select   recom.id_to_use -- NEED Attention
		from map_food_to_groups_sub_groups map
		inner join food_groups_shift_recommendation recom on 
				
		recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,  len(recom.usda_subgroup_code_1)  ) 	
		or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_2)) 
		or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_3)) 
		or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_4)) 
		or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_5) ) 
		or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_6) ) 
		or recom.usda_subgroup_code_7 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_7) ) 
		or recom.usda_subgroup_code_8 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_8) )
				
		where map.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where sub_group_id is not null
	order by sub_group_id desc


	--test sub group assignment one by one
	-- Group id in the output will be id_to_use from shift_recommendation table
	-- food code starting with 1 -> shift id_t_use = 11 = Dairy -- though verify with the table as well 

	--Shift: 11 = dairy, 12 = Protein, 1 = Vegetable, 8 = Grain, 7 = fruits, 17 = Fats, oils, and salad dressings, 16 = Sugars, sweets, and beverages

	--scan by eye
	select * 
	from map_food_to_groups_sub_groups
	where substring(usda_food_code,1,1) = 4

	--find distinct group ids
	select distinct(map.sub_group_id) as unique_sub_group_ids 
	from map_food_to_groups_sub_groups map
	where substring(map.usda_food_code,1,1) = 4





	--update subgroup name
	update map_food_to_groups_sub_groups 
	set map_food_to_groups_sub_groups.subgroup_name = (	
		select   
		recom.food_group_name
		--recom.name_to_use
		from map_food_to_groups_sub_groups map
		
		inner join food_groups_shift_recommendation recom on 


		recom.usda_subgroup_code_1 = substring(map.usda_food_code,1,  len(recom.usda_subgroup_code_1)  ) 	
		or recom.usda_subgroup_code_2 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_2)) 
		or recom.usda_subgroup_code_3 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_3)) 
		or recom.usda_subgroup_code_4 = substring(map.usda_food_code,1,len(recom.usda_subgroup_code_4)) 
		or recom.usda_subgroup_code_5 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_5) ) 
		or recom.usda_subgroup_code_6 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_6) ) 
		or recom.usda_subgroup_code_7 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_7) ) 
		or recom.usda_subgroup_code_8 = substring(map.usda_food_code,1, len(recom.usda_subgroup_code_8) )

		where (recom.is_shift_subgroup = 1) and  map.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups
	where usda_food_code like '3%'

	select * 
	from map_food_to_groups_sub_groups
	where group_id=3

	select * 
	from map_food_to_groups_sub_groups
	where subgroup_name is  null

	select * 
	from map_food_to_groups_sub_groups
	where subgroup_name is not null
	order by sub_group_id --desc

	--find all legumes and peas
	select * from map_food_to_groups_sub_groups
	where group_id = 4 and sub_group_id=4


	-- Manual changes to groups and subgroups are no longer required
	--Hence the following code is not useful rather can cause issues
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
