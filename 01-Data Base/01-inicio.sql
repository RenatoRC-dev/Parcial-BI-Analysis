USE [master]
GO
-- Ingeniero tiene que borrar la base de datos normal que tiene ya que la bd de mi grupo aunmento 2 tablas para el proyecto de DW
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'BancoDB')
BEGIN
    ALTER DATABASE [BancoDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Echa a cualquiera que esté conectado
    DROP DATABASE [BancoDB];
END
GO
/****** Object:  Database [BancoDB]    Script Date: 1/12/2025 20:20:17 ******/
CREATE DATABASE [BancoDB]
GO
ALTER DATABASE [BancoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BancoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BancoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BancoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BancoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BancoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BancoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BancoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BancoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BancoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BancoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BancoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BancoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BancoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BancoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BancoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BancoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BancoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BancoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BancoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BancoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BancoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BancoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BancoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BancoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BancoDB] SET  MULTI_USER 
GO
ALTER DATABASE [BancoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BancoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BancoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BancoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BancoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BancoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BancoDB', N'ON'
GO
ALTER DATABASE [BancoDB] SET QUERY_STORE = OFF
GO
USE [BancoDB]
GO
/****** Object:  Schema [canales]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [canales]
GO
/****** Object:  Schema [contabilidad]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [contabilidad]
GO
/****** Object:  Schema [cumplimiento]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [cumplimiento]
GO
/****** Object:  Schema [depositos]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [depositos]
GO
/****** Object:  Schema [nucleo]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [nucleo]
GO
/****** Object:  Schema [operaciones]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [operaciones]
GO
/****** Object:  Schema [pagos]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [pagos]
GO
/****** Object:  Schema [prestamos]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [prestamos]
GO
/****** Object:  Schema [referencial]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [referencial]
GO
/****** Object:  Schema [relaciones]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [relaciones]
GO
/****** Object:  Schema [reportes]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [reportes]
GO
/****** Object:  Schema [riesgo]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [riesgo]
GO
/****** Object:  Schema [seguridad]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [seguridad]
GO
/****** Object:  Schema [tarifas]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [tarifas]
GO
/****** Object:  Schema [tarjetas]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [tarjetas]
GO
/****** Object:  Schema [tesoreria]    Script Date: 1/12/2025 20:20:17 ******/
CREATE SCHEMA [tesoreria]
GO
/****** Object:  Table [riesgo].[ScoreCliente]    Script Date: 1/12/2025 20:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[ScoreCliente](
	[ScoreClienteId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[FechaCalculo] [datetime2](3) NOT NULL,
	[Metodo] [nvarchar](64) NULL,
	[VersionModelo] [nvarchar](32) NULL,
	[Score] [int] NOT NULL,
	[Rating] [nvarchar](10) NULL,
	[Fuente] [nvarchar](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
	[MetodoNN]  AS (isnull([Metodo],N'')) PERSISTED NOT NULL,
	[VersionModeloNN]  AS (isnull([VersionModelo],N'')) PERSISTED NOT NULL,
 CONSTRAINT [PK_ScoreCliente] PRIMARY KEY CLUSTERED 
(
	[ScoreClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [riesgo].[vwScoreClienteUltimo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [riesgo].[vwScoreClienteUltimo]
AS
SELECT sc.*
FROM riesgo.ScoreCliente sc
WHERE sc.ScoreClienteId = (
    SELECT TOP (1) sc2.ScoreClienteId
    FROM riesgo.ScoreCliente sc2
    WHERE sc2.ClienteId = sc.ClienteId AND sc2.Estado = 1
    ORDER BY sc2.FechaCalculo DESC, sc2.ScoreClienteId DESC
);
GO
/****** Object:  Table [canales].[Canal]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[Canal](
	[CanalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[Nombre] [nvarchar](64) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsCanal] PRIMARY KEY CLUSTERED 
(
	[CanalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[CodigoOtp]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[CodigoOtp](
	[OtpCodigoId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[CanalCodigo] [nvarchar](16) NOT NULL,
	[Codigo] [nvarchar](8) NOT NULL,
	[ExpiraEn] [datetime2](3) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsOtpCodigo] PRIMARY KEY CLUSTERED 
(
	[OtpCodigoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[Consentimiento]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[Consentimiento](
	[ConsentimientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NULL,
	[TipoConsentimiento] [nvarchar](32) NOT NULL,
	[OtorgadoEn] [datetime2](3) NOT NULL,
	[RevocadoEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsConsentimiento] PRIMARY KEY CLUSTERED 
(
	[ConsentimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[Dispositivo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[Dispositivo](
	[DispositivoId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NULL,
	[Plataforma] [nvarchar](16) NOT NULL,
	[TokenDispositivo] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsDispositivo] PRIMARY KEY CLUSTERED 
(
	[DispositivoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[EventoWebhook]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[EventoWebhook](
	[WebhookEventId] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriptionId] [bigint] NULL,
	[NombreEvento] [nvarchar](64) NOT NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[EntregadoEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsWebhookEvent] PRIMARY KEY CLUSTERED 
(
	[WebhookEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [canales].[IntentoIngreso]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[IntentoIngreso](
	[LoginAttemptId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NULL,
	[UsuarioNombre] [nvarchar](64) NULL,
	[Exito] [bit] NOT NULL,
	[IntentadoEn] [datetime2](3) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsLoginAttempt] PRIMARY KEY CLUSTERED 
(
	[LoginAttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[Notificacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[Notificacion](
	[NotificacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NULL,
	[CanalCodigo] [nvarchar](16) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Body] [nvarchar](512) NOT NULL,
	[SentEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsNotificacion] PRIMARY KEY CLUSTERED 
(
	[NotificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[PreferenciaNotificacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[PreferenciaNotificacion](
	[NotificacionPreferenceId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[CanalCodigo] [nvarchar](16) NOT NULL,
	[Habilitado] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsNotificacionPreference] PRIMARY KEY CLUSTERED 
(
	[NotificacionPreferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [canales].[SuscripcionWebhook]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [canales].[SuscripcionWebhook](
	[WebhookSubscriptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[TargetUrl] [nvarchar](512) NOT NULL,
	[NombreEvento] [nvarchar](64) NOT NULL,
	[Secret] [nvarchar](128) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [channelsWebhookSubscription] PRIMARY KEY CLUSTERED 
(
	[WebhookSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[Asiento]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[Asiento](
	[DiarioEntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[PostingBatchId] [bigint] NOT NULL,
	[EntryFecha] [date] NOT NULL,
	[Reference] [nvarchar](64) NULL,
	[Descripcion] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerDiarioEntry] PRIMARY KEY CLUSTERED 
(
	[DiarioEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[BalancePruebaCorte]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[BalancePruebaCorte](
	[TrialSaldoInstantaneaId] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaCorte] [date] NOT NULL,
	[GLCuentaId] [bigint] NOT NULL,
	[Saldo] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerTrialSaldoInstantanea] PRIMARY KEY CLUSTERED 
(
	[TrialSaldoInstantaneaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[CentroCosto]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[CentroCosto](
	[CostCenterId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerCostCenter] PRIMARY KEY CLUSTERED 
(
	[CostCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[Conciliacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[Conciliacion](
	[ConciliacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[FechaCorte] [date] NOT NULL,
	[SaldoEstado] [decimal](19, 4) NOT NULL,
	[SaldoLibro] [decimal](19, 4) NOT NULL,
	[Diferencia]  AS ([SaldoEstado]-[SaldoLibro]) PERSISTED,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerConciliacion] PRIMARY KEY CLUSTERED 
(
	[ConciliacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[CuentaContable]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[CuentaContable](
	[GLCuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[ParentId] [bigint] NULL,
	[MonedaId] [bigint] NULL,
	[IsLeaf] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerGLCuenta] PRIMARY KEY CLUSTERED 
(
	[GLCuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[Diario]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[Diario](
	[DiarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[IsOpen] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerDiario] PRIMARY KEY CLUSTERED 
(
	[DiarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[LineaAsiento]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[LineaAsiento](
	[DiarioEntryLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[DiarioEntryId] [bigint] NOT NULL,
	[GLCuentaId] [bigint] NOT NULL,
	[CostCenterId] [bigint] NULL,
	[MonedaId] [bigint] NULL,
	[Debito] [decimal](19, 4) NOT NULL,
	[Credito] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerDiarioEntryLine] PRIMARY KEY CLUSTERED 
(
	[DiarioEntryLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[LoteAsiento]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[LoteAsiento](
	[PostingBatchId] [bigint] IDENTITY(1,1) NOT NULL,
	[DiarioId] [bigint] NOT NULL,
	[BatchFecha] [date] NOT NULL,
	[PostedEn] [datetime2](3) NULL,
	[PostedBy] [nvarchar](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerPostingBatch] PRIMARY KEY CLUSTERED 
(
	[PostingBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[PeriodoCierre]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[PeriodoCierre](
	[ClosingPeriodId] [bigint] IDENTITY(1,1) NOT NULL,
	[Anio] [smallint] NOT NULL,
	[Mes] [tinyint] NOT NULL,
	[CerradoEn] [datetime2](3) NULL,
	[ClosedBy] [nvarchar](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerClosingPeriod] PRIMARY KEY CLUSTERED 
(
	[ClosingPeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contabilidad].[ReglaContable]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contabilidad].[ReglaContable](
	[ContableRuleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[DefinitionJson] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [ledgerContableRule] PRIMARY KEY CLUSTERED 
(
	[ContableRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[AlertaTransaccion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[AlertaTransaccion](
	[TransactionAlertaId] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleId] [bigint] NOT NULL,
	[CuentaId] [bigint] NULL,
	[LevantadaEn] [datetime2](3) NOT NULL,
	[Severidad] [nvarchar](8) NOT NULL,
	[Message] [nvarchar](512) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [complianceTransactionAlerta] PRIMARY KEY CLUSTERED 
(
	[TransactionAlertaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[DocumentoKYC]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[DocumentoKYC](
	[KYCDocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[DocumentTypeId] [bigint] NOT NULL,
	[DocumentNumero] [nvarchar](64) NOT NULL,
	[PaisEmisionId] [bigint] NULL,
	[FechaExpiracion] [date] NULL,
	[HashArchivo] [varbinary](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [complianceKYCDocument] PRIMARY KEY CLUSTERED 
(
	[KYCDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[EntradaPEP]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[EntradaPEP](
	[PEPListEntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](256) NOT NULL,
	[PaisId] [bigint] NULL,
	[Rol] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [compliancePEPListEntry] PRIMARY KEY CLUSTERED 
(
	[PEPListEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[PerfilKYC]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[PerfilKYC](
	[KYCProfileId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[RiskGradeId] [bigint] NULL,
	[ReviewedEn] [datetime2](3) NULL,
	[Reviewer] [nvarchar](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [complianceKYCProfile] PRIMARY KEY CLUSTERED 
(
	[KYCProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[ReglaMonitoreoTransacciones]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[ReglaMonitoreoTransacciones](
	[TransactionMonitoringRuleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[DefinitionJson] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [complianceTransactionMonitoringRule] PRIMARY KEY CLUSTERED 
(
	[TransactionMonitoringRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[ResultadoScreening]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[ResultadoScreening](
	[ScreeningResultadoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[ScreenedEn] [datetime2](3) NOT NULL,
	[Proveedor] [nvarchar](64) NOT NULL,
	[Resultado] [nvarchar](16) NOT NULL,
	[Detalles] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [complianceScreeningResultado] PRIMARY KEY CLUSTERED 
(
	[ScreeningResultadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cumplimiento].[ROS]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cumplimiento].[ROS](
	[ROSId] [bigint] IDENTITY(1,1) NOT NULL,
	[AMLCaseId] [bigint] NOT NULL,
	[PresentadoEn] [datetime2](3) NOT NULL,
	[RefReporte] [nvarchar](64) NOT NULL,
	[DatosReporte] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [compliance] PRIMARY KEY CLUSTERED 
(
	[ROSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [depositos].[AbonoInteres]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[AbonoInteres](
	[InteresPostingId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[FechaAbono] [date] NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsInteresPosting] PRIMARY KEY CLUSTERED 
(
	[InteresPostingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[CuentaDeposito]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[CuentaDeposito](
	[DepositCuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[LimiteSobregiro] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsDepositCuenta] PRIMARY KEY CLUSTERED 
(
	[DepositCuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[DevengoInteres]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[DevengoInteres](
	[InteresAccrualId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[FechaDevengo] [date] NOT NULL,
	[MontoDevengado] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsInteresAccrual] PRIMARY KEY CLUSTERED 
(
	[InteresAccrualId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[OperacionDeposito]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[OperacionDeposito](
	[DepositOperationId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[FechaHoraDeposito] [datetime2](3) NOT NULL,
	[MontoDepositado] [decimal](19, 4) NOT NULL,
	[SucursalId] [bigint] NULL,
	[Canal] [nvarchar](16) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [PK_OperacionDeposito] PRIMARY KEY CLUSTERED 
(
	[DepositOperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[ProductoDeposito]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[ProductoDeposito](
	[DepositProductoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[SaldoMinimo] [decimal](19, 4) NOT NULL,
	[MetodoCalculoInteres] [nvarchar](16) NOT NULL,
	[PermiteSobregiro] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsDepositProducto] PRIMARY KEY CLUSTERED 
(
	[DepositProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[ReglaRetencion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[ReglaRetencion](
	[RetencionImpuestoRuleId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaisId] [bigint] NOT NULL,
	[Tasa] [decimal](9, 6) NOT NULL,
	[VigenteDesde] [date] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsRetencionImpuestoRule] PRIMARY KEY CLUSTERED 
(
	[RetencionImpuestoRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [depositos].[TasaInteres]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [depositos].[TasaInteres](
	[InteresTasaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[VigenteDesde] [date] NOT NULL,
	[NominalTasa] [decimal](9, 6) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [depositsInteresTasa] PRIMARY KEY CLUSTERED 
(
	[InteresTasaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Cliente]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Cliente](
	[ClienteId] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoCliente] [nvarchar](16) NOT NULL,
	[PersonaId] [bigint] NULL,
	[OrganizacionId] [bigint] NULL,
	[RiskGradeId] [bigint] NULL,
	[EstadoKYC] [nvarchar](16) NOT NULL,
	[AltaEn] [datetime2](3) NULL,
	[SucursalPrincipalId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreCliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Cuenta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Cuenta](
	[CuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[NumeroCuenta] [nvarchar](34) NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[AbiertoEn] [datetime2](3) NOT NULL,
	[CerradoEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreCuenta] PRIMARY KEY CLUSTERED 
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[DireccionCliente]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[DireccionCliente](
	[ClienteDireccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[TipoDireccion] [nvarchar](16) NOT NULL,
	[Linea1] [nvarchar](200) NOT NULL,
	[Linea2] [nvarchar](200) NULL,
	[CiudadId] [bigint] NULL,
	[CodigoPostal] [nvarchar](16) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreClienteDireccion] PRIMARY KEY CLUSTERED 
(
	[ClienteDireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Empleado]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Empleado](
	[EmpleadoId] [bigint] IDENTITY(1,1) NOT NULL,
	[SucursalId] [bigint] NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Correo] [nvarchar](200) NULL,
	[Telefono] [nvarchar](40) NULL,
	[FechaContratacion] [date] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreEmpleado] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[HistorialEstadoCuenta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[HistorialEstadoCuenta](
	[CuentaEstadoHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[DesdeEstado] [nvarchar](16) NOT NULL,
	[HastaEstado] [nvarchar](16) NOT NULL,
	[CambiadoEn] [datetime2](3) NOT NULL,
	[ChangedBy] [nvarchar](64) NULL,
	[Motivo] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreCuentaEstadoHistory] PRIMARY KEY CLUSTERED 
(
	[CuentaEstadoHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Organizacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Organizacion](
	[OrganizacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [nvarchar](200) NOT NULL,
	[NombreComercial] [nvarchar](200) NULL,
	[NIT] [nvarchar](32) NULL,
	[IndustriaId] [bigint] NULL,
	[PaisId] [bigint] NULL,
	[FechaRegistro] [date] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreOrganizacion] PRIMARY KEY CLUSTERED 
(
	[OrganizacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Persona]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Persona](
	[PersonaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[SegundoNombre] [nvarchar](100) NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Genero] [char](1) NULL,
	[NacionalidadPaisId] [bigint] NULL,
	[IdNacional] [nvarchar](50) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [corePersona] PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Producto]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Producto](
	[ProductoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Categoria] [nvarchar](32) NOT NULL,
	[MonedaId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreProducto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[ProductoParametro]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[ProductoParametro](
	[ProductoParametroId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[ParamNombre] [nvarchar](64) NOT NULL,
	[ParamValue] [nvarchar](256) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreProductoParametro] PRIMARY KEY CLUSTERED 
(
	[ProductoParametroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Relacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Relacion](
	[RelacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[RelacionadoClienteId] [bigint] NOT NULL,
	[RelationType] [nvarchar](32) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreRelacion] PRIMARY KEY CLUSTERED 
(
	[RelacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[SaldoCuenta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[SaldoCuenta](
	[CuentaSaldoId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[FechaCorte] [date] NOT NULL,
	[Disponible] [decimal](19, 4) NOT NULL,
	[Contable] [decimal](19, 4) NOT NULL,
	[RetencionMonto] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreCuentaSaldo] PRIMARY KEY CLUSTERED 
(
	[CuentaSaldoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[Sucursal]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[Sucursal](
	[SucursalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[CiudadId] [bigint] NULL,
	[DireccionLinea1] [nvarchar](200) NULL,
	[DireccionLinea2] [nvarchar](200) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreSucursal] PRIMARY KEY CLUSTERED 
(
	[SucursalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[TelefonoCliente]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[TelefonoCliente](
	[ClienteTelefonoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[TipoTelefono] [nvarchar](16) NOT NULL,
	[TelefonoNumero] [nvarchar](40) NOT NULL,
	[EsPrincipal] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreClienteTelefono] PRIMARY KEY CLUSTERED 
(
	[ClienteTelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nucleo].[TitularCuenta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nucleo].[TitularCuenta](
	[CuentaTitularId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[RolTitular] [nvarchar](16) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [coreCuentaTitular] PRIMARY KEY CLUSTERED 
(
	[CuentaTitularId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [operaciones].[ImportacionArchivo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operaciones].[ImportacionArchivo](
	[FileImportId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileNombre] [nvarchar](256) NOT NULL,
	[ImportedEn] [datetime2](3) NOT NULL,
	[FilasImportadas] [int] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [opsFileImport] PRIMARY KEY CLUSTERED 
(
	[FileImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [operaciones].[MensajeIntegracion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operaciones].[MensajeIntegracion](
	[IntegrationMessageId] [bigint] IDENTITY(1,1) NOT NULL,
	[EndpointId] [bigint] NOT NULL,
	[Direction] [nvarchar](8) NOT NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[SentEn] [datetime2](3) NULL,
	[ReceivedEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [opsIntegrationMessage] PRIMARY KEY CLUSTERED 
(
	[IntegrationMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [operaciones].[ProblemaCalidadDatos]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operaciones].[ProblemaCalidadDatos](
	[DataQualityIssueId] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreEntidad] [nvarchar](128) NOT NULL,
	[EntidadId] [bigint] NULL,
	[EncontradoEn] [datetime2](3) NOT NULL,
	[Severidad] [nvarchar](8) NOT NULL,
	[Descripcion] [nvarchar](512) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [opsDataQualityIssue] PRIMARY KEY CLUSTERED 
(
	[DataQualityIssueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [operaciones].[PuntoIntegracion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operaciones].[PuntoIntegracion](
	[IntegrationEndpointId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[EndpointUrl] [nvarchar](512) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [opsIntegrationEndpoint] PRIMARY KEY CLUSTERED 
(
	[IntegrationEndpointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [operaciones].[TareaLote]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operaciones].[TareaLote](
	[BatchJobId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[CronExpresion] [nvarchar](64) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [opsBatchJob] PRIMARY KEY CLUSTERED 
(
	[BatchJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pagos].[Beneficiario]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[Beneficiario](
	[BeneficiarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[NombreBanco] [nvarchar](200) NULL,
	[NumeroCuenta] [nvarchar](34) NULL,
	[SwiftBic] [nvarchar](16) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsBeneficiario] PRIMARY KEY CLUSTERED 
(
	[BeneficiarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pagos].[HistorialEstadoPago]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[HistorialEstadoPago](
	[PaymentEstadoHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentOrderId] [bigint] NOT NULL,
	[DesdeEstado] [nvarchar](16) NOT NULL,
	[HastaEstado] [nvarchar](16) NOT NULL,
	[CambiadoEn] [datetime2](3) NOT NULL,
	[Motivo] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsPaymentEstadoHistory] PRIMARY KEY CLUSTERED 
(
	[PaymentEstadoHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pagos].[InstruccionPago]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[InstruccionPago](
	[PaymentInstructionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentOrderId] [bigint] NOT NULL,
	[Canal] [nvarchar](16) NOT NULL,
	[InstructionData] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsPaymentInstruction] PRIMARY KEY CLUSTERED 
(
	[PaymentInstructionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [pagos].[MandatoDebitoDirecto]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[MandatoDebitoDirecto](
	[DirectDebitoMandateId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[CreditorNombre] [nvarchar](200) NOT NULL,
	[IBAN] [nvarchar](34) NULL,
	[FirmadoEn] [date] NOT NULL,
	[RevocadoEn] [date] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsDirectDebitoMandate] PRIMARY KEY CLUSTERED 
(
	[DirectDebitoMandateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pagos].[MensajePago]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[MensajePago](
	[PaymentMessageId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentOrderId] [bigint] NOT NULL,
	[Estandar] [nvarchar](16) NOT NULL,
	[TipoMensaje] [nvarchar](16) NOT NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsPaymentMessage] PRIMARY KEY CLUSTERED 
(
	[PaymentMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [pagos].[OrdenPermanente]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[OrdenPermanente](
	[StandingOrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaOrigenId] [bigint] NOT NULL,
	[BeneficiarioId] [bigint] NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[CronExpresion] [nvarchar](64) NOT NULL,
	[VigenteDesde] [date] NOT NULL,
	[VigenteHasta] [date] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsStandingOrder] PRIMARY KEY CLUSTERED 
(
	[StandingOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pagos].[Transferencia]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pagos].[Transferencia](
	[TransferenciaId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentOrderId] [bigint] NOT NULL,
	[EjecutadoEn] [datetime2](3) NULL,
	[ReferenciaTxn] [nvarchar](64) NULL,
	[MontoComision] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [paymentsTransferencia] PRIMARY KEY CLUSTERED 
(
	[TransferenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[CasoCobranza]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[CasoCobranza](
	[CollectionCaseId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoanCuentaId] [bigint] NOT NULL,
	[AbiertoEn] [datetime2](3) NOT NULL,
	[CerradoEn] [datetime2](3) NULL,
	[EstadoNote] [nvarchar](512) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansCollectionCase] PRIMARY KEY CLUSTERED 
(
	[CollectionCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[Cronograma]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[Cronograma](
	[AmortizationScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoanCuentaId] [bigint] NOT NULL,
	[NumeroCuota] [int] NOT NULL,
	[FechaVencimientoCuota] [date] NOT NULL,
	[CapitalVencido] [decimal](19, 4) NOT NULL,
	[InteresVencido] [decimal](19, 4) NOT NULL,
	[CargosVencidos] [decimal](19, 4) NOT NULL,
	[MontoPagado] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansAmortizationSchedule] PRIMARY KEY CLUSTERED 
(
	[AmortizationScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[CuentaPrestamo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[CuentaPrestamo](
	[LoanCuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[MontoPrincipal] [decimal](19, 4) NOT NULL,
	[FechaDesembolso] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[TasaInteres] [decimal](9, 6) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansLoanCuenta] PRIMARY KEY CLUSTERED 
(
	[LoanCuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[Desembolso]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[Desembolso](
	[DesembolsoId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoanCuentaId] [bigint] NOT NULL,
	[DesembolsadoEn] [datetime2](3) NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[CuentaDestinoId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansDesembolso] PRIMARY KEY CLUSTERED 
(
	[DesembolsoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[Garantia]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[Garantia](
	[GarantiaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[Type] [nvarchar](32) NOT NULL,
	[Descripcion] [nvarchar](256) NULL,
	[MontoAvaluo] [decimal](19, 4) NULL,
	[FechaAvaluo] [date] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansGarantia] PRIMARY KEY CLUSTERED 
(
	[GarantiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[Pago]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[Pago](
	[PagoId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoanCuentaId] [bigint] NOT NULL,
	[PagadoEn] [datetime2](3) NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[Method] [nvarchar](16) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansPago] PRIMARY KEY CLUSTERED 
(
	[PagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[ProductoPrestamo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[ProductoPrestamo](
	[LoanProductoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[TipoAmortizacion] [nvarchar](16) NOT NULL,
	[BaseInteres] [nvarchar](16) NOT NULL,
	[DiasGracia] [int] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansLoanProducto] PRIMARY KEY CLUSTERED 
(
	[LoanProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [prestamos].[TramoMora]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamos].[TramoMora](
	[DelinquencyBucketId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[MinDays] [int] NOT NULL,
	[MaxDays] [int] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [loansDelinquencyBucket] PRIMARY KEY CLUSTERED 
(
	[DelinquencyBucketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[BusinessCalendar]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[BusinessCalendar](
	[BusinessCalendarId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaisId] [bigint] NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refBusinessCalendar] PRIMARY KEY CLUSTERED 
(
	[BusinessCalendarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Ciudad]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Ciudad](
	[CiudadId] [bigint] IDENTITY(1,1) NOT NULL,
	[RegionId] [bigint] NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[CodigoPostal] [nvarchar](16) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refCiudad] PRIMARY KEY CLUSTERED 
(
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[GradoRiesgo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[GradoRiesgo](
	[RiskGradeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](8) NOT NULL,
	[Nombre] [nvarchar](64) NOT NULL,
	[PuntajeMin] [int] NULL,
	[PuntajeMax] [int] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refRiskGrade] PRIMARY KEY CLUSTERED 
(
	[RiskGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Holiday]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Holiday](
	[HolidayId] [bigint] IDENTITY(1,1) NOT NULL,
	[BusinessCalendarId] [bigint] NOT NULL,
	[HolidayFecha] [date] NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refHoliday] PRIMARY KEY CLUSTERED 
(
	[HolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Idioma]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Idioma](
	[IdiomaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](8) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refIdioma] PRIMARY KEY CLUSTERED 
(
	[IdiomaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Industria]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Industria](
	[IndustriaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refIndustria] PRIMARY KEY CLUSTERED 
(
	[IndustriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Moneda]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Moneda](
	[MonedaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [char](3) NOT NULL,
	[Nombre] [nvarchar](64) NOT NULL,
	[NumericCodigo] [smallint] NULL,
	[MinorUnit] [tinyint] NULL,
	[Simbolo] [nvarchar](8) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refMoneda] PRIMARY KEY CLUSTERED 
(
	[MonedaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Pais]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Pais](
	[PaisId] [bigint] IDENTITY(1,1) NOT NULL,
	[Iso2] [char](2) NOT NULL,
	[Iso3] [char](3) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[TelefonoCodigo] [nvarchar](8) NULL,
	[DefaultMonedaId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refPais] PRIMARY KEY CLUSTERED 
(
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[Region]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[Region](
	[RegionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaisId] [bigint] NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refRegion] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [referencial].[TipoDocumento]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [referencial].[TipoDocumento](
	[DocumentTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](16) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[IsPersonal] [bit] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [refDocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [relaciones].[Campania]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [relaciones].[Campania](
	[CampaniaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[StartFecha] [date] NOT NULL,
	[EndFecha] [date] NULL,
	[Budget] [decimal](19, 4) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [crmCampania] PRIMARY KEY CLUSTERED 
(
	[CampaniaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [relaciones].[InteraccionCliente]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [relaciones].[InteraccionCliente](
	[ClienteInteractionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[CanalCodigo] [nvarchar](16) NULL,
	[OcurridoEn] [datetime2](3) NOT NULL,
	[Asunto] [nvarchar](128) NULL,
	[Notas] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [crmClienteInteraction] PRIMARY KEY CLUSTERED 
(
	[ClienteInteractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [relaciones].[Oportunidad]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [relaciones].[Oportunidad](
	[OportunidadId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Monto] [decimal](19, 4) NULL,
	[FechaCierre] [date] NULL,
	[Etapa] [nvarchar](32) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [crmOportunidad] PRIMARY KEY CLUSTERED 
(
	[OportunidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [relaciones].[Prospecto]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [relaciones].[Prospecto](
	[ProspectoId] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](200) NOT NULL,
	[Correo] [nvarchar](200) NULL,
	[Telefono] [nvarchar](40) NULL,
	[Fuente] [nvarchar](32) NULL,
	[ClienteConvertidoId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [crmProspecto] PRIMARY KEY CLUSTERED 
(
	[ProspectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [relaciones].[Reclamo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [relaciones].[Reclamo](
	[ReclamoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[AbiertoEn] [datetime2](3) NOT NULL,
	[CerradoEn] [datetime2](3) NULL,
	[Categoria] [nvarchar](32) NOT NULL,
	[Detalles] [nvarchar](1024) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [crmReclamo] PRIMARY KEY CLUSTERED 
(
	[ReclamoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reportes].[Instantanea]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reportes].[Instantanea](
	[InstantaneaId] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreEntidad] [nvarchar](64) NOT NULL,
	[EntidadId] [bigint] NOT NULL,
	[AFecha] [datetime2](3) NOT NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [reportingInstantanea] PRIMARY KEY CLUSTERED 
(
	[InstantaneaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [reportes].[KPI]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reportes].[KPI](
	[KPIId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Formula] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [reporting] PRIMARY KEY CLUSTERED 
(
	[KPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [reportes].[ProgramacionReporte]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reportes].[ProgramacionReporte](
	[ReporteScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReporteId] [bigint] NOT NULL,
	[CronExpresion] [nvarchar](64) NOT NULL,
	[ProximaEjecucionEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [reportingReporteSchedule] PRIMARY KEY CLUSTERED 
(
	[ReporteScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reportes].[Reporte]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reportes].[Reporte](
	[ReporteId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[DefinicionSql] [nvarchar](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [reportingReporte] PRIMARY KEY CLUSTERED 
(
	[ReporteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[Alerta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[Alerta](
	[AlertaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NULL,
	[Severidad] [nvarchar](8) NOT NULL,
	[Categoria] [nvarchar](32) NOT NULL,
	[LevantadaEn] [datetime2](3) NOT NULL,
	[ResueltaEn] [datetime2](3) NULL,
	[Message] [nvarchar](512) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskAlerta] PRIMARY KEY CLUSTERED 
(
	[AlertaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[CaracteristicaModeloRiesgo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[CaracteristicaModeloRiesgo](
	[RiskModelFeatureId] [bigint] IDENTITY(1,1) NOT NULL,
	[RiskModelId] [bigint] NOT NULL,
	[FeatureNombre] [nvarchar](64) NOT NULL,
	[Weight] [decimal](9, 6) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskRiskModelFeature] PRIMARY KEY CLUSTERED 
(
	[RiskModelFeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[EvaluacionRiesgo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[EvaluacionRiesgo](
	[RiskAssessmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[AssessmentFecha] [date] NOT NULL,
	[RiskGradeId] [bigint] NULL,
	[Notas] [nvarchar](512) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskRiskAssessment] PRIMARY KEY CLUSTERED 
(
	[RiskAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[Exposicion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[Exposicion](
	[ExposicionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[AFecha] [datetime2](3) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskExposicion] PRIMARY KEY CLUSTERED 
(
	[ExposicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[Limite]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[Limite](
	[LimiteId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[LimiteType] [nvarchar](32) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskLimite] PRIMARY KEY CLUSTERED 
(
	[LimiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[ModeloRiesgo]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[ModeloRiesgo](
	[RiskModelId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Version] [nvarchar](16) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskRiskModel] PRIMARY KEY CLUSTERED 
(
	[RiskModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[PuntajeCredito]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[PuntajeCredito](
	[CreditoPuntajeId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[RiskModelId] [bigint] NULL,
	[CalificadoEn] [datetime2](3) NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskCreditoPuntaje] PRIMARY KEY CLUSTERED 
(
	[CreditoPuntajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [riesgo].[UsoLimite]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [riesgo].[UsoLimite](
	[LimiteUsageId] [bigint] IDENTITY(1,1) NOT NULL,
	[LimiteId] [bigint] NOT NULL,
	[UsedMonto] [decimal](19, 4) NOT NULL,
	[AFecha] [datetime2](3) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [riskLimiteUsage] PRIMARY KEY CLUSTERED 
(
	[LimiteUsageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[ClienteApi]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[ClienteApi](
	[ApiClientId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[ClienteId] [nvarchar](128) NOT NULL,
	[HashSecretoCliente] [varbinary](max) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityApiClient] PRIMARY KEY CLUSTERED 
(
	[ApiClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[LlaveApi]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[LlaveApi](
	[ApiKeyId] [bigint] IDENTITY(1,1) NOT NULL,
	[ApiClientId] [bigint] NOT NULL,
	[HashLlave] [varbinary](64) NOT NULL,
	[ExpiraEn] [datetime2](3) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityApiKey] PRIMARY KEY CLUSTERED 
(
	[ApiKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Permiso]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Permiso](
	[PermisoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](128) NOT NULL,
	[Descripcion] [nvarchar](256) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityPermiso] PRIMARY KEY CLUSTERED 
(
	[PermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Rol]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Rol](
	[RolId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](64) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityRol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[RolPermiso]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[RolPermiso](
	[RolPermisoId] [bigint] IDENTITY(1,1) NOT NULL,
	[RolId] [bigint] NOT NULL,
	[PermisoId] [bigint] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityRolPermiso] PRIMARY KEY CLUSTERED 
(
	[RolPermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Sesion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Sesion](
	[SesionId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[Token] [nvarchar](512) NOT NULL,
	[EmitidoEn] [datetime2](3) NOT NULL,
	[ExpiraEn] [datetime2](3) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securitySesion] PRIMARY KEY CLUSTERED 
(
	[SesionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Usuario]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Usuario](
	[UsuarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioNombre] [nvarchar](64) NOT NULL,
	[Correo] [nvarchar](200) NULL,
	[HashContrasena] [varbinary](max) NULL,
	[Sal] [varbinary](128) NULL,
	[UltimoIngresoEn] [datetime2](3) NULL,
	[ClienteId] [bigint] NULL,
	[EmpleadoId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityUsuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[UsuarioRol]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[UsuarioRol](
	[UsuarioRolId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[RolId] [bigint] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [securityUsuarioRol] PRIMARY KEY CLUSTERED 
(
	[UsuarioRolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarifas].[EvaluacionComision]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarifas].[EvaluacionComision](
	[FeeAssessmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[FeeRuleId] [bigint] NOT NULL,
	[NombreEntidad] [nvarchar](64) NOT NULL,
	[EntidadId] [bigint] NOT NULL,
	[EvaluadoEn] [datetime2](3) NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [feesFeeAssessment] PRIMARY KEY CLUSTERED 
(
	[FeeAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarifas].[ExencionComision]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarifas].[ExencionComision](
	[FeeWaiverId] [bigint] IDENTITY(1,1) NOT NULL,
	[FeeAssessmentId] [bigint] NOT NULL,
	[WaivedEn] [datetime2](3) NOT NULL,
	[Motivo] [nvarchar](256) NULL,
	[MontoExento] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [feesFeeWaiver] PRIMARY KEY CLUSTERED 
(
	[FeeWaiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarifas].[MatrizPrecios]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarifas].[MatrizPrecios](
	[PricingMatrixId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[DefinitionJson] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [feesPricingMatrix] PRIMARY KEY CLUSTERED 
(
	[PricingMatrixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tarifas].[ReglaComision]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarifas].[ReglaComision](
	[FeeRuleId] [bigint] IDENTITY(1,1) NOT NULL,
	[FeeTypeId] [bigint] NOT NULL,
	[PricingMatrixId] [bigint] NULL,
	[AplicaA] [nvarchar](32) NOT NULL,
	[RuleJson] [nvarchar](max) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [feesFeeRule] PRIMARY KEY CLUSTERED 
(
	[FeeRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tarifas].[TipoComision]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarifas].[TipoComision](
	[FeeTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](32) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [feesFeeType] PRIMARY KEY CLUSTERED 
(
	[FeeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[Autorizacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[Autorizacion](
	[AutorizacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[TarjetaId] [bigint] NOT NULL,
	[ComercioId] [bigint] NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[AutorizadoEn] [datetime2](3) NOT NULL,
	[CodigoAutorizacion] [nvarchar](12) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsAutorizacion] PRIMARY KEY CLUSTERED 
(
	[AutorizacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[Captura]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[Captura](
	[CapturaId] [bigint] IDENTITY(1,1) NOT NULL,
	[AutorizacionId] [bigint] NULL,
	[CapturadoEn] [datetime2](3) NOT NULL,
	[MontoCapturado] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsCaptura] PRIMARY KEY CLUSTERED 
(
	[CapturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[Comercio]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[Comercio](
	[ComercioId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[CodigoCategoria] [nvarchar](8) NULL,
	[PaisId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsComercio] PRIMARY KEY CLUSTERED 
(
	[ComercioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[Disputa]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[Disputa](
	[DisputaId] [bigint] IDENTITY(1,1) NOT NULL,
	[AutorizacionId] [bigint] NULL,
	[AbiertoEn] [datetime2](3) NOT NULL,
	[MotivoCodigo] [nvarchar](16) NOT NULL,
	[ResueltaEn] [datetime2](3) NULL,
	[Resolucion] [nvarchar](128) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsDisputa] PRIMARY KEY CLUSTERED 
(
	[DisputaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[Tarjeta]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[Tarjeta](
	[TarjetaId] [bigint] IDENTITY(1,1) NOT NULL,
	[HashPAN] [varbinary](64) NOT NULL,
	[PANEnmascarado] [nvarchar](32) NOT NULL,
	[MesExpiracion] [tinyint] NOT NULL,
	[AnioExpiracion] [smallint] NOT NULL,
	[NombreTarjetahabiente] [nvarchar](128) NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsTarjeta] PRIMARY KEY CLUSTERED 
(
	[TarjetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tarjetas].[TarjetaCuentaLink]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tarjetas].[TarjetaCuentaLink](
	[TarjetaCuentaLinkId] [bigint] IDENTITY(1,1) NOT NULL,
	[TarjetaId] [bigint] NOT NULL,
	[CuentaId] [bigint] NOT NULL,
	[LinkType] [nvarchar](16) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [cardsTarjetaCuentaLink] PRIMARY KEY CLUSTERED 
(
	[TarjetaCuentaLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[Contraparte]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[Contraparte](
	[ContraparteId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[SwiftBic] [nvarchar](16) NULL,
	[PaisId] [bigint] NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryContraparte] PRIMARY KEY CLUSTERED 
(
	[ContraparteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[CuboLiquidez]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[CuboLiquidez](
	[LiquidityBucketId] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreCubo] [nvarchar](32) NOT NULL,
	[DiasMin] [int] NOT NULL,
	[DiasMax] [int] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryLiquidityBucket] PRIMARY KEY CLUSTERED 
(
	[LiquidityBucketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[CuentaNostro]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[CuentaNostro](
	[NostroCuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContraparteId] [bigint] NOT NULL,
	[NumeroCuenta] [nvarchar](34) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryNostroCuenta] PRIMARY KEY CLUSTERED 
(
	[NostroCuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[Operacion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[Operacion](
	[OperacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContraparteId] [bigint] NOT NULL,
	[TipoOperacion] [nvarchar](16) NOT NULL,
	[FechaOperacion] [date] NOT NULL,
	[FechaValor] [date] NOT NULL,
	[FechaVencimiento] [date] NULL,
	[Nominal] [decimal](19, 4) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryOperacion] PRIMARY KEY CLUSTERED 
(
	[OperacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[Posicion]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[Posicion](
	[PosicionId] [bigint] IDENTITY(1,1) NOT NULL,
	[MonedaId] [bigint] NOT NULL,
	[AFecha] [datetime2](3) NOT NULL,
	[Monto] [decimal](19, 4) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryPosicion] PRIMARY KEY CLUSTERED 
(
	[PosicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tesoreria].[TipoCambio]    Script Date: 1/12/2025 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tesoreria].[TipoCambio](
	[FXTasaId] [bigint] IDENTITY(1,1) NOT NULL,
	[MonedaOrigenId] [bigint] NOT NULL,
	[MonedaDestinoId] [bigint] NOT NULL,
	[AFecha] [datetime2](3) NOT NULL,
	[Tasa] [decimal](19, 8) NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[IdExterno] [nvarchar](64) NULL,
	[CreadoEn] [datetime2](3) NOT NULL,
	[CreadoPor] [nvarchar](64) NULL,
	[ModificadoEn] [datetime2](3) NULL,
	[ModificadoPor] [nvarchar](64) NULL,
	[VersionFila] [timestamp] NOT NULL,
 CONSTRAINT [treasuryFXTasa] PRIMARY KEY CLUSTERED 
(
	[FXTasaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO