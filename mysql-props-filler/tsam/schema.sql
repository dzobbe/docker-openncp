
	SET FOREIGN_KEY_CHECKS=0;
	SET CHARACTER SET utf8;
    SET NAMES 'utf8';

	DROP TABLE IF EXISTS `CODE_SYSTEM`;
	DROP TABLE IF EXISTS `CODE_SYSTEM_CONCEPT`;
	DROP TABLE IF EXISTS `CODE_SYSTEM_VERSION`;
	DROP TABLE IF EXISTS `DESIGNATION`;
	DROP TABLE IF EXISTS `TRANSCODING_ASSOCIATION`;
	DROP TABLE IF EXISTS `VALUE_SET`;
	DROP TABLE IF EXISTS `VALUE_SET_VERSION`;
	DROP TABLE IF EXISTS `X_CONCEPT_VALUE_SET`;
	

    create table CODE_SYSTEM (
        ID bigint not null,
        OID varchar(255),
        NAME varchar(255),
        DESCRIPTION varchar(255),
        primary key (ID)
    );

    create table CODE_SYSTEM_CONCEPT (
        ID bigint not null,
        CODE varchar(255),
        STATUS varchar(255),
        STATUS_DATE timestamp,
        DEFINITION varchar(1000),
        CODE_SYSTEM_VERSION_ID bigint,
        primary key (ID)
    );

    create table CODE_SYSTEM_VERSION (
        ID bigint not null,
        FULL_NAME varchar(255),
        LOCAL_NAME varchar(255),
        PREVIOUS_VERSION_ID bigint,
        EFFECTIVE_DATE timestamp,
        RELEASE_DATE timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        STATUS varchar(255),
        STATUS_DATE timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        DESCRIPTION varchar(255),
        COPYRIGHT varchar(255),
        SOURCE varchar(255),
        CODE_SYSTEM_ID bigint,
        primary key (ID)
    );

    create table DESIGNATION (
        ID bigint not null,
        DESIGNATION varchar(255),
        LANGUAGE_CODE varchar(255),
        TYPE varchar(255),
        IS_PREFERRED boolean,
        STATUS varchar(255),
        STATUS_DATE timestamp,
        CODE_SYSTEM_CONCEPT_ID bigint,
        primary key (ID)
    );

    create table TRANSCODING_ASSOCIATION (
        ID bigint not null,
        TARGET_CONCEPT_ID bigint,
        SOURCE_CONCEPT_ID bigint,
        QUALITY varchar(255),
        STATUS varchar(255),
        STATUS_DATE timestamp,
        primary key (ID)
    );

    create table VALUE_SET (
        ID bigint not null,
        OID varchar(255),
        EPSOS_NAME varchar(255),
        DESCRIPTION varchar(255),
        PARENT_CODE_SYSTEM_ID bigint,
        primary key (ID)
    );

    create table VALUE_SET_VERSION (
        ID bigint not null,
        VERSION_NAME varchar(255),
        EFFECTIVE_DATE timestamp,
        RELEASE_DATE timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        STATUS varchar(255),
        STATUS_DATE timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        DESCRIPTION varchar(255),
        PREVIOUS_VERSION_ID bigint, 
        VALUE_SET_ID bigint,
        primary key (ID)
    );

    create table X_CONCEPT_VALUE_SET (
        CODE_SYSTEM_CONCEPT_ID bigint not null,
        VALUE_SET_VERSION_ID bigint not null
    );


    alter table CODE_SYSTEM_CONCEPT 
        add constraint FKEEFD04CAC0188620 
        foreign key (CODE_SYSTEM_VERSION_ID) 
        references CODE_SYSTEM_VERSION(ID);

    alter table CODE_SYSTEM_VERSION 
        add constraint FK_CODE_SYSTEM_ID 
        foreign key (CODE_SYSTEM_ID) 
        references CODE_SYSTEM(ID);

    alter table DESIGNATION 
        add constraint FK4AA073D79860DC20 
        foreign key (CODE_SYSTEM_CONCEPT_ID) 
        references CODE_SYSTEM_CONCEPT(ID);

    alter table TRANSCODING_ASSOCIATION 
        add constraint FK125C5F9490796486 
        foreign key (SOURCE_CONCEPT_ID) 
        references CODE_SYSTEM_CONCEPT(ID);

    alter table TRANSCODING_ASSOCIATION 
        add constraint FK125C5F94197DF550 
        foreign key (TARGET_CONCEPT_ID) 
        references CODE_SYSTEM_CONCEPT(ID);

    alter table VALUE_SET 
        add constraint FK7887F854C2571EC1 
        foreign key (PARENT_CODE_SYSTEM_ID) 
        references CODE_SYSTEM(ID); 
 
    alter table VALUE_SET_VERSION 
        add constraint FKBFD4B3CD4031CAD5 
        foreign key (PREVIOUS_VERSION_ID) 
        references VALUE_SET_VERSION(ID);

    alter table VALUE_SET_VERSION 
        add constraint FKBFD4B3CDBDA3213 
        foreign key (VALUE_SET_ID) 
        references VALUE_SET(ID);

    alter table X_CONCEPT_VALUE_SET 
        add constraint FK86BB42F69860DC20 
        foreign key (CODE_SYSTEM_CONCEPT_ID) 
        references CODE_SYSTEM_CONCEPT(ID);

    alter table X_CONCEPT_VALUE_SET 
        add constraint FK86BB42F690B7F518 
        foreign key (VALUE_SET_VERSION_ID) 
        references VALUE_SET_VERSION(ID);
    
