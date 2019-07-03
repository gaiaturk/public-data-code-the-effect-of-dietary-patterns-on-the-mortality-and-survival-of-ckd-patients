USE [mrp_2015_2016_diet_esrd_mortality]
GO
/****** Object:  StoredProcedure [dbo].[get_dietary_intake_by_participants]    Script Date: 2019-07-03 12:02:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_dietary_intake_by_participants]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	-- EXPLORATION
	-- Insert statements for procedure here
	select top (1000) demo.[SEQN - Respondent sequence number]
	, demo.[RIDAGEYR - Age in years at screening]
	, food_code.[DRXFCLD]
	, diet.*
	from [2015-2016-demographics_data] demo
	inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	left join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]



 --   -- Insert statements for procedure here
	--select  
	--count(demo.[SEQN - Respondent sequence number]) as number_of_participants
	--, max(demo.[RIDAGEYR - Age in years at screening]) as age
	--, max(food_code.[DRXFCLD]) as food
	----, diet.*
	--from [2015-2016-demographics_data] demo
	--inner join [2015-2016-dietary-interview-individual-foods-first-day-DR1IFF_I] diet on demo.[SEQN - Respondent sequence number] = diet.[SEQN - Respondent sequence number]
	--left join [2015-2016-support-food-codes-DRXFCD_I] food_code on food_code.[DRXFDCD] = diet.[DR1IFDCD - USDA food code]
	--group by diet.[DR1IFDCD - USDA food code]
	----group by demo.[RIDAGEYR - Age in years at screening]
	--order by food, age

	--where demo.[SEQN - Respondent sequence number] <= 84732

	
END

--how did they come to the number, for each group recommended and actually taken
--select the food code to consider
--group by food code then group by age then take them to temp table and average them


GO
