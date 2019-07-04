USE [mrp_experiment_phase_data_process]
GO
/****** Object:  Table [dbo].[2015-2016-demographics_data]    Script Date: 2019-07-03 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2015-2016-demographics_data](
	[SEQN - Respondent sequence number] [float] NULL,
	[SDDSRVYR - Data release cycle] [float] NULL,
	[RIDSTATR - Interview/Examination status] [float] NULL,
	[RIAGENDR - Gender] [float] NULL,
	[RIDAGEYR - Age in years at screening] [float] NULL,
	[RIDAGEMN - Age in months at screening - 0 to 24 mos] [nvarchar](255) NULL,
	[RIDRETH1 - Race/Hispanic origin] [float] NULL,
	[RIDRETH3 - Race/Hispanic origin w/ NH Asian] [float] NULL,
	[RIDEXMON - Six month time period] [float] NULL,
	[RIDEXAGM - Age in months at exam - 0 to 19 years] [nvarchar](255) NULL,
	[DMQMILIZ - Served active duty in US Armed Forces] [float] NULL,
	[DMQADFC - Served in a foreign country] [nvarchar](255) NULL,
	[DMDBORN4 - Country of birth] [float] NULL,
	[DMDCITZN - Citizenship status] [float] NULL,
	[DMDYRSUS - Length of time in US] [nvarchar](255) NULL,
	[DMDEDUC3 - Education level - Children/Youth 6-19] [nvarchar](255) NULL,
	[DMDEDUC2 - Education level - Adults 20+] [float] NULL,
	[DMDMARTL - Marital status] [float] NULL,
	[RIDEXPRG - Pregnancy status at exam] [nvarchar](255) NULL,
	[SIALANG - Language of SP Interview] [float] NULL,
	[SIAPROXY - Proxy used in SP Interview?] [float] NULL,
	[SIAINTRP - Interpreter used in SP Interview?] [float] NULL,
	[FIALANG - Language of Family Interview] [float] NULL,
	[FIAPROXY - Proxy used in Family Interview?] [float] NULL,
	[FIAINTRP - Interpreter used in Family Interview?] [float] NULL,
	[MIALANG - Language of MEC Interview] [float] NULL,
	[MIAPROXY - Proxy used in MEC Interview?] [float] NULL,
	[MIAINTRP - Interpreter used in MEC Interview?] [float] NULL,
	[AIALANGA - Language of ACASI Interview] [float] NULL,
	[DMDHHSIZ - Total number of people in the Household] [float] NULL,
	[DMDFMSIZ - Total number of people in the Family] [float] NULL,
	[DMDHHSZA - # of children 5 years or younger in HH] [float] NULL,
	[DMDHHSZB - # of children 6-17 years old in HH] [float] NULL,
	[DMDHHSZE - # of adults 60 years or older in HH] [float] NULL,
	[DMDHRGND - HH ref person's gender] [float] NULL,
	[DMDHRAGE - HH ref person's age in years] [float] NULL,
	[DMDHRBR4 - HH ref person's country of birth] [float] NULL,
	[DMDHREDU - HH ref person's education level] [float] NULL,
	[DMDHRMAR - HH ref person's marital status] [float] NULL,
	[DMDHSEDU - HH ref person's spouse's education level] [nvarchar](255) NULL,
	[WTINT2YR - Full sample 2 year interview weight] [float] NULL,
	[WTMEC2YR - Full sample 2 year MEC exam weight] [float] NULL,
	[SDMVPSU - Masked variance pseudo-PSU] [float] NULL,
	[SDMVSTRA - Masked variance pseudo-stratum] [float] NULL,
	[INDHHIN2 - Annual household income] [float] NULL,
	[INDFMIN2 - Annual family income] [float] NULL,
	[INDFMPIR - Ratio of family income to poverty] [float] NULL
) ON [PRIMARY]
GO
