USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[gender_get_food_subgroup_based_dietary_intake_by_participants]    Script Date: 2019-07-03 12:02:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[gender_get_food_subgroup_based_dietary_intake_by_participants]
AS
BEGIN
    
    -- This is very important. This is used to get data for sub group based food intake

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	-- EXPLORATION
	-- Insert statements for procedure here
	select 
	demo.[SEQN - Respondent sequence number] as participant_id
	, demo.[RIDAGEYR - Age in years at screening] as age
	, food_code.[DRXFCLD] as food_taken
	, map.sub_group_id
	, map.food_name
	--, map.group_name
	, recom.food_group_name
	, map.subgroup_name
	, map.group_name as map_parent_group
	, [DR1IGRMS - Grams] as food_weight_in_gms
	, [DR1IFDCD - USDA food code] as usda_food_code
	--, diet.*
	from [2015-2016-demographics_data] demo
	inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	inner join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]
	inner join map_food_to_groups_sub_groups map on map.usda_food_code = diet.[DR1IFDCD - USDA food code]	
	inner join food_groups_shift_recommendation recom on recom.id = map.sub_group_id and (map.sub_group_id is not null)
	order by participant_id, sub_group_id





	-- GET amount in gms taken by groups
	select 
	max(demo.[SEQN - Respondent sequence number]) as participant_id
	, max(demo.[RIDAGEYR - Age in years at screening]) as age
	, max(demo.[DMDHRGND - HH ref person's gender]) as gender
	--, food_code.[DRXFCLD] as food_taken
	,max(map.sub_group_id) as sub_group_id

	, max(map.food_name) as food_name_a_sample
	--, max(map.group_name) as food_group_name
	, max(recom.food_group_name) as food_subgroup_name

	, max(map.subgroup_name) as map_subgroup
	, max(map.group_name) as map_parent_group

	, sum([DR1IGRMS - Grams]) as food_weight_in_gms
	--, [DR1IFDCD - USDA food code] as usda_food_code
	--, diet.*
	from [2015-2016-demographics_data] demo
	inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	inner join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]
	inner join map_food_to_groups_sub_groups map on map.usda_food_code = diet.[DR1IFDCD - USDA food code]
	--left join age_groups on demo.[RIDAGEYR - Age in years at screening]  <= age_groups.[to] and (demo.[RIDAGEYR - Age in years at screening]  >= age_groups.[from]) 
	--inner join food_groups_shift_recommendation recom on recom.id = map.group_id
	inner join food_groups_shift_recommendation recom on recom.id = map.sub_group_id and (map.sub_group_id is not null)
	group by /*demo.[DMDHRGND - HH ref person's gender],*/ demo.[SEQN - Respondent sequence number], sub_group_id -- it cannot be group id, as different subgroup can belong to the same group
	order by demo.[SEQN - Respondent sequence number]

	-- it cannot be group id, as different subgroup can belong to the same group
	-- changing the group also is a possibility in future

	-- 
	drop table #subgroup_based_total_taken

	select
	count(distinct(demo.[SEQN - Respondent sequence number])) as no_of_participants
	,min(demo.[RIDAGEYR - Age in years at screening]) as min_age_for_group
	,max(demo.[RIDAGEYR - Age in years at screening]) as max_age_for_group
	, max(demo.[DMDHRGND - HH ref person's gender]) as gender
	,min(age_groups.id) as age_group_id
	--max(demo.[SEQN - Respondent sequence number]) as participant_id
	--, max(demo.[RIDAGEYR - Age in years at screening]) as age
	--, food_code.[DRXFCLD] as food_taken
	,max(map.sub_group_id) as food_subgroup_id
	--, max(map.group_name) as food_group_name
	, max(recom.food_group_name) as food_subgroup_name

	, max(map.subgroup_name) as map_subgroup
	, max(map.group_name) as map_parent_group

	, sum([DR1IGRMS - Grams]) as food_weight_in_gms
	--, [DR1IFDCD - USDA food code] as usda_food_code
	--, diet.*
	into #subgroup_based_total_taken
	from [2015-2016-demographics_data] demo
	inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	inner join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]
	inner join map_food_to_groups_sub_groups map on map.usda_food_code = diet.[DR1IFDCD - USDA food code]
	--inner join food_groups_shift_recommendation recom on recom.id = map.group_id
	inner join food_groups_shift_recommendation recom on recom.id = map.sub_group_id and (map.sub_group_id is not null)
	left join age_groups on demo.[RIDAGEYR - Age in years at screening]  <= age_groups.[to] and (demo.[RIDAGEYR - Age in years at screening]  >= age_groups.[from]) 
	--group by demo.[SEQN - Respondent sequence number], group_id
	--order by demo.[SEQN - Respondent sequence number]
	group by demo.[DMDHRGND - HH ref person's gender], age_groups.id, map.sub_group_id --map.group_id
	order by age_group_id


	update #subgroup_based_total_taken
	set gender = 'Male'
	where gender = 1

	update #subgroup_based_total_taken
	set gender = 'Female'
	where gender = '2'




	select
	no_of_participants
	,min_age_for_group
	,max_age_for_group
	,age_group_id
	,gender			
	,food_subgroup_id
	,food_subgroup_name
	,map_subgroup
	,map_parent_group
	,food_weight_in_gms as sum_taken_in_gms
	,round(food_weight_in_gms/no_of_participants,2) as avg_taken_in_gms
	
	from #subgroup_based_total_taken	
	--order by age_group_id, food_subgroup_id
	order by age_group_id, food_subgroup_name

	select
	age_group_id		
	,no_of_participants	
	,min_age_for_group
	,max_age_for_group	
	, gender	
	,food_subgroup_id
	,food_subgroup_name
	,map_subgroup
	,map_parent_group
	,food_weight_in_gms as sum_taken_in_gms
	--,food_weight_in_gms/no_of_participants as avg_taken	
	,round(food_weight_in_gms/no_of_participants,2) as avg_taken_in_gms
	from #subgroup_based_total_taken	
	order by food_subgroup_id, age_group_id
	
END
GO
