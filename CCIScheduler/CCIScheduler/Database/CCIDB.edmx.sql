
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/08/2017 17:25:29
-- Generated from EDMX file: C:\Users\Corey\source\seriously\repos\CCIScheduler\CCIScheduler\Database\CCIDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ccitestdb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserPassword] nvarchar(max)  NOT NULL,
    [UserEmail] nvarchar(max)  NOT NULL,
    [UserFirstName] nvarchar(max)  NOT NULL,
    [UserLastName] nvarchar(max)  NOT NULL,
    [UserPrivledgeLevel] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reservations'
CREATE TABLE [dbo].[Reservations] (
    [ReservID] int IDENTITY(1,1) NOT NULL,
    [ReservTime] nvarchar(max)  NOT NULL,
    [ReservDate] nvarchar(max)  NOT NULL,
    [RoomNumber] nvarchar(max)  NOT NULL,
    [UserID] nvarchar(max)  NOT NULL,
    [UserUserID] int  NOT NULL,
    [Room_RoomNumber] int  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [RoomNumber] int IDENTITY(1,1) NOT NULL,
    [RoomCapacity] nvarchar(max)  NOT NULL,
    [RoomHasProjector] nvarchar(max)  NOT NULL,
    [RoomHasPodium] nvarchar(max)  NOT NULL,
    [RoomOutletCount] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [ReservID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [PK_Reservations]
    PRIMARY KEY CLUSTERED ([ReservID] ASC);
GO

-- Creating primary key on [RoomNumber] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([RoomNumber] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserUserID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_UserReservations]
    FOREIGN KEY ([UserUserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReservations'
CREATE INDEX [IX_FK_UserReservations]
ON [dbo].[Reservations]
    ([UserUserID]);
GO

-- Creating foreign key on [Room_RoomNumber] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_RoomReservations]
    FOREIGN KEY ([Room_RoomNumber])
    REFERENCES [dbo].[Rooms]
        ([RoomNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomReservations'
CREATE INDEX [IX_FK_RoomReservations]
ON [dbo].[Reservations]
    ([Room_RoomNumber]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------