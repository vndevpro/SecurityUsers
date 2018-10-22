create proc [dbo].[usp_GetUser]
	@email varchar(250)
as
begin
	select * from dbo.Users
	where Email = @email
end

GO


