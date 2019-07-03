USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[total_food_taken_by_individuals]    Script Date: 2019-07-03 12:02:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[total_food_taken_by_individuals]
AS
BEGIN

    --Here food groups are not based on Shift Recommendation Article

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- EXPLORATION
	-- Insert statements for procedure here
	select top (1000)
	max(demo.[SEQN - Respondent sequence number]) as participant_id
	,max(demo.[RIDAGEYR - Age in years at screening]) as age 
	--, food_code.[DRXFCLD]
	,sum(diet.[DR1IKCAL - Energy (kcal)]) as total_calory
	,sum(diet.[DR1IPROT - Protein (gm)]) as total_protein
	, sum(diet.[DR1ISODI - Sodium (mg)]) as total_sodium
	, sum ( diet.[DR1ICARB - Carbohydrate (gm)]  ) as total_carbohydrate
	, sum (  diet.[DR1ISUGR - Total sugars (gm)] ) as total_sugar
	, sum (  diet.[DR1IFIBE - Dietary fiber (gm)] ) as total_fibre
	, sum ( diet.[DR1ITFAT - Total fat (gm)] ) as total_fat
	, sum ( diet.[DR1ISFAT - Total saturated fatty acids (gm)]) as total_saturated_fat
	,sum ( diet.[DR1IMFAT - Total monounsaturated fatty acids (gm)]) as total_mono_fat
	,sum ( diet.[DR1IPFAT - Total polyunsaturated fatty acids (gm)]) as total_poly_fat
	,sum ( diet.[DR1ICHOL - Cholesterol (mg)]) as total_cholesterol
	,sum ( diet.[DR1ICALC - Calcium (mg)]) as total_calcium
	,sum ( diet.[DR1IPHOS - Phosphorus (mg)]) as total_phosphorous
	,sum ( diet.[DR1IMAGN - Magnesium (mg)]) as total_magnesium
	,sum ( diet.[DR1IPOTA - Potassium (mg)]) as total_potassium
	,sum ( diet.[DR1IALCO - Alcohol (gm)]) as total_alcohol
	--, diet.*
	from [2015-2016-demographics_data] demo
	inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	left join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]
	group by diet.[SEQN - Respondent sequence number]
	order by age


END
GO
