/****** Object:  StoredProcedure [dbo].[usp_GetByDynProperty]    Script Date: 01/24/2019 18:53:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetByDynProperty]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetByDynProperty]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetByDynProperty]    Script Date: 01/24/2019 18:53:52 ******/
CREATE proc [dbo].[usp_GetByDynProperty]
	@key varchar(100),
	@value nvarchar(max)
as
begin
	select * from dbo.Messages	
	where [dbo].[udf_GetKeyAndValueFromXml](MetadataXml, @key, @value) = 1
end

GO


