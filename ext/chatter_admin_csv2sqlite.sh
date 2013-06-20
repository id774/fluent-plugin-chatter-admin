#!/bin/sh

test -n "$1" || exit 1

sqlite3 $1<<END
.separator ,
.headers on

create table feedposts (Id varchar,FeedItemId varchar,ParentId varchar,Type varchar,CreatedById varchar,CreatedDate datetime,SystemModstamp datetime,Title varchar,Body varchar,LinkUrl varchar,IsDeleted integer,ContentId varchar,RelatedRecordId varchar,InsertedById varchar);

create table users (Id varchar,Username varchar,FirstName varchar,LastName varchar,CompanyName varchar,Division varchar,Department varchar,Title varchar,Street varchar,City varchar,State varchar,PostalCode varchar,Country varchar,Email varchar,Phone varchar,Fax varchar,MobilePhone varchar,Alias varchar,CommunityNickname varchar,IsActive integer,TimeZoneSidKey varchar,UserRoleId varchar,LocaleSidKey varchar,ReceivesInfoEmails varchar,ReceivesAdminInfoEmails varchar,EmailEncodingKey varchar,ProfileId varchar,UserType varchar,UserSubtype varchar,StartDay datetime,EndDay datetime,LanguageLocaleKey varchar,EmployeeNumber varchar,DelegatedApproverId varchar,ManagerId varchar,LastLoginDate datetime,LastPasswordChangeDate datetime,CreatedDate datetime,CreatedById varchar,LastModifiedDate datetime,LastModifiedById varchar,SystemModstamp varchar,SuAccessExpirationDate datetime,SuOrgAdminExpirationDate datetime,OfflineTrialExpirationDate datetime,WirelessTrialExpirationDate datetime,OfflinePdaTrialExpirationDate datetime,ForecastEnabled varchar,ContactId varchar,AccountId varchar,CallCenterId varchar,Extension varchar,FederationIdentifier varchar,AboutMe varchar,LoginLimit varchar,ProfilePhotoId varchar,DigestFrequency varchar,DefaultGroupNotificationFrequency varchar,WorkspaceId varchar,SharingType varchar,ChatterAdoptionStage varchar,ChatterAdoptionStageModifiedDate varchar);

.import FeedPost.csv feedposts
.import User.csv users
END

