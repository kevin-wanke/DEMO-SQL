USE [DemoDataDB]
GO

DROP TRIGGER IF EXISTS [DBO].[TRG_DEMO_Users_AfterUpdate]
GO

ALTER TABLE [DBO].[DEMO_Users] DROP CONSTRAINT [CNST_DEMO_Users_user_cre_ts]
GO

ALTER TABLE [DBO].[DEMO_Users] DROP CONSTRAINT [CNST_DEMO_Users_user_upd_ts]
GO

DROP TABLE [DBO].[DEMO_Users]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [DBO].[DEMO_Users](
	[user_seq] [INT] IDENTITY(1,1) NOT NULL,
	[user_email] [nvarchar](100) NOT NULL,
	[user_first_name] [NVARCHAR](50) NOT NULL,
	[engineer_birthday] [DATE] NULL,
	[user_fav_color] [NVARCHAR](50) NOT NULL,
	[user_cre_ts] [datetime] NULL,
	[user_upd_ts] [datetime] NULL,
 CONSTRAINT [PK_DEMO_Users] PRIMARY KEY CLUSTERED 
(
	[user_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DBO].[DEMO_Users] ADD CONSTRAINT [CNST_DEMO_Users_user_cre_ts] DEFAULT (getdate()) FOR [user_cre_ts]
GO

ALTER TABLE [DBO].[DEMO_Users] ADD CONSTRAINT [CNST_DEMO_Users_user_upd_ts] DEFAULT (getdate()) FOR [user_upd_ts]
GO

CREATE TRIGGER [dbo].[TRG_DEMO_Users_AfterUpdate] ON [DBO].[DEMO_Users]
AFTER UPDATE
AS
	UPDATE DMOUSR SET [user_upd_ts] = GETDATE()
	FROM [dbo].[DEMO_Users] as DMOUSR INNER JOIN inserted as INS ON DMOUSR.user_seq = INS.user_seq;
GO
