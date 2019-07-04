USE [mrp_experiment_phase_data_process]
GO
/****** Object:  Table [dbo].[2015-2016-dietary-nutrients-intake-2nd-day-DR2TOT_I]    Script Date: 2019-07-03 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2015-2016-dietary-nutrients-intake-2nd-day-DR2TOT_I](
	[SEQN - Respondent sequence number] [float] NULL,
	[WTDRD1 - Dietary day one sample weight] [float] NULL,
	[WTDR2D - Dietary two-day sample weight] [float] NULL,
	[DR2DRSTZ - Dietary recall status] [float] NULL,
	[DR2EXMER - Interviewer ID code] [float] NULL,
	[DRABF - Breast-fed infant (either day)] [float] NULL,
	[DRDINT - Number of days of intake] [float] NULL,
	[DR2DBIH - # of days b/w intake and HH interview] [float] NULL,
	[DR2DAY - Intake day of the week] [float] NULL,
	[DR2LANG - Language respondent used mostly] [float] NULL,
	[DR2MRESP - Main respondent for this interview] [float] NULL,
	[DR2HELP - Helped in responding for this interview] [float] NULL,
	[DR2TNUMF - Number of foods/beverages reported] [float] NULL,
	[DR2STY - Salt used at table yesterday?] [float] NULL,
	[DR2SKY - Type of salt used yesterday] [nvarchar](255) NULL,
	[DR2TKCAL - Energy (kcal)] [float] NULL,
	[DR2TPROT - Protein (gm)] [float] NULL,
	[DR2TCARB - Carbohydrate (gm)] [float] NULL,
	[DR2TSUGR - Total sugars (gm)] [float] NULL,
	[DR2TFIBE - Dietary fiber (gm)] [float] NULL,
	[DR2TTFAT - Total fat (gm)] [float] NULL,
	[DR2TSFAT - Total saturated fatty acids (gm)] [float] NULL,
	[DR2TMFAT - Total monounsaturated fatty acids (gm)] [float] NULL,
	[DR2TPFAT - Total polyunsaturated fatty acids (gm)] [float] NULL,
	[DR2TCHOL - Cholesterol (mg)] [float] NULL,
	[DR2TATOC - Vitamin E as alpha-tocopherol (mg)] [float] NULL,
	[DR2TATOA - Added alpha-tocopherol (Vitamin E) (mg)] [float] NULL,
	[DR2TRET - Retinol (mcg)] [float] NULL,
	[DR2TVARA - Vitamin A, RAE (mcg)] [float] NULL,
	[DR2TACAR - Alpha-carotene (mcg)] [float] NULL,
	[DR2TBCAR - Beta-carotene (mcg)] [float] NULL,
	[DR2TCRYP - Beta-cryptoxanthin (mcg)] [float] NULL,
	[DR2TLYCO - Lycopene (mcg)] [float] NULL,
	[DR2TLZ - Lutein + zeaxanthin (mcg)] [float] NULL,
	[DR2TVB1 - Thiamin (Vitamin B1) (mg)] [float] NULL,
	[DR2TVB2 - Riboflavin (Vitamin B2) (mg)] [float] NULL,
	[DR2TNIAC - Niacin (mg)] [float] NULL,
	[DR2TVB6 - Vitamin B6 (mg)] [float] NULL,
	[DR2TFOLA - Total folate (mcg)] [float] NULL,
	[DR2TFA - Folic acid (mcg)] [float] NULL,
	[DR2TFF - Food folate (mcg)] [float] NULL,
	[DR2TFDFE - Folate, DFE (mcg)] [float] NULL,
	[DR2TCHL - Total choline (mg)] [float] NULL,
	[DR2TVB12 - Vitamin B12 (mcg)] [float] NULL,
	[DR2TB12A - Added vitamin B12 (mcg)] [float] NULL,
	[DR2TVC - Vitamin C (mg)] [float] NULL,
	[DR2TVD - Vitamin D (D2 + D3) (mcg)] [float] NULL,
	[DR2TVK - Vitamin K (mcg)] [float] NULL,
	[DR2TCALC - Calcium (mg)] [float] NULL,
	[DR2TPHOS - Phosphorus (mg)] [float] NULL,
	[DR2TMAGN - Magnesium (mg)] [float] NULL,
	[DR2TIRON - Iron (mg)] [float] NULL,
	[DR2TZINC - Zinc (mg)] [float] NULL,
	[DR2TCOPP - Copper (mg)] [float] NULL,
	[DR2TSODI - Sodium (mg)] [float] NULL,
	[DR2TPOTA - Potassium (mg)] [float] NULL,
	[DR2TSELE - Selenium (mcg)] [float] NULL,
	[DR2TCAFF - Caffeine (mg)] [float] NULL,
	[DR2TTHEO - Theobromine (mg)] [float] NULL,
	[DR2TALCO - Alcohol (gm)] [float] NULL,
	[DR2TMOIS - Moisture (gm)] [float] NULL,
	[DR2TS040 - SFA 4:0 (Butanoic) (gm)] [float] NULL,
	[DR2TS060 - SFA 6:0 (Hexanoic) (gm)] [float] NULL,
	[DR2TS080 - SFA 8:0 (Octanoic) (gm)] [float] NULL,
	[DR2TS100 - SFA 10:0 (Decanoic) (gm)] [float] NULL,
	[DR2TS120 - SFA 12:0 (Dodecanoic) (gm)] [float] NULL,
	[DR2TS140 - SFA 14:0 (Tetradecanoic) (gm)] [float] NULL,
	[DR2TS160 - SFA 16:0 (Hexadecanoic) (gm)] [float] NULL,
	[DR2TS180 - SFA 18:0 (Octadecanoic) (gm)] [float] NULL,
	[DR2TM161 - MFA 16:1 (Hexadecenoic) (gm)] [float] NULL,
	[DR2TM181 - MFA 18:1 (Octadecenoic) (gm)] [float] NULL,
	[DR2TM201 - MFA 20:1 (Eicosenoic) (gm)] [float] NULL,
	[DR2TM221 - MFA 22:1 (Docosenoic) (gm)] [float] NULL,
	[DR2TP182 - PFA 18:2 (Octadecadienoic) (gm)] [float] NULL,
	[DR2TP183 - PFA 18:3 (Octadecatrienoic) (gm)] [float] NULL,
	[DR2TP184 - PFA 18:4 (Octadecatetraenoic) (gm)] [float] NULL,
	[DR2TP204 - PFA 20:4 (Eicosatetraenoic) (gm)] [float] NULL,
	[DR2TP205 - PFA 20:5 (Eicosapentaenoic) (gm)] [float] NULL,
	[DR2TP225 - PFA 22:5 (Docosapentaenoic) (gm)] [float] NULL,
	[DR2TP226 - PFA 22:6 (Docosahexaenoic) (gm)] [float] NULL,
	[DR2_300 - Compare food consumed yesterday to usual] [float] NULL,
	[DR2_320Z - Total plain water drank yesterday (gm)] [float] NULL,
	[DR2_330Z - Total tap water drank yesterday (gm)] [float] NULL,
	[DR2BWATZ - Total bottled water drank yesterday (gm)] [float] NULL,
	[DR2TWS - Tap water source] [float] NULL
) ON [PRIMARY]
GO
