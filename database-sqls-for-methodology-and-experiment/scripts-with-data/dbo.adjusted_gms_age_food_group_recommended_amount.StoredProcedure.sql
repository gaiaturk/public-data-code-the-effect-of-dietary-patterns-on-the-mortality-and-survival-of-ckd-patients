USE [mrp_experiment_phase_data_process]
GO
/****** Object:  StoredProcedure [dbo].[adjusted_gms_age_food_group_recommended_amount]    Script Date: 2019-07-17 5:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adjusted_gms_age_food_group_recommended_amount]	
AS
BEGIN

select *
from age_food_group_recommended_amount

select distinct(food_group)
from age_food_group_recommended_amount


truncate table age_food_group_recommended_amount_adjusted

insert into age_food_group_recommended_amount_adjusted
select *
from age_food_group_recommended_amount
where food_group = 'vegetables' 

----
insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]*175/150 as [average_taken]
      ,[recommended_low]*175/150 as [recommended_low]
      ,[recommended_high]*175/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group = 'fruits' 

select * from age_food_group_recommended_amount_adjusted


insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]*28.3495/150 as [average_taken]
      ,[recommended_low]*28.3495/150 as [recommended_low]
      ,[recommended_high]*28.3495/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group = 'grains' 


--Milk 245gm https://www.traditionaloven.com/foods/exchange/cup/g-gram/milk-buttermilk-liquid-whole.html
insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]*245/150 as [average_taken]
      ,[recommended_low]*245/150 as [recommended_low]
      ,[recommended_high]*245/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group = 'dairy'

--https://www.traditionaloven.com/foods/exchange/cup-chopped-or-diced/g-gram/chicken-breast-meat-cook-roast.html
--https://health.gov/dietaryguidelines/2015/guidelines/chapter-1/a-closer-look-inside-healthy-eating-patterns/
--https://www.tasteofhome.com/article/how-many-grams-of-protein-are-in-1-ounce-of-meat/

insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]*28.35/150 as [average_taken]
      ,[recommended_low]*28.35/150 as [recommended_low]
      ,[recommended_high]*28.35/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group = 'protein'


insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]--*28.35/150 as [average_taken]
      ,[recommended_low]--*28.35/150 as [recommended_low]
      ,[recommended_high]--*28.35/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group like '%oils%'


insert into age_food_group_recommended_amount_adjusted
SELECT [age]
      ,[food_group]
      ,[average_taken]--*28.35/150 as [average_taken]
      ,[recommended_low]--*28.35/150 as [recommended_low]
      ,[recommended_high]--*28.35/150 as [recommended_high]
FROM [dbo].[age_food_group_recommended_amount]
where food_group like '%sugars%'


select *
from age_food_group_recommended_amount_adjusted


END
GO
