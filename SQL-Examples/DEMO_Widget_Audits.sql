USE [DemoDataDB]
GO

ALTER TABLE [DBO].[DEMO_Widget_Audits] DROP CONSTRAINT [CNST_DEMO_Widget_Audits_widget_audit_cre_ts]
GO

DROP TABLE [DBO].[DEMO_Widget_Audits]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [DBO].[DEMO_Widget_Audits](
  [widget_audit_seq] [INT] IDENTITY(1,1) NOT NULL,
	[widget_seq] [INT] NOT NULL,
	[user_seq] [INT] NOT NULL,
	[widget_name_prev] [NVARCHAR](100) NOT NULL,
	[widget_name_new] [NVARCHAR](100) NOT NULL,
	[widget_type_prev] [NVARCHAR](50) NOT NULL,
	[widget_type_new] [NVARCHAR](50) NOT NULL,
	[widget_version_prev] [INT] NOT NULL,
	[widget_version_new] [INT] NOT NULL,
	[widget_audit_cre_ts] [datetime] NULL,
 CONSTRAINT [PK_DEMO_Widget_Audits] PRIMARY KEY CLUSTERED 
(
	[widget_audit_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DBO].[DEMO_Widget_Audits] ADD CONSTRAINT [CNST_DEMO_Widget_Audits_widget_audit_cre_ts]  DEFAULT (getdate()) FOR [widget_audit_cre_ts]
GO
