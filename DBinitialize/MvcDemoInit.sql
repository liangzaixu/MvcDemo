/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [UserID]
      ,[Name]
      ,[Age]
      ,[Email]
      ,[Pwd]
  FROM [MvcDemo].[dbo].[User]
  
  USE MvcDemo
  
INSERT INTO HeaderMenu( MenuID, MenuName, Url,IconUrl, MenuOrder) VALUES('root','根目录','','',0)
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('root'
           ,'根目录'
           ,''
           ,''
           ,'root'
           ,''
           ,1)
  
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('power'
           ,'权限管理'
           ,''
           ,''
           ,'root'
           ,'root'
           ,1)
           
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('menu'
           ,'菜单管理'
           ,'/admin/menu'
           ,''
           ,'root'
           ,'power'
           ,1)

INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('role'
           ,'角色管理'
           ,'/admin/role'
           ,''
           ,'root'
           ,'power'
           ,2)

INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('user'
           ,'用户管理'
           ,'/admin/user'
           ,''
           ,'root'
           ,'power'
           ,3)
           
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('action'
           ,'操作管理'
           ,'admin/action'
           ,''
           ,'root'
           ,'power'
           ,4)

INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('system'
           ,'系统管理'
           ,''
           ,''
           ,'root'
           ,'root'
           ,2)
           
           
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('setting'
           ,'网站设置'
           ,''
           ,''
           ,'root'
           ,'system'
           ,1)
           
INSERT INTO [MvcDemo].[dbo].[SideMenu]
           ([MenuID]
           ,[MenuName]
           ,[Url]
           ,[IconUrl]
           ,[HeaderMenuID]
           ,[ParentID]
           ,[MenuOrder])
     VALUES
           ('log'
           ,'系统日志'
           ,''
           ,''
           ,'root'
           ,'system'
           ,2)
           
INSERT dbo.[Role](RoleName) VALUES('超级管理员')

DECLARE @RoleID int
SELECT TOP 1 @RoleID=RoleID FROM dbo.[Role]

INSERT RoleUser(RoleID,UserID) VALUES(@RoleID,'admin')

INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'power')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'menu')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'role')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'user')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'action')

INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'system')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'setting')
INSERT RoleSideMenu( RoleID, MenuID) VALUES(@RoleID,'log')



GO