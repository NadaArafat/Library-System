/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     5/27/2022 2:49:01 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOK') and o.name = 'FK_BOOK_AUTHORED_AUTHOR')
alter table BOOK
   drop constraint FK_BOOK_AUTHORED_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOK') and o.name = 'FK_BOOK_UPLOAD_ADMIN')
alter table BOOK
   drop constraint FK_BOOK_UPLOAD_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BUYS') and o.name = 'FK_BUYS_BUYS_READER')
alter table BUYS
   drop constraint FK_BUYS_BUYS_READER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BUYS') and o.name = 'FK_BUYS_BUYS2_BOOK')
alter table BUYS
   drop constraint FK_BUYS_BUYS2_BOOK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENTS_ON') and o.name = 'FK_COMMENTS_COMMENTS__READER')
alter table COMMENTS_ON
   drop constraint FK_COMMENTS_COMMENTS__READER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENTS_ON') and o.name = 'FK_COMMENTS_COMMENTS__BOOK')
alter table COMMENTS_ON
   drop constraint FK_COMMENTS_COMMENTS__BOOK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE1') and o.name = 'FK_UPDATEPR_UPDATEPRO_ADMIN')
alter table UPDATEPROFILE1
   drop constraint FK_UPDATEPR_UPDATEPRO_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE1') and o.name = 'FK_UPDATEPR_UPDATEPRO_ADMIN2')
alter table UPDATEPROFILE1
   drop constraint FK_UPDATEPR_UPDATEPRO_ADMIN2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE2') and o.name = 'FK_RELATION_RELATIONS_READER2')
alter table UPDATEPROFILE2
   drop constraint FK_RELATION_RELATIONS_READER2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE2') and o.name = 'FK_UPDATEPR_UPDATEPRO_READER')
alter table UPDATEPROFILE2
   drop constraint FK_UPDATEPR_UPDATEPRO_READER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE3') and o.name = 'FK_RELATION_RELATIONS_AUTHOR2')
alter table UPDATEPROFILE3
   drop constraint FK_RELATION_RELATIONS_AUTHOR2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPDATEPROFILE3') and o.name = 'FK_UPDATEPR_UPDATEPRO_AUTHOR')
alter table UPDATEPROFILE3
   drop constraint FK_UPDATEPR_UPDATEPRO_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPLOADS') and o.name = 'FK_UPLOADS_UPLOADS_AUTHOR')
alter table UPLOADS
   drop constraint FK_UPLOADS_UPLOADS_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UPLOADS') and o.name = 'FK_UPLOADS_UPLOADS2_BOOK')
alter table UPLOADS
   drop constraint FK_UPLOADS_UPLOADS2_BOOK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIEWS') and o.name = 'FK_VIEWS_VIEWS_READER')
alter table VIEWS
   drop constraint FK_VIEWS_VIEWS_READER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIEWS') and o.name = 'FK_VIEWS_VIEWS2_BOOK')
alter table VIEWS
   drop constraint FK_VIEWS_VIEWS2_BOOK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTHOR')
            and   type = 'U')
   drop table AUTHOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOK')
            and   name  = 'AUTHORED_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOK.AUTHORED_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOK')
            and   name  = 'UPLOAD_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOK.UPLOAD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOOK')
            and   type = 'U')
   drop table BOOK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BUYS')
            and   name  = 'BUYS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BUYS.BUYS2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BUYS')
            and   name  = 'ASSOCIATION_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index BUYS.ASSOCIATION_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BUYS')
            and   type = 'U')
   drop table BUYS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMMENTS_ON')
            and   name  = 'COMMENTS_ON2_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMMENTS_ON.COMMENTS_ON2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMMENTS_ON')
            and   type = 'U')
   drop table COMMENTS_ON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('READER')
            and   type = 'U')
   drop table READER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UPDATEPROFILE1')
            and   name  = 'UPDATEPROFILE_FK'
            and   indid > 0
            and   indid < 255)
   drop index UPDATEPROFILE1.UPDATEPROFILE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UPDATEPROFILE1')
            and   type = 'U')
   drop table UPDATEPROFILE1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UPDATEPROFILE2')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index UPDATEPROFILE2.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UPDATEPROFILE2')
            and   type = 'U')
   drop table UPDATEPROFILE2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UPDATEPROFILE3')
            and   name  = 'RELATIONSHIP3_FK'
            and   indid > 0
            and   indid < 255)
   drop index UPDATEPROFILE3.RELATIONSHIP3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UPDATEPROFILE3')
            and   type = 'U')
   drop table UPDATEPROFILE3
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UPLOADS')
            and   name  = 'UPLOADS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index UPLOADS.UPLOADS2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UPLOADS')
            and   name  = 'UPLOADS_FK'
            and   indid > 0
            and   indid < 255)
   drop index UPLOADS.UPLOADS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UPLOADS')
            and   type = 'U')
   drop table UPLOADS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"USER"')
            and   type = 'U')
   drop table "USER"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIEWS')
            and   name  = 'VIEWS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIEWS.VIEWS2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VIEWS')
            and   type = 'U')
   drop table VIEWS
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   A_ID                 varchar(15)          not null,
   USER_NAME            varchar(20)          null,
   USER_PASS            varchar(15)          null,
   USER_TYPE            char(1)              null,
   USER_EMAIL           varchar(55)          null,
   USER_FNAME           varchar(55)          null,
   USER_LNAME           varchar(55)          null,
   constraint PK_ADMIN primary key (A_ID)
)
go

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR (
   AUTH_ID              varchar(15)          not null,
   USER_NAME            varchar(20)          null,
   USER_PASS            varchar(15)          null,
   USER_TYPE            char(1)              null,
   USER_EMAIL           varchar(55)          null,
   USER_FNAME           varchar(55)          null,
   USER_LNAME           varchar(55)          null,
   constraint PK_AUTHOR primary key (AUTH_ID)
)
go

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK (
   BOOK_ID              varchar(15)          not null,
   AUTH_ID              varchar(15)          not null,
   A_ID                 varchar(15)          null,
   TITLE                varchar(255)         null,
   NUMBUYERS            int                  null,
   PRICE                money                null,
   TYPE                 varchar(55)          null,
   ISBN                 varchar(55)          null,
   PUBLISHYEAR          datetime             null,
   LASTBUYDATE          datetime             null,
   constraint PK_BOOK primary key (BOOK_ID)
)
go

/*==============================================================*/
/* Index: UPLOAD_FK                                             */
/*==============================================================*/




create nonclustered index UPLOAD_FK on BOOK (A_ID ASC)
go

/*==============================================================*/
/* Index: AUTHORED_FK                                           */
/*==============================================================*/




create nonclustered index AUTHORED_FK on BOOK (AUTH_ID ASC)
go

/*==============================================================*/
/* Table: BUYS                                                  */
/*==============================================================*/
create table BUYS (
   BUY_BOOK_ID          varchar(15)          not null,
   AUTH_ID              varchar(15)          not null,
   R_ID                 varchar(15)          not null,
   BOOK_ID              varchar(15)          not null,
   constraint PK_BUYS primary key (R_ID, BOOK_ID, BUY_BOOK_ID, AUTH_ID)
)
go

/*==============================================================*/
/* Index: ASSOCIATION_6_FK                                      */
/*==============================================================*/




create nonclustered index ASSOCIATION_6_FK on BUYS (BOOK_ID ASC)
go

/*==============================================================*/
/* Index: BUYS2_FK                                              */
/*==============================================================*/




create nonclustered index BUYS2_FK on BUYS (R_ID ASC)
go

/*==============================================================*/
/* Table: COMMENTS_ON                                           */
/*==============================================================*/
create table COMMENTS_ON (
   R_ID                 varchar(15)          not null,
   BOOK_ID              varchar(15)          not null,
   constraint PK_COMMENTS_ON primary key (R_ID, BOOK_ID)
)
go

/*==============================================================*/
/* Index: COMMENTS_ON2_FK                                       */
/*==============================================================*/




create nonclustered index COMMENTS_ON2_FK on COMMENTS_ON (BOOK_ID ASC)
go

/*==============================================================*/
/* Table: READER                                                */
/*==============================================================*/
create table READER (
   R_ID                 varchar(15)          not null,
   USER_NAME            varchar(20)          null,
   USER_PASS            varchar(15)          null,
   USER_TYPE            char(1)              null,
   USER_EMAIL           varchar(55)          null,
   USER_FNAME           varchar(55)          null,
   USER_LNAME           varchar(55)          null,
   _OFBOOKS             int                  null,
   constraint PK_READER primary key (R_ID)
)
go

/*==============================================================*/
/* Table: UPDATEPROFILE1                                        */
/*==============================================================*/
create table UPDATEPROFILE1 (
   A_ID                 varchar(15)          not null,
   ADM_A_ID             varchar(15)          not null,
   constraint PK_UPDATEPROFILE1 primary key (A_ID)
)
go

/*==============================================================*/
/* Index: UPDATEPROFILE_FK                                      */
/*==============================================================*/




create nonclustered index UPDATEPROFILE_FK on UPDATEPROFILE1 (A_ID ASC)
go

/*==============================================================*/
/* Table: UPDATEPROFILE2                                        */
/*==============================================================*/
create table UPDATEPROFILE2 (
   R_ID                 varchar(15)          not null,
   REA_R_ID             varchar(15)          not null,
   constraint PK_UPDATEPROFILE2 primary key (R_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on UPDATEPROFILE2 (R_ID ASC)
go

/*==============================================================*/
/* Table: UPDATEPROFILE3                                        */
/*==============================================================*/
create table UPDATEPROFILE3 (
   AUTH_ID              varchar(15)          not null,
   AUT_AUTH_ID          varchar(15)          not null,
   constraint PK_UPDATEPROFILE3 primary key (AUTH_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP3_FK                                      */
/*==============================================================*/




create nonclustered index RELATIONSHIP3_FK on UPDATEPROFILE3 (AUTH_ID ASC)
go

/*==============================================================*/
/* Table: UPLOADS                                               */
/*==============================================================*/
create table UPLOADS (
   AUTH_ID              varchar(15)          not null,
   BOOK_ID              varchar(15)          not null,
   constraint PK_UPLOADS primary key (AUTH_ID, BOOK_ID)
)
go

/*==============================================================*/
/* Index: UPLOADS_FK                                            */
/*==============================================================*/




create nonclustered index UPLOADS_FK on UPLOADS (AUTH_ID ASC)
go

/*==============================================================*/
/* Index: UPLOADS2_FK                                           */
/*==============================================================*/




create nonclustered index UPLOADS2_FK on UPLOADS (BOOK_ID ASC)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   USER_NAME            varchar(20)          null,
   USER_PASS            varchar(15)          null,
   USER_TYPE            char(1)              null,
   USER_EMAIL           varchar(55)          null,
   USER_FNAME           varchar(55)          null,
   USER_LNAME           varchar(55)          null
)
go

/*==============================================================*/
/* Table: VIEWS                                                 */
/*==============================================================*/
create table VIEWS (
   R_ID                 varchar(15)          not null,
   BOOK_ID              varchar(15)          not null,
   constraint PK_VIEWS primary key (R_ID, BOOK_ID)
)
go

/*==============================================================*/
/* Index: VIEWS2_FK                                             */
/*==============================================================*/




create nonclustered index VIEWS2_FK on VIEWS (BOOK_ID ASC)
go

alter table BOOK
   add constraint FK_BOOK_AUTHORED_AUTHOR foreign key (AUTH_ID)
      references AUTHOR (AUTH_ID)
go

alter table BOOK
   add constraint FK_BOOK_UPLOAD_ADMIN foreign key (A_ID)
      references ADMIN (A_ID)
go

alter table BUYS
   add constraint FK_BUYS_BUYS_READER foreign key (R_ID)
      references READER (R_ID)
go

alter table BUYS
   add constraint FK_BUYS_BUYS2_BOOK foreign key (BOOK_ID)
      references BOOK (BOOK_ID)
go

alter table COMMENTS_ON
   add constraint FK_COMMENTS_COMMENTS__READER foreign key (R_ID)
      references READER (R_ID)
go

alter table COMMENTS_ON
   add constraint FK_COMMENTS_COMMENTS__BOOK foreign key (BOOK_ID)
      references BOOK (BOOK_ID)
go

alter table UPDATEPROFILE1
   add constraint FK_UPDATEPR_UPDATEPRO_ADMIN foreign key (A_ID)
      references ADMIN (A_ID)
go

alter table UPDATEPROFILE1
   add constraint FK_UPDATEPR_UPDATEPRO_ADMIN2 foreign key (A_ID)
      references ADMIN (A_ID)
go

alter table UPDATEPROFILE2
   add constraint FK_RELATION_RELATIONS_READER2 foreign key (R_ID)
      references READER (R_ID)
go

alter table UPDATEPROFILE2
   add constraint FK_UPDATEPR_UPDATEPRO_READER foreign key (R_ID)
      references READER (R_ID)
go

alter table UPDATEPROFILE3
   add constraint FK_RELATION_RELATIONS_AUTHOR2 foreign key (AUTH_ID)
      references AUTHOR (AUTH_ID)
go

alter table UPDATEPROFILE3
   add constraint FK_UPDATEPR_UPDATEPRO_AUTHOR foreign key (AUTH_ID)
      references AUTHOR (AUTH_ID)
go

alter table UPLOADS
   add constraint FK_UPLOADS_UPLOADS_AUTHOR foreign key (AUTH_ID)
      references AUTHOR (AUTH_ID)
go

alter table UPLOADS
   add constraint FK_UPLOADS_UPLOADS2_BOOK foreign key (BOOK_ID)
      references BOOK (BOOK_ID)
go

alter table VIEWS
   add constraint FK_VIEWS_VIEWS_READER foreign key (R_ID)
      references READER (R_ID)
go

alter table VIEWS
   add constraint FK_VIEWS_VIEWS2_BOOK foreign key (BOOK_ID)
      references BOOK (BOOK_ID)
go

