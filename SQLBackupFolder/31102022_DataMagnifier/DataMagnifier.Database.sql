﻿USE [master]
GO
/****** Object:  Database [DataMagnifier]    Script Date: 31.10.2022 12:08:34 ******/
CREATE DATABASE [DataMagnifier]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataMagnifier', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DataMagnifier.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataMagnifier_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DataMagnifier_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataMagnifier].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataMagnifier] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataMagnifier] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataMagnifier] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataMagnifier] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataMagnifier] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataMagnifier] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataMagnifier] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataMagnifier] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataMagnifier] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataMagnifier] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataMagnifier] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataMagnifier] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataMagnifier] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataMagnifier] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataMagnifier] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataMagnifier] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataMagnifier] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataMagnifier] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataMagnifier] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataMagnifier] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataMagnifier] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataMagnifier] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataMagnifier] SET RECOVERY FULL 
GO
ALTER DATABASE [DataMagnifier] SET  MULTI_USER 
GO
ALTER DATABASE [DataMagnifier] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataMagnifier] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataMagnifier] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataMagnifier] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataMagnifier] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DataMagnifier', N'ON'
GO
ALTER DATABASE [DataMagnifier] SET QUERY_STORE = OFF
GO
USE [DataMagnifier]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE [DataMagnifier] SET  READ_WRITE 
GO
