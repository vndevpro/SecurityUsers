create proc [dbo].[usp_Users_GetByDynProperty]
	@key varchar(100),
	@value nvarchar(max)
as
begin
	select u.*
	from dbo.Users u
		cross apply u.MetadataXml.nodes('items/item') as x(i)
	where x.i.value('(@key)[1]', 'varchar(max)') = @key
	and x.i.value('(@value)[1]', 'nvarchar(max)') = @value
end
GO
