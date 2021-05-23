USE [DemoDataDB]
GO

DROP TRIGGER IF EXISTS [dbo].[TRG_DEMO_Widgets_AfterUpdate]
GO

ALTER TABLE [dbo].[DEMO_Widgets] DROP CONSTRAINT [CNST_DEMO_Widgets_user_cre_ts]
GO

ALTER TABLE [dbo].[DEMO_Widgets] DROP CONSTRAINT [CNST_DEMO_Widgets_user_upd_ts]
GO

DROP TABLE [dbo].[DEMO_Widgets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [DBO].[DEMO_Widgets](
	[widget_seq] [INT] IDENTITY(1,1) NOT NULL,
	[widget_name] [NVARCHAR](100) NOT NULL,
	[widget_type] [NVARCHAR](50) NOT NULL,
	[widget_version] [INT] NOT NULL,
	[widget_cre_ts] [datetime] NULL,
	[widget_upd_ts] [datetime] NULL,
 CONSTRAINT [PK_DEMO_Widgets] PRIMARY KEY CLUSTERED 
(
	[widget_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DBO].[DEMO_Widgets] ADD CONSTRAINT [CNST_DEMO_Widgets_user_cre_ts]  DEFAULT (getdate()) FOR [widget_cre_ts]
GO

ALTER TABLE [DBO].[DEMO_Widgets] ADD CONSTRAINT [CNST_DEMO_Widgets_user_upd_ts]  DEFAULT (getdate()) FOR [widget_upd_ts]
GO

CREATE TRIGGER [dbo].[TRG_DEMO_Widgets_AfterUpdate] ON [DBO].[DEMO_Widgets]
AFTER UPDATE
AS
	UPDATE DmoWdgt SET [widget_upd_ts] = GETDATE()
	FROM [dbo].[DEMO_Widgets] as DmoWdgt INNER JOIN inserted as INS ON DmoWdgt.widget_seq = INS.widget_seq;
GO
