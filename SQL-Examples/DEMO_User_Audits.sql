USE [DemoDataDB]
GO

ALTER TABLE [DBO].[DEMO_User_Audits] DROP CONSTRAINT [CNST_DEMO_User_Audits_user_audit_cre_ts]
GO

DROP TABLE [DBO].[DEMO_User_Audits]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [DBO].[DEMO_User_Audits](
	[user_audit_seq] [INT] IDENTITY(1,1) NOT NULL,
	[user_seq] [INT] NOT NULL,
	[user_seq_audit] [INT] NOT NULL,
	[user_fav_color_prev] [NVARCHAR](50) NOT NULL,
	[user_fav_color_new] [NVARCHAR](50) NOT NULL,
	[user_audit_cre_ts] [datetime] NULL,
 CONSTRAINT [PK_DEMO_User_Audits] PRIMARY KEY CLUSTERED 
(
	[user_audit_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DBO].[DEMO_User_Audits] ADD CONSTRAINT [CNST_DEMO_User_Audits_user_audit_cre_ts]  DEFAULT (getdate()) FOR [user_audit_cre_ts]
GO
