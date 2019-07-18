USE [mrp_experiment_phase_data_process]
GO
/****** Object:  StoredProcedure [dbo].[merged_individual_foods_and_nutrients]    Script Date: 2019-07-17 5:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[merged_individual_foods_and_nutrients]
AS
BEGIN

	select top (10) *
	from temp_albumin_creatinine_and_demographics_nutrients


	select top (10) *
	from food_groups_in_column_names


	select   survey.*, demo.[SEQN - Respondent sequence number]	
	from [multi-day-2015-2016-dietary-nutrients-intake] survey
	inner join [2015-2016-demographics_data] demo on demo.[SEQN - Respondent sequence number] = survey.[SEQN - Respondent sequence number]



	select *
	--into merged_individual_foods_and_nutrients
	from food_groups_in_column_names foods
	left join temp_albumin_creatinine_and_demographics_nutrients  nutrients on nutrients.participant_id = foods.participant_id



	---

	--result:  8608 rows
	select 
	max(demo.[SEQN - Respondent sequence number]) as participant_id
	

	/*
	,max(demo.[RIDAGEYR - Age in years at screening]) as participant_age
	,avg(acr.[URDACT - Albumin creatinine ratio (mg/g)]) as acr
	,max(kidney.[KIQ022 - Ever told you had weak/failing kidneys]) as kidney_failed
	,avg(blood.[BPXSY1 - Systolic: Blood pres (1st rdg) mm Hg]) as systolic_pressure
	,avg(blood.[BPXDI1 - Diastolic: Blood pres (1st rdg) mm Hg]) as diastolic_pressure
	,max(demo.[RIAGENDR - Gender]) as gender
	*/
	
	
	,avg(survey.[DR1TKCAL - Energy (kcal)]) as avg_energy_kcal
    ,avg(survey.[DR1TPROT - Protein (gm)]) as avg_protein_gm
    ,avg(survey.[DR1TCARB - Carbohydrate (gm)]) as avg_carbohydrate_gm
    ,avg(survey.[DR1TSUGR - Total sugars (gm)]) as avg_total_sugars
    ,avg(survey.[DR1TFIBE - Dietary fiber (gm)]) as avg_dietary_fiber_gm
    ,avg(survey.[DR1TTFAT - Total fat (gm)]) as avg_total_fat_gm
    ,avg(survey.[DR1TSFAT - Total saturated fatty acids (gm)]) as avg_total_saturated_fatty_acids_gm
    ,avg(survey.[DR1TMFAT - Total monounsaturated fatty acids (gm)]) as avg_total_monounsaturated_fatty_acids_gm
    ,avg(survey.[DR1TPFAT - Total polyunsaturated fatty acids (gm)]) as avg_total_polyunsaturated_fatty_acids_gm
    ,avg(survey.[DR1TCHOL - Cholesterol (mg)]) as avg_cholesterol_mg
    ,avg(survey.[DR1TATOC - Vitamin E as alpha-tocopherol (mg)]) as avg_vitamin_e_as_alpha_tocopherol_mg
    ,avg(survey.[DR1TATOA - Added alpha-tocopherol (Vitamin E) (mg)]) as avg_added_alpha_tocopherol_vitamin_E_mg
    ,avg(survey.[DR1TRET - Retinol (mcg)]) as retinol_mcg
    ,avg(survey.[DR1TVARA - Vitamin A, RAE (mcg)]) as avg_Vitamin_A_RAE_mcg
    ,avg(survey.[DR1TACAR - Alpha-carotene (mcg)]) as avg_Alpha_carotene_mcg
    ,avg(survey.[DR1TBCAR - Beta-carotene (mcg)]) as avg_beta_carotene_mcg
    ,avg(survey.[DR1TCRYP - Beta-cryptoxanthin (mcg)]) as avg_beta_cryptoxanthin_mcg
    ,avg(survey.[DR1TLYCO - Lycopene (mcg)]) as avg_lycopene_mcg
    ,avg(survey.[DR1TLZ - Lutein + zeaxanthin (mcg)]) as avg_lutein_zeaxanthin_mcg
    ,avg(survey.[DR1TVB1 - Thiamin (Vitamin B1) (mg)]) as avg_thiamin_vitamin_B1_mg
    ,avg(survey.[DR1TVB2 - Riboflavin (Vitamin B2) (mg)]) as avg_riboflavin_Vitamin_B2_mg
    ,avg(survey.[DR1TNIAC - Niacin (mg)]) as avg_Niacin_mg
    ,avg(survey.[DR1TVB6 - Vitamin B6 (mg)]) as avg_Vitamin_B6_mg
    ,avg(survey.[DR1TFOLA - Total folate (mcg)]) as avg_Total_folate_mcg
    ,avg(survey.[DR1TFA - Folic acid (mcg)]) as avg_Folic_acid_mcg
    ,avg(survey.[DR1TFF - Food folate (mcg)]) as avg_Food_folate_mcg
    ,avg(survey.[DR1TFDFE - Folate, DFE (mcg)]) as avg_Folate_DFE_mcg
    ,avg(survey.[DR1TCHL - Total choline (mg)]) as Total_choline_mg
    ,avg(survey.[DR1TVB12 - Vitamin B12 (mcg)]) as Vitamin_B12_mcg
    ,avg(survey.[DR1TB12A - Added vitamin B12 (mcg)]) as avg_Added_vitamin_B12_mcg
    ,avg(survey.[DR1TVC - Vitamin C (mg)]) as avg_Vitamin_C_mg
    ,avg(survey.[DR1TVD - Vitamin D (D2 + D3) (mcg)]) as avg_Vitamin_D_D2_D3_mcg
    ,avg(survey.[DR1TVK - Vitamin K (mcg)]) as avg_Vitamin_K_mcg
    ,avg(survey.[DR1TCALC - Calcium (mg)]) as avg_Calcium_mg
    ,avg(survey.[DR1TPHOS - Phosphorus (mg)]) as avg_Phosphorus_mg
    ,avg(survey.[DR1TMAGN - Magnesium (mg)]) as avg_Magnesium_mg
    ,avg(survey.[DR1TIRON - Iron (mg)]) as avg_Iron_mg
    ,avg(survey.[DR1TZINC - Zinc (mg)]) as avg_Zinc_mg
    ,avg(survey.[DR1TCOPP - Copper (mg)]) as avg_Copper_mg
    ,avg(survey.[DR1TSODI - Sodium (mg)]) as avg_Sodium_mg
    ,avg(survey.[DR1TPOTA - Potassium (mg)]) as avg_Potassium_mg
    ,avg(survey.[DR1TSELE - Selenium (mcg)]) as avg_Selenium_mcg
    ,avg(survey.[DR1TCAFF - Caffeine (mg)]) as avg_Caffeine_mg
    ,avg(survey.[DR1TTHEO - Theobromine (mg)]) as avg_Theobromine_mg
    ,avg(survey.[DR1TALCO - Alcohol (gm)]) as avg_Alcohol_gm
    ,avg(survey.[DR1TMOIS - Moisture (gm)]) as avg_Moisture_gm
    ,avg(survey.[DR1TS040 - SFA 4:0 (Butanoic) (gm)]) as Butanoic_gm
    ,avg(survey.[DR1TS060 - SFA 6:0 (Hexanoic) (gm)]) as Hexanoic_gm
    ,avg(survey.[DR1TS080 - SFA 8:0 (Octanoic) (gm)]) as Octanoic_gm
    ,avg(survey.[DR1TS100 - SFA 10:0 (Decanoic) (gm)]) as Decanoic_gm
    ,avg(survey.[DR1TS120 - SFA 12:0 (Dodecanoic) (gm)]) as Dodecanoic_gm
    ,avg(survey.[DR1TS140 - SFA 14:0 (Tetradecanoic) (gm)]) as Tetradecanoic_gm
    ,avg(survey.[DR1TS160 - SFA 16:0 (Hexadecanoic) (gm)]) as Hexadecanoic_gm
    ,avg(survey.[DR1TS180 - SFA 18:0 (Octadecanoic) (gm)]) as Octadecanoic_gm
    ,avg(survey.[DR1TM161 - MFA 16:1 (Hexadecenoic) (gm)]) as Hexadecenoic_gm
    ,avg(survey.[DR1TM181 - MFA 18:1 (Octadecenoic) (gm)]) as Octadecenoic_gm
    ,avg(survey.[DR1TM201 - MFA 20:1 (Eicosenoic) (gm)]) as Eicosenoic_gm
    ,avg(survey.[DR1TM221 - MFA 22:1 (Docosenoic) (gm)]) as Docosenoic_gm
    ,avg(survey.[DR1TP182 - PFA 18:2 (Octadecadienoic) (gm)]) as Octadecadienoic1_gm
    ,avg(survey.[DR1TP183 - PFA 18:3 (Octadecatrienoic) (gm)]) as Octadecatrienoic2_gm
    ,avg(survey.[DR1TP184 - PFA 18:4 (Octadecatetraenoic) (gm)]) as Octadecatetraenoic3_gm
    ,avg(survey.[DR1TP204 - PFA 20:4 (Eicosatetraenoic) (gm)]) as Eicosatetraenoic1_gm
    ,avg(survey.[DR1TP205 - PFA 20:5 (Eicosapentaenoic) (gm)]) as Eicosapentaenoic2_gm
    ,avg(survey.[DR1TP225 - PFA 22:5 (Docosapentaenoic) (gm)]) as Docosapentaenoic1_gm
    ,avg(survey.[DR1TP226 - PFA 22:6 (Docosahexaenoic) (gm)]) as Docosahexaenoic2_gm      
    ,avg(survey.[DR1_320Z - Total plain water drank yesterday (gm)]) as avg_Total_plain_water_drank_yesterday_gm
    ,avg(survey.[DR1_330Z - Total tap water drank yesterday (gm)]) as avg_Total_tap_water_drank_yesterday_gm
    ,avg(survey.[DR1BWATZ - Total bottled water drank yesterday (gm)]) as avg_Total_bottled_water_drank_yesterday_gm	

	/*
	,max(acr.[URXUMA - Albumin, urine (ug/mL)]) as albumin_urine_mu_g
	,max(acr.[URXUMS - Albumin, urine (mg/L)]) as albumin_urine_mg
	,max(acr.[URXCRS - Creatinine, urine (umol/L)]) as creatinine_mu_mol
	,max(acr.[URXUCR - Creatinine, urine (mg/dL)]) as creatinine_mg	
	,max(kidney.[KIQ025 - Received dialysis in past 12 months]) as received_dialysis_in_12_months
	,max(kidney.[KIQ026 - Ever had kidney stones?]) as kidney_stones
	,max(kidney.[KIQ029 - Pass kidney stone in past 12 months?]) as passed_kidney_stones_12_months			
	,max(kidney.[KIQ005 - How often have urinary leakage]) as urinary_leakage_frequency	
	,max(kidney.[KIQ010 - How much urine lose each time?]) as urine_lose_each_time	
	,max(kidney.[KIQ042 - Leak urine during physical activities]) as leak_during_activities	
	,max(kidney.[KIQ430 - How frequently does this occur?]) as how_frequent_leak_occurs	
	,max(kidney.[KIQ044 - Urinated before reaching the toilet]) as urinated_before_reaching_toilet	
	,max(kidney.[KIQ450 - How frequently does this occur?]) as how_frequent	
	,max(kidney.[KIQ046 - Leak urine during nonphysical activities]) as leak_during_nonphysical_activities	
	,max(kidney.[KIQ470 - How frequently does this occur?]) as how_frequest_leak_nonphysical	
	,max(kidney.[KIQ050 - How much did urine leakage bother you]) as how_much_leak_bothering
	,max(kidney.[KIQ052 - How much were daily activities affected]) as how_much_daily_activities_affected
	,max(kidney.[KIQ480 - How many times urinate in night?]) as count_night_time_urinate
	*/


	into nutrients_demographics
	from [multi-day-2015-2016-dietary-nutrients-intake] survey
	inner join [2015-2016-demographics_data] demo on demo.[SEQN - Respondent sequence number] = survey.[SEQN - Respondent sequence number]
	--inner join [2015-2016-laboratory-albumin-creatinine-data-ALB_CR_I] acr on acr.[SEQN - Respondent sequence number] = demo.[SEQN - Respondent sequence number]
	--left join  [2015-2016-examinations-kidney-condition-KIQ_U_I] kidney on kidney.[SEQN - Respondent sequence number] = demo.[SEQN - Respondent sequence number]
	--left join  [2015-2016-examination-blood-pressure-BPX_I] blood on demo.[SEQN - Respondent sequence number] = blood.[SEQN - Respondent sequence number]	
	--left join age_food_group_recommended_amount age_recom on age_recom.age = demo.[RIDAGEYR - Age in years at screening] and survey. = age_recom.food_group
	group by demo.[SEQN - Respondent sequence number]
	order by demo.[SEQN - Respondent sequence number]


	select *
	from nutrients_demographics


	select top(10) *
	--into merged_individual_foods_and_nutrients
	from food_groups_in_column_names foods
	left join nutrients_demographics  nutrients on nutrients.participant_id = foods.participant_id
	--left join age_food_group_recommended_amount age_recom on age_recom.age = foods.participant_age  and foods.food_group_name = age_recom.food_group


	select 
	demo.[SEQN - Respondent sequence number] as participant_id,
	demo.[RIDAGEYR - Age in years at screening] as participant_age
	,age_recom.average_taken
	,age_recom.food_group
	,age_recom.recommended_low
	,age_recom.recommended_high
	--into temp
	from [2015-2016-demographics_data] demo
	inner join age_food_group_recommended_amount age_recom on age_recom.age = demo.[RIDAGEYR - Age in years at screening]  --and foods.food_group_name = age_recom.food_group

	/*
	select 	
	temp.participant_id
	,( select recommended_low from (select recommended_low from temp inside where food_group='dairy' and inside.participant_id = temp.participant_id))
	from temp 
	

	--https://docs.microsoft.com/en-us/sql/t-sql/queries/from-using-pivot-and-unpivot?view=sql-server-2017
	-- Pivot table with one row and five columns  
	SELECT 	
	average_taken	
	,recommended_low
	,recommended_high	  
	,['dairy']
	FROM  
	(
	
	SELECT food_group 
	,average_taken	
	,recommended_low
	,recommended_high
	  
	     
		FROM temp
	) AS age_recom  
	PIVOT  
	(  

	avg(age_recom.average_taken)
	,avg(age_recom.recommended_low)
	,avg(age_recom.recommended_high)

	 
	FOR food_group IN (['dairy'])  
	) AS PivotTable;  

	*/


END
GO
