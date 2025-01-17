USE [master]
GO
/****** Object:  Database [SugarSite]    Script Date: 2016/11/30 4:13:44 ******/
CREATE DATABASE [SugarSite] ON  PRIMARY 
( NAME = N'SugarSite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SugarSite.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SugarSite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SugarSite_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SugarSite] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SugarSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SugarSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SugarSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SugarSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SugarSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SugarSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [SugarSite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SugarSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SugarSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SugarSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SugarSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SugarSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SugarSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SugarSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SugarSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SugarSite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SugarSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SugarSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SugarSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SugarSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SugarSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SugarSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SugarSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SugarSite] SET RECOVERY FULL 
GO
ALTER DATABASE [SugarSite] SET  MULTI_USER 
GO
ALTER DATABASE [SugarSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SugarSite] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SugarSite', N'ON'
GO
USE [SugarSite]
GO
/****** Object:  Table [dbo].[BBS_Forums]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BBS_Forums](
	[Fid] [int] IDENTITY(1,1) NOT NULL,
	[Parentid] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Paren__5070F446]  DEFAULT ('0'),
	[Layer] [smallint] NOT NULL CONSTRAINT [DF__BBS_forum__Layer__5165187F]  DEFAULT ('0'),
	[Pathlist] [nchar](3000) NOT NULL CONSTRAINT [DF__BBS_forum__Pathl__52593CB8]  DEFAULT (''),
	[Parentidlist] [char](300) NOT NULL,
	[Subforumcount] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Subfo__534D60F1]  DEFAULT (''),
	[Name] [nchar](50) NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Statu__5441852A]  DEFAULT ('0'),
	[Colcount] [smallint] NOT NULL CONSTRAINT [DF__BBS_forum__Colco__5535A963]  DEFAULT ('1'),
	[Displayorder] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Displ__5629CD9C]  DEFAULT ('0'),
	[Templateid] [smallint] NOT NULL CONSTRAINT [DF__BBS_forum__Templ__571DF1D5]  DEFAULT ('0'),
	[Topics] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Topic__5812160E]  DEFAULT ('0'),
	[Curtopics] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Curto__59063A47]  DEFAULT ('0'),
	[Posts] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Posts__59FA5E80]  DEFAULT ('0'),
	[Todayposts] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Today__5AEE82B9]  DEFAULT ('0'),
	[Lasttid] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Lastt__5BE2A6F2]  DEFAULT ('0'),
	[Lasttitle] [nchar](60) NOT NULL CONSTRAINT [DF__BBS_forum__Lastt__5CD6CB2B]  DEFAULT (''),
	[Lastpost] [datetime] NOT NULL CONSTRAINT [DF__BBS_forum__Lastp__5DCAEF64]  DEFAULT (''),
	[Lastposterid] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Lastp__5EBF139D]  DEFAULT (''),
	[Lastposter] [nchar](20) NOT NULL CONSTRAINT [DF__BBS_forum__Lastp__5FB337D6]  DEFAULT (''),
	[Allowsmilies] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__60A75C0F]  DEFAULT ('0'),
	[Allowrss] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__619B8048]  DEFAULT ('0'),
	[Allowhtml] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__628FA481]  DEFAULT ('0'),
	[Allowbbcode] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__6383C8BA]  DEFAULT ('0'),
	[Allowimgcode] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__6477ECF3]  DEFAULT ('0'),
	[Allowblog] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__656C112C]  DEFAULT ('0'),
	[Istrade] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Istra__66603565]  DEFAULT ('0'),
	[Allowpostspecial] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__6754599E]  DEFAULT ((0)),
	[Allowspecialonly] [int] NULL CONSTRAINT [DF__BBS_forum__Allow__68487DD7]  DEFAULT ((0)),
	[Alloweditrules] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__693CA210]  DEFAULT ('0'),
	[Allowthumbnail] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__6A30C649]  DEFAULT ('0'),
	[Allowtag] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Allow__6B24EA82]  DEFAULT ((0)),
	[Recyclebin] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Recyc__6C190EBB]  DEFAULT ('0'),
	[Modnewposts] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Modne__6D0D32F4]  DEFAULT ('0'),
	[Modnewtopics] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Modne__6E01572D]  DEFAULT ((0)),
	[Jammer] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Jamme__6EF57B66]  DEFAULT ('0'),
	[Disablewatermark] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Disab__6FE99F9F]  DEFAULT ('0'),
	[Inheritedmod] [int] NOT NULL CONSTRAINT [DF__BBS_forum__Inher__70DDC3D8]  DEFAULT ('0'),
	[Autoclose] [smallint] NOT NULL CONSTRAINT [DF__BBS_forum__Autoc__71D1E811]  DEFAULT ('0'),
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dnt_test_forums] PRIMARY KEY CLUSTERED 
(
	[Fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BBS_Posts]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BBS_Posts](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Fid] [int] NOT NULL,
	[Tid] [int] NOT NULL,
	[Parentid] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Paren__797309D9]  DEFAULT ((0)),
	[Layer] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Layer__7A672E12]  DEFAULT ((0)),
	[Poster] [nvarchar](20) NOT NULL CONSTRAINT [DF__BBS_posts__Poste__7B5B524B]  DEFAULT (''),
	[Posterid] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Poste__7C4F7684]  DEFAULT ((0)),
	[Title] [nvarchar](60) NOT NULL,
	[Postdatetime] [datetime] NOT NULL CONSTRAINT [DF__BBS_posts__Postd__7D439ABD]  DEFAULT (getdate()),
	[Message] [ntext] NOT NULL CONSTRAINT [DF__BBS_posts__Messa__7E37BEF6]  DEFAULT (''),
	[Ip] [nvarchar](15) NOT NULL CONSTRAINT [DF__BBS_posts__Ip__7F2BE32F]  DEFAULT (''),
	[Lastedit] [nvarchar](50) NOT NULL CONSTRAINT [DF__BBS_posts__Laste__00200768]  DEFAULT (''),
	[Invisible] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Invis__01142BA1]  DEFAULT ((0)),
	[Usesig] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Usesi__02084FDA]  DEFAULT ((0)),
	[Htmlon] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Htmlo__02FC7413]  DEFAULT ((0)),
	[Smileyoff] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Smile__03F0984C]  DEFAULT ((0)),
	[Parseurloff] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Parse__04E4BC85]  DEFAULT ((0)),
	[Bbcodeoff] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Bbcod__05D8E0BE]  DEFAULT ((0)),
	[Attachment] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Attac__06CD04F7]  DEFAULT ((0)),
	[Rate] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Rate__07C12930]  DEFAULT ((0)),
	[Ratetimes] [int] NOT NULL CONSTRAINT [DF__BBS_posts__Ratet__08B54D69]  DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dnt_test_posts1] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BBS_Topics]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BBS_Topics](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[Fid] [smallint] NOT NULL,
	[Iconid] [tinyint] NULL CONSTRAINT [DF__BBS_topic__Iconi__36B12243]  DEFAULT ((0)),
	[Typeid] [int] NULL CONSTRAINT [DF__BBS_topic__Typei__37A5467C]  DEFAULT ((0)),
	[Readperm] [int] NULL CONSTRAINT [DF__BBS_topic__Readp__38996AB5]  DEFAULT ((0)),
	[Price] [smallint] NULL CONSTRAINT [DF__BBS_topic__Price__398D8EEE]  DEFAULT ((0)),
	[Poster] [nchar](20) NULL CONSTRAINT [DF__BBS_topic__Poste__3A81B327]  DEFAULT (''),
	[PosterAvatar] [varchar](350) NULL,
	[Posterid] [int] NOT NULL CONSTRAINT [DF__BBS_topic__Poste__3B75D760]  DEFAULT ((0)),
	[Title] [nchar](60) NULL,
	[Attention] [int] NULL CONSTRAINT [DF__BBS_topic__Atten__3C69FB99]  DEFAULT ((0)),
	[Postdatetime] [datetime] NULL CONSTRAINT [DF__BBS_topic__Postd__3D5E1FD2]  DEFAULT (getdate()),
	[Lastpost] [datetime] NULL CONSTRAINT [DF__BBS_topic__Lastp__3E52440B]  DEFAULT (getdate()),
	[Lastpostid] [int] NULL CONSTRAINT [DF__BBS_topic__Lastp__3F466844]  DEFAULT ((0)),
	[Lastposter] [nchar](20) NULL CONSTRAINT [DF__BBS_topic__Lastp__403A8C7D]  DEFAULT (''),
	[Lastposterid] [int] NULL CONSTRAINT [DF__BBS_topic__Lastp__412EB0B6]  DEFAULT ((0)),
	[Views] [int] NULL CONSTRAINT [DF__BBS_topic__Views__4222D4EF]  DEFAULT ((0)),
	[Replies] [int] NULL CONSTRAINT [DF__BBS_topic__Repli__4316F928]  DEFAULT ((0)),
	[Displayorder] [int] NULL CONSTRAINT [DF__BBS_topic__Displ__440B1D61]  DEFAULT ((0)),
	[Highlight] [varchar](500) NULL CONSTRAINT [DF__BBS_topic__Highl__44FF419A]  DEFAULT (''),
	[Digest] [tinyint] NULL CONSTRAINT [DF__BBS_topic__Diges__45F365D3]  DEFAULT ((0)),
	[Rate] [int] NULL CONSTRAINT [DF__BBS_topics__Rate__46E78A0C]  DEFAULT ((0)),
	[Hide] [int] NULL CONSTRAINT [DF__BBS_topics__Hide__47DBAE45]  DEFAULT ((0)),
	[Attachment] [int] NULL CONSTRAINT [DF__BBS_topic__Attac__48CFD27E]  DEFAULT ((0)),
	[Moderated] [tinyint] NULL CONSTRAINT [DF__BBS_topic__Moder__49C3F6B7]  DEFAULT ((0)),
	[Closed] [int] NULL CONSTRAINT [DF__BBS_topic__Close__4AB81AF0]  DEFAULT ((0)),
	[Magic] [int] NULL CONSTRAINT [DF__BBS_topic__Magic__4BAC3F29]  DEFAULT ((0)),
	[Identify] [int] NULL CONSTRAINT [DF__BBS_topic__Ident__4CA06362]  DEFAULT ('0'),
	[Special] [tinyint] NULL CONSTRAINT [DF__BBS_topic__Speci__4D94879B]  DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BBS_Topictypes]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BBS_Topictypes](
	[Typeid] [int] IDENTITY(1,1) NOT NULL,
	[Displayorder] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocContent]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Sort] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [varchar](350) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK__DocConte__3214EC0785F7A992] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocType]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](300) NOT NULL,
	[Sort] [int] NULL,
	[ParentId] [int] NULL,
	[Level] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionContent]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varbinary](550) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Sort] [int] NULL,
	[UserId] [int] NULL,
	[ParentId] [int] NULL,
	[Level] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Question__3214EC07ED307A36] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](300) NOT NULL,
	[Sort] [int] NULL,
	[ParentId] [int] NULL,
	[Level] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Email] [varchar](50) NULL,
	[Avatar] [varchar](500) NULL,
	[CreateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[RoleId] [int] NULL,
	[NickName] [varchar](100) NULL,
 CONSTRAINT [PK__UserInfo__3214EC076E0F77EC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserOAuthMapping]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserOAuthMapping](
	[AppId] [varchar](30) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_UserOAuthMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VerifyCode]    Script Date: 2016/11/30 4:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VerifyCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Problem] [varchar](350) NOT NULL,
	[Answer] [varchar](350) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_VerifyCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BBS_Forums] ON 

INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (5, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'签到                                                ', 1, 1, 3, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (6, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'水吧                                                ', 1, 1, 4, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (9, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'求助                                                ', 1, 1, 1, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (11, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'分享                                                ', 1, 1, 5, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (14, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'文档                                                ', 1, 1, 2, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (17, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'资源                                                ', 1, 1, 7, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Forums] ([Fid], [Parentid], [Layer], [Pathlist], [Parentidlist], [Subforumcount], [Name], [Status], [Colcount], [Displayorder], [Templateid], [Topics], [Curtopics], [Posts], [Todayposts], [Lasttid], [Lasttitle], [Lastpost], [Lastposterid], [Lastposter], [Allowsmilies], [Allowrss], [Allowhtml], [Allowbbcode], [Allowimgcode], [Allowblog], [Istrade], [Allowpostspecial], [Allowspecialonly], [Alloweditrules], [Allowthumbnail], [Allowtag], [Recyclebin], [Modnewposts], [Modnewtopics], [Jammer], [Disablewatermark], [Inheritedmod], [Autoclose], [IsDeleted]) VALUES (18, 0, 0, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'                                                                                                                                                                                                                                                                                                            ', 0, N'爆照                                                ', 0, 1, 8, 0, 0, 0, 0, 0, 0, N'                                                            ', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'                    ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[BBS_Forums] OFF
SET IDENTITY_INSERT [dbo].[BBS_Posts] ON 

INSERT [dbo].[BBS_Posts] ([Pid], [Fid], [Tid], [Parentid], [Layer], [Poster], [Posterid], [Title], [Postdatetime], [Message], [Ip], [Lastedit], [Invisible], [Usesig], [Htmlon], [Smileyoff], [Parseurloff], [Bbcodeoff], [Attachment], [Rate], [Ratetimes], [IsDeleted]) VALUES (1, 11, 17, 0, 0, N'小杰', 1, N'221423423523453453', CAST(N'2016-11-30 01:09:39.487' AS DateTime), N'<p>2423423543534534534453</p>', N'::1', N'小杰', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Posts] ([Pid], [Fid], [Tid], [Parentid], [Layer], [Poster], [Posterid], [Title], [Postdatetime], [Message], [Ip], [Lastedit], [Invisible], [Usesig], [Htmlon], [Smileyoff], [Parseurloff], [Bbcodeoff], [Attachment], [Rate], [Ratetimes], [IsDeleted]) VALUES (2, 14, 18, 0, 0, N'小杰', 1, N'323船舶的2342423423', CAST(N'2016-11-30 01:10:09.377' AS DateTime), N'<p>123414234235253</p>', N'::1', N'小杰', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Posts] ([Pid], [Fid], [Tid], [Parentid], [Layer], [Poster], [Posterid], [Title], [Postdatetime], [Message], [Ip], [Lastedit], [Invisible], [Usesig], [Htmlon], [Smileyoff], [Parseurloff], [Bbcodeoff], [Attachment], [Rate], [Ratetimes], [IsDeleted]) VALUES (3, 9, 19, 0, 0, N'小杰', 1, N'XXXXXXXXXXXXXXX', CAST(N'2016-11-30 02:00:02.903' AS DateTime), N'<p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>', N'::1', N'小杰', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[BBS_Posts] ([Pid], [Fid], [Tid], [Parentid], [Layer], [Poster], [Posterid], [Title], [Postdatetime], [Message], [Ip], [Lastedit], [Invisible], [Usesig], [Htmlon], [Smileyoff], [Parseurloff], [Bbcodeoff], [Attachment], [Rate], [Ratetimes], [IsDeleted]) VALUES (4, 5, 20, 0, 0, N'小杰', 1, N'121231241341', CAST(N'2016-11-30 02:36:47.483' AS DateTime), N'<p>43242342342342342</p>', N'::1', N'小杰', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[BBS_Posts] OFF
SET IDENTITY_INSERT [dbo].[BBS_Topics] ON 

INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (1, 9, NULL, NULL, NULL, 0, N'小杰                  ', NULL, 1, N'2q321312424                                                 ', NULL, CAST(N'2016-11-29 23:54:51.100' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (13, 9, NULL, NULL, NULL, 0, N'小杰                  ', N'/_theme/default.jpg', 1, N'1231231231                                                  ', NULL, CAST(N'2016-11-30 01:04:43.630' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (17, 11, NULL, NULL, NULL, 0, N'小杰                  ', N'/_theme/default.jpg', 1, N'221423423523453453                                          ', NULL, CAST(N'2016-11-30 01:09:39.403' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (18, 14, NULL, NULL, NULL, 0, N'小杰                  ', N'/_theme/default.jpg', 1, N'323船舶的2342423423                                            ', NULL, CAST(N'2016-11-30 01:10:09.363' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (20, 5, NULL, NULL, NULL, 0, N'小杰                  ', N'/_theme/default.jpg', 1, N'121231241341                                                ', NULL, CAST(N'2016-11-30 02:36:47.390' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[BBS_Topics] ([Tid], [Fid], [Iconid], [Typeid], [Readperm], [Price], [Poster], [PosterAvatar], [Posterid], [Title], [Attention], [Postdatetime], [Lastpost], [Lastpostid], [Lastposter], [Lastposterid], [Views], [Replies], [Displayorder], [Highlight], [Digest], [Rate], [Hide], [Attachment], [Moderated], [Closed], [Magic], [Identify], [Special], [IsDeleted]) VALUES (19, 9, NULL, NULL, NULL, 0, N'小杰                  ', N'/_theme/default.jpg', 1, N'XXXXXXXXXXXXXXX                                             ', NULL, CAST(N'2016-11-30 02:00:02.827' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BBS_Topics] OFF
SET IDENTITY_INSERT [dbo].[DocContent] ON 

INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (8, N'<ol class="custom_num list-paddingleft-1"><li class="list-num-1-1 list-num-paddingleft-1"><p style="line-height: normal; margin-bottom: 10px;">&nbsp;SqlSugar 是一款小巧，并且功能齐全的ORM，并不需要像Dapper一样依赖第三方扩展</p></li><li class="list-num-1-2 list-num-paddingleft-1"><p style="line-height: normal; margin-bottom: 10px;">SqlSugar 语法易用简单 ，有漂亮的拉姆达语法，也支持Dapper SQL和ADO.NET（存储过程等）的所有功能</p></li><li class="list-num-1-3 list-num-paddingleft-1"><p style="line-height: normal; margin-bottom: 10px;">SqlSugar 性能达到原生水准，远超 Dapper和EF CORE。</p></li><li class="list-num-1-4 list-num-paddingleft-1"><p style="line-height: normal; margin-bottom: 10px;">SqlSugar 支持.NET CORE , 多个数据库</p></li><li class="list-num-1-5 list-num-paddingleft-1"><p style="line-height: normal; margin-bottom: 10px;">SqlSugar 体积小巧只有150K是EF的30分之1 ，NUGET直接可以下载</p></li></ol><p><br/></p><table class="layui-table"><tbody><tr class="firstRow"><th width="442" valign="top" style="word-break: break-all;">Asp.net 4.+<br/></th><th width="442" valign="top" style="word-break: break-all;">Asp.net Core<br/></th><th width="442" valign="top" style="word-break: break-all;">说明<br/></th><th width="442" valign="top" style="word-break: break-all;">依赖<br/></th></tr><tr><td width="442" valign="top" style="word-break: break-all;">SqlSugar.dll<br/></td><td width="442" valign="top" style="word-break: break-all;">SqlSugarCore.dll</td><td width="442" valign="top" style="word-break: break-all;"><p>SqlServer ORM&nbsp;&nbsp;<br/></p></td><td width="442" valign="top" style="word-break: break-all;">无<br/></td></tr><tr><td width="442" valign="top" style="word-break: break-all;">MysqlSugar.dll<br/></td><td width="442" valign="top" style="word-break: break-all;">MysqlSugarCore.dll</td><td width="442" valign="top" style="word-break: break-all;"><p>MySql ORM&nbsp;&nbsp;</p></td><td width="442" valign="top" style="word-break: break-all;">MySql.Data.dll</td></tr><tr><td width="442" valign="top" style="word-break: break-all;">SqliteSugar.dll<br/></td><td width="442" valign="top" style="word-break: break-all;">SqliteSugarCore.dll</td><td width="442" valign="top" style="word-break: break-all;"><p>Sqlite ORM&nbsp;</p></td><td width="442" valign="top" style="word-break: break-all;"><p>System.Data.SQLite.dll<br/></p><p>SQLite.Interop.dll（Core版不需要）</p></td></tr><tr><td width="442" valign="top" style="word-break: break-all;">OracleSugar.dll<br/></td><td width="442" valign="top" style="word-break: break-all;">-<br/></td><td width="442" valign="top" style="word-break: break-all;"><p>Oracle ORM<br/></p></td><td width="442" valign="top" style="word-break: break-all;">Oracle.ManagedDataAccess.dll</td></tr><tr><td valign="top" style="word-break: break-all;" rowspan="1" colspan="1">SqlSugarRepository.dll</td><td valign="top" style="word-break: break-all;" rowspan="1" colspan="1">-<br/></td><td valign="top" style="word-break: break-all;" rowspan="1" colspan="1">SqlServer MySql Sqlite Oracle 四合一</td><td valign="top" style="word-break: break-all;" rowspan="1" colspan="1"><p>MySql.Data.dll</p><p>System.Data.SQLite.dll</p><p>Oracle.ManagedDataAccess.dll</p><p>SQLite.Interop.dll</p><p><br/></p></td></tr></tbody></table><p><br/></p>', 7, NULL, 0, N'SqlSugar ORM 系列介绍', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (9, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET 4.0+ MSSQL<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/SqlSugar">https://github.com/sunkaixuan/SqlSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET CORE MSSQL<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqlSugar">https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqlSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET 4.0+ MYSQL<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/MySqlSugar">https://github.com/sunkaixuan/MySqlSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET CORE MYSQL<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/ASP_NET_CORE_ORM_MySqlSugar">https://github.com/sunkaixuan/ASP_NET_CORE_ORM_MySqlSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET 4.0+ Sqlite<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/SqliteSugar">https://github.com/sunkaixuan/SqliteSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET CORE Sqlite<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqliteSugar">https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqliteSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET 4.0+ ORACLE<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/OracleSugar">https://github.com/sunkaixuan/OracleSugar</a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET CORE ORACLE<span class="Apple-converted-space">&nbsp;</span><a style="box-sizing: border-box; background-color: transparent; color: rgb(64, 120, 192); text-decoration: none;" href="https://github.com/sunkaixuan/ASP_NET_CORE_ORM_OracleSugar">https://github.com/sunkaixuan/ASP_NET_CORE_ORM_OracleSugar</a></p><p><br/></p>', 7, 2, 0, N'GItHub 源码下载', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (10, N'<p class="site-tips site-text">Sugar.dll是指 <strong><span style="color: rgb(31, 73, 125);">Sqlsugar.dll</span>&nbsp;</strong> <strong><span style="color: rgb(247, 150, 70);">MySqlSugar.dll</span> </strong><strong><span style="color: rgb(192, 80, 77);">SqliteSugar.dll </span></strong>和 <strong><span style="color: rgb(31, 73, 125);">OracleSugar.dll </span></strong>中任何一个，因为太多我们就简写成Sugar.dll方便和SqlSugarRepository区分开来</p><p><br/></p><p><strong>普通用法</strong><br/></p><pre class="brush:c#;toolbar:false">using&nbsp;(var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(connectionString))&nbsp;
{&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;var&nbsp;list=db.Queryable&lt;T&gt;().ToList();
}</pre><p><span style="font-size: 16px;"><strong><br/></strong></span></p><p><span style="font-size: 16px;"><strong>打包用法</strong></span></p><pre class="brush:c#;toolbar:false">///&nbsp;&lt;summary&gt;
///&nbsp;SqlSugar
///&nbsp;&lt;/summary&gt;
public&nbsp;class&nbsp;SugarDao
{
&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;SugarDao()
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;string&nbsp;ConnectionString
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;get
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;reval&nbsp;=&nbsp;&quot;server=.;uid=sa;pwd=sasa;database=SqlSugarTest&quot;;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;reval;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;SqlSugarClient&nbsp;GetInstance()
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(ConnectionString);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableLogEvent&nbsp;=&nbsp;true;//Enable&nbsp;log&nbsp;events
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.LogEventStarting&nbsp;=&nbsp;(sql,&nbsp;par)&nbsp;=&gt;&nbsp;{&nbsp;Console.WriteLine(sql&nbsp;+&nbsp;&quot;&nbsp;&quot;&nbsp;+&nbsp;par+&quot;\r\n&quot;);&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;db;
&nbsp;&nbsp;&nbsp;&nbsp;}
}</pre><p><span style="font-size: 12px;">通过SugarDao类来调用SqlSugarClient对象，这样做的好处是可以在&nbsp;GetInstance 方法里面做一些公用的配置，调用处都是一个配置。</span></p><p><br/></p><p><span style="font-size: 12px;">使用法打包</span></p><pre class="brush:c#;toolbar:false">using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarDao.GetInstance())
{&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list=db.Queryable&lt;T&gt;().ToList();
}</pre><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', 8, NULL, 0, N'Sugar.dll 用法:', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (11, N'<pre class="brush:c#;toolbar:false">//查询单条
var&nbsp;single&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Single(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;1);
//查询单条根据主键
var&nbsp;singleByPk&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().InSingle(1);
//查询单条没有记录返回空对象
var&nbsp;singleOrDefault&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().SingleOrDefault(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;11111111);
//查询单条没有记录返回空对象
var&nbsp;single2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;1).SingleOrDefault();
//查询所有的Id
var&nbsp;singleFieldList&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Select&lt;int&gt;(it=&gt;it.id).ToList();
//查询第一条
var&nbsp;first&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;1).First();
var&nbsp;first2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;1).FirstOrDefault();

//查询条数
var&nbsp;count&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;10).Count();
//从第2条开始以后取所有
var&nbsp;skip&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;10).OrderBy(it&nbsp;=&gt;&nbsp;it.id).Skip(2).ToList();
//取前2条
var&nbsp;take&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;10).OrderBy(it&nbsp;=&gt;&nbsp;it.id).Take(2).ToList();
//Not&nbsp;like&nbsp;
string&nbsp;conval&nbsp;=&nbsp;&quot;a&quot;;
var&nbsp;notLike&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;!c.name.Contains(conval.ToString())).ToList();
//Like
conval&nbsp;=&nbsp;&quot;三&quot;;
var&nbsp;like&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.Contains(conval)).ToList();
//支持字符串Where&nbsp;让你解决，更复杂的查询
var&nbsp;student12&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;&quot;a&quot;&nbsp;==&nbsp;&quot;a&quot;).Where(&quot;id&gt;@id&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;}).ToList();
var&nbsp;student13&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;&quot;a&quot;&nbsp;==&nbsp;&quot;a&quot;).Where(&quot;id&gt;100&nbsp;and&nbsp;id&nbsp;in(&nbsp;select&nbsp;1)&quot;).ToList();

//存在记录反回true，则否返回false
bool&nbsp;isAny100&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Any(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;100);
bool&nbsp;isAny1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Any(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;1);

//获取最大Id
object&nbsp;maxId&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Max(it&nbsp;=&gt;&nbsp;it.id);
int&nbsp;maxId1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Max(it&nbsp;=&gt;&nbsp;it.id).ObjToInt();//拉姆达
int&nbsp;maxId2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Max&lt;int&gt;(&quot;id&quot;);&nbsp;//字符串写法
//获取最小
int&nbsp;minId1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;0).Min(it&nbsp;=&gt;&nbsp;it.id).ObjToInt();//拉姆达
int&nbsp;minId2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;0).Min&lt;int&gt;(&quot;id&quot;);//字符串写法</pre><p><br/></p><p><strong>排序</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;orderList&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().OrderBy(&quot;id&nbsp;desc,name&nbsp;asc&quot;).ToList();//字符串支持多个排序
//可以多个order&nbsp;by表达示
var&nbsp;order2List&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().OrderBy(it&nbsp;=&gt;&nbsp;it.name).OrderBy(it&nbsp;=&gt;&nbsp;it.id,&nbsp;OrderByType.desc).ToList();&nbsp;//&nbsp;order&nbsp;by&nbsp;name&nbsp;as&nbsp;,order&nbsp;by&nbsp;id&nbsp;desc</pre><p><br/></p><p><br/></p><p><strong>分页</strong></p><pre class="brush:c#;toolbar:false">//取11-20条
var&nbsp;page1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;10).OrderBy(it&nbsp;=&gt;&nbsp;it.id).Skip(10).Take(10).ToList();
//取11-20条&nbsp;&nbsp;等于&nbsp;Skip(pageIndex-1)*pageSize).Take(pageSize)&nbsp;等于&nbsp;&nbsp;between&nbsp;(pageIndex-1)*pageSize&nbsp;and&nbsp;&nbsp;pageIndex*pageSize
var&nbsp;page2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&gt;&nbsp;10).OrderBy(it&nbsp;=&gt;&nbsp;it.id).ToPageList(2,&nbsp;10);</pre><p><br/></p><p><strong>IN操作</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;intArray&nbsp;=&nbsp;new[]&nbsp;{&nbsp;&quot;5&quot;,&nbsp;&quot;2&quot;,&nbsp;&quot;3&quot;&nbsp;};
var&nbsp;intList&nbsp;=&nbsp;intArray.ToList();
var&nbsp;listnew&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(it&nbsp;=&gt;&nbsp;intArray.Contains(it.name)).ToList();
var&nbsp;list0&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(it&nbsp;=&gt;&nbsp;it.id,&nbsp;1,&nbsp;2,&nbsp;3).ToList();
var&nbsp;list1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(it&nbsp;=&gt;&nbsp;it.id,&nbsp;intArray).ToList();
var&nbsp;list2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(&quot;id&quot;,&nbsp;intArray).ToList();
var&nbsp;list3&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(it&nbsp;=&gt;&nbsp;it.id,&nbsp;intList).ToList();
var&nbsp;list4&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(&quot;id&quot;,&nbsp;intList).ToList();
var&nbsp;list6&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().In(intList).ToList();//不设置字段默认主键</pre><p><br/></p><p><strong>分组查询</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;list7&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&lt;&nbsp;20).GroupBy(it&nbsp;=&gt;&nbsp;it.sex).Select(&quot;sex,count(*)&nbsp;Count&quot;).ToDynamic();
var&nbsp;list8&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&lt;&nbsp;20).GroupBy(it&nbsp;=&gt;&nbsp;it.sex).GroupBy(it&nbsp;=&gt;&nbsp;it.id).Select(&quot;id,sex,count(*)&nbsp;Count&quot;).ToDynamic();
List&lt;StudentGroup&gt;&nbsp;list9&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&lt;&nbsp;20).GroupBy(it&nbsp;=&gt;&nbsp;it.sex).Select&lt;StudentGroup&gt;(&quot;Sex,count(*)&nbsp;Count&quot;).ToList();
List&lt;StudentGroup&gt;&nbsp;list10&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&lt;&nbsp;20).GroupBy(&quot;sex&quot;).Select&lt;StudentGroup&gt;(&quot;Sex,count(*)&nbsp;Count&quot;).ToList();
//SELECT&nbsp;Sex,Count=count(*)&nbsp;&nbsp;FROM&nbsp;Student&nbsp;&nbsp;WHERE&nbsp;1=1&nbsp;&nbsp;AND&nbsp;&nbsp;(id&nbsp;&lt;&nbsp;20)&nbsp;&nbsp;&nbsp;&nbsp;GROUP&nbsp;BY&nbsp;Sex&nbsp;--生成结果</pre><p><br/></p>', 10, 4, 0, N'单表查询总览', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (12, N'<p>支持的函数写法：</p><pre class="brush:c#;toolbar:false">var&nbsp;r1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(it&nbsp;=&gt;&nbsp;it.name&nbsp;==&nbsp;par1.ObjToString()).ToList();&nbsp;//ObjToString会将null转转成&quot;&quot;
var&nbsp;r2&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(it&nbsp;=&gt;&nbsp;it.d1&nbsp;==&nbsp;par1.ObjToDate()).ToList();
var&nbsp;r3&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;1.ObjToInt()).ToList();//ObjToInt会将null转转成0
var&nbsp;r4&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;2.ObjToDecimal()).ToList();
var&nbsp;r5&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;3.ObjToMoney()).ToList();
var&nbsp;r6&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(it&nbsp;=&gt;&nbsp;it.v1&nbsp;==&nbsp;par2.Trim()).ToList();
var&nbsp;convert1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name&nbsp;==&nbsp;&quot;a&quot;.ToString()).ToList();
var&nbsp;convert2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;==&nbsp;Convert.ToInt32(&quot;1&quot;)).ToList();
var&nbsp;convert3&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name&nbsp;==&nbsp;par2.ToLower()).ToList();
var&nbsp;convert4&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name&nbsp;==&nbsp;par2.ToUpper()).ToList();
var&nbsp;convert5=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;DateTime.Now&nbsp;&gt;&nbsp;Convert.ToDateTime(&quot;2015-1-1&quot;)).ToList();
var&nbsp;c1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.Contains(&quot;a&quot;)).ToList();
var&nbsp;c2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.StartsWith(&quot;a&quot;)).ToList();
var&nbsp;c3&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.EndsWith(&quot;a&quot;)).ToList();
var&nbsp;c4&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;!string.IsNullOrEmpty(c.name)).ToList();
var&nbsp;c5&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.Equals(&quot;小杰&quot;)).ToList();
var&nbsp;c6&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.name.Length&nbsp;&gt;&nbsp;4).ToList();
var&nbsp;time&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(c&nbsp;=&gt;&nbsp;c.d1&gt;DateTime.Now.AddDays(1)).ToList();
var&nbsp;time2&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(c&nbsp;=&gt;&nbsp;c.d1&nbsp;&gt;&nbsp;DateTime.Now.AddYears(1)).ToList();
var&nbsp;time3&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(c&nbsp;=&gt;&nbsp;c.d1&nbsp;&gt;&nbsp;DateTime.Now.AddMonths(1)).ToList();</pre><p><br/></p><p>不支持的一些函数请将变量提取到外面在传进表达式如下：</p><pre class="brush:c#;toolbar:false">string&nbsp;par1&nbsp;=&nbsp;&quot;asdfsa&quot;.Replace(&quot;aa&quot;,&quot;&quot;);
var&nbsp;list=&nbsp;db.Queryable&lt;Student&gt;().Where(it&nbsp;=&gt;&nbsp;it.name&nbsp;==&nbsp;par1).ToList();</pre><p><br/></p><p>复杂的条件可以使用字符串来实现</p><pre class="brush:c#;toolbar:false">var&nbsp;list&nbsp;=&nbsp;db.Queryable&lt;InsertTest&gt;().Where(&quot;id=@id&nbsp;and&nbsp;name=@name&quot;,&nbsp;new&nbsp;{&nbsp;id=1,name=xxx}).ToList();</pre><p><br/></p>', 11, 5, 0, N'拉姆达支持的函数用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (13, N'<p>单表：</p><pre class="brush:c#;toolbar:false">var&nbsp;queryable&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(c&nbsp;=&gt;&nbsp;c.id&nbsp;&lt;&nbsp;10)
.Select&lt;V_Student&gt;(c&nbsp;=&gt;&nbsp;new&nbsp;V_Student&nbsp;{&nbsp;id&nbsp;=&nbsp;c.id,&nbsp;name&nbsp;=&nbsp;c.name,&nbsp;AreaName&nbsp;=&nbsp;&quot;默认地区&quot;,&nbsp;SchoolName&nbsp;=&nbsp;&quot;默认学校&quot;,&nbsp;SubjectName&nbsp;=&nbsp;&quot;NET&quot;&nbsp;});</pre><p><br/></p><p>多表：</p><pre class="brush:c#;toolbar:false">&nbsp;&nbsp;List&lt;V_Student&gt;&nbsp;jList4&nbsp;=db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s2&nbsp;&nbsp;on&nbsp;s1.id=s2.id
.JoinTable&lt;School,&nbsp;Area&gt;((s1,&nbsp;s2,&nbsp;a1)&nbsp;=&gt;&nbsp;a1.id&nbsp;==&nbsp;s2.AreaId)//&nbsp;left&nbsp;join&nbsp;&nbsp;Area&nbsp;a1&nbsp;&nbsp;on&nbsp;a1.id=s2.AreaId&nbsp;&nbsp;第三张表与第二张表关联
.JoinTable&lt;Area,&nbsp;School&gt;((s1,&nbsp;a1,&nbsp;s3)&nbsp;=&gt;&nbsp;a1.id&nbsp;==&nbsp;s3.AreaId)//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s3&nbsp;&nbsp;on&nbsp;a1.id=s3.AreaId&nbsp;&nbsp;第四第表第三张表关联
.JoinTable&lt;School&gt;((s1,&nbsp;s4)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s4.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s2&nbsp;&nbsp;on&nbsp;s1.id=s4.id
.Select&lt;School,&nbsp;Area,&nbsp;V_Student&gt;((s1,&nbsp;s2,&nbsp;a1)&nbsp;=&gt;&nbsp;new&nbsp;V_Student&nbsp;{&nbsp;id&nbsp;=&nbsp;s1.id,&nbsp;name&nbsp;=&nbsp;s1.name,&nbsp;SchoolName&nbsp;=&nbsp;s2.name,&nbsp;AreaName&nbsp;=&nbsp;a1.name&nbsp;}).ToList();</pre><p><br/></p><p>字符串用法：</p><pre class="brush:c#;toolbar:false">var&nbsp;list3&nbsp;=&nbsp;db.Queryable()
.JoinTable((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)
.Where(s1&nbsp;=&gt;&nbsp;s1.id&nbsp;&lt;=&nbsp;3)
.Select&lt;V_Student&gt;(&quot;s1.*,s2.name&nbsp;SchoolName&quot;)
.ToList();</pre><p><br/></p>', 12, 6, 0, N'映射到新类', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (14, N'<p>可以通过&gt;=和&lt;=来获取范围 ，&nbsp;d1 在 DateTime.Now 和DateTime.Now.AddDays(1)之间</p><pre class="brush:c#;toolbar:false">&nbsp;db.Queryable&lt;InsertTest&gt;().Where(c&nbsp;=&gt;&nbsp;c.d1&gt;=DateTime.Now&amp;&amp;c.d1&lt;=DateTime.Now.AddDays(1)).ToList();</pre><p><br/></p><p><br/></p>', 13, 7, 0, N'拉姆达的详解', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (15, N'<p><strong>插入单条</strong></p><pre class="brush:c#;toolbar:false">db.Insert(GetInsertItem());&nbsp;//插入一条记录&nbsp;(有主键也好，没主键也好，有自增列也好都可以插进去)</pre><p><br/></p><p><strong>插入多条</strong><br/></p><pre class="brush:c#;toolbar:false">db.InsertRange(GetInsertList());&nbsp;//批量插入&nbsp;支持（别名表等功能）
db.SqlBulkCopy(GetInsertList());&nbsp;//批量插入&nbsp;适合海量数据插入</pre><p><br/></p><p><strong>设置不插入列</strong></p><pre class="brush:c#;toolbar:false">db.DisableInsertColumns&nbsp;=&nbsp;new&nbsp;string[]&nbsp;{&nbsp;&quot;sex&quot;&nbsp;};//sex列将不会插入值
Student&nbsp;s&nbsp;=&nbsp;new&nbsp;Student()
{
&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;=&nbsp;&quot;张&quot;&nbsp;+&nbsp;new&nbsp;Random().Next(1,&nbsp;int.MaxValue),
&nbsp;&nbsp;&nbsp;&nbsp;sex&nbsp;=&nbsp;&quot;gril&quot;
};var&nbsp;id&nbsp;=&nbsp;db.Insert(s);&nbsp;//插入
//查询刚插入的sex是否有值
var&nbsp;sex&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Single(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;id.ObjToInt()).sex;//无值
var&nbsp;name&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Single(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;id.ObjToInt()).name;//有值

//SqlBulkCopy同样支持不挺入列设置
db.SqlBulkCopy(GetInsertList());

//清空禁止插入列
db.DisableInsertColumns&nbsp;=&nbsp;null;
//添加禁止插入列
db.AddDisableInsertColumns(&quot;name&quot;,&quot;id&quot;);</pre><p><br/></p><p><br/></p><p><br/></p>', 15, 8, 0, N'插入基本用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (16, N'<p><strong>指定列更新</strong><br/></p><pre class="brush:c#;toolbar:false">db.Update&lt;School&gt;(new&nbsp;{&nbsp;name&nbsp;=&nbsp;&quot;蓝翔14&quot;&nbsp;},&nbsp;it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;14);&nbsp;//只更新name列
db.Update&lt;School,&nbsp;int&gt;(new&nbsp;{&nbsp;name&nbsp;=&nbsp;&quot;蓝翔11&nbsp;23&nbsp;12&quot;,&nbsp;areaId&nbsp;=&nbsp;2&nbsp;},&nbsp;11,&nbsp;23,&nbsp;12);
db.Update&lt;School,&nbsp;string&gt;(new&nbsp;{&nbsp;name&nbsp;=&nbsp;&quot;蓝翔2&quot;&nbsp;},&nbsp;new&nbsp;string[]&nbsp;{&nbsp;&quot;11&quot;,&nbsp;&quot;21&quot;&nbsp;});
db.Update&lt;School&gt;(new&nbsp;{&nbsp;name&nbsp;=&nbsp;&quot;蓝翔2&quot;&nbsp;},&nbsp;it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;100);
var&nbsp;array=new&nbsp;int[]{1,2,3};
db.Update&lt;School&gt;(new&nbsp;{&nbsp;name&nbsp;=&nbsp;&quot;蓝翔2&quot;&nbsp;},&nbsp;it&nbsp;=&gt;&nbsp;array.Contains(it.id));//&nbsp;id&nbsp;in&nbsp;1,2,3</pre><p><br/><strong>使用字典更新</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;dic&nbsp;=&nbsp;new&nbsp;Dictionary&lt;string,&nbsp;string&gt;();
dic.Add(&quot;name&quot;,&nbsp;&quot;第十三条&quot;);
dic.Add(&quot;areaId&quot;,&nbsp;&quot;1&quot;);
db.Update&lt;School,&nbsp;int&gt;(dic,&nbsp;13);</pre><p><br/><strong>整个实体更新</strong><br/></p><pre class="brush:c#;toolbar:false">db.Update(new&nbsp;School&nbsp;{&nbsp;id&nbsp;=&nbsp;16,&nbsp;name&nbsp;=&nbsp;&quot;蓝翔16&quot;,&nbsp;AreaId&nbsp;=&nbsp;1&nbsp;});
db.Update&lt;School&gt;(new&nbsp;School&nbsp;{&nbsp;id&nbsp;=&nbsp;12,&nbsp;name&nbsp;=&nbsp;&quot;蓝翔12&quot;,&nbsp;AreaId&nbsp;=&nbsp;2&nbsp;},&nbsp;it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;18);
db.Update&lt;School&gt;(new&nbsp;School()&nbsp;{&nbsp;id&nbsp;=&nbsp;11,&nbsp;name&nbsp;=&nbsp;&quot;青鸟11&quot;&nbsp;});</pre><p><span style="color: rgb(192, 80, 77);">与指定列更新不同的是只要实体中有的字段都会更新，如果想不更新指定字段请用排除更新列</span></p><p><br/></p><p><strong>设置不更新列</strong></p><pre class="brush:c#;toolbar:false">db.DisableUpdateColumns&nbsp;=&nbsp;new&nbsp;string[]&nbsp;{&nbsp;&quot;CreateTime&quot;&nbsp;};//设置CreateTime不更新TestUpdateColumns&nbsp;updObj&nbsp;=&nbsp;new&nbsp;TestUpdateColumns()
{
&nbsp;&nbsp;&nbsp;&nbsp;VGUID&nbsp;=&nbsp;Guid.Parse(&quot;542b5a27-6984-47c7-a8ee-359e483c8470&quot;),
&nbsp;&nbsp;&nbsp;&nbsp;Name&nbsp;=&nbsp;&quot;xx&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;Name2&nbsp;=&nbsp;&quot;xx2&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;IdentityField&nbsp;=&nbsp;0,
&nbsp;&nbsp;&nbsp;&nbsp;CreateTime&nbsp;=&nbsp;null
};
//CreateTime将不会被更新
db.Update(updObj);
//以前实现这种更新需要用指定列的方式实现，现在就简单多了。
//批量更新&nbsp;&nbsp;&nbsp;数据量小时建议使用
var&nbsp;updateResult&nbsp;=&nbsp;db.UpdateRange(GetUpdateList());
//批量更新&nbsp;&nbsp;数据量大时建议使用
var&nbsp;updateResult2&nbsp;=&nbsp;db.SqlBulkReplace(GetUpdateList2());

//更新字符串
db.Update&lt;Student&gt;(&quot;sch_id=sch_id+1&quot;,&nbsp;it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;1);

//清空禁止更新列
db.DisableUpdateColumns&nbsp;=&nbsp;null;
//新语法添加禁止更新列
db.AddDisableUpdateColumn(&quot;id&quot;,&nbsp;&quot;name&quot;);//添加禁止更新列</pre><p><br/></p><p><br/></p><p><br/></p>', 16, 9, 0, N'更新基础用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (17, N'<p><strong>删除根据主键</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete&lt;School,&nbsp;int&gt;(10);</pre><p><strong><br/></strong></p><p><strong>删除根据表达示</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete&lt;School&gt;(it&nbsp;=&gt;&nbsp;it.id&nbsp;&gt;&nbsp;100);//支持it=&gt;array.contains(it.id)</pre><p><strong><br/></strong></p><p><strong>主键批量删除</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete&lt;School,&nbsp;string&gt;(new&nbsp;string[]&nbsp;{&nbsp;&quot;100&quot;,&nbsp;&quot;101&quot;,&nbsp;&quot;102&quot;&nbsp;});</pre><p><strong><br/></strong></p><p><strong>非主键批量删除</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete&lt;School,&nbsp;string&gt;(it&nbsp;=&gt;&nbsp;it.name,&nbsp;new&nbsp;string[]&nbsp;{&nbsp;&quot;&quot;&nbsp;});
db.Delete&lt;School,&nbsp;int&gt;(it&nbsp;=&gt;&nbsp;it.id,&nbsp;new&nbsp;int[]&nbsp;{&nbsp;20,&nbsp;22&nbsp;});</pre><p><br/><strong>根据实体删除（实体一定要有主键，并且要有值）</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete(new&nbsp;School()&nbsp;{&nbsp;id&nbsp;=&nbsp;200&nbsp;});</pre><p><br/></p><p><strong>根据字符串删除</strong><br/></p><pre class="brush:c#;toolbar:false">db.Delete&lt;School&gt;(&quot;id=@id&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;100&nbsp;});</pre><p></p><p><strong>假删除</strong><br/></p><pre class="brush:c#;toolbar:false">//db.FalseDelete&lt;school&gt;(&quot;is_del&quot;,&nbsp;100);
//等同于&nbsp;update&nbsp;school&nbsp;set&nbsp;is_del=1&nbsp;where&nbsp;id&nbsp;in(100)
//db.FalseDelete&lt;school&gt;(&quot;is_del&quot;,&nbsp;it=&gt;it.id==100);</pre><p><br/></p>', 17, 10, 0, N'删除基本用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (18, N'<p class="site-tips site-text"><strong>OracleSugar.OracleConfig</strong></p><p><span style="font-size: 12px;">Oracle自添列的设置是通过序列实现的，只需要在IIS启动时赋值</span></p><pre class="brush:c#;toolbar:false">OracleConfig.SequenceMapping&nbsp;=&nbsp;new&nbsp;List&lt;SequenceModel&gt;()
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;SequenceModel(){&nbsp;ColumnName=&quot;ID&quot;,&nbsp;TableName=&quot;STUDENT&quot;,&nbsp;Value=&quot;SEQ&quot;}&nbsp;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;SequenceModel(){&nbsp;ColumnName=&quot;ID&quot;,&nbsp;TableName=&quot;AREA&quot;,&nbsp;Value=&quot;SEQ2&quot;}&nbsp;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;SequenceModel(){&nbsp;ColumnName=&quot;ID&quot;,&nbsp;TableName=&quot;SCHOOL&quot;,&nbsp;Value=&quot;SEQ3&quot;}&nbsp;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;SequenceModel(){&nbsp;ColumnName=&quot;ID&quot;,&nbsp;TableName=&quot;SUBJECT&quot;,&nbsp;Value=&quot;SEQ4&quot;}&nbsp;
};</pre><p><br/></p><p><br/></p><p><br/></p><p class="site-tips site-text"><strong>参数的区别</strong></p><p><span style="font-size: 12px;">Oracle是:其它的是@</span></p><pre class="brush:c#;toolbar:false">//oracleSugar.dll
db.Delete&lt;School&gt;(&quot;id=:id&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;100&nbsp;});
//其它所有dll
db.Delete&lt;School&gt;(&quot;id=@id&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;100&nbsp;});</pre><p><br/></p><p><br/></p><p><br/></p><p class="site-tips site-text"><strong>生成实体类时，根据number的长度生成指定的C#类型</strong></p><table class="layui-table"><tbody><tr class="firstRow"><th width="904" valign="top">Number长度</th><th width="904" valign="top">C#类型</th></tr></tbody><tbody><tr class="firstRow"><td width="904" valign="top" style="word-break: break-all;">1<br/></td><td width="904" valign="top" style="word-break: break-all;">bool<br/></td></tr><tr><td width="904" valign="top" style="word-break: break-all;">3<br/></td><td width="904" valign="top" style="word-break: break-all;">byte<br/></td></tr><tr><td width="904" valign="top" style="word-break: break-all;">4<br/></td><td width="904" valign="top" style="word-break: break-all;">short<br/></td></tr><tr><td width="904" valign="top" style="word-break: break-all;">9<br/></td><td width="904" valign="top" style="word-break: break-all;">int<br/></td></tr><tr><td width="904" valign="top" style="word-break: break-all;">18<br/></td><td width="904" valign="top" style="word-break: break-all;">long<br/></td></tr></tbody></table><p>不在此范围默认是int</p><p><br/></p>', 18, 11, 0, N'Oracle与其它版本的差异', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (19, N'<p class="site-tips site-text"><span style="color: rgb(79, 129, 189);"><strong>SqlSugarRepository.dll</strong></span><strong>同时可以操作四种数据库，用法小有区别。</strong></p><p><br/></p><p><strong>普通用法</strong></p><pre class="brush:c#;toolbar:false">using&nbsp;(ISqlSugarClient&nbsp;db&nbsp;=&nbsp;DbRepository.GetInstance(DbType.MySql,MySqlConnString))
{
&nbsp;&nbsp;&nbsp;var&nbsp;list=&nbsp;db.Queryable&lt;Student&gt;().ToList();&nbsp;
}</pre><p><br/></p><p><strong><br/></strong></p><p><strong>灵活用法</strong></p><pre class="brush:c#;toolbar:false">using&nbsp;NewTest.Demos;
using&nbsp;System;
using&nbsp;System.Collections.Generic;
using&nbsp;System.Linq;
using&nbsp;System.Text;
using&nbsp;System.Threading.Tasks;
using&nbsp;SqlSugarRepository;
namespace&nbsp;OrmTest
{
&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Program
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;static&nbsp;string&nbsp;SqlConnString&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;server=.;uid=sa;pwd=sasa;database=SqlSugarTest&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;static&nbsp;string&nbsp;MySqlConnString&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;server=localhost;Database=SqlSugarTest;Uid=root;Pwd=root&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;static&nbsp;string&nbsp;PlSqlConnString&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;Data&nbsp;Source=localhost/orcl;User&nbsp;ID=system;Password=xxx;&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;static&nbsp;string&nbsp;SqliteSqlConnString&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@&quot;DataSource=F:\SugarForOne\OrmTest\OrmTest\Database\demo.sqlite&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static&nbsp;void&nbsp;Main(string[]&nbsp;args)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(MyRepository&nbsp;db&nbsp;=&nbsp;new&nbsp;MyRepository())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//当前DB是SqlConnection1
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list=&nbsp;db.Database.Queryable&lt;Student&gt;().ToList();&nbsp;//使用和其它一模一样只是多了个Database
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//切换到Sqlite2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.SetCurrent(db.Sqlite2);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list2&nbsp;=&nbsp;db.Database.Queryable&lt;Student&gt;().ToList();//从Sqlite读取的数据
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;MyRepository&nbsp;:&nbsp;DbRepository
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;ConnectionConfig&nbsp;SqlConnection1&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;ConnectionConfig()&nbsp;{&nbsp;ConnectionString&nbsp;=&nbsp;SqlConnString,&nbsp;DbType&nbsp;=&nbsp;DbType.SqlServer&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;ConnectionConfig&nbsp;Sqlite2&nbsp;=&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;ConnectionConfig()&nbsp;{&nbsp;ConnectionString&nbsp;=&nbsp;SqliteSqlConnString,&nbsp;DbType&nbsp;=&nbsp;DbType.Sqlite&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;Student
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;id&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;string&nbsp;name&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}
}</pre><p><br/></p>', 8, 12, 0, N'SqlSugarRepository.dll用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (20, N'<p>Sql支持无锁查询 ，其它库并没有这个功能。</p><pre class="brush:c#;toolbar:false">db.IsNoLock=true;</pre><p><br/></p>', 18, NULL, 0, N'SqlServer和其它版本的差异', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (21, N'<p><strong>2表关联查询</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;jList&nbsp;=&nbsp;db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;//默认left&nbsp;join
.Where&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.id&nbsp;==&nbsp;1)
.Select(&quot;s1.*,s2.name&nbsp;as&nbsp;schName&quot;)
.ToDynamic();</pre><p><span style="font-size: 12px;">等于同于</span><br/></p><pre class="brush:sql;toolbar:false">SELECT&nbsp;s1.*,s2.name&nbsp;as&nbsp;schName&nbsp;
FROM&nbsp;[Student]&nbsp;&nbsp;s1&nbsp;
LEFT&nbsp;JOIN&nbsp;[School]&nbsp;&nbsp;s2&nbsp;ON&nbsp;&nbsp;s1.sch_id&nbsp;&nbsp;=&nbsp;s2.id&nbsp;
WHERE&nbsp;&nbsp;s1.id&nbsp;&nbsp;=&nbsp;1</pre><p><strong>2表关联查询并分页</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;jList2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;//默认left&nbsp;join
//如果要用inner&nbsp;join这么写
//.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id&nbsp;,JoinType.INNER)
.Where&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.id&nbsp;&gt;&nbsp;1)
.OrderBy(s1&nbsp;=&gt;&nbsp;s1.name)
.Skip(10)
.Take(20)
.Select(&quot;s1.*,s2.name&nbsp;as&nbsp;schName&quot;)
.ToDynamic();</pre><p><strong>3表查询并分页</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;jList3&nbsp;=&nbsp;db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s2&nbsp;&nbsp;on&nbsp;s1.id=s2.id
.JoinTable&lt;School&gt;((s1,&nbsp;s3)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s3.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s3&nbsp;&nbsp;on&nbsp;s1.id=s3.id
.Where&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.id&nbsp;&gt;&nbsp;1)&nbsp;&nbsp;//&nbsp;where&nbsp;s1.id&gt;1
.Where(s1&nbsp;=&gt;&nbsp;s1.id&nbsp;&gt;&nbsp;0)
.OrderBy&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.id)&nbsp;//order&nbsp;by&nbsp;s1.id&nbsp;多个order可以&nbsp;&nbsp;.oderBy().orderby&nbsp;叠加&nbsp;
.Skip(10)
.Take(20)
.Select(&quot;s1.*,s2.name&nbsp;as&nbsp;schName,s3.name&nbsp;as&nbsp;schName2&quot;)//select目前只支持这种写法
.ToDynamic();</pre><p><span style="font-size: 12px;">上面的方式都是与第一张表join，第三张表想与第二张表join写法如下</span><br/></p><pre class="brush:c#;toolbar:false">List&lt;V_Student&gt;&nbsp;jList4&nbsp;=
db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s2&nbsp;&nbsp;on&nbsp;s1.id=s2.id
.JoinTable&lt;School,&nbsp;Area&gt;((s1,&nbsp;s2,&nbsp;a1)&nbsp;=&gt;&nbsp;a1.id&nbsp;==&nbsp;s2.AreaId)//&nbsp;left&nbsp;join&nbsp;&nbsp;Area&nbsp;a1&nbsp;&nbsp;on&nbsp;a1.id=s2.AreaId&nbsp;&nbsp;第三张表与第二张表关联
.JoinTable&lt;Area,&nbsp;School&gt;((s1,&nbsp;a1,&nbsp;s3)&nbsp;=&gt;&nbsp;a1.id&nbsp;==&nbsp;s3.AreaId)//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s3&nbsp;&nbsp;on&nbsp;a1.id=s3.AreaId&nbsp;&nbsp;第四第表第三张表关联
.JoinTable&lt;School&gt;((s1,&nbsp;s4)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s4.id)&nbsp;//&nbsp;left&nbsp;join&nbsp;&nbsp;School&nbsp;s2&nbsp;&nbsp;on&nbsp;s1.id=s4.id
.Select&lt;School,&nbsp;Area,&nbsp;V_Student&gt;((s1,&nbsp;s2,&nbsp;a1)&nbsp;=&gt;&nbsp;new&nbsp;V_Student&nbsp;{&nbsp;id&nbsp;=&nbsp;s1.id,&nbsp;name&nbsp;=&nbsp;s1.name,&nbsp;SchoolName&nbsp;=&nbsp;s2.name,&nbsp;AreaName&nbsp;=&nbsp;a1.name&nbsp;}).ToList();</pre><p><span style="font-size: 12px;">等同于</span><br/></p><pre class="brush:sql;toolbar:false">SELECT&nbsp;id&nbsp;=&nbsp;s1.id,&nbsp;name&nbsp;=&nbsp;s1.name,&nbsp;SchoolName&nbsp;=&nbsp;s2.name,&nbsp;AreaName&nbsp;=&nbsp;a1.name&nbsp;&nbsp;
FROM&nbsp;[Student]&nbsp;&nbsp;&nbsp;s1&nbsp;
LEFT&nbsp;JOIN&nbsp;School&nbsp;&nbsp;s2&nbsp;ON&nbsp;&nbsp;(&nbsp;s1.sch_id&nbsp;&nbsp;=&nbsp;s2.id&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;
LEFT&nbsp;JOIN&nbsp;Area&nbsp;&nbsp;a1&nbsp;ON&nbsp;&nbsp;(&nbsp;a1.id&nbsp;&nbsp;=&nbsp;s2.AreaId&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//第三张表与第二张表关联
LEFT&nbsp;JOIN&nbsp;School&nbsp;&nbsp;s3&nbsp;ON&nbsp;&nbsp;(&nbsp;a1.id&nbsp;&nbsp;=&nbsp;s3.AreaId&nbsp;)&nbsp;&nbsp;&nbsp;//第四张表与第三张表关联
LEFT&nbsp;JOIN&nbsp;School&nbsp;&nbsp;s4&nbsp;ON&nbsp;&nbsp;(&nbsp;s1.sch_id&nbsp;&nbsp;=&nbsp;s4.id&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;
WHERE&nbsp;1=1</pre><p>&nbsp;&nbsp;&nbsp;<br/></p><p><br/></p>', 19, 14, 0, N'多表查询', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (22, N'<p>只有当queryable类型转成其它类型时才会执行数据操作</p><p><br/></p><p><strong>条件拼接</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;queryable2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(it&nbsp;=&gt;&nbsp;true);
if&nbsp;(maxId.ObjToInt()&nbsp;==&nbsp;1)
{
&nbsp;&nbsp;&nbsp;&nbsp;queryable2.Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;1);
}
else
{
&nbsp;&nbsp;&nbsp;&nbsp;queryable2.Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;2);
}
var&nbsp;list&nbsp;=&nbsp;queryable2.ToList();</pre><p><br/></p><p><strong>分页的例子</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;queryable&nbsp;=&nbsp;db.Queryable&lt;Student&gt;()
.JoinTable&lt;School&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.sch_id&nbsp;==&nbsp;s2.id)&nbsp;&nbsp;
.JoinTable(childTableName,&nbsp;&quot;a1&quot;,&nbsp;&quot;a1.id=s2.areaid&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;},&nbsp;JoinType.INNER)&nbsp;
.OrderBy(s1&nbsp;=&gt;&nbsp;s1.id);</pre><p><span style="font-size: 12px;"><br/></span></p><p><span style="font-size: 12px;">使用上面的queryable</span></p><pre class="brush:c#;toolbar:false">var&nbsp;list&nbsp;=&nbsp;queryable
&nbsp;&nbsp;.Select&lt;School,&nbsp;Area,&nbsp;V_Student&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((s1,&nbsp;s2,&nbsp;a1)&nbsp;=&gt;&nbsp;new&nbsp;V_Student&nbsp;{&nbsp;id&nbsp;=&nbsp;s1.id,&nbsp;name&nbsp;=&nbsp;s1.name,&nbsp;SchoolName&nbsp;=&nbsp;s2.name,&nbsp;AreaName&nbsp;=&nbsp;a1.name&nbsp;})
&nbsp;&nbsp;.ToPageList(0,&nbsp;200);</pre><pre class="brush:c#;toolbar:false">var&nbsp;count&nbsp;=&nbsp;queryable.Count();</pre><p><br/></p>', 14, 15, 0, N'queryable动态拼接', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (23, N'<p><br/></p><p><strong>转成list</strong><br/></p><pre class="brush:c#;toolbar:false">List&lt;Student&gt;&nbsp;list1&nbsp;=&nbsp;db.SqlQuery&lt;Student&gt;(&quot;select&nbsp;*&nbsp;from&nbsp;Student&quot;);</pre><p><strong>转成list带参</strong><br/></p><pre class="brush:c#;toolbar:false">List&lt;Student&gt;&nbsp;list2&nbsp;=&nbsp;db.SqlQuery&lt;Student&gt;(&quot;select&nbsp;*&nbsp;from&nbsp;Student&nbsp;where&nbsp;id=@id&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});</pre><p><strong>转成dynamic</strong><br/></p><pre class="brush:c#;toolbar:false">dynamic&nbsp;list3&nbsp;=&nbsp;db.SqlQueryDynamic(&quot;select&nbsp;*&nbsp;from&nbsp;student&quot;);</pre><p><strong>转成json</strong><br/></p><pre class="brush:c#;toolbar:false">string&nbsp;list4&nbsp;=&nbsp;db.SqlQueryJson(&quot;select&nbsp;*&nbsp;from&nbsp;student&quot;);</pre><p><strong>返回int</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;list5&nbsp;=&nbsp;db.SqlQuery&lt;int&gt;(&quot;select&nbsp;top&nbsp;1&nbsp;id&nbsp;from&nbsp;Student&quot;).SingleOrDefault();</pre><p><strong>反回键值</strong><br/></p><pre class="brush:c#;toolbar:false">Dictionary&lt;string,&nbsp;string&gt;&nbsp;list6&nbsp;=&nbsp;db.SqlQuery&lt;KeyValuePair&lt;string,&nbsp;string&gt;&gt;(&quot;select&nbsp;id,name&nbsp;from&nbsp;Student&quot;).ToDictionary(it&nbsp;=&gt;&nbsp;it.Key,&nbsp;it&nbsp;=&gt;&nbsp;it.Value);</pre><p><strong>反回List&lt;string[]&gt;</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;list7&nbsp;=&nbsp;db.SqlQuery&lt;string[]&gt;(&quot;select&nbsp;top&nbsp;1&nbsp;id,name&nbsp;from&nbsp;Student&quot;).SingleOrDefault();</pre><p><br/></p><p><br/><strong>存储过程</strong></p><pre class="brush:c#;toolbar:false">var&nbsp;spResult&nbsp;=&nbsp;db.SqlQuery&lt;School&gt;(&quot;exec&nbsp;sp_school&nbsp;@p1,@p2&quot;,&nbsp;new&nbsp;{&nbsp;p1&nbsp;=&nbsp;1,&nbsp;p2&nbsp;=&nbsp;2&nbsp;});

//存储过程加Output&nbsp;
var&nbsp;pars&nbsp;=&nbsp;SqlSugarTool.GetParameters(new&nbsp;{&nbsp;p1&nbsp;=&nbsp;1,p2=0&nbsp;});&nbsp;//将匿名对象转成SqlParameter
db.IsClearParameters&nbsp;=&nbsp;false;//禁止清除参数
pars[1].Direction&nbsp;=&nbsp;ParameterDirection.Output;&nbsp;//将p2设为&nbsp;output
var&nbsp;spResult2&nbsp;=&nbsp;db.SqlQuery&lt;School&gt;(&quot;exec&nbsp;sp_school&nbsp;@p1,@p2&nbsp;output&quot;,&nbsp;pars);
db.IsClearParameters&nbsp;=&nbsp;true;//启用清除参数
var&nbsp;outPutValue&nbsp;=&nbsp;pars[1].Value;//获取output&nbsp;@p2的值

//存储过程优化操作
var&nbsp;pars2&nbsp;=&nbsp;SqlSugarTool.GetParameters(new&nbsp;{&nbsp;p1&nbsp;=&nbsp;1,&nbsp;p2&nbsp;=&nbsp;0&nbsp;});&nbsp;//将匿名对象转成SqlParameter
db.CommandType&nbsp;=&nbsp;CommandType.StoredProcedure;//指定为存储过程可比上面少写EXEC和参数
var&nbsp;spResult3&nbsp;=&nbsp;db.SqlQuery&lt;School&gt;(&quot;sp_school&quot;,&nbsp;pars2);
db.CommandType&nbsp;=&nbsp;CommandType.Text;//还原回默认</pre><p><br/></p><p><strong>获取第一行第一列的值</strong><br/></p><pre class="brush:c#;toolbar:false">string&nbsp;v1&nbsp;=&nbsp;db.GetString(&quot;select&nbsp;&#39;张三&#39;&nbsp;as&nbsp;name&quot;);
int&nbsp;v2&nbsp;=&nbsp;db.GetInt(&quot;select&nbsp;1&nbsp;as&nbsp;name&quot;);
double&nbsp;v3&nbsp;=&nbsp;db.GetDouble(&quot;select&nbsp;1&nbsp;as&nbsp;name&quot;);
decimal&nbsp;v4&nbsp;=&nbsp;db.GetDecimal(&quot;select&nbsp;1&nbsp;as&nbsp;name&quot;);</pre><p><br/></p><p><strong>更多底层函数</strong></p><pre class="brush:c#;toolbar:false">//获取DataTable
var&nbsp;dt&nbsp;=&nbsp;db.GetDataTable(&quot;select&nbsp;*&nbsp;from&nbsp;student&quot;);
//获取DataSet
var&nbsp;ds&nbsp;=&nbsp;db.GetDataSetAll(&quot;select&nbsp;*&nbsp;from&nbsp;student&quot;);
//获取单条
var&nbsp;r2&nbsp;=&nbsp;db.GetSingle&lt;Student&gt;(&quot;select&nbsp;top&nbsp;1&nbsp;*&nbsp;from&nbsp;student&quot;);
//获取首行首列
var&nbsp;r3&nbsp;=&nbsp;db.GetScalar(&quot;select&nbsp;&nbsp;count(1)&nbsp;from&nbsp;student&quot;);
//获取DR
var&nbsp;r4&nbsp;=&nbsp;db.GetReader(&quot;select&nbsp;&nbsp;count(1)&nbsp;from&nbsp;student&quot;);
r4.Dispose();
var&nbsp;r5&nbsp;=&nbsp;db.GetString(&quot;select&nbsp;&nbsp;top&nbsp;1&nbsp;name&nbsp;from&nbsp;student&quot;);
//执行SQL返回受影响行数
var&nbsp;r6&nbsp;=&nbsp;db.ExecuteCommand(&quot;select&nbsp;1&quot;);</pre><p><br/></p>', 20, 22, 0, N'Sql和存储过程支持', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (24, N'<pre class="brush:c#;toolbar:false">using&nbsp;(SqlSugarClient&nbsp;db&nbsp;=&nbsp;SugarDao.GetInstance())//开启数据库连接
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.CommandTimeOut&nbsp;=&nbsp;30000;//设置超时时间
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.BeginTran();//开启事务
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//db.BeginTran(IsolationLevel.ReadCommitted);+3重载可以设置事世隔离级别
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.CommitTran();//提交事务
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;catch&nbsp;(Exception)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.RollbackTran();//回滚事务
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
}</pre><p><br/></p>', 21, 22, 0, N'事务用法', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (25, N'<pre class="brush:c#;toolbar:false">&nbsp;&nbsp;&nbsp;&nbsp;//别名表的功能
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;MappingTable
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;void&nbsp;Init()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;启动MappingTable.Init&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//单个设置
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarDao.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list&nbsp;=&nbsp;db.Queryable&lt;V_Student&gt;(&quot;Student&quot;).ToList();//查询的是&nbsp;select&nbsp;*&nbsp;from&nbsp;student&nbsp;而我的实体名称为V_Student
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//全局设置
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarFactory.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list&nbsp;=&nbsp;db.Queryable&lt;V_Student&gt;().ToList();//查询的是&nbsp;select&nbsp;*&nbsp;from&nbsp;student&nbsp;而我的实体名称为V_Student
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;全局配置类
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarConfigs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//key类名&nbsp;value表名
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;List&lt;KeyValue&gt;&nbsp;MpList&nbsp;=&nbsp;new&nbsp;List&lt;KeyValue&gt;(){
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;FormAttr&quot;,&nbsp;Value=&quot;Flow_FormAttr&quot;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;Student3&quot;,&nbsp;Value=&quot;Student&quot;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;V_Student&quot;,&nbsp;Value=&quot;Student&quot;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;SqlSugar实例工厂
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarFactory
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//禁止实例化
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;SugarFactory()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;SqlSugarClient&nbsp;GetInstance()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;connection&nbsp;=&nbsp;SugarDao.ConnectionString;&nbsp;//这里可以动态根据cookies或session实现多库切换
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(connection);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.SetMappingTables(SugarConfigs.MpList);//设置关联表&nbsp;(引用地址赋值，每次赋值都只是存储一个内存地址)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//批量设置别名表
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//db.ClassGenerating.ForeachTables(db,&nbsp;tableName&nbsp;=&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;db.AddMappingTable(new&nbsp;KeyValue()&nbsp;{&nbsp;Key&nbsp;=&nbsp;tableName.Replace(&quot;bbs.&quot;,&quot;&quot;),&nbsp;Value&nbsp;=&nbsp;&nbsp;tableName&nbsp;});&nbsp;//key实体名，value表名
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//});

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;db;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p><br/></p>', 22, 22, 0, N'别名表', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (26, N'<pre class="brush:c#;toolbar:false">&nbsp;&nbsp;&nbsp;&nbsp;//别名列的功能
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;MappingColumns
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;void&nbsp;Init()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;启动MappingColumns.Init&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//全局设置
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarFactory.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(it=&gt;it.classId==1).ToList();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;Student
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//id
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;classId&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//name
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;string&nbsp;className&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//sch_id
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;classSchoolId&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;isOk&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;全局配置别名列（不区分表）
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarConfigs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//key实体字段名&nbsp;value表字段名&nbsp;，KEY唯一否则异常
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;List&lt;KeyValue&gt;&nbsp;MpList&nbsp;=&nbsp;new&nbsp;List&lt;KeyValue&gt;(){
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;classId&quot;,&nbsp;Value=&quot;id&quot;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;className&quot;,&nbsp;Value=&quot;name&quot;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;KeyValue(){&nbsp;Key=&quot;classSchoolId&quot;,&nbsp;Value=&quot;sch_id&quot;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;SqlSugar实例工厂
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarFactory
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//禁止实例化
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;SugarFactory()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;SqlSugarClient&nbsp;GetInstance()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;connection&nbsp;=&nbsp;SugarDao.ConnectionString;&nbsp;//这里可以动态根据cookies或session实现多库切换
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(connection);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注意：只有启动属性映射才可以使用SetMappingColumns
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableAttributeMapping&nbsp;=&nbsp;true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.SetMappingColumns(SugarConfigs.MpList);//设置关联列&nbsp;(引用地址赋值，每次赋值都只是存储一个内存地址)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;db;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p class="brush:c#;toolbar:false"><br/></p>', 23, 22, 0, N'别名列', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (27, N'<pre class="brush:delphi;toolbar:false">&nbsp;&nbsp;&nbsp;//通过属性的方法设置别名表和别名字段（主键和自添列都无需设置&nbsp;SQLSUGAR会帮你自动处理）
&nbsp;&nbsp;&nbsp;&nbsp;//注意:【属性映射和&nbsp;(SetMappingTables、SetMappingColumns)方式映射&nbsp;2种选其中一，不清楚底层缓存机质不建议同时使用】
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;AttributesMapping&nbsp;:&nbsp;IDemos
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;void&nbsp;Init()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;启动AttributesMapping.Init&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;DBManager.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//查询
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list&nbsp;=&nbsp;db.Queryable&lt;TestStudent&gt;()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.Where(it&nbsp;=&gt;&nbsp;it.className.Contains(&quot;小&quot;)).OrderBy(it&nbsp;=&gt;&nbsp;it.classSchoolId).Select&lt;V_Student&gt;(it&nbsp;=&gt;&nbsp;new&nbsp;V_Student()&nbsp;{&nbsp;id&nbsp;=&nbsp;it.classId,&nbsp;name&nbsp;=&nbsp;it.className&nbsp;}).ToList();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;list2&nbsp;=&nbsp;db.Queryable&lt;TestStudent&gt;()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.JoinTable&lt;TestSchool&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.classSchoolId&nbsp;==&nbsp;s2.classId)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.OrderBy&lt;TestSchool&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;s1.classId)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.Select&lt;TestStudent,&nbsp;TestSchool,&nbsp;V_Student&gt;((s1,&nbsp;s2)&nbsp;=&gt;&nbsp;new&nbsp;V_Student()&nbsp;{&nbsp;id&nbsp;=&nbsp;s1.classId,&nbsp;name&nbsp;=&nbsp;s1.className,&nbsp;SchoolName&nbsp;=&nbsp;s2.className&nbsp;}).ToList();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//添加
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TestStudent&nbsp;s&nbsp;=&nbsp;new&nbsp;TestStudent();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.className&nbsp;=&nbsp;&quot;属性名&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.classSchoolId&nbsp;=&nbsp;1;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;id&nbsp;=&nbsp;db.Insert(s);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.classId&nbsp;=&nbsp;id.ObjToInt();

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.SqlBulkCopy(new&nbsp;List&lt;TestStudent&gt;()&nbsp;{&nbsp;s&nbsp;});

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//更新
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.Update(s);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.Update&lt;TestStudent,&nbsp;int&gt;(s,&nbsp;100);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.Update&lt;TestStudent&gt;(s,&nbsp;it&nbsp;=&gt;&nbsp;it.classId&nbsp;==&nbsp;100);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.SqlBulkReplace(new&nbsp;List&lt;TestStudent&gt;()&nbsp;{&nbsp;s&nbsp;});
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//删除
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.Delete&lt;TestStudent&gt;(it&nbsp;=&gt;&nbsp;it.classId&nbsp;==&nbsp;100);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//根据实体赋值实体一定要有主键，并且要有值。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.Delete(new&nbsp;TestStudent()&nbsp;{&nbsp;&nbsp;classId&nbsp;=&nbsp;200&nbsp;});
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;属性只作为初始化映射，SetMappingTables和SetMappingColumns可以覆盖
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(TableName&nbsp;=&nbsp;&quot;Student&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;TestStudent
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(ColumnName&nbsp;=&nbsp;&quot;id&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;classId&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(ColumnName&nbsp;=&nbsp;&quot;name&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;string&nbsp;className&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(ColumnName&nbsp;=&nbsp;&quot;sch_id&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;classSchoolId&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;isOk&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;数据库并没有这一列
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;string&nbsp;errorField&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(TableName&nbsp;=&nbsp;&quot;School&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;TestSchool
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(ColumnName&nbsp;=&nbsp;&quot;id&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;classId&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SugarMapping(ColumnName&nbsp;=&nbsp;&quot;name&quot;)]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;string&nbsp;className&nbsp;{&nbsp;get;&nbsp;set;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;int&nbsp;AreaId&nbsp;=&nbsp;1;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;DBManager
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;SqlSugarClient&nbsp;GetInstance()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(SugarDao.ConnectionString);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableAttributeMapping&nbsp;=&nbsp;true;//启用属性映射
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsIgnoreErrorColumns&nbsp;=&nbsp;true;//忽略非数据库列
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableLogEvent&nbsp;=&nbsp;true;//启用日志事件
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.LogEventStarting&nbsp;=&nbsp;(sql,&nbsp;par)&nbsp;=&gt;&nbsp;{&nbsp;Console.WriteLine(sql&nbsp;+&nbsp;&quot;&nbsp;&quot;&nbsp;+&nbsp;par&nbsp;+&nbsp;&quot;\r\n&quot;);&nbsp;};

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;db;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p><br/></p>', 24, 22, 0, N'通过属性的方法设置别名表和别名字段', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (28, N'<p><strong><br/></strong></p><p><strong>生成实体文件</strong><br/></p><pre class="brush:c#;toolbar:false">//db.SetMappingTables(mappingTableList);&nbsp;可以结合别名表
db.ClassGenerating.CreateClassFiles(db,&nbsp;(&quot;e:/TestModels&quot;),&nbsp;&quot;Models&quot;);&nbsp;//Models是命名空间</pre><p><br/><strong>批量设置别名表,可以方便生成指定格式的实体对象</strong></p><pre class="brush:c#;toolbar:false">db.ClassGenerating.ForeachTables(db,&nbsp;tableName&nbsp;=&gt;
{
&nbsp;&nbsp;&nbsp;&nbsp;db.AddMappingTable(new&nbsp;KeyValue()&nbsp;{&nbsp;Key&nbsp;=&nbsp;&quot;Rename_&quot;+tableName,&nbsp;Value&nbsp;=&nbsp;&nbsp;tableName&nbsp;});
});//生成的文件都Rename_开头
db.ClassGenerating.CreateClassFiles(db,&nbsp;(&quot;e:/TestModels&quot;),&nbsp;&quot;Models&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;null,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;className&nbsp;=&gt;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//生成文件之后的回调
&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;tableName&nbsp;=&gt;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//生成文件之前的回调
});</pre><p><br/></p><p><br/><strong>只生成student和school表的实体</strong><br/></p><pre class="brush:c#;toolbar:false">db.ClassGenerating.CreateClassFilesByTableNames(db,&nbsp;&quot;e:/TestModels2&quot;,&nbsp;&quot;Models&quot;,&nbsp;new&nbsp;string[]&nbsp;{&nbsp;&quot;student&quot;,&nbsp;&quot;school&quot;&nbsp;});</pre><p><strong><br/></strong></p><p><strong>根据表名生成class字符串</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;str&nbsp;=&nbsp;db.ClassGenerating.TableNameToClass(db,&nbsp;&quot;Student&quot;);
var&nbsp;dynamicToClassStr&nbsp;=&nbsp;db.ClassGenerating.DynamicToClass(new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;},&nbsp;&quot;dyName&quot;);</pre><p><strong><br/></strong></p><p><strong>根据SQL语句生成class字符串</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;str2&nbsp;=&nbsp;db.ClassGenerating.SqlToClass(db,&nbsp;&quot;select&nbsp;top&nbsp;1&nbsp;*&nbsp;from&nbsp;Student&quot;,&nbsp;&quot;student&quot;);</pre><p><br/></p><p><strong>自定义格式</strong><br/></p><pre class="brush:c#;toolbar:false">var&nbsp;tempItem&nbsp;=&nbsp;ClassTemplate.ItemTemplate;//例如可以在生成的实体添加默认构造函数给指定的字段赋默认值或者公司信息等
var&nbsp;temp&nbsp;=&nbsp;ClassTemplate.Template;
var&nbsp;temSummary&nbsp;=&nbsp;ClassTemplate.ClassFieldSummaryTemplate;</pre><pre class="brush:c#;toolbar:false">ClassTemplate.Template&nbsp;=&nbsp;&quot;xxx....&quot;;
var&nbsp;str3&nbsp;=&nbsp;db.ClassGenerating.TableNameToClass(db,&nbsp;&quot;Student&quot;);</pre><p><br/></p><p><strong>结合T4T生成</strong></p><p><a href="http://www.cnblogs.com/sunkaixuan/p/5751503.html" target="_blank">http://www.cnblogs.com/sunkaixuan/p/5751503.html</a></p>', 25, 22, 0, N'生成实体', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (29, N'<pre class="brush:c#;toolbar:false">&nbsp;&nbsp;&nbsp;&nbsp;//日志记录功能
&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;Log&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;void&nbsp;Init()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;启动Log.Init&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarDemoDao.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;a1&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Where(it&nbsp;=&gt;&nbsp;it.id&nbsp;==&nbsp;1).ToList();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;a2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().OrderBy(it&nbsp;=&gt;&nbsp;it.id).ToList();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarConfigs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;Action&lt;string,&nbsp;string&gt;&nbsp;LogEventStarting&nbsp;=&nbsp;(sql,&nbsp;pars)&nbsp;=&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;starting:&quot;&nbsp;+&nbsp;sql&nbsp;+&nbsp;&quot;&nbsp;&quot;&nbsp;+&nbsp;pars);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using&nbsp;(var&nbsp;db&nbsp;=&nbsp;SugarDemoDao.GetInstance())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//日志记录件事件里面用到数据库操作&nbsp;IsEnableLogEvent一定要为false否则将引起死循环，并且要新开一个数据实例&nbsp;像我这样写就没问题。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableLogEvent&nbsp;=&nbsp;false;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.ExecuteCommand(&quot;select&nbsp;1&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;Action&lt;string,&nbsp;string&gt;&nbsp;LogEventCompleted&nbsp;=&nbsp;(sql,&nbsp;pars)&nbsp;=&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;completed:&quot;&nbsp;+&nbsp;sql&nbsp;+&nbsp;&quot;&nbsp;&quot;&nbsp;+&nbsp;pars);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;SqlSugar
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&lt;/summary&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;class&nbsp;SugarDemoDao
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;SqlSugarClient&nbsp;GetInstance()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;db&nbsp;=&nbsp;new&nbsp;SqlSugarClient(SugarDao.ConnectionString);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.IsEnableLogEvent&nbsp;=&nbsp;true;//启用日志事件
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.LogEventStarting&nbsp;=&nbsp;SugarConfigs.LogEventStarting;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db.LogEventCompleted&nbsp;=&nbsp;SugarConfigs.LogEventCompleted;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;db;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p><br/></p>', 26, 22, 0, N'Sql监听功能', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (30, N'<p><a style="color: rgb(192, 80, 77); font-size: 20px; text-decoration: underline;" href="http://www.cnblogs.com/sunkaixuan/p/5851425.html" target="_blank"><span style="color: rgb(192, 80, 77); font-size: 20px;">查看</span></a><br/></p>', 27, 22, 1, N'智能提示', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (31, N'<p>字符串部分支持 字典&nbsp; 匿名对象 和SqlParameter(<span style="font-size: 12px;">MYSQL就是 MySqlParameter</span>)</p><pre class="brush:c#;toolbar:false">&nbsp;&nbsp;var&nbsp;p1&nbsp;=&nbsp;db.GetDataTable(&quot;select&nbsp;*&nbsp;from&nbsp;student&nbsp;where&nbsp;id=@id&quot;,&nbsp;new&nbsp;{id=1&nbsp;});
&nbsp;&nbsp;
&nbsp;&nbsp;var&nbsp;p2&nbsp;=&nbsp;db.GetDataTable(&quot;select&nbsp;*&nbsp;from&nbsp;student&nbsp;where&nbsp;id=@id&quot;,&nbsp;
&nbsp;&nbsp;new&nbsp;Dictionary&lt;string,&nbsp;object&gt;()&nbsp;{&nbsp;{&nbsp;&quot;id&quot;,&nbsp;&quot;1&quot;&nbsp;}&nbsp;});//目前只支持&nbsp;Dictionary&lt;string,&nbsp;object&gt;和Dictionary&lt;string,&nbsp;string&gt;
&nbsp;&nbsp;
&nbsp;&nbsp;var&nbsp;p3&nbsp;=&nbsp;db.GetDataTable(&quot;select&nbsp;*&nbsp;from&nbsp;student&nbsp;where&nbsp;id=@id&quot;,&nbsp;new&nbsp;SqlParameter(&quot;@id&quot;,1)&nbsp;);</pre><p><br/></p>', 28, 22, 1, N'参数支持', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (32, N'<p>Queryable返回类型支持四种 List&lt;T&gt;&nbsp; Dynamic&nbsp;&nbsp; JsonString&nbsp; DataTable</p><pre class="brush:c#;toolbar:false">var&nbsp;student&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().ToList();
var&nbsp;studentDynamic&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().ToDynamic();
var&nbsp;studentJson&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().ToJson();
var&nbsp;studentTable&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().ToDataTable();</pre><p><br/></p><p>别外Select还可以这么使用</p><pre class="brush:c#;toolbar:false">var&nbsp;student&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Select&lt;int&gt;(it=&gt;it.id).ToList();
var&nbsp;student2&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Select&lt;string[]&gt;(&quot;*&quot;).ToList();
var&nbsp;student3&nbsp;=&nbsp;db.Queryable&lt;Student&gt;().Select&lt;Dictionary&lt;string,object&gt;&gt;(&quot;id,name&quot;).ToList();</pre><p><br/></p><p><a href="/Home/Doc?typeId=12" target="_self">更多Select用法 </a><br/></p>', 29, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (33, N'<p><br/><strong>多表查询</strong><br/></p><pre class="brush:c#;toolbar:false">List&lt;School&gt;&nbsp;dataList&nbsp;=&nbsp;db.Sqlable()
.From(&quot;school&quot;,&nbsp;&quot;s&quot;)
.Join(&quot;student&quot;,&nbsp;&quot;st&quot;,&nbsp;&quot;st.id&quot;,&nbsp;&quot;s.id&quot;,&nbsp;JoinType.INNER)
.Join(&quot;student&quot;,&nbsp;&quot;st2&quot;,&nbsp;&quot;st2.id&quot;,&nbsp;&quot;st.id&quot;,&nbsp;JoinType.LEFT)
.Where(&quot;s.id&gt;100&nbsp;and&nbsp;s.id&lt;@id&quot;)
.Where(&quot;1=1&quot;)//可以多个WHERE
.OrderBy(&quot;id&quot;)
.SelectToList&lt;School/*新的Model我这里没有所以写的School*/&gt;(&quot;st.*&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});</pre><p><strong>多表分页</strong></p><pre class="brush:c#;toolbar:false">List&lt;School&gt;&nbsp;dataPageList&nbsp;=&nbsp;db.Sqlable()
.From(&quot;school&quot;,&nbsp;&quot;s&quot;)
.Join(&quot;student&quot;,&nbsp;&quot;st&quot;,&nbsp;&quot;st.id&quot;,&nbsp;&quot;s.id&quot;,&nbsp;JoinType.INNER)
.Join(&quot;student&quot;,&nbsp;&quot;st2&quot;,&nbsp;&quot;st2.id&quot;,&nbsp;&quot;st.id&quot;,&nbsp;JoinType.LEFT)
.Where(&quot;s.id&gt;100&nbsp;and&nbsp;s.id&lt;100&quot;)
.SelectToPageList&lt;School&gt;(&quot;st.*&quot;,&nbsp;&quot;s.id&quot;,&nbsp;1,&nbsp;10);//多表分页WHERE加子查询
List&lt;School&gt;&nbsp;dataPageList2&nbsp;=&nbsp;db.Sqlable()
.From(&quot;school&quot;,&nbsp;&quot;s&quot;)
.Join(&quot;student&quot;,&nbsp;&quot;st&quot;,&nbsp;&quot;st.id&quot;,&nbsp;&quot;s.id&quot;,&nbsp;JoinType.INNER)
.Join(&quot;student&quot;,&nbsp;&quot;st2&quot;,&nbsp;&quot;st2.id&quot;,&nbsp;&quot;st.id&quot;,&nbsp;JoinType.LEFT)
.Where(&quot;s.id&gt;100&nbsp;and&nbsp;s.id&lt;100&nbsp;and&nbsp;s.id&nbsp;in&nbsp;(select&nbsp;1&nbsp;)&quot;&nbsp;/*这里面写子查询都可以*/)
.SelectToPageList&lt;School&gt;(&quot;st.*&quot;,&nbsp;&quot;s.id&quot;,&nbsp;1,&nbsp;10);</pre><p><br/></p><p><strong>转成List Dynmaic 或者 Json</strong></p><pre class="brush:c#;toolbar:false">//不分页
var&nbsp;list1&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToDynamic(&quot;*&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});
var&nbsp;list2&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToJson(&quot;*&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});
var&nbsp;list3&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToDataTable(&quot;*&quot;,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});
//分页
var&nbsp;list4&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToPageDynamic(&quot;s.*&quot;,&nbsp;&quot;l.id&quot;,&nbsp;1,&nbsp;10,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});
var&nbsp;list5&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToPageTable(&quot;s.*&quot;,&nbsp;&quot;l.id&quot;,&nbsp;1,&nbsp;10,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});
var&nbsp;list6&nbsp;=&nbsp;db.Sqlable().From(&quot;student&quot;,&nbsp;&quot;s&quot;).Join(&quot;school&quot;,&nbsp;&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&nbsp;and&nbsp;l.id=@id&quot;,&nbsp;JoinType.INNER).SelectToPageDynamic(&quot;s.*&quot;,&nbsp;&quot;l.id&quot;,&nbsp;1,&nbsp;10,&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;1&nbsp;});</pre><p><br/></p><p><strong>拼接</strong></p><pre class="brush:c#;toolbar:false">Sqlable&nbsp;sable&nbsp;=&nbsp;db.Sqlable().From&lt;Student&gt;(&quot;s&quot;).Join&lt;School&gt;(&quot;l&quot;,&nbsp;&quot;s.sch_id&quot;,&nbsp;&quot;l.id&quot;,&nbsp;JoinType.INNER);
string&nbsp;name&nbsp;=&nbsp;&quot;a&quot;;
int&nbsp;id&nbsp;=&nbsp;1;
if&nbsp;(!string.IsNullOrEmpty(name))
{
sable&nbsp;=&nbsp;sable.Where(&quot;s.name=@name&quot;);
}
if&nbsp;(!string.IsNullOrEmpty(name))
{
sable&nbsp;=&nbsp;sable.Where(&quot;s.id=@id&nbsp;or&nbsp;s.id=100&quot;);
}
if&nbsp;(id&nbsp;&gt;&nbsp;0)
{
sable&nbsp;=&nbsp;sable.Where(&quot;l.id&nbsp;in&nbsp;(select&nbsp;top&nbsp;10&nbsp;id&nbsp;from&nbsp;school)&quot;);//where加子查询
}
var&nbsp;pars&nbsp;=&nbsp;new&nbsp;{&nbsp;id&nbsp;=&nbsp;id,&nbsp;name&nbsp;=&nbsp;name&nbsp;};
int&nbsp;pageCount&nbsp;=&nbsp;sable.Count(pars);
var&nbsp;list7&nbsp;=&nbsp;sable.SelectToPageList&lt;Student&gt;(&quot;s.*&quot;,&nbsp;&quot;l.id&nbsp;desc&quot;,&nbsp;1,&nbsp;20,&nbsp;pars);</pre><p><br/></p>', 30, 22, 0, N'高级SQL拼接器', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (34, N'<p>123123131<br/></p>', 8, NULL, 0, N'123', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (35, N'<p>123123</p>', 7, NULL, 1, N'123123', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (36, N'<p>2231231</p>', 7, NULL, 1, N'X', NULL, NULL)
INSERT [dbo].[DocContent] ([Id], [Content], [TypeId], [Sort], [IsDeleted], [Title], [CreateTime], [Creator]) VALUES (37, N'<p>4234</p>', 7, NULL, 1, N'XXXXXXXXX2222', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocContent] OFF
SET IDENTITY_INSERT [dbo].[DocType] ON 

INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (1, N'SqlSugar', 0, 0, 0, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (2, N'入门', 1, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (3, N'查询', 2, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (4, N'插入', 3, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (5, N'更新', 4, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (6, N'删除', 5, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (7, N'框架说明1', 1, 2, 2, 1)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (8, N'连接数据库', 2, 2, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (9, N'应用功能', 1, 1, 1, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (10, N'单表查询总览', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (11, N'拉姆达与函数', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (12, N'查询结果映射到新类', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (13, N'拉姆达详解', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (14, N'动态拼接', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (15, N'基本用法', 20, 4, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (16, N'基本用法', 20, 5, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (17, N'基本用法', 20, 6, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (18, N'多库之间的差异', 20, 2, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (19, N'多表查询总览', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (20, N'SQL和存储过程', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (21, N'事务', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (22, N'别名表', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (23, N'别名列', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (24, N'属性方式设置别名', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (25, N'生成实体', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (26, N'SQL监听', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (27, N'智能提示', 20, 9, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (28, N'参数支持', 20, 2, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (29, N'反回类型', 20, 2, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (30, N'高级SQL拼接器', 20, 3, 2, 0)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (31, N'aaaa', NULL, 3, 2, 1)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (32, N'aaa', NULL, 3, 2, 1)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (33, N'131233', NULL, 4, 2, 1)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (34, N'12313x', NULL, 4, 2, 1)
INSERT [dbo].[DocType] ([Id], [TypeName], [Sort], [ParentId], [Level], [IsDeleted]) VALUES (35, N'aaa2', NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[DocType] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [UserName], [Password], [Email], [Avatar], [CreateTime], [IsDeleted], [RoleId], [NickName]) VALUES (1, N'admin', N'21232F297A57A5A743894A0E4A801FC3', NULL, NULL, NULL, NULL, 1, N'小杰')
INSERT [dbo].[UserInfo] ([Id], [UserName], [Password], [Email], [Avatar], [CreateTime], [IsDeleted], [RoleId], [NickName]) VALUES (2, N'610262374@qq.com', N'96E79218965EB72C92A549DD5A330112', NULL, NULL, NULL, NULL, 2, N'小杰小号')
INSERT [dbo].[UserInfo] ([Id], [UserName], [Password], [Email], [Avatar], [CreateTime], [IsDeleted], [RoleId], [NickName]) VALUES (3, N'6102623741@qq.com', N'96E79218965EB72C92A549DD5A330112', NULL, NULL, NULL, NULL, 2, N'1111')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[VerifyCode] ON 

INSERT [dbo].[VerifyCode] ([Id], [Problem], [Answer], [IsDeleted]) VALUES (1, N'作者QQ是多少', N'610262374', NULL)
INSERT [dbo].[VerifyCode] ([Id], [Problem], [Answer], [IsDeleted]) VALUES (2, N'SqlSugar群号是多少', N'225982985', NULL)
INSERT [dbo].[VerifyCode] ([Id], [Problem], [Answer], [IsDeleted]) VALUES (3, N'作者叫什么', N'孙凯旋', NULL)
SET IDENTITY_INSERT [dbo].[VerifyCode] OFF
/****** Object:  Index [PK_dnt_test_topics]    Script Date: 2016/11/30 4:13:45 ******/
ALTER TABLE [dbo].[BBS_Topics] ADD  CONSTRAINT [PK_dnt_test_topics] PRIMARY KEY NONCLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BBS_Topictypes] ADD  CONSTRAINT [DF_dnt_test_topictypes_displayorder]  DEFAULT ((0)) FOR [Displayorder]
GO
ALTER TABLE [dbo].[BBS_Topictypes] ADD  CONSTRAINT [DF_dnt_test_topictypes_name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[BBS_Topictypes] ADD  CONSTRAINT [DF_dnt_test_topictypes_description]  DEFAULT ('') FOR [Description]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1处理中 2已解决' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionContent', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionContent', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
USE [master]
GO
ALTER DATABASE [SugarSite] SET  READ_WRITE 
GO
USE SugarSite
go
Create View V_BBS_Posts
AS
select p.*,u.Avatar from BBS_Posts  p
inner join [dbo].[UserInfo]  u on p.Posterid=u.Id
GO