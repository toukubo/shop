
    create table ATTACHMENT (
        ID INTEGER not null auto_increment,
        FILETYPE VARCHAR(255) BINARY not null,
        WIDTH FLOAT not null,
        HEIGHT FLOAT not null,
        WIDE TINYINT not null,
        DB_FILE_FK INTEGER unique,
        ASDETAILED_FK INTEGER,
        primary key (ID)
    );

    create table CARRIAGE (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        VALUE INTEGER not null,
        primary key (ID)
    );

    create table CATEGORY (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        primary key (ID)
    );

    create table CHOISE (
        ID INTEGER not null auto_increment,
        ORDERNUM INTEGER not null,
        PRICEWITHTAX INTEGER not null,
        WRAPPING TINYINT not null,
        PURCHASE_FK INTEGER not null,
        ITEM_FK INTEGER not null,
        primary key (ID)
    );

    create table DB_FILE (
        ID INTEGER not null auto_increment,
        DATA LONGBLOB not null,
        primary key (ID)
    );

    create table DELIVERY_ADDRESS (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        KANA VARCHAR(255) BINARY not null,
        ZIPTHREE INTEGER not null,
        ZIPFOUR INTEGER not null,
        PHONE VARCHAR(255) BINARY not null,
        ADDRESS VARCHAR(255) BINARY not null,
        BUILDINGNAME VARCHAR(255) BINARY not null,
        PREF VARCHAR(255) BINARY not null,
        PREFERREDDATE VARCHAR(255) BINARY not null,
        PREFERREDTIME VARCHAR(255) BINARY not null,
        HASGIFTCARD TINYINT not null,
        PUBLIC_USER_FK INTEGER not null,
        GIFT_CARD_FK INTEGER,
        PREFECTURE_FK INTEGER,
        primary key (ID)
    );

    create table DELIVERY_ADDRESS_CHOISE (
        ID INTEGER not null auto_increment,
        ORDERNUM INTEGER not null,
        PREFERREDDATE VARCHAR(255) BINARY not null,
        PREFERREDTIME VARCHAR(255) BINARY not null,
        DELIVERY_ADDRESS_FK INTEGER not null,
        CHOISE_FK INTEGER not null,
        GIFT_CARD_FK INTEGER,
        primary key (ID)
    );

    create table GIFT_CARD (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        primary key (ID)
    );

    create table ITEM (
        ID INTEGER not null auto_increment,
        NO VARCHAR(255) BINARY not null,
        NAME VARCHAR(255) BINARY not null,
        PRICEWITHTAX INTEGER not null,
        SIZE VARCHAR(255) BINARY not null,
        MATERIAL VARCHAR(255) BINARY not null,
        CATCHCOPY VARCHAR(2000 ) BINARY not null,
        DESCRIPTION VARCHAR(2000 ) BINARY not null,
        NOTE VARCHAR(2000 ) BINARY not null,
        STOCKNUM INTEGER not null,
        MAIN TINYINT not null,
        PRODUCT_FK INTEGER not null,
        CARRIAGE_FK INTEGER,
        ZOOM_FK INTEGER unique,
        DEFAULTATTACHMENT_FK INTEGER unique,
        primary key (ID)
    );

    create table PAYMENT_METHOD (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        NOTE VARCHAR(2000) BINARY not null,
        primary key (ID)
    );

    create table PREFECTURE (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        primary key (ID)
    );

    create table PRODUCT (
        ID INTEGER not null auto_increment,
        NO VARCHAR(255) BINARY not null,
        NAME VARCHAR(255) BINARY not null,
        DATE DATETIME not null,
        PUB TINYINT not null,
        PRICEWITHTAX INTEGER not null,
        SIZE VARCHAR(255) BINARY not null,
        MATERIAL VARCHAR(255) BINARY not null,
        CATCHCOPY VARCHAR(2000 ) BINARY not null,
        DESCRIPTION VARCHAR(2000 ) BINARY not null,
        NOTE VARCHAR(2000 ) BINARY not null,
        STOCKNUM INTEGER not null,
        REMOVED TINYINT not null,
        MAINITEMNAME VARCHAR(255) BINARY not null,
        CATEGORY_FK INTEGER,
        THUMNAIL_FK INTEGER unique,
        SLIDESHOW_FK INTEGER unique,
        primary key (ID)
    );

    create table PUBLIC_USER (
        ID INTEGER not null auto_increment,
        NAME VARCHAR(255) BINARY not null,
        KANA VARCHAR(255) BINARY not null,
        ZIPTHREE INTEGER not null,
        ZIPFOUR INTEGER not null,
        PREF VARCHAR(255) BINARY not null,
        ADDRESS VARCHAR(255) BINARY not null,
        BUILDINGNAME VARCHAR(255) BINARY not null,
        MAIL VARCHAR(255) BINARY not null,
        MAILFORCONFIRM VARCHAR(255) BINARY not null,
        PHONE VARCHAR(255) BINARY not null,
        DEVLIVERYHOUR INTEGER not null,
        DELIVERYDATE INTEGER not null,
        DELIVERYPHONE INTEGER not null,
        DELIVERYKANA VARCHAR(255) BINARY not null,
        DELIVERYBLOCKNUMBER VARCHAR(255) BINARY not null,
        DELIVERYADDRESS VARCHAR(255) BINARY not null,
        DELIVERYNAME VARCHAR(255) BINARY not null,
        DELIVERYZIPFOUR INTEGER not null,
        DELIVERYZIPTHREE INTEGER not null,
        DELIVERYPREF VARCHAR(255) BINARY not null,
        DELIVERTODIFFERENTADDRESS TINYINT not null,
        MALE TINYINT not null,
        BRITHDAY INTEGER not null,
        BIRTHMONTH INTEGER not null,
        MUNICIPALITY VARCHAR(255) BINARY not null,
        BIRTHYEAR INTEGER not null,
        KEITAI VARCHAR(255) BINARY not null,
        REMOVED TINYINT not null,
        PASSWORD VARCHAR(255) BINARY not null,
        FAX VARCHAR(255) BINARY not null,
        REGISTED TINYINT not null,
        TEMP TINYINT not null,
        PASSWORDONETIMEHASH VARCHAR(255) BINARY not null,
        PREFECTURE_FK INTEGER,
        primary key (ID)
    );

    create table PURCHASE (
        ID INTEGER not null auto_increment,
        TOTAL INTEGER not null,
        CARRIAGE INTEGER not null,
        TOTALORDERNUM INTEGER not null,
        SHIPPED TINYINT not null,
        DATE DATETIME not null,
        TEMP TINYINT not null,
        CANCELLED TINYINT not null,
        REMOVED TINYINT not null,
        PUBLIC_USER_FK INTEGER,
        PAYMENT_METHOD_FK INTEGER,
        primary key (ID)
    );

    create table STATIC_DATA (
        ID INTEGER not null auto_increment,
        FROMADDRESS VARCHAR(255) BINARY not null,
        SITENAME VARCHAR(255) BINARY not null,
        BASEPATH VARCHAR(255) BINARY not null,
        UNIX TINYINT not null,
        MAPEVENTSPAN INTEGER not null,
        NOIMAGE LONGBLOB not null,
        CARRIAGE INTEGER not null,
        CREDITCARDPROCESURL VARCHAR(255) BINARY not null,
        CONTRACT_CODE VARCHAR(255) BINARY not null,
        primary key (ID)
    );

   create table PAYMENT_STATUS (
        ID INTEGER not null auto_increment,
        PURCHASE_FK INTEGER not null,
        PAYMENT_STATUS VARCHAR(100) not null,
        PAYMENTGATEWAY_ACS TINYINT,
        PAYMENTGATEWAY_MD VARCHAR(1000),
		PAYMENTGATEWAY_PAREQ VARCHAR(1000),
		PAYMENTGATEWAY_PARES VARCHAR(5000),
		PAYMENTGATEWAY_ACSURL VARCHAR(1000),
 		TRANSACTION_REFERENCE varchar(100) DEFAULT NULL,
  		TRANSACTION_DATE datetime DEFAULT NULL,
  		ORDER_ID varchar(255) DEFAULT NULL,
        primary key (ID)
    );
    
	CREATE TABLE `PREFECTURE_CARRIAGE` (
		`ID` INTEGER not null auto_increment,
		`PREFECTURE_FK` INTEGER not null,
		`CARRIAGEVALUE` INTEGER not null,
		primary key (ID)	
	); 

	CREATE TABLE `PUBLIC_USER_SESSION` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `PUBLIC_USER_FK` int(11) NOT NULL,
	  `SESSION_TOKEN` varchar(1000) NOT NULL,
	  `PURCHASE_FK` int(11) NOT NULL,
	  `PARENT_SESSION_TOKEN` varchar(1000) DEFAULT NULL,
	  `EXPIRED` tinyint(1) DEFAULT '0',
	  PRIMARY KEY (`ID`),
	  KEY `SESSIONTOKEN_PUBLICUSER_FKC` (`PUBLIC_USER_FK`),
	  KEY `SESSIONTOKEN_PURCHASE_FKC` (`PURCHASE_FK`),
	  CONSTRAINT `SESSIONTOKEN_PUBLICUSER_FKC` FOREIGN KEY (`PUBLIC_USER_FK`) REFERENCES `PUBLIC_USER` (`ID`),
	  CONSTRAINT `SESSIONTOKEN_PURCHASE_FKC` FOREIGN KEY (`PURCHASE_FK`) REFERENCES `PURCHASE` (`ID`)
	);


	CREATE TABLE `app_function` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `function_name` varchar(100) NOT NULL,
	  `function_uri` varchar(255) NOT NULL,
	  PRIMARY KEY (`id`),
	  KEY `FUNCTIONS_FUNCTIONURI` (`function_uri`)
	);
	
	CREATE TABLE `role` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `role_name` varchar(50) NOT NULL,
	  `role_description` varchar(255) DEFAULT NULL,
	  PRIMARY KEY (`id`)
	);
	
	CREATE TABLE `user` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `name` varchar(255) NOT NULL,
	  `email` varchar(255) NOT NULL,
	  `password` varchar(255) NOT NULL,
	  `created_by` int(11) NOT NULL,
	  `updated_by` int(11) NOT NULL,
	  `created_date` datetime NOT NULL,
	  `updated_date` datetime NOT NULL,
	  `removed` tinyint(4) NOT NULL DEFAULT '0',
	  PRIMARY KEY (`id`)
	);
	
	CREATE TABLE `user_roles` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `user_fk` int(11) NOT NULL,
	  `role_fk` int(11) NOT NULL,
	  PRIMARY KEY (`id`),
	  KEY `USERROLE_USER_FKC` (`user_fk`),
	  KEY `USERROLE_ROLE_FKC` (`role_fk`),
	  CONSTRAINT `USERROLES_ROLE_FKC` FOREIGN KEY (`role_fk`) REFERENCES `role` (`id`),
	  CONSTRAINT `USERROLES_USER_FKC` FOREIGN KEY (`user_fk`) REFERENCES `user` (`id`)
	);
	
	CREATE TABLE `role_app_functions` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `role_fk` int(11) NOT NULL,
	  `app_function_fk` int(11) NOT NULL,
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `ROLEFUNCTIONS_ROLEFUNCTION` (`role_fk`,`app_function_fk`),
	  KEY `ROLEFUNCTIONS_ROLE_FKC` (`role_fk`),
	  KEY `ROLEFUNCTIONS_FUNCTION_FKC` (`app_function_fk`),
	  CONSTRAINT `ROLEFUNCTIONS_FUNCTION_FKC` FOREIGN KEY (`app_function_fk`) REFERENCES `app_function` (`id`),
	  CONSTRAINT `ROLEFUNCTIONS_ROLE_FKC` FOREIGN KEY (`role_fk`) REFERENCES `role` (`id`)
	);
	
	CREATE TABLE `purchase_email` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `USER_EMAIL_ADDRESS` varchar(255) NOT NULL,
	  `USER_EMAIL_SENT` tinyint(1) NOT NULL DEFAULT '0',
	  `USER_EMAIL_SENT_DATE` datetime DEFAULT NULL,
	  `USER_EMAIL_ERROR_MSG` varchar(1000) DEFAULT NULL,
	  `USER_EMAIL_ERROR_CODE` varchar(20) DEFAULT NULL,
	  `ADMIN_EMAIL_ADDRESSES` varchar(2000) NOT NULL,
	  `ADMIN_EMAIL_SENT` tinyint(1) NOT NULL DEFAULT '0',
	  `ADMIN_EMAIL_SENT_DATE` datetime DEFAULT NULL,
	  `ADMIN_EMAIL_ERROR_MSG` varchar(1000) DEFAULT NULL,
	  `ADMIN_EMAIL_ERROR_CODE` varchar(20) DEFAULT NULL,
	  `PURCHASE_FK` int(11) NOT NULL,
	  KEY `id` (`ID`),
	  KEY `PURCHASE_EMAIL_PURCHASE_FKC` (`PURCHASE_FK`),
	  CONSTRAINT `PURCHASE_EMAIL_PURCHASE_FKC` FOREIGN KEY (`PURCHASE_FK`) REFERENCES `purchase` (`ID`)
	);
	
	alter table ATTACHMENT 
        add index ATTACHMENT_DB_FILE_FKC (DB_FILE_FK), 
        add constraint ATTACHMENT_DB_FILE_FKC 
        foreign key (DB_FILE_FK) 
        references DB_FILE (ID);

    alter table ATTACHMENT 
        add index ATTACHMENT_ASDETAILED_FKC (ASDETAILED_FK), 
        add constraint ATTACHMENT_ASDETAILED_FKC 
        foreign key (ASDETAILED_FK) 
        references ITEM (ID);

    alter table CHOISE 
        add index CHOISE_PURCHASE_FKC (PURCHASE_FK), 
        add constraint CHOISE_PURCHASE_FKC 
        foreign key (PURCHASE_FK) 
        references PURCHASE (ID);

    alter table CHOISE 
        add index CHOISE_ITEM_FKC (ITEM_FK), 
        add constraint CHOISE_ITEM_FKC 
        foreign key (ITEM_FK) 
        references ITEM (ID);

    alter table DELIVERY_ADDRESS 
        add index DELIVERY_ADDRESS_PUBLIC_USER_C (PUBLIC_USER_FK), 
        add constraint DELIVERY_ADDRESS_PUBLIC_USER_C 
        foreign key (PUBLIC_USER_FK) 
        references PUBLIC_USER (ID);

    alter table DELIVERY_ADDRESS 
        add index DELIVERY_ADDRESS_PREFECTURE_FC (PREFECTURE_FK), 
        add constraint DELIVERY_ADDRESS_PREFECTURE_FC 
        foreign key (PREFECTURE_FK) 
        references PREFECTURE (ID);

    alter table DELIVERY_ADDRESS 
        add index DELIVERY_ADDRESS_GIFT_CARD_FKC (GIFT_CARD_FK), 
        add constraint DELIVERY_ADDRESS_GIFT_CARD_FKC 
        foreign key (GIFT_CARD_FK) 
        references GIFT_CARD (ID);

    alter table DELIVERY_ADDRESS_CHOISE 
        add index DELIVERY_ADDRESS_CHOISE_DELIVC (DELIVERY_ADDRESS_FK), 
        add constraint DELIVERY_ADDRESS_CHOISE_DELIVC 
        foreign key (DELIVERY_ADDRESS_FK) 
        references DELIVERY_ADDRESS (ID);

    alter table DELIVERY_ADDRESS_CHOISE 
        add index DELIVERY_ADDRESS_CHOISE_GIFT_C (GIFT_CARD_FK), 
        add constraint DELIVERY_ADDRESS_CHOISE_GIFT_C 
        foreign key (GIFT_CARD_FK) 
        references GIFT_CARD (ID);

    alter table DELIVERY_ADDRESS_CHOISE 
        add index DELIVERY_ADDRESS_CHOISE_CHOISC (CHOISE_FK), 
        add constraint DELIVERY_ADDRESS_CHOISE_CHOISC 
        foreign key (CHOISE_FK) 
        references CHOISE (ID);

    alter table ITEM 
        add index ITEM_CARRIAGE_FKC (CARRIAGE_FK), 
        add constraint ITEM_CARRIAGE_FKC 
        foreign key (CARRIAGE_FK) 
        references CARRIAGE (ID);

    alter table ITEM 
        add index ITEM_ZOOM_FKC (ZOOM_FK), 
        add constraint ITEM_ZOOM_FKC 
        foreign key (ZOOM_FK) 
        references ATTACHMENT (ID);

    alter table ITEM 
        add index ITEM_DEFAULTATTACHMENT_FKC (DEFAULTATTACHMENT_FK), 
        add constraint ITEM_DEFAULTATTACHMENT_FKC 
        foreign key (DEFAULTATTACHMENT_FK) 
        references ATTACHMENT (ID);

    alter table ITEM 
        add index ITEM_PRODUCT_FKC (PRODUCT_FK), 
        add constraint ITEM_PRODUCT_FKC 
        foreign key (PRODUCT_FK) 
        references PRODUCT (ID);

    alter table PRODUCT 
        add index PRODUCT_SLIDESHOW_FKC (SLIDESHOW_FK), 
        add constraint PRODUCT_SLIDESHOW_FKC 
        foreign key (SLIDESHOW_FK) 
        references ATTACHMENT (ID);

    alter table PRODUCT 
        add index PRODUCT_THUMNAIL_FKC (THUMNAIL_FK), 
        add constraint PRODUCT_THUMNAIL_FKC 
        foreign key (THUMNAIL_FK) 
        references ATTACHMENT (ID);

    alter table PRODUCT 
        add index PRODUCT_CATEGORY_FKC (CATEGORY_FK), 
        add constraint PRODUCT_CATEGORY_FKC 
        foreign key (CATEGORY_FK) 
        references CATEGORY (ID);

    alter table PUBLIC_USER 
        add index PUBLIC_USER_PREFECTURE_FKC (PREFECTURE_FK), 
        add constraint PUBLIC_USER_PREFECTURE_FKC 
        foreign key (PREFECTURE_FK) 
        references PREFECTURE (ID);

    alter table PURCHASE 
        add index PURCHASE_PUBLIC_USER_FKC (PUBLIC_USER_FK), 
        add constraint PURCHASE_PUBLIC_USER_FKC 
        foreign key (PUBLIC_USER_FK) 
        references PUBLIC_USER (ID);

    alter table PURCHASE 
        add index PURCHASE_PAYMENT_METHOD_FKC (PAYMENT_METHOD_FK), 
        add constraint PURCHASE_PAYMENT_METHOD_FKC 
        foreign key (PAYMENT_METHOD_FK) 
        references PAYMENT_METHOD (ID);

    alter table PAYMENT_STATUS 
        add index PAYMENT_STATUS_PURCHASE_FKC (PURCHASE_FK), 
        add constraint PAYMENT_STATUS_PURCHASE_FKC 
        foreign key (PURCHASE_FK) 
        references PURCHASE (ID);
        
	ALTER TABLE PREFECTURE_CARRIAGE
	    ADD INDEX PREFECTURE_CARRIAGE_FKC (PREFECTURE_FK), 
	    ADD CONSTRAINT PREFECTURE_CARRIAGE_FKC 
	    FOREIGN KEY (PREFECTURE_FK) 
	    REFERENCES PREFECTURE (ID);