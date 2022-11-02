USE [DataMagnifier]
GO
/****** Object:  Table [dbo].[DIMCalendarDay]    Script Date: 02.11.2022 09:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMCalendarDay](
	[CalendarDayDate] [date] NOT NULL,
	[RowCreatedByID] [bigint] NULL,
	[RowLastUpdateByID] [bigint] NULL,
	[RowCreatedDtm] [datetime] NOT NULL,
	[RowLastUpdateDtm] [datetime] NOT NULL,
	[SourceSystemID] [varchar](25) NOT NULL,
	[CalendarYearNbr] [int] NULL,
	[CalendarQuarterNbr] [tinyint] NULL,
	[CalendarQuarterDayNbr] [tinyint] NULL,
	[CalendarHalfYearLabelYYYYQAbrv] [int] NULL,
	[CalendarHalfYearLabelNbr] [tinyint] NULL,
	[CalendarHalfYearLabelName] [varchar](13) NULL,
	[CalendarHalfYearLabelStartDateAbrv] [varchar](25) NULL,
	[CalendarHalfYearLabelEndDateAbrv] [varchar](25) NULL,
	[CalendarYearWeekLabelYYYYWWAbrv] [int] NULL,
	[CalendarYearDayNbr] [smallint] NULL,
	[CalendarYearWeekNbr] [tinyint] NULL,
	[CalendarMonthNbr] [tinyint] NULL,
	[CalendarMonthName] [varchar](25) NULL,
	[CalendarQuarterStartDateLabelAbrv] [varchar](25) NULL,
	[CalendarQuarterEndDateLabelAbrv] [varchar](25) NULL,
	[CalendarMonthStartDateLabelAbrv] [varchar](25) NULL,
	[CalendarMonthEndDateLabelAbrv] [varchar](25) NULL,
	[CalendarMonthDayNbr] [tinyint] NULL,
	[CalendarMonSunWeekDayNbr] [int] NULL,
	[CalendarWeekDayName] [varchar](25) NULL,
	[CalendarWeekDayTypeName] [varchar](25) NULL,
	[HolidayInd] [tinyint] NULL,
	[CalendarMonSunWeekStartDateLabelAbrv] [varchar](25) NULL,
	[CalendarMonSunWeekEndDateLabelAbrv] [varchar](25) NULL,
	[CalendarDaysInWeekNbr] [tinyint] NULL,
	[CalendarDaysInYearNbr] [smallint] NULL,
	[CalendarDaysInMonthNbr] [tinyint] NULL,
	[CalendarWeeksInMonthNbr] [tinyint] NULL,
	[CalendarWeeksInYearNbr] [tinyint] NULL,
	[CalendarDayDesc] [varchar](50) NULL,
 CONSTRAINT [PK_DIMCalendarDay] PRIMARY KEY CLUSTERED 
(
	[CalendarDayDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
