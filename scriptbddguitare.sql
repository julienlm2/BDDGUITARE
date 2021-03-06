USE [master]
GO
/****** Object:  Database [Guitare]    Script Date: 16/04/2021 11:56:47 ******/
CREATE DATABASE [Guitare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Guitare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Guitare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Guitare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Guitare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Guitare] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Guitare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Guitare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Guitare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Guitare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Guitare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Guitare] SET ARITHABORT OFF 
GO
ALTER DATABASE [Guitare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Guitare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Guitare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Guitare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Guitare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Guitare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Guitare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Guitare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Guitare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Guitare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Guitare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Guitare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Guitare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Guitare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Guitare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Guitare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Guitare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Guitare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Guitare] SET  MULTI_USER 
GO
ALTER DATABASE [Guitare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Guitare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Guitare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Guitare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Guitare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Guitare] SET QUERY_STORE = OFF
GO
USE [Guitare]
GO
/****** Object:  User [IIS APPPOOL\GuitareCustom]    Script Date: 16/04/2021 11:56:47 ******/
CREATE USER [IIS APPPOOL\GuitareCustom] FOR LOGIN [IIS APPPOOL\GuitareCustom] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\GuitareCustom]
GO
/****** Object:  Table [dbo].[Bois]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bois](
	[idBois] [int] IDENTITY(1,1) NOT NULL,
	[NomBois] [varchar](50) NULL,
	[OrigineBois] [varchar](50) NULL,
 CONSTRAINT [PK__Bois__D80296ED2766609A] PRIMARY KEY CLUSTERED 
(
	[idBois] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[idClient] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[telephone] [varchar](50) NULL,
 CONSTRAINT [PK__Client__A6A610D486FDDA0C] PRIMARY KEY CLUSTERED 
(
	[idClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtatCommande](
	[idEtatCommande] [int] IDENTITY(1,1) NOT NULL,
	[libelleetatcommande] [varchar](50) NULL,
 CONSTRAINT [PK__EtatComm__51E6CC1AD133947E] PRIMARY KEY CLUSTERED 
(
	[idEtatCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guitare]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guitare](
	[idGuitare] [int] IDENTITY(1,1) NOT NULL,
	[dateCommande] [datetime] NULL,
	[idEtatCommande] [int] NOT NULL,
	[idMicro] [int] NULL,
	[idMicro_1] [int] NULL,
	[idBois] [int] NOT NULL,
	[idBois_1] [int] NOT NULL,
	[idClient] [int] NULL,
	[idBois_2] [int] NOT NULL,
	[idVibrato] [int] NOT NULL,
	[idMicro_2] [int] NOT NULL,
 CONSTRAINT [PK__Guitare__BAC5E7DA8FD53490] PRIMARY KEY CLUSTERED 
(
	[idGuitare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Micro]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Micro](
	[idMicro] [int] IDENTITY(1,1) NOT NULL,
	[NomMicro] [varchar](50) NULL,
	[marque] [varchar](50) NULL,
 CONSTRAINT [PK__Micro__C22747C52907F73D] PRIMARY KEY CLUSTERED 
(
	[idMicro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vibrato]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vibrato](
	[idVibrato] [int] IDENTITY(1,1) NOT NULL,
	[nomVibrato] [varchar](50) NULL,
	[marqueVibrato] [varchar](50) NULL,
 CONSTRAINT [PK__Vibrato__79E49031F325ECF1] PRIMARY KEY CLUSTERED 
(
	[idVibrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois___44FF419A] FOREIGN KEY([idBois_1])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois___44FF419A]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois___46E78A0C] FOREIGN KEY([idBois_2])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois___46E78A0C]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois__440B1D61] FOREIGN KEY([idBois])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois__440B1D61]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idClien__45F365D3] FOREIGN KEY([idClient])
REFERENCES [dbo].[Client] ([idClient])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idClien__45F365D3]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idEtatC__412EB0B6] FOREIGN KEY([idEtatCommande])
REFERENCES [dbo].[EtatCommande] ([idEtatCommande])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idEtatC__412EB0B6]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idMicro__48CFD27E] FOREIGN KEY([idMicro_2])
REFERENCES [dbo].[Micro] ([idMicro])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idMicro__48CFD27E]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idVibra__47DBAE45] FOREIGN KEY([idVibrato])
REFERENCES [dbo].[Vibrato] ([idVibrato])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idVibra__47DBAE45]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK_Guitare_Micro] FOREIGN KEY([idMicro_1])
REFERENCES [dbo].[Micro] ([idMicro])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK_Guitare_Micro]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK_Guitare_Micro1] FOREIGN KEY([idMicro])
REFERENCES [dbo].[Micro] ([idMicro])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK_Guitare_Micro1]
GO
/****** Object:  StoredProcedure [dbo].[Add_Client]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Client](@Nom as varchar(50), @Adresse as varchar(50),@Telephone as Varchar(50))
as begin
insert into Client(Nom,Adresse,telephone) 
Values(@Nom,@Adresse,@Telephone);
end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Guitare]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Add_Guitare](@Micro_neck as int,@Micro_Bridge as int, @MicroCentrale as int,
@Bois_Manche as int, @Bois_Touche as int, @Bois_Corps as int, @Id_Client as int, @Vibrato as int)
as begin
insert into Guitare(dateCommande,idMicro,idMicro_1,idMicro_2,idBois,idBois_1,idBois_2,idClient,idVibrato,idEtatCommande)
Values (GETDATE(),@Micro_neck,@Micro_Bridge, @MicroCentrale,
@Bois_Manche, @Bois_Touche, @Bois_Corps, @Id_Client, @Vibrato,1)
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Bois]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Bois] 
as begin 
SELECT NomBois
From Bois
end;
GO
/****** Object:  StoredProcedure [dbo].[get_bois_by_id]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_bois_by_id](@id_bois as int)
as begin 
select *
from Bois
WHERE idBois = @id_bois;
END; 
GO
/****** Object:  StoredProcedure [dbo].[Get_Etat_Commande]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Etat_Commande]
as begin 
SELECT libelleetatcommande
From EtatCommande
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Guitare]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_Guitare]

as begin 

SELECT  Client.Nom, Client.telephone,Guitare.idBois,Guitare.idBois_1,Guitare.idBois_2,Guitare.idMicro,Guitare.idMicro_1,Guitare.idMicro_2,
Vibrato.nomVibrato,EtatCommande.libelleetatcommande AS Etat_Commande

From Guitare, Vibrato,EtatCommande, Client

WHERE
	Guitare.idClient = Client.idClient
and Guitare.idEtatCommande = EtatCommande.idEtatCommande
and guitare.idVibrato = Vibrato.idVibrato

end;
GO
/****** Object:  StoredProcedure [dbo].[GET_GUITARE_BY_ID_CLIENT]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GET_GUITARE_BY_ID_CLIENT](@idClient as int)

as begin 
SELECT  Client.Nom, Client.telephone,Guitare.idBois,Guitare.idBois_1,Guitare.idBois_2,Guitare.idMicro,Guitare.idMicro_1,Guitare.idMicro_2,
Vibrato.nomVibrato,EtatCommande.libelleetatcommande AS Etat_Commande

From Guitare, Vibrato,EtatCommande, Client

WHERE
	Guitare.idClient = Client.idClient
and Guitare.idEtatCommande = EtatCommande.idEtatCommande
and guitare.idVibrato = Vibrato.idVibrato
and Guitare.idClient = @idClient

end;
GO
/****** Object:  StoredProcedure [dbo].[Get_id_Bois_by_Name]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_id_Bois_by_Name](@NomBois as varchar(50))
as begin
Select idBois
From Bois
Where NomBois = @NomBois
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_id_client_by_name]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_id_client_by_name](@Nom as varchar(50))
as begin 
Select idClient
From Client
Where Nom = @Nom
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_id_micro_by_Name]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_id_micro_by_Name](@NomMicro as varchar(50))
as begin
Select idMicro
From micro
Where NomMicro = @NomMicro
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_id_Vibrato_by_Name]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_id_Vibrato_by_Name](@Vibrato as varchar(50))
as begin
Select idVibrato
From Vibrato
Where nomVibrato = @Vibrato
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Micro]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Micro]
as begin 
SELECT NomMicro
From Micro
end;
GO
/****** Object:  StoredProcedure [dbo].[get_micro_by_id]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_micro_by_id](@id_micro as int)
as begin 
select *
from Micro
WHERE idMicro = @id_micro;
END; 
GO
/****** Object:  StoredProcedure [dbo].[Get_Vibrato]    Script Date: 16/04/2021 11:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Vibrato]
as begin 
SELECT nomVibrato
From Vibrato
end;
GO
USE [master]
GO
ALTER DATABASE [Guitare] SET  READ_WRITE 
GO
