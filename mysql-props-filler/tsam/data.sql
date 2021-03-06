insert into CODE_SYSTEM (ID,OID,NAME,DESCRIPTION)values (11,'2.16.840.1.113883.6.96','SNOMED-CT','Systematized Nomenclature of Medicine-Clinical Terms (maintained by IHTSDO)');
insert into CODE_SYSTEM (ID,OID,NAME,DESCRIPTION)values (12,'2.16.840.1.113883.6.1','LOINC','Logical Observation Identifiers Names and Codes');
insert into CODE_SYSTEM (ID,OID,NAME,DESCRIPTION)values (13,'2.16.840.1.113883.5.1','HL7:AdministrativeGender','HL7:AdministrativeGender');
insert into CODE_SYSTEM_VERSION (ID,FULL_NAME,LOCAL_NAME,PREVIOUS_VERSION_ID,CODE_SYSTEM_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION,COPYRIGHT,SOURCE)values (41,'SNOMED-CT July 2009','July 2009',null,11, TIMESTAMP'2010-01-20 00:00:00', TIMESTAMP '2009-07-01 00:00:00','retired', TIMESTAMP '2010-01-20 00:00:00','SNOMED-CT Release July 2009',null,'www.ihtsdo.org');
insert into CODE_SYSTEM_VERSION (ID,FULL_NAME,LOCAL_NAME,PREVIOUS_VERSION_ID,CODE_SYSTEM_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION,COPYRIGHT,SOURCE)values (42,'SNOMED-CT January 2010','January 2010',41,11, TIMESTAMP'2010-01-20 00:00:00', TIMESTAMP '2010-01-01 00:00:00','current', TIMESTAMP '2010-01-20 00:00:00','SNOMED-CT Release January 2010',null,'www.ihtsdo.org');
insert into CODE_SYSTEM_VERSION (ID,FULL_NAME,LOCAL_NAME,PREVIOUS_VERSION_ID,CODE_SYSTEM_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION,COPYRIGHT,SOURCE)values (43,'SNOMED-CT July 2010','July 2010',42,11,null, TIMESTAMP '2010-07-01 00:00:00','not in use', TIMESTAMP '2010-07-15 00:00:00','SNOMED-CT Release July 2010',null,'www.ihtsdo.org');
insert into CODE_SYSTEM_VERSION (ID,FULL_NAME,LOCAL_NAME,PREVIOUS_VERSION_ID,CODE_SYSTEM_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION,COPYRIGHT,SOURCE)values (44,'LOINC June 2009','June 2009',null,12, TIMESTAMP '2010-06-06 00:00:00', TIMESTAMP '2010-06-01 00:00:00','current', TIMESTAMP '2010-06-06 00:00:00','Last version of LOINC',null,'http://loinc.org/');
insert into CODE_SYSTEM_VERSION (ID,FULL_NAME,LOCAL_NAME,PREVIOUS_VERSION_ID,CODE_SYSTEM_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION,COPYRIGHT,SOURCE)values (45,'HL7:AdministrativeGender June 2009','June 2009',null,13, TIMESTAMP '2010-06-06 00:00:00', TIMESTAMP '2010-06-01 00:00:00','current', TIMESTAMP '2010-06-6 00:00:00','Last version of HL7:AdministrativeGender',null,' ');
insert into VALUE_SET (ID,OID,EPSOS_NAME,DESCRIPTION,PARENT_CODE_SYSTEM_ID)values (71,'1.3.6.1.4.1.12559.11.10.1.3.1.42.18','epSOSAdverseEventType','Types of adverse events and allergic reactions',11);
insert into VALUE_SET (ID,OID,EPSOS_NAME,DESCRIPTION,PARENT_CODE_SYSTEM_ID)values (72,'1.3.6.1.4.1.12559.11.10.1.3.1.42.21','epSOSBloodPressure','Blood pressure type',12);
insert into VALUE_SET (ID,OID,EPSOS_NAME,DESCRIPTION,PARENT_CODE_SYSTEM_ID)values (73,'2.16.840.1.113883.5.1','HL7:AdministrativeGender','HL7:AdministrativeGender',13);
insert into VALUE_SET (ID,OID,EPSOS_NAME,DESCRIPTION,PARENT_CODE_SYSTEM_ID)values (74,'epSOSCDAdocumentTypes','epSOSCDAdocumentTypes','CDA Document types',12);
insert into VALUE_SET_VERSION (ID,VERSION_NAME,PREVIOUS_VERSION_ID,VALUE_SET_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION)values (81,'MVC 1.0',null,71, TIMESTAMP '2010-05-05 00:00:00', TIMESTAMP '2010-05-01 00:00:00','current', TIMESTAMP '2010-05-05 00:00:00','Final version of MVC');
insert into VALUE_SET_VERSION (ID,VERSION_NAME,PREVIOUS_VERSION_ID,VALUE_SET_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION)values (82,'MVC 1.0',null,72, TIMESTAMP '2010-05-05 00:00:00', TIMESTAMP '2010-05-01 00:00:00','current', TIMESTAMP '2010-05-05 00:00:00','Final version of MVC');
insert into VALUE_SET_VERSION (ID,VERSION_NAME,PREVIOUS_VERSION_ID,VALUE_SET_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION)values (83,'MVC 1.0',null,73, TIMESTAMP '2010-05-05 00:00:00', TIMESTAMP '2010-05-01 00:00:00','current', TIMESTAMP '2010-05-05 00:00:00','Final version of MVC');
insert into VALUE_SET_VERSION (ID,VERSION_NAME,PREVIOUS_VERSION_ID,VALUE_SET_ID,EFFECTIVE_DATE,RELEASE_DATE,STATUS,STATUS_DATE,DESCRIPTION)values (84,'MVC 1.0',null,74, TIMESTAMP '2010-05-05 00:00:00', TIMESTAMP '2010-05-01 00:00:00','current', TIMESTAMP '2010-05-05 00:00:00','Final version of MVC');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (21,null,41,'419199007');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (22,null,41,'416098002');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (23,null,41,'59037007');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (24,null,44,'8462-4');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (25,null,44,'8480-6');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (26,null,42,'271649006');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (27,null,42,'271650006');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (28,null,42,'271650007');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (29,null,45,'M');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (30,null,45,'F');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (31,null,45,'U');-- code should be 'UN' - 'U' is because of testing
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (32,null,44,'60591-5');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (33,null,44,'57833-6');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (34,null,44,'60593-1');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (35,null,41,'160244002');
insert into CODE_SYSTEM_CONCEPT (ID,DEFINITION,CODE_SYSTEM_VERSION_ID,CODE)values (36,null,41,'57168000');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (51,'Allergy to substance',21,'en-US','Preferred Term',1,'current', TIMESTAMP '2010-01-20 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (52,'Drug allergy',22,'en-US','Preferred Term',1,'current', TIMESTAMP '2010-01-20 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (54,'INTRAVASCULAR DIASTOLIC',24,'en-GB',null,1,'current', TIMESTAMP '2010-06-06 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (55,'INTRAVASCULAR SYSTOLIC',25,'en-GB',null,1,'current', TIMESTAMP '2010-06-06 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (56,'Systolic blood pressure',26,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (57,'diastolický artériový tlak',27,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-12-24 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (58,'Diastolic blood pressure',27,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (59,'Male',29,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (60,'Female',30,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (61,'Undifferentiated ',31,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (62,'Mužské',29,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (63,'Ženské',30,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (64,'Nerozlíšené',31,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (65,'Diastolický artériový tlak',24,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (66,'PatientSummary',32,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (67,'ePrescription',33,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (68,'eDispensation',34,'en','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (69,'Pacientský sumár',32,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (70,'ePredpis',33,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into DESIGNATION (ID,DESIGNATION,CODE_SYSTEM_CONCEPT_ID,LANGUAGE_CODE,TYPE,IS_PREFERRED,STATUS,STATUS_DATE)values (71,'eDispenzácia',34,'sk-SK','Preferred Term',1,'current', TIMESTAMP '2009-07-01 00:00:00');
insert into TRANSCODING_ASSOCIATION (ID,SOURCE_CONCEPT_ID,TARGET_CONCEPT_ID,QUALITY,STATUS,STATUS_DATE)values (61,26,25,null,'valid', TIMESTAMP '2010-05-05 00:00:00');
insert into TRANSCODING_ASSOCIATION (ID,SOURCE_CONCEPT_ID,TARGET_CONCEPT_ID,QUALITY,STATUS,STATUS_DATE)values (62,27,24,null,'valid', TIMESTAMP '2010-05-05 00:00:00');
