/****** Object:  UserDefinedFunction [dbo].[udf_GetKeyAndValueFromXml]    Script Date: 01/24/2019 18:52:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_GetKeyAndValueFromXml]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[udf_GetKeyAndValueFromXml]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_GetKeyAndValueFromXml]    Script Date: 01/24/2019 18:52:49 ******/
create function [dbo].[udf_GetKeyAndValueFromXml](
	@metadata xml,
	@key varchar(max),
	@value varchar(max)
)
returns bit
as
begin
	declare @result bit = 0
	
	;with CTE as (
		select r.value('@key', 'varchar(max)') as [Key], r.value('@value', 'varchar(max)') as [Value]
		from @metadata.nodes('/items/item') as x(r)
	)
	select @result = 1 from CTE
	where [Key] = @key and [Value] = @value
	
	return @result
end

GO


