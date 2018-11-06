
CREATE TABLE public.identity
( 
	dateofbirth          date  NULL ,
	firstname            character varying(30)  NULL ,
	surname              character varying(50)  NULL ,
	placeofbirth         character varying(60)  NULL ,
	fullname             character varying(100)  NULL ,
	givennames           character varying(100)  NULL ,
	shortname            character varying(50)  NULL ,
	identityid           uuid  NOT NULL   DEFAULT  uuid_generate_v4(),
	estimatedyearofbirth integer  NULL ,
	personid             uuid  NULL ,
	religionid           integer  NULL ,
	ethnicityid          integer  NULL ,
	titleid              integer  NULL ,
	genderid             integer  NULL ,
	nationalityid        integer  NULL ,
	maritalid            integer  NULL ,
	addressid            uuid  NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_pkey PRIMARY KEY (identityid);

CREATE TABLE OAR_Cash_Records
( 
	OARCashRecordID      char(18)  NOT NULL ,
	count                char(18)  NULL ,
	5x5x5Referral        char(18)  NULL ,
	DogIndication        char(18)  NULL ,
	rfFinancialinstrumentID char(18)  NOT NULL ,
	rfCurrencyID         char(18)  NOT NULL ,
	amount               char(18)  NULL ,
	sterlingequivalent   char(18)  NULL ,
	referred             char(18)  NULL ,
	adopted              char(18)  NULL ,
	centaurref           char(18)  NULL ,
	seized               char(18)  NULL ,
	partneragencyid      char(18)  NOT NULL 
);

ALTER TABLE OAR_Cash_Records
	ADD CONSTRAINT XPKOAR_Cash_Records PRIMARY KEY (OARCashRecordID);

CREATE TABLE oar_consignee
( 
	consigneeid          char(18)  NOT NULL ,
	businessname         char(18)  NULL ,
	surname              char(18)  NULL ,
	forename             char(18)  NULL ,
	othernames           char(18)  NULL ,
	address              char(18)  NULL ,
	postcode             char(18)  NULL ,
	telnumber            char(18)  NULL 
);

ALTER TABLE oar_consignee
	ADD CONSTRAINT XPKoar_consignee PRIMARY KEY (consigneeid);

CREATE TABLE oar_consignor
( 
	consignorid          char(18)  NOT NULL ,
	businessname         char(18)  NULL ,
	surname              char(18)  NULL ,
	forenames            char(18)  NULL ,
	othernames           char(18)  NULL ,
	address              char(18)  NULL ,
	postcode             char(18)  NULL ,
	telnumber            char(18)  NULL 
);

ALTER TABLE oar_consignor
	ADD CONSTRAINT XPKoar_consignor PRIMARY KEY (consignorid);

CREATE TABLE oar_ct_passenger_details
( 
	passengerdetailsid   char(18)  NOT NULL ,
	surname              char(18)  NULL ,
	forename             char(18)  NULL ,
	othernames           char(18)  NULL ,
	DOB                  char(18)  NULL ,
	UKresident           char(18)  NULL ,
	forgery              char(18)  NULL ,
	egatesintercept      char(18)  NULL ,
	genderid             integer  NOT NULL ,
	countryid            character varying(2)  NOT NULL ,
	nationalityid        integer  NOT NULL ,
	ctreferraleventid    char(18)  NOT NULL 
);

ALTER TABLE oar_ct_passenger_details
	ADD CONSTRAINT XPKoar_ct_passenger_details PRIMARY KEY (passengerdetailsid);

CREATE TABLE oar_ct_referral_event
( 
	ctreferraleventid    char(18)  NOT NULL ,
	date                 char(18)  NULL ,
	workarea             char(18)  NULL ,
	rerralofficersname   char(18)  NULL ,
	additionalnotes      char(18)  NULL ,
	resultsofbehaviouralindictortr char(18)  NULL ,
	commandid            uuid  NOT NULL ,
	locationid           integer  NOT NULL ,
	referraltypeid       char(18)  NOT NULL ,
	indicatorsid         char(18)  NOT NULL 
);

ALTER TABLE oar_ct_referral_event
	ADD CONSTRAINT XPKoar_ct_referral_event PRIMARY KEY (ctreferraleventid);

CREATE TABLE oar_detection_details
( 
	ctreferraleventid    char(18)  NOT NULL ,
	detectionid          char(18)  NOT NULL ,
	load                 char(18)  NULL ,
	containernumber      char(18)  NULL ,
	trailernumber        char(18)  NULL ,
	description          char(18)  NULL ,
	quantity             char(18)  NULL ,
	detail               char(18)  NULL ,
	concelmentmethod     char(18)  NULL ,
	detecteditemsid      char(18)  NOT NULL ,
	outcomeid            char(18)  NOT NULL 
);

ALTER TABLE oar_detection_details
	ADD CONSTRAINT XPKoar_detection_details PRIMARY KEY (detectionid);

CREATE TABLE oar_fast_parcels_and_post_deta
( 
	fastparcelsandpostid char(18)  NOT NULL ,
	consignorid          char(18)  NOT NULL ,
	consigneeid          char(18)  NOT NULL ,
	ctreferraleventid    char(18)  NOT NULL 
);

ALTER TABLE oar_fast_parcels_and_post_deta
	ADD CONSTRAINT XPKoar_fast_Parcels_and_post_d PRIMARY KEY (fastparcelsandpostid);

CREATE TABLE oar_gradecount
( 
	OARgradecountid      char(18)  NOT NULL ,
	NumberofHOs          char(18)  NULL ,
	NumberofOs           char(18)  NULL ,
	NumberofAOs          char(18)  NULL ,
	NumberofSeasonalWorkers char(18)  NULL ,
	TotalNumberofPermanentStaff char(18)  NULL ,
	TotalNumberofStaff   char(18)  NULL ,
	TotalHoursWorkedHOs  char(18)  NULL ,
	TotalHoursworkedOs   char(18)  NULL ,
	TotalHoursWorkedAOs  char(18)  NULL ,
	TotalHoursWorkedSeasonal char(18)  NULL ,
	TotalShiftHours      char(18)  NULL 
);

ALTER TABLE oar_gradecount
	ADD CONSTRAINT XPKOAR_Grade_Count PRIMARY KEY (OARgradecountid);

CREATE TABLE oar_maritime_container_details
( 
	ctreferraleventid    char(18)  NOT NULL ,
	maritimecontainerid  char(18)  NOT NULL ,
	continaernumber      char(18)  NULL ,
	arrivaldate          char(18)  NULL ,
	cargodescrition      char(18)  NULL ,
	carrierid            char(18)  NOT NULL ,
	countryid            character varying(2)  NOT NULL ,
	consignorid          char(18)  NOT NULL ,
	consigneeid          char(18)  NOT NULL 
);

ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT XPKoar_maritime_container_deta PRIMARY KEY (maritimecontainerid);

CREATE TABLE OAR_Performance_at_Border
( 
	OARPerformanceatBorderID char(18)  NOT NULL ,
	rfexaminationtypeID  char(18)  NOT NULL ,
	rftargetcatid        char(18)  NOT NULL ,
	rfsearchcatid        char(18)  NOT NULL ,
	EC_Positive_Count    char(18)  NULL ,
	EC_Negative_Count    char(18)  NULL ,
	3C_Positive_Count    char(18)  NULL ,
	3C_Negative_Count    char(18)  NULL ,
	Chief_Self_Generated char(18)  NULL ,
	NCH_Abandonded       char(18)  NULL ,
	NCH_Strategic        char(18)  NULL ,
	NCH_Other            char(18)  NULL ,
	NCTS_Exam            char(18)  NULL 
);

ALTER TABLE OAR_Performance_at_Border
	ADD CONSTRAINT XPKOAR_Performance_at_Border PRIMARY KEY (OARPerformanceatBorderID);

CREATE TABLE OAR_Records
( 
	OARrecordID          char(18)  NOT NULL ,
	OARgradecountid      char(18)  NOT NULL ,
	OARStaffUtilsationID char(18)  NOT NULL ,
	OARPerformanceatBorderID char(18)  NOT NULL ,
	OARCashRecordID      char(18)  NOT NULL ,
	shifthistoryid       uuid  NOT NULL 
);

ALTER TABLE OAR_Records
	ADD CONSTRAINT XPKOAR_Records PRIMARY KEY (OARrecordID,shifthistoryid);

CREATE TABLE oar_roro_details
( 
	ctreferraleventid    char(18)  NOT NULL ,
	roroid               char(18)  NOT NULL ,
	direction            char(18)  NULL ,
	cargocmrdetails      char(18)  NULL ,
	vehiclenumber        char(18)  NULL ,
	hauliercompany       char(18)  NULL ,
	accompaniedload      char(18)  NULL ,
	countryid            character varying(2)  NOT NULL ,
	unlocodeid           uuid  NOT NULL ,
	consignorid          char(18)  NOT NULL ,
	consigneeid          char(18)  NOT NULL 
);

ALTER TABLE oar_roro_details
	ADD CONSTRAINT XPKoar_roro_details PRIMARY KEY (roroid);

CREATE TABLE OAR_Staff_Utilisation
( 
	OARStaffUtilsationID char(18)  NOT NULL ,
	timespent            char(18)  NULL 
);

ALTER TABLE OAR_Staff_Utilisation
	ADD CONSTRAINT XPKOAR_Staff_Utilsation PRIMARY KEY (OARStaffUtilsationID);

CREATE TABLE oar_travel_details
( 
	traveldetailsid      char(18)  NOT NULL ,
	direction            char(18)  NULL ,
	dateoftravel         char(18)  NULL ,
	flightnumber         char(18)  NULL ,
	countryid            character varying(2)  NOT NULL ,
	unlocodeid           uuid  NOT NULL ,
	carrierid            char(18)  NOT NULL ,
	passengerdetailsid   char(18)  NOT NULL 
);

ALTER TABLE oar_travel_details
	ADD CONSTRAINT XPKoar_travel_details PRIMARY KEY (traveldetailsid);

CREATE TABLE rf_carrier
( 
	carrierid            char(18)  NOT NULL ,
	carriername          char(18)  NULL 
);

ALTER TABLE rf_carrier
	ADD CONSTRAINT XPKrf_carrier PRIMARY KEY (carrierid);

CREATE TABLE public.rf_country
( 
	countryid            character varying(2)  NOT NULL ,
	iso31661alpha3       character varying(3)  NOT NULL ,
	name                 character varying(40)  NOT NULL ,
	continent            character varying(2)  NOT NULL ,
	dial                 character varying(20)  NULL ,
	iso31661numeric      integer  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_country
	ADD CONSTRAINT rf_country_pkey PRIMARY KEY (countryid);

CREATE TABLE rf_currency
( 
	rfCurrencyID         char(18)  NOT NULL ,
	country              char(18)  NULL ,
	currency             char(18)  NULL ,
	currencycode         char(18)  NULL 
);

ALTER TABLE rf_currency
	ADD CONSTRAINT XPKrf_Currency PRIMARY KEY (rfCurrencyID);

CREATE TABLE rf_deteteditems
( 
	detecteditemsid      char(18)  NOT NULL ,
	detecteditem         char(18)  NULL 
);

ALTER TABLE rf_deteteditems
	ADD CONSTRAINT XPKrf_deteteditems PRIMARY KEY (detecteditemsid);

CREATE TABLE rf_examinationtype
( 
	rfexaminationtypeID  char(18)  NOT NULL ,
	examinationtype      char(18)  NULL 
);

ALTER TABLE rf_examinationtype
	ADD CONSTRAINT XPKrf_examinationtype PRIMARY KEY (rfexaminationtypeID);

CREATE TABLE rf_financial_instrument_type
( 
	rfFinancialinstrumentID char(18)  NOT NULL ,
	typeoffinanacialinstrument char(18)  NULL ,
	description          char(18)  NULL 
);

ALTER TABLE rf_financial_instrument_type
	ADD CONSTRAINT XPKrf_commodity_type PRIMARY KEY (rfFinancialinstrumentID);

CREATE TABLE public.rf_gender
( 
	genderid             integer  NOT NULL ,
	gender               character varying(20)  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_gender
	ADD CONSTRAINT rf_gender_pkey PRIMARY KEY (genderid);

CREATE TABLE public.rf_grade
( 
	gradetypeid          uuid  NOT NULL ,
	gradename            character varying(60)  NOT NULL ,
	parentgradetypeid    uuid  NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_grade
	ADD CONSTRAINT rf_grade_pkey PRIMARY KEY (gradetypeid);

CREATE TABLE rf_indicators
( 
	indicatorsid         char(18)  NOT NULL 
);

ALTER TABLE rf_indicators
	ADD CONSTRAINT XPKrf_indicators PRIMARY KEY (indicatorsid);

CREATE TABLE public.rf_location
( 
	locationid           integer  NOT NULL ,
	locationname         character varying(50)  NOT NULL ,
	description          text  NULL ,
	unlocodeid           uuid  NULL ,
	addressid            uuid  NOT NULL ,
	geolat               numeric  NOT NULL ,
	geolong              numeric  NOT NULL ,
	icaoid               uuid  NULL ,
	bflocationtypeid     uuid  NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_location
	ADD CONSTRAINT rf_location_pkey PRIMARY KEY (locationid);

CREATE TABLE public.rf_nationality
( 
	nationalityid        integer  NOT NULL ,
	nationality          character varying(50)  NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_nationality
	ADD CONSTRAINT rf_nationality_pkey PRIMARY KEY (nationalityid);

CREATE TABLE public.rf_organisationcommand
( 
	commandname          character varying(50)  NULL ,
	commandcode          character varying(10)  NULL ,
	parentcommandid      uuid  NULL ,
	commandid            uuid  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_organisationcommand
	ADD CONSTRAINT rf_organisationcommand_pkey PRIMARY KEY (commandid);

CREATE TABLE rf_outcome
( 
	outcomeid            char(18)  NOT NULL ,
	outcomename          char(18)  NULL 
);

ALTER TABLE rf_outcome
	ADD CONSTRAINT XPKrf_outcome PRIMARY KEY (outcomeid);

CREATE TABLE rf_partneragency
( 
	partneragencyid      char(18)  NOT NULL ,
	partneragencyname    char(18)  NULL ,
	partneragencyabbreviatedname char(18)  NULL ,
	seizure              char(18)  NULL ,
	disclosure           char(18)  NULL ,
	intellligence        char(18)  NULL ,
	referralfrom         char(18)  NULL ,
	referralto           char(18)  NULL 
);

ALTER TABLE rf_partneragency
	ADD CONSTRAINT XPKrf_partneragency PRIMARY KEY (partneragencyid);

CREATE TABLE rf_referraltype
( 
	referraltypeid       char(18)  NOT NULL 
);

ALTER TABLE rf_referraltype
	ADD CONSTRAINT XPKrf_referraltype PRIMARY KEY (referraltypeid);

CREATE TABLE rf_searchcountcat
( 
	rfsearchcatid        char(18)  NOT NULL ,
	searchtypecount      char(18)  NULL 
);

ALTER TABLE rf_searchcountcat
	ADD CONSTRAINT XPKrf_searchcountcat PRIMARY KEY (rfsearchcatid);

CREATE TABLE rf_targetcat
( 
	rftargetcatid        char(18)  NOT NULL ,
	category_level       char(18)  NULL 
);

ALTER TABLE rf_targetcat
	ADD CONSTRAINT XPKrf_targetcat PRIMARY KEY (rftargetcatid);

CREATE TABLE public.rf_unlocode
( 
	unlocodeid           uuid  NOT NULL ,
	countryid            character varying(2)  NOT NULL ,
	unlogeolong          numeric  NULL ,
	unlogeolat           numeric  NULL ,
	name                 character varying(80)  NOT NULL ,
	namewodiacritics     character varying(80)  NOT NULL ,
	iata                 character varying(3)  NULL ,
	locode               character varying(3)  NOT NULL ,
	seaport              boolean  NOT NULL ,
	railterminal         boolean  NOT NULL ,
	airport              boolean  NOT NULL ,
	postexchange         boolean  NOT NULL ,
	multimodal           boolean  NOT NULL ,
	fixedtransport       boolean  NOT NULL ,
	bordercrossing       boolean  NOT NULL ,
	subdivision          character varying(3)  NULL ,
	roadterminal         boolean  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.rf_unlocode
	ADD CONSTRAINT rf_unlocode_pkey PRIMARY KEY (unlocodeid);

CREATE TABLE public.shift
( 
	shiftid              uuid  NOT NULL   DEFAULT  uuid_generate_v4(),
	email                character varying(60)  NOT NULL ,
	enddatetime          timestamp(6) without time zone  NOT NULL ,
	attributes           json  NULL ,
	shifthours           smallint  NOT NULL ,
	shiftminutes         smallint  NOT NULL ,
	startdatetime        timestamp(6) without time zone  NOT NULL ,
	staffid              uuid  NOT NULL ,
	teamid               uuid  NOT NULL ,
	locationid           integer  NOT NULL ,
	commandid            uuid  NOT NULL ,
	subcommandid         uuid  NULL ,
	shifthistoryid       uuid  NOT NULL ,
	phone                character varying(20)  NOT NULL ,
	currentlocationid    integer  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.shift
	ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);

CREATE TABLE public.shifthistory
( 
	shifthistoryid       uuid  NOT NULL   DEFAULT  uuid_generate_v4(),
	startdatetime        timestamp(6) without time zone  NOT NULL ,
	enddatetime          timestamp(6) without time zone  NOT NULL ,
	teamid               uuid  NOT NULL ,
	staffid              uuid  NOT NULL ,
	locationid           integer  NOT NULL ,
	commandid            uuid  NOT NULL ,
	currentlocationid    integer  NOT NULL ,
	email                character varying(60)  NOT NULL ,
	phone                character varying(20)  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistory_pkey PRIMARY KEY (shifthistoryid);

CREATE TABLE public.staff
( 
	staffid              uuid  NOT NULL   DEFAULT  uuid_generate_v4(),
	identityid           uuid  NOT NULL ,
	email                character varying(60)  NOT NULL ,
	gradetypeid          uuid  NULL ,
	phone                character varying(20)  NOT NULL ,
	defaultteamid        uuid  NULL ,
	defaultlocationid    integer  NULL ,
	defaultcommandid     uuid  NULL ,
	defaultsubcommandid  uuid  NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.staff
	ADD CONSTRAINT staff_pkey PRIMARY KEY (staffid);

CREATE UNIQUE INDEX staff_email_unique ON public.staff USING btree
( 
	email    COLLATE pg_catalog.Collation_5717 ASC
);

CREATE TABLE public.team
( 
	teamid               uuid  NOT NULL ,
	teamname             character varying(100)  NOT NULL ,
	teamcode             character varying(100)  NOT NULL ,
	description          text  NULL ,
	costcentrecode       character varying(50)  NULL ,
	parentteamid         uuid  NULL ,
	locationid           integer  NOT NULL ,
	commandid            uuid  NOT NULL ,
	bffunctiontypeid     uuid  NOT NULL 
)
TABLESPACE pg_default;

ALTER TABLE public.team
	ADD CONSTRAINT team_pkey PRIMARY KEY (teamid);


ALTER TABLE public.identity
	ADD CONSTRAINT identity_addressid_fkey FOREIGN KEY (addressid) REFERENCES address(addressid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_ethnicityid_fkey FOREIGN KEY (ethnicityid) REFERENCES rf_ethnicity(ethnicityid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_genderid_fkey FOREIGN KEY (genderid) REFERENCES rf_gender(genderid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_maritalid_fkey FOREIGN KEY (maritalid) REFERENCES rf_marital(maritalid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_nationalityid_fkey FOREIGN KEY (nationalityid) REFERENCES rf_nationality(nationalityid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_religionid_fkey FOREIGN KEY (religionid) REFERENCES rf_religion(religionid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identity_titleid_fkey FOREIGN KEY (titleid) REFERENCES rf_title(titleid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity
	ADD CONSTRAINT identitypersonid FOREIGN KEY (personid) REFERENCES person(personid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.identity OWNER TO postgres;


ALTER TABLE OAR_Cash_Records
	ADD CONSTRAINT R_102 FOREIGN KEY (rfFinancialinstrumentID) REFERENCES rf_financial_instrument_type(rfFinancialinstrumentID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Cash_Records
	ADD CONSTRAINT R_103 FOREIGN KEY (rfCurrencyID) REFERENCES rf_currency(rfCurrencyID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Cash_Records
	ADD CONSTRAINT R_115 FOREIGN KEY (partneragencyid) REFERENCES rf_partneragency(partneragencyid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_ct_passenger_details
	ADD CONSTRAINT R_121 FOREIGN KEY (genderid) REFERENCES rf_gender(genderid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_passenger_details
	ADD CONSTRAINT R_122 FOREIGN KEY (countryid) REFERENCES rf_country(countryid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_passenger_details
	ADD CONSTRAINT R_123 FOREIGN KEY (nationalityid) REFERENCES rf_nationality(nationalityid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_passenger_details
	ADD CONSTRAINT R_129 FOREIGN KEY (ctreferraleventid) REFERENCES oar_ct_referral_event(ctreferraleventid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_ct_referral_event
	ADD CONSTRAINT R_117 FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_referral_event
	ADD CONSTRAINT R_118 FOREIGN KEY (locationid) REFERENCES rf_location(locationid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_referral_event
	ADD CONSTRAINT R_119 FOREIGN KEY (referraltypeid) REFERENCES rf_referraltype(referraltypeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_ct_referral_event
	ADD CONSTRAINT R_120 FOREIGN KEY (indicatorsid) REFERENCES rf_indicators(indicatorsid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_detection_details
	ADD CONSTRAINT R_134 FOREIGN KEY (ctreferraleventid) REFERENCES oar_ct_referral_event(ctreferraleventid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_detection_details
	ADD CONSTRAINT R_143 FOREIGN KEY (detecteditemsid) REFERENCES rf_deteteditems(detecteditemsid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_detection_details
	ADD CONSTRAINT R_144 FOREIGN KEY (outcomeid) REFERENCES rf_outcome(outcomeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_fast_parcels_and_post_deta
	ADD CONSTRAINT R_128 FOREIGN KEY (consignorid) REFERENCES oar_consignor(consignorid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_fast_parcels_and_post_deta
	ADD CONSTRAINT R_127 FOREIGN KEY (consigneeid) REFERENCES oar_consignee(consigneeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_fast_parcels_and_post_deta
	ADD CONSTRAINT R_132 FOREIGN KEY (ctreferraleventid) REFERENCES oar_ct_referral_event(ctreferraleventid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT R_131 FOREIGN KEY (ctreferraleventid) REFERENCES oar_ct_referral_event(ctreferraleventid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT R_135 FOREIGN KEY (carrierid) REFERENCES rf_carrier(carrierid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT R_136 FOREIGN KEY (countryid) REFERENCES rf_country(countryid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT R_137 FOREIGN KEY (consignorid) REFERENCES oar_consignor(consignorid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_maritime_container_details
	ADD CONSTRAINT R_138 FOREIGN KEY (consigneeid) REFERENCES oar_consignee(consigneeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE OAR_Performance_at_Border
	ADD CONSTRAINT R_111 FOREIGN KEY (rfexaminationtypeID) REFERENCES rf_examinationtype(rfexaminationtypeID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Performance_at_Border
	ADD CONSTRAINT R_112 FOREIGN KEY (rftargetcatid) REFERENCES rf_targetcat(rftargetcatid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Performance_at_Border
	ADD CONSTRAINT R_113 FOREIGN KEY (rfsearchcatid) REFERENCES rf_searchcountcat(rfsearchcatid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE OAR_Records
	ADD CONSTRAINT R_104 FOREIGN KEY (OARgradecountid) REFERENCES oar_gradecount(OARgradecountid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Records
	ADD CONSTRAINT R_107 FOREIGN KEY (OARStaffUtilsationID) REFERENCES OAR_Staff_Utilisation(OARStaffUtilsationID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Records
	ADD CONSTRAINT R_108 FOREIGN KEY (OARPerformanceatBorderID) REFERENCES OAR_Performance_at_Border(OARPerformanceatBorderID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Records
	ADD CONSTRAINT R_109 FOREIGN KEY (OARCashRecordID) REFERENCES OAR_Cash_Records(OARCashRecordID)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE OAR_Records
	ADD CONSTRAINT R_110 FOREIGN KEY (shifthistoryid) REFERENCES shifthistory(shifthistoryid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_roro_details
	ADD CONSTRAINT R_133 FOREIGN KEY (ctreferraleventid) REFERENCES oar_ct_referral_event(ctreferraleventid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_roro_details
	ADD CONSTRAINT R_139 FOREIGN KEY (countryid) REFERENCES rf_country(countryid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_roro_details
	ADD CONSTRAINT R_140 FOREIGN KEY (unlocodeid) REFERENCES rf_unlocode(unlocodeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_roro_details
	ADD CONSTRAINT R_141 FOREIGN KEY (consignorid) REFERENCES oar_consignor(consignorid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_roro_details
	ADD CONSTRAINT R_142 FOREIGN KEY (consigneeid) REFERENCES oar_consignee(consigneeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE oar_travel_details
	ADD CONSTRAINT R_124 FOREIGN KEY (countryid) REFERENCES rf_country(countryid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_travel_details
	ADD CONSTRAINT R_125 FOREIGN KEY (unlocodeid) REFERENCES rf_unlocode(unlocodeid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_travel_details
	ADD CONSTRAINT R_126 FOREIGN KEY (carrierid) REFERENCES rf_carrier(carrierid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE oar_travel_details
	ADD CONSTRAINT R_130 FOREIGN KEY (passengerdetailsid) REFERENCES oar_ct_passenger_details(passengerdetailsid)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;


ALTER TABLE public.rf_country OWNER TO postgres;


ALTER TABLE public.rf_gender OWNER TO postgres;


ALTER TABLE public.rf_grade OWNER TO postgres;


ALTER TABLE public.rf_location
	ADD CONSTRAINT locationunlocodeid FOREIGN KEY (unlocodeid) REFERENCES rf_unlocode(unlocodeid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_location
	ADD CONSTRAINT rf_location_bflocationtypeid_f FOREIGN KEY (bflocationtypeid) REFERENCES rf_bflocationtype(bflocationtypeid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_location
	ADD CONSTRAINT rf_location_icaoid_fkey FOREIGN KEY (icaoid) REFERENCES rf_icao(icaoid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_location
	ADD CONSTRAINT rf_locationaddressid FOREIGN KEY (addressid) REFERENCES address(addressid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_location OWNER TO postgres;


ALTER TABLE public.rf_nationality OWNER TO postgres;


ALTER TABLE public.rf_organisationcommand
	ADD CONSTRAINT rf_organisationcommand_parentc FOREIGN KEY (parentcommandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_organisationcommand OWNER TO postgres;


ALTER TABLE public.rf_unlocode
	ADD CONSTRAINT rf_unlocode_countryid_fkey FOREIGN KEY (countryid) REFERENCES rf_country(countryid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.rf_unlocode OWNER TO postgres;


ALTER TABLE public.shift
	ADD CONSTRAINT currentlocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shift_commandid_fkey FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT currentlocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shift_shifthistoryid_fkey FOREIGN KEY (shifthistoryid) REFERENCES shifthistory(shifthistoryid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shift_subcommandid_fkey FOREIGN KEY (subcommandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shiftcommandid FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shiftlocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shiftstaffid FOREIGN KEY (staffid) REFERENCES staff(staffid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift
	ADD CONSTRAINT shiftteamid FOREIGN KEY (teamid) REFERENCES team(teamid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shift OWNER TO postgres;


ALTER TABLE public.shifthistory
	ADD CONSTRAINT currentlocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT currentlocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistory_commandid_fkey FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistorycommandid FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistorylocationid FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistorystaffid FOREIGN KEY (staffid) REFERENCES staff(staffid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory
	ADD CONSTRAINT shifthistoryteamid FOREIGN KEY (teamid) REFERENCES team(teamid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.shifthistory OWNER TO postgres;


ALTER TABLE public.staff
	ADD CONSTRAINT staff_defaultcommandid_fkey FOREIGN KEY (defaultcommandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.staff
	ADD CONSTRAINT staff_defaultsubcommandid_fkey FOREIGN KEY (defaultsubcommandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.staff
	ADD CONSTRAINT staff_gradetypeid_fkey FOREIGN KEY (gradetypeid) REFERENCES rf_grade(gradetypeid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.staff
	ADD CONSTRAINT staff_identityid_fkey FOREIGN KEY (identityid) REFERENCES identity(identityid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.staff OWNER TO postgres;


ALTER TABLE public.team
	ADD CONSTRAINT team_bffunctiontypeid_fkey FOREIGN KEY (bffunctiontypeid) REFERENCES rf_bffunctiontypes(bffunctiontypeid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.team
	ADD CONSTRAINT team_commandid_fkey FOREIGN KEY (commandid) REFERENCES rf_organisationcommand(commandid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.team
	ADD CONSTRAINT team_locationid_fkey FOREIGN KEY (locationid) REFERENCES rf_location(locationid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.team
	ADD CONSTRAINT team_parentteamid_fkey FOREIGN KEY (parentteamid) REFERENCES team(teamid) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION;

ALTER TABLE public.team OWNER TO postgres;

CREATE FUNCTION public.uuid_nil() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_nil'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_nil()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_ns_dns() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_ns_dns'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_ns_dns()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_ns_url() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_ns_url'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_ns_url()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_ns_oid() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_ns_oid'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_ns_oid()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_ns_x500() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_ns_x500'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_ns_x500()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_generate_v1() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_generate_v1'
LANGUAGE c VOLATILE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_generate_v1()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_generate_v1mc() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_generate_v1mc'
LANGUAGE c VOLATILE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_generate_v1mc()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_generate_v3(IN namespace uuid, IN name text) 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_generate_v3'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_generate_v3(uuid, text)
	OWNER TO postgres;

CREATE FUNCTION public.uuid_generate_v4() 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_generate_v4'
LANGUAGE c VOLATILE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_generate_v4()
	OWNER TO postgres;

CREATE FUNCTION public.uuid_generate_v5(IN namespace uuid, IN name text) 
RETURNS uuid AS 
'$libdir/uuid-ossp', 'uuid_generate_v5'
LANGUAGE c IMMUTABLE NOT LEAKPROOF STRICT SECURITY INVOKER PARALLEL SAFE
COST 1;

ALTER FUNCTION public.uuid_generate_v5(uuid, text)
	OWNER TO postgres;

CREATE FUNCTION public.incidentdates(IN startparam timestamp without time zone, IN endparam timestamp without time zone)
RETURNS TABLE(title character varying, start timestamp without time zone, locationname character varying, geolat numeric, geolong numeric, incidentid uuid) AS $$BEGIN
  RETURN QUERY
  WITH RECURSIVE subordinates AS
  (
      SELECT
        incident.incidentcode AS title,
        date_trunc('day', incident.createdon) AS start,
        rf_location.locationname AS locationname,
        rf_location.geolat,
        rf_location.geolong,
        incident.incidentid AS incidentid
      FROM incident, rf_location
      WHERE
        incident.createdon >= startparam
        AND incident.createdon <= endparam
        AND incident.locationid = rf_location.locationid
      GROUP BY
        start,
        title,
        rf_location.locationname,
        rf_location.geolat,
        rf_location.geolong,
        incident.incidentid
  ) SELECT *
    FROM subordinates;
END;$$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF SECURITY INVOKER PARALLEL UNSAFE
COST 100
ROWS 1000;

ALTER FUNCTION public.incidentdates(timestamp without time zone, timestamp without time zone)
	OWNER TO postgres;

CREATE FUNCTION public.incidentreport(IN code character varying)
RETURNS TABLE(locationname character varying, safe boolean, medicalassistance boolean, peoplecount integer, firstname character varying, surname character varying, email character varying, phone character varying, responded boolean) AS $$BEGIN
  RETURN QUERY
  WITH RECURSIVE subordinates AS
  (
      SELECT
        rf_location.locationname,
        incidentresponses.safe,
        incidentresponses.medicalassistance,
        incidentresponses.peoplecount,
        identity.firstname,
        identity.surname,
        incidentresponses.email,
        incidentresponses.phone,
        incidentresponses.responded
      FROM incident, rf_location, incidentresponses, identity, staff
      WHERE incidentresponses.incidentid = uuid(code)
            AND incident.locationid = rf_location.locationid
            AND incident.incidentid = incidentresponses.incidentid
            AND incidentresponses.notificationrecipient = staff.staffid
            AND staff.identityid = identity.identityid
      GROUP BY incident.notificationcount,
        rf_location.locationname,
        incidentresponses.safe,
        incidentresponses.medicalassistance,
        incidentresponses.peoplecount,
        identity.firstname,
        identity.surname,
        incidentresponses.email,
        incidentresponses.phone,
        incidentresponses.responded
  ) SELECT *
    FROM subordinates;
  END;$$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF SECURITY INVOKER PARALLEL UNSAFE
COST 100
ROWS 1000;

ALTER FUNCTION public.incidentreport(character varying)
	OWNER TO postgres;

CREATE FUNCTION public.teamchildren(IN id uuid)
RETURNS TABLE(teamid uuid, parentteamid uuid, teamname character varying, teamcode character varying) AS $$BEGIN
  RETURN QUERY
  WITH RECURSIVE subordinates AS
  (
    SELECT
      team.teamid,
      team.parentteamid,
      team.teamname,
      team.teamcode
    FROM team
    WHERE team.teamid = id
    UNION ALL
    SELECT
      team.teamid,
      team.parentteamid,
      team.teamname,
      team.teamcode
    FROM team, subordinates
    WHERE team.parentteamid = subordinates.teamid
  ) SELECT *
    FROM subordinates
  ;
END;$$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF SECURITY INVOKER PARALLEL UNSAFE
COST 100
ROWS 1000;

ALTER FUNCTION public.teamchildren(uuid)
	OWNER TO postgres;

CREATE FUNCTION public.teamfunction(IN id uuid)
RETURNS TABLE(teamid uuid, teamname character varying, bffunction character varying) AS $$BEGIN
  RETURN QUERY
  SELECT
    team.teamid,
    team.teamname,
    rf_bffunctiontypes.bffunction
  FROM
    team,
    rf_bffunctiontypes
  WHERE
    team.teamid = id
  AND
    team.bffunctiontypeid = rf_bffunctiontypes.bffunctiontypeid;
END;$$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF SECURITY INVOKER PARALLEL UNSAFE
COST 100
ROWS 1000;

ALTER FUNCTION public.teamfunction(uuid)
	OWNER TO postgres;

CREATE FUNCTION public.teamshift(IN params_id uuid, IN params_startdatetime timestamp without time zone, IN params_enddatetime timestamp without time zone)
RETURNS TABLE(teamid uuid, staffid uuid, phone character varying, email character varying, teamname character varying, teamcode character varying, startdatetime timestamp without time zone, enddatetime timestamp without time zone, locationid integer, locationname character varying) AS $$BEGIN
  RETURN QUERY
  WITH RECURSIVE subordinates AS
  (
    SELECT
      shifthistory.teamid,
      shifthistory.staffid,
      shift.phone,
      staff.email,
      team.teamname,
      team.teamcode,
      shifthistory.startdatetime,
      shifthistory.enddatetime,
      rf_location.locationid,
      rf_location.locationname
    FROM team, staff, shift, shifthistory, rf_location
    WHERE team.teamid = params_id
      AND
        team.teamid = shift.teamid
      AND
        team.teamid = shifthistory.teamid
      AND
        shifthistory.staffid = staff.staffid
      AND
        shifthistory.locationid = rf_location.locationid
      AND
        shifthistory.startdatetime >= params_startdatetime
      AND
        shifthistory.enddatetime <= params_enddatetime
  ) SELECT *
    FROM subordinates;
  END;$$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF SECURITY INVOKER PARALLEL UNSAFE
COST 100
ROWS 1000;

ALTER FUNCTION public.teamshift(uuid, timestamp without time zone, timestamp without time zone)
	OWNER TO postgres;


CREATE OR REPLACE FUNCTION before_insert_tD_identity AFTER DELETE ON public."identity" for each row
EXECUTE PROCEDURE aft_delete_tD_identity();

CREATE  TRIGGER tI_identity BEFORE INSERT ON identity for each row
-- erwin Builtin Trigger
-- INSERT trigger on identity 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* person  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00084061", PARENT_OWNER="", PARENT_TABLE="person"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identitypersonid", FK_COLUMNS="personid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.personid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM person
            WHERE
              /* %JoinFKPK( %New,person," = "," AND") */
               new.personid = person.personid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_title  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_title"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_titleid_fkey", FK_COLUMNS="titleid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.titleid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_title
            WHERE
              /* %JoinFKPK( %New,rf_title," = "," AND") */
               new.titleid = rf_title.titleid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_religion  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_religion"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_religionid_fkey", FK_COLUMNS="religionid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.religionid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_religion
            WHERE
              /* %JoinFKPK( %New,rf_religion," = "," AND") */
               new.religionid = rf_religion.religionid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_nationality  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.nationalityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_nationality
            WHERE
              /* %JoinFKPK( %New,rf_nationality," = "," AND") */
               new.nationalityid = rf_nationality.nationalityid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_marital  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_marital"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_marita() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* identity  staff on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0004d23c", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" */
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
        /*  %JoinFKPK(staff, %Old," = "," AND") */
        staff.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE identity because staff exists.';
    END IF;

     * erwin Builtin Trigger * 
     * identity  passenger on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="passenger"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="passenger_identityid_fkey", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM passenger
      WHERE
         *  %JoinFKPK(passenger, %Old," = "," AND") * 
        passenger.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE identity because passenger exists.';
    END IF;

     * erwin Builtin Trigger * 
     * identity  eventpeople on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="eventpeople"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="eventpeoplepersonid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM eventpeople
      WHERE
         *  %JoinFKPK(eventpeople, %Old," = "," AND") * 
        eventpeople.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because eventpeople exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * identity  doghistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="doghistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="doghistorypersonid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM doghistory
      WHERE
         *  %JoinFKPK(doghistory, %Old," = "," AND") * 
        doghistory.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because doghistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * identity  document on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="document"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="documentidentityid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM document
      WHERE
         *  %JoinFKPK(document, %Old," = "," AND") * 
        document.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because document exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_identity AFTER DELETE ON public."identity" for each row
EXECUTE PROCEDURE aft_delete_tD_identity();

CREATE  TRIGGER tI_identity BEFORE INSERT ON identity for each row
-- erwin Builtin Trigger
-- INSERT trigger on identity 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * person  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00084061", PARENT_OWNER="", PARENT_TABLE="person"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identitypersonid", FK_COLUMNS="personid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.personid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM person
            WHERE
               * %JoinFKPK( %New,person," = "," AND") * 
               new.personid = person.personid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_title  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_title"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_titleid_fkey", FK_COLUMNS="titleid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.titleid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_title
            WHERE
               * %JoinFKPK( %New,rf_title," = "," AND") * 
               new.titleid = rf_title.titleid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_religion  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_religion"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_religionid_fkey", FK_COLUMNS="religionid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.religionid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_religion
            WHERE
               * %JoinFKPK( %New,rf_religion," = "," AND") * 
               new.religionid = rf_religion.religionid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_nationality  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.nationalityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_nationality
            WHERE
               * %JoinFKPK( %New,rf_nationality," = "," AND") * 
               new.nationalityid = rf_nationality.nationalityid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_marital  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_marital"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_maritalid_fkey", FK_COLUMNS="maritalid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.maritalid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_marital
            WHERE
               * %JoinFKPK( %New,rf_marital," = "," AND") * 
               new.maritalid = rf_marital.maritalid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_gender  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_genderid_fkey", FK_COLUMNS="genderid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.genderid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_gender
            WHERE
               * %JoinFKPK( %New,rf_gender," = "," AND") * 
               new.genderid = rf_gender.genderid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * rf_ethnicity  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_ethnicity"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_ethnicityid_fkey", FK_COLUMNS="ethnicityid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.ethnicityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_ethnicity
            WHERE
               * %JoinFKPK( %New,rf_ethnicity," = "," AND") * 
               new.ethnicityid = rf_ethnicity.ethnicityid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;

     * erwin Builtin Trigger * 
     * address  identity on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_addressid_fkey", FK_COLUMNS="addressid" * 
    UPDATE identity
      SET
         * %SetFK(identity,NULL) * 
        identity.addressid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM address
            WHERE
               * %JoinFKPK( %New,address," = "," AND") * 
               new.addressid = address.addressid
        ) 
         * %JoinPKPK(identity, %New," = "," AND") * 
        identity.identityid =  new.identityid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_identity() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* identity  staff on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0004d23c", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" */
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
        /*  %JoinFKPK(staff, %Old," = "," AND") */
        staff.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE identity because staff exists.';
    END IF;

     * erwin Builtin Trigger * 
     * identity  passenger on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="passenger"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="passenger_identityid_fkey", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM passenger
      WHERE
         *  %JoinFKPK(passenger, %Old," = "," AND") * 
        passenger.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because passenger exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * identity  eventpeople on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="eventpeople"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="eventpeoplepersonid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM eventpeople
      WHERE
         *  %JoinFKPK(eventpeople, %Old," = "," AND") * 
        eventpeople.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because eventpeople exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * identity  doghistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="doghistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="doghistorypersonid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM doghistory
      WHERE
         *  %JoinFKPK(doghistory, %Old," = "," AND") * 
        doghistory.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because doghistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * identity  document on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="document"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="documentidentityid", FK_COLUMNS="identityid" * 
    SELECT count(*) INTO NUMROWS
      FROM document
      WHERE
         *  %JoinFKPK(document, %Old," = "," AND") * 
        document.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE identity because document exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_identity AFTER DELETE ON public."identity"" for each row
EXECUTE PROCEDURE before_insert_tD_identity AFTER DELETE ON public."identity" for each row
EXECUTE PROCEDURE aft_delete_tD_identity();

CREATE  TRIGGER tI_identity BEFORE INSERT ON identity for each row
-- erwin Builtin Trigger
-- INSERT trigger on identity 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* person  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00084061", PARENT_OWNER="", PARENT_TABLE="person"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identitypersonid", FK_COLUMNS="personid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.personid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM person
            WHERE
              /* %JoinFKPK( %New,person," = "," AND") */
               new.personid = person.personid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_title  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_title"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_titleid_fkey", FK_COLUMNS="titleid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.titleid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_title
            WHERE
              /* %JoinFKPK( %New,rf_title," = "," AND") */
               new.titleid = rf_title.titleid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_religion  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_religion"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_religionid_fkey", FK_COLUMNS="religionid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.religionid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_religion
            WHERE
              /* %JoinFKPK( %New,rf_religion," = "," AND") */
               new.religionid = rf_religion.religionid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_nationality  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" */
    UPDATE identity
      SET
        /* %SetFK(identity,NULL) */
        identity.nationalityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_nationality
            WHERE
              /* %JoinFKPK( %New,rf_nationality," = "," AND") */
               new.nationalityid = rf_nationality.nationalityid
        ) 
        /* %JoinPKPK(identity, %New," = "," AND") */
        identity.identityid =  new.identityid;

    /* erwin Builtin Trigger */
    /* rf_marital  identity on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_marital"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_marita();


CREATE OR REPLACE FUNCTION aft_update_U_identity() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* identity  staff on parent update no action */
  /* ERWIN_RELATION CHECKSUM="000acdfe", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.identityid <>  new.identityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
        /*  %JoinFKPK(staff, %Old," = "," AND") */
        staff.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update identity because staff exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * identity  passenger on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="passenger"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="passenger_identityid_fkey", FK_COLUMNS="identityid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.identityid <>  new.identityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM passenger
      WHERE
         *  %JoinFKPK(passenger, %Old," = "," AND") * 
        passenger.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update identity because passenger exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * identity  eventpeople on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="eventpeople"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="eventpeoplepersonid", FK_COLUMNS="identityid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.identityid <>  new.identityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM eventpeople
      WHERE
         *  %JoinFKPK(eventpeople, %Old," = "," AND") * 
        eventpeople.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update identity because eventpeople exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * identity  doghistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="doghistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="doghistorypersonid", FK_COLUMNS="identityid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.identityid <>  new.identityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM doghistory
      WHERE
         *  %JoinFKPK(doghistory, %Old," = "," AND") * 
        doghistory.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update identity because doghistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * identity  document on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="document"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="documentidentityid", FK_COLUMNS="identityid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.identityid <>  new.identityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM document
      WHERE
         *  %JoinFKPK(document, %Old," = "," AND") * 
        document.identityid =  old.identityid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update identity because document exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * person  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="person"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identitypersonid", FK_COLUMNS="personid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_title  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_title"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_titleid_fkey", FK_COLUMNS="titleid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_religion  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_religion"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_religionid_fkey", FK_COLUMNS="religionid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_nationality  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_marital  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_marital"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_maritalid_fkey", FK_COLUMNS="maritalid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_gender  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_genderid_fkey", FK_COLUMNS="genderid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_ethnicity  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_ethnicity"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_ethnicityid_fkey", FK_COLUMNS="ethnicityid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * address  identity on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_addressid_fkey", FK_COLUMNS="addressid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_identity AFTER UPDATE ON public."identity" for each row
EXECUTE PROCEDURE aft_update_U_identity();



CREATE OR REPLACE FUNCTION before_insert_tD_OAR_Cash_Records AFTER DELETE ON public."OAR_Cash_Records" for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Cash_Records();

CREATE  TRIGGER tI_OAR_Cash_Records BEFORE INSERT ON OAR_Cash_Records for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Cash_Records 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_partneragency  OAR_Cash_Records on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039b3d", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_partneragency
      WHERE
        /* %JoinFKPK( %New,rf_partneragency," = "," AND") */
         new.partneragencyid = rf_partneragency.partneragencyid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OAR_Cash_Records  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000e6a5", PARENT_OWNER="", PARENT_TABLE="OAR_Cash_Records"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="OARCashRecordID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARCashRecordID =  old.OARCashRecordID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete OAR_Cash_Records because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_OAR_Cash_Records AFTER DELETE ON public."OAR_Cash_Records" for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Cash_Records();

CREATE  TRIGGER tI_OAR_Cash_Records BEFORE INSERT ON OAR_Cash_Records for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Cash_Records 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_partneragency  OAR_Cash_Records on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039b3d", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_partneragency
      WHERE
        /* %JoinFKPK( %New,rf_partneragency," = "," AND") */
         new.partneragencyid = rf_partneragency.partneragencyid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert OAR_Cash_Records because rf_partneragency does not exist.';

CREATE  TRIGGER tI_OAR_Cash_Records BEFORE INSERT ON OAR_Cash_Records for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Cash_Records 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * rf_partneragency  OAR_Cash_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00039b3d", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_partneragency
      WHERE
         * %JoinFKPK( %New,rf_partneragency," = "," AND") * 
         new.partneragencyid = rf_partneragency.partneragencyid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Cash_Records because rf_partneragency does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_currency  OAR_Cash_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_currency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_103", FK_COLUMNS="rfCurrencyID" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_currency
      WHERE
         * %JoinFKPK( %New,rf_currency," = "," AND") * 
         new.rfCurrencyID = rf_currency.rfCurrencyID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Cash_Records because rf_currency does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_financial_instrument_type  OAR_Cash_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_financial_instrument_type"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_102", FK_COLUMNS="rfFinancialinstrumentID" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_financial_instrument_type
      WHERE
         * %JoinFKPK( %New,rf_financial_instrument_type," = "," AND") * 
         new.rfFinancialinstrumentID = rf_financial_instrument_type.rfFinancialinstrumentID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Cash_Records because rf_financial_instrument_type does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_OAR_Cash_Records() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OAR_Cash_Records  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000e6a5", PARENT_OWNER="", PARENT_TABLE="OAR_Cash_Records"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="OARCashRecordID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARCashRecordID =  old.OARCashRecordID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete OAR_Cash_Records because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_OAR_Cash_Records AFTER DELETE ON public."OAR_Cash_Records"" for each row
EXECUTE PROCEDURE before_insert_tD_OAR_Cash_Records AFTER DELETE ON public."OAR_Cash_Records" for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Cash_Records();

CREATE  TRIGGER tI_OAR_Cash_Records BEFORE INSERT ON OAR_Cash_Records for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Cash_Records 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_partneragency  OAR_Cash_Records on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039b3d", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_partneragency
      WHERE
        /* %JoinFKPK( %New,rf_partneragency," = "," AND") */
         new.partneragencyid = rf_partneragency.partneragencyid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
();


CREATE OR REPLACE FUNCTION aft_update_U_OAR_Cash_Records() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OAR_Cash_Records  OAR_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0004bcb4", PARENT_OWNER="", PARENT_TABLE="OAR_Cash_Records"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="OARCashRecordID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.OARCashRecordID <>  new.OARCashRecordID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARCashRecordID =  old.OARCashRecordID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update OAR_Cash_Records because OAR_Records exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_partneragency  OAR_Cash_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_partneragency
    WHERE
       * %JoinFKPK( %New,rf_partneragency," = "," AND") * 
       new.partneragencyid = rf_partneragency.partneragencyid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Cash_Records because rf_partneragency does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_currency  OAR_Cash_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_currency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_103", FK_COLUMNS="rfCurrencyID" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_currency
    WHERE
       * %JoinFKPK( %New,rf_currency," = "," AND") * 
       new.rfCurrencyID = rf_currency.rfCurrencyID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Cash_Records because rf_currency does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_financial_instrument_type  OAR_Cash_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_financial_instrument_type"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_102", FK_COLUMNS="rfFinancialinstrumentID" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_financial_instrument_type
    WHERE
       * %JoinFKPK( %New,rf_financial_instrument_type," = "," AND") * 
       new.rfFinancialinstrumentID = rf_financial_instrument_type.rfFinancialinstrumentID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Cash_Records because rf_financial_instrument_type does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_OAR_Cash_Records AFTER UPDATE ON public."OAR_Cash_Records" for each row
EXECUTE PROCEDURE aft_update_U_OAR_Cash_Records();



CREATE OR REPLACE FUNCTION aft_delete_tD_oar_consignee() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_consignee  oar_roro_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00035d7d", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_142", FK_COLUMNS="consigneeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_consignee because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignee  oar_maritime_container_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_138", FK_COLUMNS="consigneeid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_consignee because oar_maritime_container_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignee  oar_fast_parcels_and_post_deta on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_127", FK_COLUMNS="consigneeid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_consignee because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_consignee AFTER DELETE ON public."oar_consignee" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_consignee();


CREATE OR REPLACE FUNCTION aft_update_U_oar_consignee() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_consignee  oar_roro_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0003ea25", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_142", FK_COLUMNS="consigneeid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.consigneeid <>  new.consigneeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update oar_consignee because oar_roro_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignee  oar_maritime_container_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_138", FK_COLUMNS="consigneeid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.consigneeid <>  new.consigneeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_consignee because oar_maritime_container_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignee  oar_fast_parcels_and_post_deta on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_127", FK_COLUMNS="consigneeid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.consigneeid <>  new.consigneeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.consigneeid =  old.consigneeid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_consignee because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_consignee AFTER UPDATE ON public."oar_consignee" for each row
EXECUTE PROCEDURE aft_update_U_oar_consignee();



CREATE OR REPLACE FUNCTION aft_delete_tD_oar_consignor() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_consignor  oar_roro_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00036b84", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_141", FK_COLUMNS="consignorid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_consignor because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignor  oar_maritime_container_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_137", FK_COLUMNS="consignorid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_consignor because oar_maritime_container_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignor  oar_fast_parcels_and_post_deta on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_128", FK_COLUMNS="consignorid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_consignor because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_consignor AFTER DELETE ON public."oar_consignor" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_consignor();


CREATE OR REPLACE FUNCTION aft_update_U_oar_consignor() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_consignor  oar_roro_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0003e5bb", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_141", FK_COLUMNS="consignorid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.consignorid <>  new.consignorid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update oar_consignor because oar_roro_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignor  oar_maritime_container_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_137", FK_COLUMNS="consignorid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.consignorid <>  new.consignorid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_consignor because oar_maritime_container_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignor  oar_fast_parcels_and_post_deta on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_128", FK_COLUMNS="consignorid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.consignorid <>  new.consignorid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.consignorid =  old.consignorid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_consignor because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_consignor AFTER UPDATE ON public."oar_consignor" for each row
EXECUTE PROCEDURE aft_update_U_oar_consignor();



CREATE OR REPLACE FUNCTION before_insert_tD_oar_ct_passenger_details AFTER DELETE ON public."oar_ct_passenger_details" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_passenger_details();

CREATE  TRIGGER tI_oar_ct_passenger_details BEFORE INSERT ON oar_ct_passenger_details for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_passenger_details 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_ct_passenger_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="000495a1", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /* %JoinFKPK( %New,oar_ct_referral_event," = "," AND") */
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
    () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_passenger_details  oar_travel_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011320", PARENT_OWNER="", PARENT_TABLE="oar_ct_passenger_details"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="passengerdetailsid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
        /*  %JoinFKPK(oar_travel_details, %Old," = "," AND") */
        oar_travel_details.passengerdetailsid =  old.passengerdetailsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_ct_passenger_details because oar_travel_details exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_ct_passenger_details AFTER DELETE ON public."oar_ct_passenger_details" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_passenger_details();

CREATE  TRIGGER tI_oar_ct_passenger_details BEFORE INSERT ON oar_ct_passenger_details for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_passenger_details 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_ct_passenger_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="000495a1", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /* %JoinFKPK( %New,oar_ct_referral_event," = "," AND") */
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_ct_passenger_details because oar_ct_referral_event does not exist.';

CREATE  TRIGGER tI_oar_ct_passenger_details BEFORE INSERT ON oar_ct_passenger_details for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_passenger_details 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_ct_passenger_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="000495a1", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
         * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_passenger_details because oar_ct_referral_event does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_nationality  oar_ct_passenger_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="nationalityid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_nationality
      WHERE
         * %JoinFKPK( %New,rf_nationality," = "," AND") * 
         new.nationalityid = rf_nationality.nationalityid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_passenger_details because rf_nationality does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_ct_passenger_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_country
      WHERE
         * %JoinFKPK( %New,rf_country," = "," AND") * 
         new.countryid = rf_country.countryid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_passenger_details because rf_country does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_gender  oar_ct_passenger_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_121", FK_COLUMNS="genderid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_gender
      WHERE
         * %JoinFKPK( %New,rf_gender," = "," AND") * 
         new.genderid = rf_gender.genderid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_passenger_details because rf_gender does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_oar_ct_passenger_details() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_passenger_details  oar_travel_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011320", PARENT_OWNER="", PARENT_TABLE="oar_ct_passenger_details"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="passengerdetailsid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
        /*  %JoinFKPK(oar_travel_details, %Old," = "," AND") */
        oar_travel_details.passengerdetailsid =  old.passengerdetailsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_ct_passenger_details because oar_travel_details exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_ct_passenger_details AFTER DELETE ON public."oar_ct_passenger_details"" for each row
EXECUTE PROCEDURE before_insert_tD_oar_ct_passenger_details AFTER DELETE ON public."oar_ct_passenger_details" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_passenger_details();

CREATE  TRIGGER tI_oar_ct_passenger_details BEFORE INSERT ON oar_ct_passenger_details for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_passenger_details 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_ct_passenger_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="000495a1", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /* %JoinFKPK( %New,oar_ct_referral_event," = "," AND") */
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
    ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_ct_passenger_details() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_ct_passenger_details  oar_travel_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0005df9b", PARENT_OWNER="", PARENT_TABLE="oar_ct_passenger_details"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="passengerdetailsid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.passengerdetailsid <>  new.passengerdetailsid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
        /*  %JoinFKPK(oar_travel_details, %Old," = "," AND") */
        oar_travel_details.passengerdetailsid =  old.passengerdetailsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update oar_ct_passenger_details because oar_travel_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_ct_passenger_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_referral_event
    WHERE
       * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
       new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_passenger_details because oar_ct_referral_event does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_nationality  oar_ct_passenger_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="nationalityid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_nationality
    WHERE
       * %JoinFKPK( %New,rf_nationality," = "," AND") * 
       new.nationalityid = rf_nationality.nationalityid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_passenger_details because rf_nationality does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_ct_passenger_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="countryid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_country
    WHERE
       * %JoinFKPK( %New,rf_country," = "," AND") * 
       new.countryid = rf_country.countryid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_passenger_details because rf_country does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_gender  oar_ct_passenger_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_121", FK_COLUMNS="genderid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_gender
    WHERE
       * %JoinFKPK( %New,rf_gender," = "," AND") * 
       new.genderid = rf_gender.genderid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_passenger_details because rf_gender does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_ct_passenger_details AFTER UPDATE ON public."oar_ct_passenger_details" for each row
EXECUTE PROCEDURE aft_update_U_oar_ct_passenger_details();



CREATE OR REPLACE FUNCTION before_insert_tD_oar_ct_referral_event AFTER DELETE ON public."oar_ct_referral_event" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_referral_event();

CREATE  TRIGGER tI_oar_ct_referral_event BEFORE INSERT ON oar_ct_referral_event for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_referral_event 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_indicators  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="0004a9e9", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_indicators
      WHERE
        /* %JoinFKPK( %New,rf_indicators," = "," AND") */
         new.indicatorsid = rf_indicators.indicatorsid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_indicators does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_referraltype  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_referraltype
      WHERE
        /* %JoinFKPK( %New,rf_referraltype," = "," AND") */
         new.referraltypeid = rf_referraltype.referraltypeid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_referraltype does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_location  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
        /* %JoinFKPK( %New,rf_location," = "," AND") */
         new.locationid = rf_location.locationid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_location does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
        /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
         new.commandid = rf_organisationcommand.commandid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_organisationcommand does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_detection_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0006175b", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_134", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_ct_referral_event because oar_detection_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_roro_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_133", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
         *  %JoinFKPK(oar_roro_details, %Old," = "," AND") * 
        oar_roro_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_ct_referral_event because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_fast_parcels_and_post_deta on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_132", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_maritime_container_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_maritime_container_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_ct_passenger_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
         *  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") * 
        oar_ct_passenger_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_ct_passenger_details exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_ct_referral_event AFTER DELETE ON public."oar_ct_referral_event" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_referral_event();

CREATE  TRIGGER tI_oar_ct_referral_event BEFORE INSERT ON oar_ct_referral_event for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_referral_event 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * rf_indicators  oar_ct_referral_event on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="0004a9e9", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_indicators
      WHERE
         * %JoinFKPK( %New,rf_indicators," = "," AND") * 
         new.indicatorsid = rf_indicators.indicatorsid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_indicators does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_referraltype  oar_ct_referral_event on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_referraltype
      WHERE
         * %JoinFKPK( %New,rf_referraltype," = "," AND") * 
         new.referraltypeid = rf_referraltype.referraltypeid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_referraltype does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  oar_ct_referral_event on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
         * %JoinFKPK( %New,rf_location," = "," AND") * 
         new.locationid = rf_location.locationid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_location does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  oar_ct_referral_event on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
         * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
         new.commandid = rf_organisationcommand.commandid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_organisationcommand does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_oar_ct_referral_event() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_detection_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0006175b", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_134", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_ct_referral_event because oar_detection_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_roro_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_133", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
         *  %JoinFKPK(oar_roro_details, %Old," = "," AND") * 
        oar_roro_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_roro_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_fast_parcels_and_post_deta on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_132", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_maritime_container_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_maritime_container_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_ct_passenger_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
         *  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") * 
        oar_ct_passenger_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete oar_ct_referral_event because oar_ct_passenger_details exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_ct_referral_event AFTER DELETE ON public."oar_ct_referral_event"" for each row
EXECUTE PROCEDURE before_insert_tD_oar_ct_referral_event AFTER DELETE ON public."oar_ct_referral_event" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_ct_referral_event();

CREATE  TRIGGER tI_oar_ct_referral_event BEFORE INSERT ON oar_ct_referral_event for each row
-- erwin Builtin Trigger
-- INSERT trigger on oar_ct_referral_event 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_indicators  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="0004a9e9", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_indicators
      WHERE
        /* %JoinFKPK( %New,rf_indicators," = "," AND") */
         new.indicatorsid = rf_indicators.indicatorsid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_indicators does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_referraltype  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_referraltype
      WHERE
        /* %JoinFKPK( %New,rf_referraltype," = "," AND") */
         new.referraltypeid = rf_referraltype.referraltypeid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_referraltype does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_location  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
        /* %JoinFKPK( %New,rf_location," = "," AND") */
         new.locationid = rf_location.locationid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_location does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  oar_ct_referral_event on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
        /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
         new.commandid = rf_organisationcommand.commandid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_ct_referral_event because rf_organisationcommand does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/();


CREATE OR REPLACE FUNCTION aft_update_U_oar_ct_referral_event() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_ct_referral_event  oar_detection_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000bb465", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_134", FK_COLUMNS="ctreferraleventid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.ctreferraleventid <>  new.ctreferraleventid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update oar_ct_referral_event because oar_detection_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_roro_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_133", FK_COLUMNS="ctreferraleventid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.ctreferraleventid <>  new.ctreferraleventid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
         *  %JoinFKPK(oar_roro_details, %Old," = "," AND") * 
        oar_roro_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_ct_referral_event because oar_roro_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_fast_parcels_and_post_deta on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_132", FK_COLUMNS="ctreferraleventid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.ctreferraleventid <>  new.ctreferraleventid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_fast_parcels_and_post_deta
      WHERE
         *  %JoinFKPK(oar_fast_parcels_and_post_deta, %Old," = "," AND") * 
        oar_fast_parcels_and_post_deta.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_ct_referral_event because oar_fast_parcels_and_post_deta exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_maritime_container_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="ctreferraleventid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.ctreferraleventid <>  new.ctreferraleventid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_ct_referral_event because oar_maritime_container_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_ct_passenger_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_129", FK_COLUMNS="ctreferraleventid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.ctreferraleventid <>  new.ctreferraleventid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
         *  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") * 
        oar_ct_passenger_details.ctreferraleventid =  old.ctreferraleventid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update oar_ct_referral_event because oar_ct_passenger_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_indicators  oar_ct_referral_event on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_indicators
    WHERE
       * %JoinFKPK( %New,rf_indicators," = "," AND") * 
       new.indicatorsid = rf_indicators.indicatorsid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_referral_event because rf_indicators does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_referraltype  oar_ct_referral_event on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_referraltype
    WHERE
       * %JoinFKPK( %New,rf_referraltype," = "," AND") * 
       new.referraltypeid = rf_referraltype.referraltypeid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_referral_event because rf_referraltype does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  oar_ct_referral_event on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_location
    WHERE
       * %JoinFKPK( %New,rf_location," = "," AND") * 
       new.locationid = rf_location.locationid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_referral_event because rf_location does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  oar_ct_referral_event on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_organisationcommand
    WHERE
       * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
       new.commandid = rf_organisationcommand.commandid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_ct_referral_event because rf_organisationcommand does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_ct_referral_event AFTER UPDATE ON public."oar_ct_referral_event" for each row
EXECUTE PROCEDURE aft_update_U_oar_ct_referral_event();



CREATE OR REPLACE FUNCTION before_insert_I_oar_detection_details () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_outcome  oar_detection_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00038681", PARENT_OWNER="", PARENT_TABLE="rf_outcome"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_144", FK_COLUMNS="outcomeid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_outcome
      WHERE
        /* %JoinFKPK( %New,rf_outcome," = "," AND") */
         new.outcomeid = rf_outcome.outcomeid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_detection_details because rf_outcome does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_deteteditems  oar_detection_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_deteteditems"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_143", FK_COLUMNS="detecteditemsid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_deteteditems
      WHERE
         * %JoinFKPK( %New,rf_deteteditems," = "," AND") * 
         new.detecteditemsid = rf_deteteditems.detecteditemsid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_detection_details because rf_deteteditems does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_detection_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_134", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
         * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_detection_details because oar_ct_referral_event does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_oar_detection_details BEFORE INSERT ON public."oar_detection_details" for each row
EXECUTE PROCEDURE before_insert_I_oar_detection_details ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_detection_details() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_outcome  oar_detection_details on child update restrict */
  /* ERWIN_RELATION CHECKSUM="00037c2d", PARENT_OWNER="", PARENT_TABLE="rf_outcome"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_144", FK_COLUMNS="outcomeid" */
  SELECT count(*) INTO NUMROWS
    FROM rf_outcome
    WHERE
      /* %JoinFKPK( %New,rf_outcome," = "," AND") */
       new.outcomeid = rf_outcome.outcomeid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update oar_detection_details because rf_outcome does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * rf_deteteditems  oar_detection_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_deteteditems"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_143", FK_COLUMNS="detecteditemsid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_deteteditems
    WHERE
       * %JoinFKPK( %New,rf_deteteditems," = "," AND") * 
       new.detecteditemsid = rf_deteteditems.detecteditemsid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_detection_details because rf_deteteditems does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_detection_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_134", FK_COLUMNS="ctreferraleventid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_referral_event
    WHERE
       * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
       new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_detection_details because oar_ct_referral_event does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_detection_details AFTER UPDATE ON public."oar_detection_details" for each row
EXECUTE PROCEDURE aft_update_U_oar_detection_details();



CREATE OR REPLACE FUNCTION before_insert_I_oar_fast_parcels_and_post_d () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_referral_event  oar_fast_parcels_and_post_deta on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039596", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_132", FK_COLUMNS="ctreferraleventid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /* %JoinFKPK( %New,oar_ct_referral_event," = "," AND") */
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_fast_parcels_and_post_deta because oar_ct_referral_event does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignor  oar_fast_parcels_and_post_deta on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_128", FK_COLUMNS="consignorid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_consignor
      WHERE
         * %JoinFKPK( %New,oar_consignor," = "," AND") * 
         new.consignorid = oar_consignor.consignorid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_fast_parcels_and_post_deta because oar_consignor does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignee  oar_fast_parcels_and_post_deta on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_127", FK_COLUMNS="consigneeid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_consignee
      WHERE
         * %JoinFKPK( %New,oar_consignee," = "," AND") * 
         new.consigneeid = oar_consignee.consigneeid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_fast_parcels_and_post_deta because oar_consignee does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_oar_fast_parcels_and_post_d BEFORE INSERT ON public."oar_fast_parcels_and_post_deta" for each row
EXECUTE PROCEDURE before_insert_I_oar_fast_parcels_and_post_d ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_fast_parcels_and_post_d() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_ct_referral_event  oar_fast_parcels_and_post_deta on child update restrict */
  /* ERWIN_RELATION CHECKSUM="0003970e", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_132", FK_COLUMNS="ctreferraleventid" */
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_referral_event
    WHERE
      /* %JoinFKPK( %New,oar_ct_referral_event," = "," AND") */
       new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update oar_fast_parcels_and_post_deta because oar_ct_referral_event does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignor  oar_fast_parcels_and_post_deta on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_128", FK_COLUMNS="consignorid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_consignor
    WHERE
       * %JoinFKPK( %New,oar_consignor," = "," AND") * 
       new.consignorid = oar_consignor.consignorid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_fast_parcels_and_post_deta because oar_consignor does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignee  oar_fast_parcels_and_post_deta on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_fast_parcels_and_post_deta"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_127", FK_COLUMNS="consigneeid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_consignee
    WHERE
       * %JoinFKPK( %New,oar_consignee," = "," AND") * 
       new.consigneeid = oar_consignee.consigneeid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_fast_parcels_and_post_deta because oar_consignee does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_fast_parcels_and_post_d AFTER UPDATE ON public."oar_fast_parcels_and_post_deta" for each row
EXECUTE PROCEDURE aft_update_U_oar_fast_parcels_and_post_d();



CREATE OR REPLACE FUNCTION aft_delete_tD_oar_gradecount() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_gradecount  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000f63e", PARENT_OWNER="", PARENT_TABLE="oar_gradecount"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_104", FK_COLUMNS="OARgradecountid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARgradecountid =  old.OARgradecountid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete oar_gradecount because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_oar_gradecount AFTER DELETE ON public."oar_gradecount" for each row
EXECUTE PROCEDURE aft_delete_tD_oar_gradecount();


CREATE OR REPLACE FUNCTION aft_update_U_oar_gradecount() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_gradecount  OAR_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00011c66", PARENT_OWNER="", PARENT_TABLE="oar_gradecount"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_104", FK_COLUMNS="OARgradecountid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.OARgradecountid <>  new.OARgradecountid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARgradecountid =  old.OARgradecountid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update oar_gradecount because OAR_Records exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_gradecount AFTER UPDATE ON public."oar_gradecount" for each row
EXECUTE PROCEDURE aft_update_U_oar_gradecount();



CREATE OR REPLACE FUNCTION before_insert_I_oar_maritime_container_deta () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_consignee  oar_maritime_container_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="0005f989", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_138", FK_COLUMNS="consigneeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_consignee
      WHERE
        /* %JoinFKPK( %New,oar_consignee," = "," AND") */
         new.consigneeid = oar_consignee.consigneeid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_maritime_container_details because oar_consignee does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignor  oar_maritime_container_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_137", FK_COLUMNS="consignorid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_consignor
      WHERE
         * %JoinFKPK( %New,oar_consignor," = "," AND") * 
         new.consignorid = oar_consignor.consignorid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_maritime_container_details because oar_consignor does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_maritime_container_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_136", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_country
      WHERE
         * %JoinFKPK( %New,rf_country," = "," AND") * 
         new.countryid = rf_country.countryid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_maritime_container_details because rf_country does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_carrier  oar_maritime_container_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_135", FK_COLUMNS="carrierid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_carrier
      WHERE
         * %JoinFKPK( %New,rf_carrier," = "," AND") * 
         new.carrierid = rf_carrier.carrierid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_maritime_container_details because rf_carrier does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_maritime_container_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
         * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_maritime_container_details because oar_ct_referral_event does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_oar_maritime_container_deta BEFORE INSERT ON public."oar_maritime_container_details" for each row
EXECUTE PROCEDURE before_insert_I_oar_maritime_container_deta ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_maritime_container_deta() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_consignee  oar_maritime_container_details on child update restrict */
  /* ERWIN_RELATION CHECKSUM="0005d4d0", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_138", FK_COLUMNS="consigneeid" */
  SELECT count(*) INTO NUMROWS
    FROM oar_consignee
    WHERE
      /* %JoinFKPK( %New,oar_consignee," = "," AND") */
       new.consigneeid = oar_consignee.consigneeid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update oar_maritime_container_details because oar_consignee does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignor  oar_maritime_container_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_137", FK_COLUMNS="consignorid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_consignor
    WHERE
       * %JoinFKPK( %New,oar_consignor," = "," AND") * 
       new.consignorid = oar_consignor.consignorid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_maritime_container_details because oar_consignor does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_maritime_container_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_136", FK_COLUMNS="countryid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_country
    WHERE
       * %JoinFKPK( %New,rf_country," = "," AND") * 
       new.countryid = rf_country.countryid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_maritime_container_details because rf_country does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_carrier  oar_maritime_container_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_135", FK_COLUMNS="carrierid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_carrier
    WHERE
       * %JoinFKPK( %New,rf_carrier," = "," AND") * 
       new.carrierid = rf_carrier.carrierid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_maritime_container_details because rf_carrier does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_maritime_container_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="ctreferraleventid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_referral_event
    WHERE
       * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
       new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_maritime_container_details because oar_ct_referral_event does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_maritime_container_deta AFTER UPDATE ON public."oar_maritime_container_details" for each row
EXECUTE PROCEDURE aft_update_U_oar_maritime_container_deta();



CREATE OR REPLACE FUNCTION before_insert_tD_OAR_Pe"rformance_at_Border AFTER DELETE ON public."OAR_Performance_at_Border for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Performance_at_Border();

CREATE  TRIGGER tI_OAR_Performance_at_Border BEFORE INSERT ON OAR_Performance_at_Border for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Performance_at_Border 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_searchcountcat  OAR_Performance_at_Border on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039449", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_searchcountcat
      WHERE
        /* %JoinFKPK( %New,rf_searchcountcat," = "," AND") */
         new.rfsearchcatid = rf_searchcountcat.rfsearchcatid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Can() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OAR_Performance_at_Border  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00010577", PARENT_OWNER="", PARENT_TABLE="OAR_Performance_at_Border"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="OARPerformanceatBorderID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARPerformanceatBorderID =  old.OARPerformanceatBorderID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete OAR_Performance_at_Border because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_OAR_Pe"rformance_at_Border AFTER DELETE ON public."OAR_Performance_at_Border for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Performance_at_Border();

CREATE  TRIGGER tI_OAR_Performance_at_Border BEFORE INSERT ON OAR_Performance_at_Border for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Performance_at_Border 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_searchcountcat  OAR_Performance_at_Border on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039449", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_searchcountcat
      WHERE
        /* %JoinFKPK( %New,rf_searchcountcat," = "," AND") */
         new.rfsearchcatid = rf_searchcountcat.rfsearchcatid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert OAR_Performance_at_Border because rf_searchcountcat does not exist.';

CREATE  TRIGGER tI_OAR_Performance_at_Border BEFORE INSERT ON OAR_Performance_at_Border for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Performance_at_Border 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * rf_searchcountcat  OAR_Performance_at_Border on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00039449", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_searchcountcat
      WHERE
         * %JoinFKPK( %New,rf_searchcountcat," = "," AND") * 
         new.rfsearchcatid = rf_searchcountcat.rfsearchcatid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Performance_at_Border because rf_searchcountcat does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_targetcat  OAR_Performance_at_Border on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_targetcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="rftargetcatid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_targetcat
      WHERE
         * %JoinFKPK( %New,rf_targetcat," = "," AND") * 
         new.rftargetcatid = rf_targetcat.rftargetcatid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Performance_at_Border because rf_targetcat does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_examinationtype  OAR_Performance_at_Border on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_examinationtype"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="rfexaminationtypeID" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_examinationtype
      WHERE
         * %JoinFKPK( %New,rf_examinationtype," = "," AND") * 
         new.rfexaminationtypeID = rf_examinationtype.rfexaminationtypeID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Performance_at_Border because rf_examinationtype does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_OAR_Pe"rformance_at_Border() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OAR_Performance_at_Border  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00010577", PARENT_OWNER="", PARENT_TABLE="OAR_Performance_at_Border"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="OARPerformanceatBorderID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARPerformanceatBorderID =  old.OARPerformanceatBorderID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete OAR_Performance_at_Border because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_OAR_Pe"rformance_at_Border AFTER DELETE ON public."OAR_Performance_at_Border for each row
EXECUTE PROCEDURE before_insert_tD_OAR_Pe"rformance_at_Border AFTER DELETE ON public."OAR_Performance_at_Border for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Performance_at_Border();

CREATE  TRIGGER tI_OAR_Performance_at_Border BEFORE INSERT ON OAR_Performance_at_Border for each row
-- erwin Builtin Trigger
-- INSERT trigger on OAR_Performance_at_Border 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_searchcountcat  OAR_Performance_at_Border on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00039449", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" */
    SELECT count(*) INTO NUMROWS
      FROM rf_searchcountcat
      WHERE
        /* %JoinFKPK( %New,rf_searchcountcat," = "," AND") */
         new.rfsearchcatid = rf_searchcountcat.rfsearchcatid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Can();


CREATE OR REPLACE FUNCTION aft_update_U_OAR_Performance_at_Border() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OAR_Performance_at_Border  OAR_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0004f273", PARENT_OWNER="", PARENT_TABLE="OAR_Performance_at_Border"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="OARPerformanceatBorderID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.OARPerformanceatBorderID <>  new.OARPerformanceatBorderID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARPerformanceatBorderID =  old.OARPerformanceatBorderID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update OAR_Performance_at_Border because OAR_Records exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_searchcountcat  OAR_Performance_at_Border on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_searchcountcat
    WHERE
       * %JoinFKPK( %New,rf_searchcountcat," = "," AND") * 
       new.rfsearchcatid = rf_searchcountcat.rfsearchcatid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Performance_at_Border because rf_searchcountcat does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_targetcat  OAR_Performance_at_Border on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_targetcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="rftargetcatid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_targetcat
    WHERE
       * %JoinFKPK( %New,rf_targetcat," = "," AND") * 
       new.rftargetcatid = rf_targetcat.rftargetcatid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Performance_at_Border because rf_targetcat does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_examinationtype  OAR_Performance_at_Border on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_examinationtype"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="rfexaminationtypeID" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_examinationtype
    WHERE
       * %JoinFKPK( %New,rf_examinationtype," = "," AND") * 
       new.rfexaminationtypeID = rf_examinationtype.rfexaminationtypeID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Performance_at_Border because rf_examinationtype does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_OAR_Pe"rformance_at_Border AFTER UPDATE ON public."OAR_Performance_at_Border for each row
EXECUTE PROCEDURE aft_update_U_OAR_Performance_at_Border();



CREATE OR REPLACE FUNCTION before_insert_I_OAR_Records () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* shifthistory  OAR_Records on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="0005d9f8", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="shifthistoryid" */
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
        /* %JoinFKPK( %New,shifthistory," = "," AND") */
         new.shifthistoryid = shifthistory.shifthistoryid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert OAR_Records because shifthistory does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * OAR_Cash_Records  OAR_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Cash_Records"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="OARCashRecordID" * 
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
         * %JoinFKPK( %New,OAR_Cash_Records," = "," AND") * 
         new.OARCashRecordID = OAR_Cash_Records.OARCashRecordID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Records because OAR_Cash_Records does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * OAR_Performance_at_Border  OAR_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Performance_at_Border"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="OARPerformanceatBorderID" * 
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
         * %JoinFKPK( %New,OAR_Performance_at_Border," = "," AND") * 
         new.OARPerformanceatBorderID = OAR_Performance_at_Border.OARPerformanceatBorderID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Records because OAR_Performance_at_Border does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * OAR_Staff_Utilisation  OAR_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Staff_Utilisation"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_107", FK_COLUMNS="OARStaffUtilsationID" * 
    SELECT count(*) INTO NUMROWS
      FROM OAR_Staff_Utilisation
      WHERE
         * %JoinFKPK( %New,OAR_Staff_Utilisation," = "," AND") * 
         new.OARStaffUtilsationID = OAR_Staff_Utilisation.OARStaffUtilsationID;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Records because OAR_Staff_Utilisation does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_gradecount  OAR_Records on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_gradecount"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_104", FK_COLUMNS="OARgradecountid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_gradecount
      WHERE
         * %JoinFKPK( %New,oar_gradecount," = "," AND") * 
         new.OARgradecountid = oar_gradecount.OARgradecountid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OAR_Records because oar_gradecount does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_OAR_Records BEFORE INSERT ON public."OAR_Records" for each row
EXECUTE PROCEDURE before_insert_I_OAR_Records ();


CREATE OR REPLACE FUNCTION aft_update_U_OAR_Records() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* shifthistory  OAR_Records on child update restrict */
  /* ERWIN_RELATION CHECKSUM="0005e9e1", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="shifthistoryid" */
  SELECT count(*) INTO NUMROWS
    FROM shifthistory
    WHERE
      /* %JoinFKPK( %New,shifthistory," = "," AND") */
       new.shifthistoryid = shifthistory.shifthistoryid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update OAR_Records because shifthistory does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * OAR_Cash_Records  OAR_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Cash_Records"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="OARCashRecordID" * 
  SELECT count(*) INTO NUMROWS
    FROM OAR_Cash_Records
    WHERE
       * %JoinFKPK( %New,OAR_Cash_Records," = "," AND") * 
       new.OARCashRecordID = OAR_Cash_Records.OARCashRecordID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Records because OAR_Cash_Records does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * OAR_Performance_at_Border  OAR_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Performance_at_Border"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="OARPerformanceatBorderID" * 
  SELECT count(*) INTO NUMROWS
    FROM OAR_Performance_at_Border
    WHERE
       * %JoinFKPK( %New,OAR_Performance_at_Border," = "," AND") * 
       new.OARPerformanceatBorderID = OAR_Performance_at_Border.OARPerformanceatBorderID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Records because OAR_Performance_at_Border does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * OAR_Staff_Utilisation  OAR_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OAR_Staff_Utilisation"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_107", FK_COLUMNS="OARStaffUtilsationID" * 
  SELECT count(*) INTO NUMROWS
    FROM OAR_Staff_Utilisation
    WHERE
       * %JoinFKPK( %New,OAR_Staff_Utilisation," = "," AND") * 
       new.OARStaffUtilsationID = OAR_Staff_Utilisation.OARStaffUtilsationID;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Records because OAR_Staff_Utilisation does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * oar_gradecount  OAR_Records on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_gradecount"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_104", FK_COLUMNS="OARgradecountid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_gradecount
    WHERE
       * %JoinFKPK( %New,oar_gradecount," = "," AND") * 
       new.OARgradecountid = oar_gradecount.OARgradecountid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OAR_Records because oar_gradecount does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_OAR_Records AFTER UPDATE ON public."OAR_Records" for each row
EXECUTE PROCEDURE aft_update_U_OAR_Records();



CREATE OR REPLACE FUNCTION before_insert_I_oar_roro_details () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_consignee  oar_roro_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="0005865c", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_142", FK_COLUMNS="consigneeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_consignee
      WHERE
        /* %JoinFKPK( %New,oar_consignee," = "," AND") */
         new.consigneeid = oar_consignee.consigneeid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_roro_details because oar_consignee does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * oar_consignor  oar_roro_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_141", FK_COLUMNS="consignorid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_consignor
      WHERE
         * %JoinFKPK( %New,oar_consignor," = "," AND") * 
         new.consignorid = oar_consignor.consignorid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_roro_details because oar_consignor does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  oar_roro_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_140", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_unlocode
      WHERE
         * %JoinFKPK( %New,rf_unlocode," = "," AND") * 
         new.unlocodeid = rf_unlocode.unlocodeid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_roro_details because rf_unlocode does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_roro_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_139", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_country
      WHERE
         * %JoinFKPK( %New,rf_country," = "," AND") * 
         new.countryid = rf_country.countryid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_roro_details because rf_country does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * oar_ct_referral_event  oar_roro_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_133", FK_COLUMNS="ctreferraleventid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
         * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
         new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_roro_details because oar_ct_referral_event does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_oar_roro_details BEFORE INSERT ON public."oar_roro_details" for each row
EXECUTE PROCEDURE before_insert_I_oar_roro_details ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_roro_details() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_consignee  oar_roro_details on child update restrict */
  /* ERWIN_RELATION CHECKSUM="00058fd2", PARENT_OWNER="", PARENT_TABLE="oar_consignee"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_142", FK_COLUMNS="consigneeid" */
  SELECT count(*) INTO NUMROWS
    FROM oar_consignee
    WHERE
      /* %JoinFKPK( %New,oar_consignee," = "," AND") */
       new.consigneeid = oar_consignee.consigneeid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update oar_roro_details because oar_consignee does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * oar_consignor  oar_roro_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_consignor"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_141", FK_COLUMNS="consignorid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_consignor
    WHERE
       * %JoinFKPK( %New,oar_consignor," = "," AND") * 
       new.consignorid = oar_consignor.consignorid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_roro_details because oar_consignor does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_unlocode  oar_roro_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_140", FK_COLUMNS="unlocodeid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_unlocode
    WHERE
       * %JoinFKPK( %New,rf_unlocode," = "," AND") * 
       new.unlocodeid = rf_unlocode.unlocodeid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_roro_details because rf_unlocode does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_roro_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_139", FK_COLUMNS="countryid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_country
    WHERE
       * %JoinFKPK( %New,rf_country," = "," AND") * 
       new.countryid = rf_country.countryid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_roro_details because rf_country does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * oar_ct_referral_event  oar_roro_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="oar_ct_referral_event"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_133", FK_COLUMNS="ctreferraleventid" * 
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_referral_event
    WHERE
       * %JoinFKPK( %New,oar_ct_referral_event," = "," AND") * 
       new.ctreferraleventid = oar_ct_referral_event.ctreferraleventid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_roro_details because oar_ct_referral_event does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_roro_details AFTER UPDATE ON public."oar_roro_details" for each row
EXECUTE PROCEDURE aft_update_U_oar_roro_details();



CREATE OR REPLACE FUNCTION aft_delete_tD_OAR_Staff_Utilisation() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OAR_Staff_Utilisation  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000ff9d", PARENT_OWNER="", PARENT_TABLE="OAR_Staff_Utilisation"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_107", FK_COLUMNS="OARStaffUtilsationID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARStaffUtilsationID =  old.OARStaffUtilsationID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete OAR_Staff_Utilisation because OAR_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_OAR_Staff_Utilisation AFTER DELETE ON public."OAR_Staff_Utilisation" for each row
EXECUTE PROCEDURE aft_delete_tD_OAR_Staff_Utilisation();


CREATE OR REPLACE FUNCTION aft_update_U_OAR_Staff_Utilisation() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OAR_Staff_Utilisation  OAR_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00013e11", PARENT_OWNER="", PARENT_TABLE="OAR_Staff_Utilisation"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_107", FK_COLUMNS="OARStaffUtilsationID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.OARStaffUtilsationID <>  new.OARStaffUtilsationID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.OARStaffUtilsationID =  old.OARStaffUtilsationID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update OAR_Staff_Utilisation because OAR_Records exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_OAR_Staff_Utilisation AFTER UPDATE ON public."OAR_Staff_Utilisation" for each row
EXECUTE PROCEDURE aft_update_U_OAR_Staff_Utilisation();



CREATE OR REPLACE FUNCTION before_insert_I_oar_travel_details () 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* oar_ct_passenger_details  oar_travel_details on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="000466ea", PARENT_OWNER="", PARENT_TABLE="oar_ct_passenger_details"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="passengerdetailsid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
        /* %JoinFKPK( %New,oar_ct_passenger_details," = "," AND") */
         new.passengerdetailsid = oar_ct_passenger_details.passengerdetailsid;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert oar_travel_details because oar_ct_passenger_details does not exist.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_carrier  oar_travel_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_126", FK_COLUMNS="carrierid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_carrier
      WHERE
         * %JoinFKPK( %New,rf_carrier," = "," AND") * 
         new.carrierid = rf_carrier.carrierid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_travel_details because rf_carrier does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  oar_travel_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_125", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_unlocode
      WHERE
         * %JoinFKPK( %New,rf_unlocode," = "," AND") * 
         new.unlocodeid = rf_unlocode.unlocodeid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_travel_details because rf_unlocode does not exist.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_travel_details on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_124", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_country
      WHERE
         * %JoinFKPK( %New,rf_country," = "," AND") * 
         new.countryid = rf_country.countryid;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert oar_travel_details because rf_country does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_oar_travel_details BEFORE INSERT ON public."oar_travel_details" for each row
EXECUTE PROCEDURE before_insert_I_oar_travel_details ();


CREATE OR REPLACE FUNCTION aft_update_U_oar_travel_details() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* oar_ct_passenger_details  oar_travel_details on child update restrict */
  /* ERWIN_RELATION CHECKSUM="00047fb6", PARENT_OWNER="", PARENT_TABLE="oar_ct_passenger_details"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="passengerdetailsid" */
  SELECT count(*) INTO NUMROWS
    FROM oar_ct_passenger_details
    WHERE
      /* %JoinFKPK( %New,oar_ct_passenger_details," = "," AND") */
       new.passengerdetailsid = oar_ct_passenger_details.passengerdetailsid;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update oar_travel_details because oar_ct_passenger_details does not exist.';
  END IF;

   * erwin Builtin Trigger * 
   * rf_carrier  oar_travel_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_126", FK_COLUMNS="carrierid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_carrier
    WHERE
       * %JoinFKPK( %New,rf_carrier," = "," AND") * 
       new.carrierid = rf_carrier.carrierid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_travel_details because rf_carrier does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_unlocode  oar_travel_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_125", FK_COLUMNS="unlocodeid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_unlocode
    WHERE
       * %JoinFKPK( %New,rf_unlocode," = "," AND") * 
       new.unlocodeid = rf_unlocode.unlocodeid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_travel_details because rf_unlocode does not exist.'
    );
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_travel_details on child update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_124", FK_COLUMNS="countryid" * 
  SELECT count(*) INTO NUMROWS
    FROM rf_country
    WHERE
       * %JoinFKPK( %New,rf_country," = "," AND") * 
       new.countryid = rf_country.countryid;
  IF (
     * %NotnullFK( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update oar_travel_details because rf_country does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_oar_travel_details AFTER UPDATE ON public."oar_travel_details" for each row
EXECUTE PROCEDURE aft_update_U_oar_travel_details();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_carrier() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_carrier  oar_maritime_container_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00023836", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_135", FK_COLUMNS="carrierid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
        /*  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") */
        oar_maritime_container_details.carrierid =  old.carrierid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_carrier because oar_maritime_container_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_carrier  oar_travel_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_126", FK_COLUMNS="carrierid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.carrierid =  old.carrierid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete rf_carrier because oar_travel_details exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_carrier AFTER DELETE ON public."rf_carrier" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_carrier();


CREATE OR REPLACE FUNCTION aft_update_U_rf_carrier() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_carrier  oar_maritime_container_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00027371", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_135", FK_COLUMNS="carrierid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.carrierid <>  new.carrierid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
        /*  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") */
        oar_maritime_container_details.carrierid =  old.carrierid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_carrier because oar_maritime_container_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_carrier  oar_travel_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_carrier"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_126", FK_COLUMNS="carrierid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.carrierid <>  new.carrierid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.carrierid =  old.carrierid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_carrier because oar_travel_details exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_carrier AFTER UPDATE ON public."rf_carrier" for each row
EXECUTE PROCEDURE aft_update_U_rf_carrier();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_country() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_country  oar_roro_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00073ff9", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_139", FK_COLUMNS="countryid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_country because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_maritime_container_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_136", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete rf_country because oar_maritime_container_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_travel_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_124", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete rf_country because oar_travel_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  oar_ct_passenger_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
         *  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") * 
        oar_ct_passenger_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete rf_country because oar_ct_passenger_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  rf_unlocode on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_unlocode
      WHERE
         *  %JoinFKPK(rf_unlocode, %Old," = "," AND") * 
        rf_unlocode.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_country because rf_unlocode exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  rf_icao on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_icao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_icao_countryid_fkey", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_icao
      WHERE
         *  %JoinFKPK(rf_icao, %Old," = "," AND") * 
        rf_icao.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_country because rf_icao exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_country  address on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="address_countryid_fkey", FK_COLUMNS="countryid" * 
    SELECT count(*) INTO NUMROWS
      FROM address
      WHERE
         *  %JoinFKPK(address, %Old," = "," AND") * 
        address.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_country because address exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_country AFTER DELETE ON public."rf_country" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_country();


CREATE OR REPLACE FUNCTION aft_update_U_rf_country() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_country  oar_roro_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00084f8f", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_139", FK_COLUMNS="countryid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_country because oar_roro_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_maritime_container_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_maritime_container_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_136", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_maritime_container_details
      WHERE
         *  %JoinFKPK(oar_maritime_container_details, %Old," = "," AND") * 
        oar_maritime_container_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because oar_maritime_container_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_travel_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_124", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because oar_travel_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  oar_ct_passenger_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
         *  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") * 
        oar_ct_passenger_details.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because oar_ct_passenger_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  rf_unlocode on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_unlocode
      WHERE
         *  %JoinFKPK(rf_unlocode, %Old," = "," AND") * 
        rf_unlocode.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because rf_unlocode exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  rf_icao on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_icao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_icao_countryid_fkey", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_icao
      WHERE
         *  %JoinFKPK(rf_icao, %Old," = "," AND") * 
        rf_icao.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because rf_icao exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_country  address on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="address_countryid_fkey", FK_COLUMNS="countryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.countryid <>  new.countryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM address
      WHERE
         *  %JoinFKPK(address, %Old," = "," AND") * 
        address.countryid =  old.countryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_country because address exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_country AFTER UPDATE ON public."rf_country" for each row
EXECUTE PROCEDURE aft_update_U_rf_country();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_currency() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_currency  OAR_Cash_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000f588", PARENT_OWNER="", PARENT_TABLE="rf_currency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_103", FK_COLUMNS="rfCurrencyID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.rfCurrencyID =  old.rfCurrencyID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_currency because OAR_Cash_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_currency AFTER DELETE ON public."rf_currency" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_currency();


CREATE OR REPLACE FUNCTION aft_update_U_rf_currency() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_currency  OAR_Cash_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00011a65", PARENT_OWNER="", PARENT_TABLE="rf_currency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_103", FK_COLUMNS="rfCurrencyID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.rfCurrencyID <>  new.rfCurrencyID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.rfCurrencyID =  old.rfCurrencyID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_currency because OAR_Cash_Records exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_currency AFTER UPDATE ON public."rf_currency" for each row
EXECUTE PROCEDURE aft_update_U_rf_currency();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_deteteditems() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_deteteditems  oar_detection_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0001067c", PARENT_OWNER="", PARENT_TABLE="rf_deteteditems"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_143", FK_COLUMNS="detecteditemsid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.detecteditemsid =  old.detecteditemsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_deteteditems because oar_detection_details exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_deteteditems AFTER DELETE ON public."rf_deteteditems" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_deteteditems();


CREATE OR REPLACE FUNCTION aft_update_U_rf_deteteditems() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_deteteditems  oar_detection_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000138b2", PARENT_OWNER="", PARENT_TABLE="rf_deteteditems"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_143", FK_COLUMNS="detecteditemsid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.detecteditemsid <>  new.detecteditemsid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.detecteditemsid =  old.detecteditemsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_deteteditems because oar_detection_details exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_deteteditems AFTER UPDATE ON public."rf_deteteditems" for each row
EXECUTE PROCEDURE aft_update_U_rf_deteteditems();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_examinationtype() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_examinationtype  OAR_Performance_at_Border on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011ead", PARENT_OWNER="", PARENT_TABLE="rf_examinationtype"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="rfexaminationtypeID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rfexaminationtypeID =  old.rfexaminationtypeID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_examinationtype because OAR_Performance_at_Border exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_examinationtype AFTER DELETE ON public."rf_examinationtype" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_examinationtype();


CREATE OR REPLACE FUNCTION aft_update_U_rf_examinationtype() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_examinationtype  OAR_Performance_at_Border on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000156cb", PARENT_OWNER="", PARENT_TABLE="rf_examinationtype"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="rfexaminationtypeID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.rfexaminationtypeID <>  new.rfexaminationtypeID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rfexaminationtypeID =  old.rfexaminationtypeID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_examinationtype because OAR_Performance_at_Border exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_examinationtype AFTER UPDATE ON public."rf_examinationtype" for each row
EXECUTE PROCEDURE aft_update_U_rf_examinationtype();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_financial_instrument_typ() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_financial_instrument_type  OAR_Cash_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011cf5", PARENT_OWNER="", PARENT_TABLE="rf_financial_instrument_type"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_102", FK_COLUMNS="rfFinancialinstrumentID" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.rfFinancialinstrumentID =  old.rfFinancialinstrumentID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_financial_instrument_type because OAR_Cash_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_financial_instrument_typ AFTER DELETE ON public."rf_financial_instrument_type" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_financial_instrument_typ();


CREATE OR REPLACE FUNCTION aft_update_U_rf_financial_instrument_typ() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_financial_instrument_type  OAR_Cash_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00014b1b", PARENT_OWNER="", PARENT_TABLE="rf_financial_instrument_type"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_102", FK_COLUMNS="rfFinancialinstrumentID" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.rfFinancialinstrumentID <>  new.rfFinancialinstrumentID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.rfFinancialinstrumentID =  old.rfFinancialinstrumentID;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_financial_instrument_type because OAR_Cash_Records exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_financial_instrument_typ AFTER UPDATE ON public."rf_financial_instrument_type" for each row
EXECUTE PROCEDURE aft_update_U_rf_financial_instrument_typ();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_gender() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_gender  oar_ct_passenger_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0001fc1b", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_121", FK_COLUMNS="genderid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
        /*  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") */
        oar_ct_passenger_details.genderid =  old.genderid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_gender because oar_ct_passenger_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_gender  identity on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_genderid_fkey", FK_COLUMNS="genderid" * 
    SELECT count(*) INTO NUMROWS
      FROM identity
      WHERE
         *  %JoinFKPK(identity, %Old," = "," AND") * 
        identity.genderid =  old.genderid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_gender because identity exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_gender AFTER DELETE ON public."rf_gender" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_gender();


CREATE OR REPLACE FUNCTION aft_update_U_rf_gender() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_gender  oar_ct_passenger_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000240fc", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_121", FK_COLUMNS="genderid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.genderid <>  new.genderid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
        /*  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") */
        oar_ct_passenger_details.genderid =  old.genderid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_gender because oar_ct_passenger_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_gender  identity on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_gender"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_genderid_fkey", FK_COLUMNS="genderid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.genderid <>  new.genderid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM identity
      WHERE
         *  %JoinFKPK(identity, %Old," = "," AND") * 
        identity.genderid =  old.genderid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_gender because identity exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_gender AFTER UPDATE ON public."rf_gender" for each row
EXECUTE PROCEDURE aft_update_U_rf_gender();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_grade() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_grade  staff on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0000d6ab", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" */
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
        /*  %JoinFKPK(staff, %Old," = "," AND") */
        staff.gradetypeid =  old.gradetypeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE rf_grade because staff exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_grade AFTER DELETE ON public."rf_grade" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_grade();


CREATE OR REPLACE FUNCTION aft_update_U_rf_grade() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_grade  staff on parent update no action */
  /* ERWIN_RELATION CHECKSUM="00010d7b", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.gradetypeid <>  new.gradetypeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
        /*  %JoinFKPK(staff, %Old," = "," AND") */
        staff.gradetypeid =  old.gradetypeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_grade because staff exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_grade AFTER UPDATE ON public."rf_grade" for each row
EXECUTE PROCEDURE aft_update_U_rf_grade();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_indicators() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_indicators  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00010388", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.indicatorsid =  old.indicatorsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_indicators because oar_ct_referral_event exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_indicators AFTER DELETE ON public."rf_indicators" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_indicators();


CREATE OR REPLACE FUNCTION aft_update_U_rf_indicators() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_indicators  oar_ct_referral_event on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000131ac", PARENT_OWNER="", PARENT_TABLE="rf_indicators"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_120", FK_COLUMNS="indicatorsid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.indicatorsid <>  new.indicatorsid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.indicatorsid =  old.indicatorsid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_indicators because oar_ct_referral_event exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_indicators AFTER UPDATE ON public."rf_indicators" for each row
EXECUTE PROCEDURE aft_update_U_rf_indicators();



CREATE OR REPLACE FUNCTION before_insert_tD_rf_location AFTER DELETE ON public."rf_location" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_location();

CREATE  TRIGGER tI_rf_location BEFORE INSERT ON rf_location for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_location 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* address  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00046ec0", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_locationaddressid", FK_COLUMNS="addressid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.addressid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM address
            WHERE
              /* %JoinFKPK( %New,address," = "," AND") */
               new.addressid = address.addressid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_icao  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_icao"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_icaoid_fkey", FK_COLUMNS="icaoid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.icaoid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_icao
            WHERE
              /* %JoinFKPK( %New,rf_icao," = "," AND") */
               new.icaoid = rf_icao.icaoid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_bflocationtype  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bflocationtype"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_bflocationtypeid_f", FK_COLUMNS="bflocationtypeid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.bflocationtypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_bflocationtype
            WHERE
              /* %JoinFKPK( %New,rf_bflocationtype," = "," AND") */
               new.bflocationtypeid = rf_bflocationtype.bflocationtypeid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_unlocode  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.unlocodeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_unlocode
            WHERE
              /* %JoinFKPK( %New,rf_unlocode," = "," AND") */
               new.unlocodeid = rf_unlocode.unlocodeid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;


-- erwin Builtin Trigger
END;
/() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_location  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000bf69a", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_location because oar_ct_referral_event exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE rf_location because team exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_lockup on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_lockup exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_commandlocation on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_locationid_", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_commandlocation exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  incident on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because incident exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_location AFTER DELETE ON public."rf_location" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_location();

CREATE  TRIGGER tI_rf_location BEFORE INSERT ON rf_location for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_location 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * address  rf_location on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00046ec0", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_locationaddressid", FK_COLUMNS="addressid" * 
    UPDATE rf_location
      SET
         * %SetFK(rf_location,NULL) * 
        rf_location.addressid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM address
            WHERE
               * %JoinFKPK( %New,address," = "," AND") * 
               new.addressid = address.addressid
        ) 
         * %JoinPKPK(rf_location, %New," = "," AND") * 
        rf_location.locationid =  new.locationid;

     * erwin Builtin Trigger * 
     * rf_icao  rf_location on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_icao"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_icaoid_fkey", FK_COLUMNS="icaoid" * 
    UPDATE rf_location
      SET
         * %SetFK(rf_location,NULL) * 
        rf_location.icaoid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_icao
            WHERE
               * %JoinFKPK( %New,rf_icao," = "," AND") * 
               new.icaoid = rf_icao.icaoid
        ) 
         * %JoinPKPK(rf_location, %New," = "," AND") * 
        rf_location.locationid =  new.locationid;

     * erwin Builtin Trigger * 
     * rf_bflocationtype  rf_location on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bflocationtype"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_bflocationtypeid_f", FK_COLUMNS="bflocationtypeid" * 
    UPDATE rf_location
      SET
         * %SetFK(rf_location,NULL) * 
        rf_location.bflocationtypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_bflocationtype
            WHERE
               * %JoinFKPK( %New,rf_bflocationtype," = "," AND") * 
               new.bflocationtypeid = rf_bflocationtype.bflocationtypeid
        ) 
         * %JoinPKPK(rf_location, %New," = "," AND") * 
        rf_location.locationid =  new.locationid;

     * erwin Builtin Trigger * 
     * rf_unlocode  rf_location on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" * 
    UPDATE rf_location
      SET
         * %SetFK(rf_location,NULL) * 
        rf_location.unlocodeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_unlocode
            WHERE
               * %JoinFKPK( %New,rf_unlocode," = "," AND") * 
               new.unlocodeid = rf_unlocode.unlocodeid
        ) 
         * %JoinPKPK(rf_location, %New," = "," AND") * 
        rf_location.locationid =  new.locationid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_rf_location() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_location  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000bf69a", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_location because oar_ct_referral_event exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_lockup on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_lockup exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  rf_commandlocation on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_locationid_", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because rf_commandlocation exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_location  incident on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_locationid_fkey", FK_COLUMNS="locationid" * 
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_location because incident exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_location AFTER DELETE ON public."rf_location"" for each row
EXECUTE PROCEDURE before_insert_tD_rf_location AFTER DELETE ON public."rf_location" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_location();

CREATE  TRIGGER tI_rf_location BEFORE INSERT ON rf_location for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_location 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* address  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00046ec0", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_locationaddressid", FK_COLUMNS="addressid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.addressid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM address
            WHERE
              /* %JoinFKPK( %New,address," = "," AND") */
               new.addressid = address.addressid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_icao  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_icao"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_icaoid_fkey", FK_COLUMNS="icaoid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.icaoid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_icao
            WHERE
              /* %JoinFKPK( %New,rf_icao," = "," AND") */
               new.icaoid = rf_icao.icaoid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_bflocationtype  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bflocationtype"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_bflocationtypeid_f", FK_COLUMNS="bflocationtypeid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.bflocationtypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_bflocationtype
            WHERE
              /* %JoinFKPK( %New,rf_bflocationtype," = "," AND") */
               new.bflocationtypeid = rf_bflocationtype.bflocationtypeid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;

    /* erwin Builtin Trigger */
    /* rf_unlocode  rf_location on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" */
    UPDATE rf_location
      SET
        /* %SetFK(rf_location,NULL) */
        rf_location.unlocodeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_unlocode
            WHERE
              /* %JoinFKPK( %New,rf_unlocode," = "," AND") */
               new.unlocodeid = rf_unlocode.unlocodeid
        ) 
        /* %JoinPKPK(rf_location, %New," = "," AND") */
        rf_location.locationid =  new.locationid;


-- erwin Builtin Trigger
END;
/();


CREATE OR REPLACE FUNCTION aft_update_U_rf_location() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_location  oar_ct_referral_event on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00106c93", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="locationid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_location because oar_ct_referral_event exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  team on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because team exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftlocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  rf_team on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_locationid_fkey", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because rf_team exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  rf_lockup on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_locationid_fkey", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because rf_lockup exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  rf_commandlocation on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_locationid_", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because rf_commandlocation exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_location  incident on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_locationid_fkey", FK_COLUMNS="locationid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.locationid <>  new.locationid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.locationid =  old.locationid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_location because incident exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * address  rf_location on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="address"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_locationaddressid", FK_COLUMNS="addressid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_icao  rf_location on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_icao"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_icaoid_fkey", FK_COLUMNS="icaoid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_bflocationtype  rf_location on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bflocationtype"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_location_bflocationtypeid_f", FK_COLUMNS="bflocationtypeid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_unlocode  rf_location on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_location AFTER UPDATE ON public."rf_location" for each row
EXECUTE PROCEDURE aft_update_U_rf_location();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_nationality() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_nationality  oar_ct_passenger_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000215b7", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="nationalityid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
        /*  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") */
        oar_ct_passenger_details.nationalityid =  old.nationalityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_nationality because oar_ct_passenger_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_nationality  identity on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" * 
    SELECT count(*) INTO NUMROWS
      FROM identity
      WHERE
         *  %JoinFKPK(identity, %Old," = "," AND") * 
        identity.nationalityid =  old.nationalityid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_nationality because identity exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_nationality AFTER DELETE ON public."rf_nationality" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_nationality();


CREATE OR REPLACE FUNCTION aft_update_U_rf_nationality() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_nationality  oar_ct_passenger_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000269a1", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_passenger_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="nationalityid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.nationalityid <>  new.nationalityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_passenger_details
      WHERE
        /*  %JoinFKPK(oar_ct_passenger_details, %Old," = "," AND") */
        oar_ct_passenger_details.nationalityid =  old.nationalityid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_nationality because oar_ct_passenger_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_nationality  identity on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_nationality"
    CHILD_OWNER="", CHILD_TABLE="identity"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="identity_nationalityid_fkey", FK_COLUMNS="nationalityid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.nationalityid <>  new.nationalityid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM identity
      WHERE
         *  %JoinFKPK(identity, %Old," = "," AND") * 
        identity.nationalityid =  old.nationalityid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_nationality because identity exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_nationality AFTER UPDATE ON public."rf_nationality" for each row
EXECUTE PROCEDURE aft_update_U_rf_nationality();



CREATE OR REPLACE FUNCTION before_insert_tD_rf_organisationcommand AFTER DELETE ON public."rf_organisationcommand" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_organisationcommand();

CREATE  TRIGGER tI_rf_organisationcommand BEFORE INSERT ON rf_organisationcommand for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_organisationcommand 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_organisationcommand  rf_organisationcommand on child insert set null */
    /* ERWIN_RELATION CHECKSUM="0001452f", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" */
    UPDATE rf_organisationcommand
      SET
        /* %SetFK(rf_organisationcommand,NULL) */
        rf_organisationcommand.parentcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.parentcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(rf_organisationcommand, %New," = "," AND") */
        rf_organisationcommand.commandid =  new.commandid;


-- erwin Builtin Trigger
END;
/() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_organisationcommand  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000ee683", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_organisationcommand because oar_ct_referral_event exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE rf_organisationcommand because team exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultsubcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because staff exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because staff exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorycommandid", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistory_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftcommandid", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_subcommandid_fkey", FK_COLUMNS="subcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.subcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_organisationcommand on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
         *  %JoinFKPK(rf_organisationcommand, %Old," = "," AND") * 
        rf_organisationcommand.parentcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_organisationcommand exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_lockup on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_lockup exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_commandlocation on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_commandid_f", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_commandlocation exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  borderforcedog on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedog_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because borderforcedog exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_organisationcommand AFTER DELETE ON public."rf_organisationcommand" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_organisationcommand();

CREATE  TRIGGER tI_rf_organisationcommand BEFORE INSERT ON rf_organisationcommand for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_organisationcommand 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_organisationcommand on child insert set null * 
     * ERWIN_RELATION CHECKSUM="0001452f", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" * 
    UPDATE rf_organisationcommand
      SET
         * %SetFK(rf_organisationcommand,NULL) * 
        rf_organisationcommand.parentcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.parentcommandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(rf_organisationcommand, %New," = "," AND") * 
        rf_organisationcommand.commandid =  new.commandid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_rf_organisationcommand() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_organisationcommand  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000ee683", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_organisationcommand because oar_ct_referral_event exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultsubcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because staff exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because staff exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorycommandid", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistory_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftcommandid", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_subcommandid_fkey", FK_COLUMNS="subcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.subcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_team on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_team exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_organisationcommand on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
         *  %JoinFKPK(rf_organisationcommand, %Old," = "," AND") * 
        rf_organisationcommand.parentcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_organisationcommand exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_lockup on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_lockup exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_commandlocation on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_commandid_f", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because rf_commandlocation exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  borde"rforcedog on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedog_commandid_fkey", FK_COLUMNS="commandid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_organisationcommand because borderforcedog exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_organisationcommand AFTER DELETE ON public."rf_organisationcommand" for each row
EXECUTE PROCEDURE before_insert_tD_rf_organisationcommand AFTER DELETE ON public."rf_organisationcommand" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_organisationcommand();

CREATE  TRIGGER tI_rf_organisationcommand BEFORE INSERT ON rf_organisationcommand for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_organisationcommand 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_organisationcommand  rf_organisationcommand on child insert set null */
    /* ERWIN_RELATION CHECKSUM="0001452f", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" */
    UPDATE rf_organisationcommand
      SET
        /* %SetFK(rf_organisationcommand,NULL) */
        rf_organisationcommand.parentcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.parentcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(rf_organisationcommand, %New," = "," AND") */
        rf_organisationcommand.commandid =  new.commandid;


-- erwin Builtin Trigger
END;
/();


CREATE OR REPLACE FUNCTION aft_update_U_rf_organisationcommand() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_organisationcommand  oar_ct_referral_event on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0011ba36", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="commandid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_organisationcommand because oar_ct_referral_event exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  team on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
         *  %JoinFKPK(team, %Old," = "," AND") * 
        team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because team exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  staff on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultsubcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because staff exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  staff on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM staff
      WHERE
         *  %JoinFKPK(staff, %Old," = "," AND") * 
        staff.defaultcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because staff exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorycommandid", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistory_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftcommandid", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_subcommandid_fkey", FK_COLUMNS="subcommandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.subcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  rf_team on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_team_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_team
      WHERE
         *  %JoinFKPK(rf_team, %Old," = "," AND") * 
        rf_team.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because rf_team exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  rf_organisationcommand on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_organisationcommand
      WHERE
         *  %JoinFKPK(rf_organisationcommand, %Old," = "," AND") * 
        rf_organisationcommand.parentcommandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because rf_organisationcommand exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  rf_lockup on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_lockup"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_lockup_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_lockup
      WHERE
         *  %JoinFKPK(rf_lockup, %Old," = "," AND") * 
        rf_lockup.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because rf_lockup exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  rf_commandlocation on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_commandlocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_commandlocation_commandid_f", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_commandlocation
      WHERE
         *  %JoinFKPK(rf_commandlocation, %Old," = "," AND") * 
        rf_commandlocation.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because rf_commandlocation exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_organisationcommand  borderforcedog on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedog_commandid_fkey", FK_COLUMNS="commandid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.commandid <>  new.commandid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.commandid =  old.commandid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_organisationcommand because borderforcedog exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  rf_organisationcommand on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="rf_organisationcommand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_organisationcommand_parentc", FK_COLUMNS="parentcommandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_organisationcommand AFTER UPDATE ON public."rf_organisationcommand" for each row
EXECUTE PROCEDURE aft_update_U_rf_organisationcommand();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_outcome() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_outcome  oar_detection_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000100d5", PARENT_OWNER="", PARENT_TABLE="rf_outcome"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_144", FK_COLUMNS="outcomeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.outcomeid =  old.outcomeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_outcome because oar_detection_details exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_outcome AFTER DELETE ON public."rf_outcome" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_outcome();


CREATE OR REPLACE FUNCTION aft_update_U_rf_outcome() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_outcome  oar_detection_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000129d3", PARENT_OWNER="", PARENT_TABLE="rf_outcome"
    CHILD_OWNER="", CHILD_TABLE="oar_detection_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_144", FK_COLUMNS="outcomeid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.outcomeid <>  new.outcomeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_detection_details
      WHERE
        /*  %JoinFKPK(oar_detection_details, %Old," = "," AND") */
        oar_detection_details.outcomeid =  old.outcomeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_outcome because oar_detection_details exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_outcome AFTER UPDATE ON public."rf_outcome" for each row
EXECUTE PROCEDURE aft_update_U_rf_outcome();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_partneragency() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_partneragency  OAR_Cash_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0000ffc9", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.partneragencyid =  old.partneragencyid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_partneragency because OAR_Cash_Records exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_partneragency AFTER DELETE ON public."rf_partneragency" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_partneragency();


CREATE OR REPLACE FUNCTION aft_update_U_rf_partneragency() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_partneragency  OAR_Cash_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00013a02", PARENT_OWNER="", PARENT_TABLE="rf_partneragency"
    CHILD_OWNER="", CHILD_TABLE="OAR_Cash_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_115", FK_COLUMNS="partneragencyid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.partneragencyid <>  new.partneragencyid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Cash_Records
      WHERE
        /*  %JoinFKPK(OAR_Cash_Records, %Old," = "," AND") */
        OAR_Cash_Records.partneragencyid =  old.partneragencyid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_partneragency because OAR_Cash_Records exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_partneragency AFTER UPDATE ON public."rf_partneragency" for each row
EXECUTE PROCEDURE aft_update_U_rf_partneragency();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_referraltype() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_referraltype  oar_ct_referral_event on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011223", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.referraltypeid =  old.referraltypeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_referraltype because oar_ct_referral_event exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_referraltype AFTER DELETE ON public."rf_referraltype" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_referraltype();


CREATE OR REPLACE FUNCTION aft_update_U_rf_referraltype() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_referraltype  oar_ct_referral_event on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00013563", PARENT_OWNER="", PARENT_TABLE="rf_referraltype"
    CHILD_OWNER="", CHILD_TABLE="oar_ct_referral_event"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_119", FK_COLUMNS="referraltypeid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.referraltypeid <>  new.referraltypeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_ct_referral_event
      WHERE
        /*  %JoinFKPK(oar_ct_referral_event, %Old," = "," AND") */
        oar_ct_referral_event.referraltypeid =  old.referraltypeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_referraltype because oar_ct_referral_event exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_referraltype AFTER UPDATE ON public."rf_referraltype" for each row
EXECUTE PROCEDURE aft_update_U_rf_referraltype();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_searchcountcat() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_searchcountcat  OAR_Performance_at_Border on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000112ad", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rfsearchcatid =  old.rfsearchcatid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_searchcountcat because OAR_Performance_at_Border exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_searchcountcat AFTER DELETE ON public."rf_searchcountcat" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_searchcountcat();


CREATE OR REPLACE FUNCTION aft_update_U_rf_searchcountcat() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_searchcountcat  OAR_Performance_at_Border on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00013dd1", PARENT_OWNER="", PARENT_TABLE="rf_searchcountcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="rfsearchcatid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.rfsearchcatid <>  new.rfsearchcatid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rfsearchcatid =  old.rfsearchcatid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_searchcountcat because OAR_Performance_at_Border exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_searchcountcat AFTER UPDATE ON public."rf_searchcountcat" for each row
EXECUTE PROCEDURE aft_update_U_rf_searchcountcat();



CREATE OR REPLACE FUNCTION aft_delete_tD_rf_targetcat() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_targetcat  OAR_Performance_at_Border on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00010b23", PARENT_OWNER="", PARENT_TABLE="rf_targetcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="rftargetcatid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rftargetcatid =  old.rftargetcatid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_targetcat because OAR_Performance_at_Border exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_targetcat AFTER DELETE ON public."rf_targetcat" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_targetcat();


CREATE OR REPLACE FUNCTION aft_update_U_rf_targetcat() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_targetcat  OAR_Performance_at_Border on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00013734", PARENT_OWNER="", PARENT_TABLE="rf_targetcat"
    CHILD_OWNER="", CHILD_TABLE="OAR_Performance_at_Border"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="rftargetcatid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.rftargetcatid <>  new.rftargetcatid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Performance_at_Border
      WHERE
        /*  %JoinFKPK(OAR_Performance_at_Border, %Old," = "," AND") */
        OAR_Performance_at_Border.rftargetcatid =  old.rftargetcatid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_targetcat because OAR_Performance_at_Border exists.';
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_targetcat AFTER UPDATE ON public."rf_targetcat" for each row
EXECUTE PROCEDURE aft_update_U_rf_targetcat();



CREATE OR REPLACE FUNCTION before_insert_tD_rf_unlocode AFTER DELETE ON public."rf_unlocode" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_unlocode();

CREATE  TRIGGER tI_rf_unlocode BEFORE INSERT ON rf_unlocode for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_unlocode 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_country  rf_unlocode on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00010439", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" */
    UPDATE rf_unlocode
      SET
        /* %SetFK(rf_unlocode,NULL) */
        rf_unlocode.countryid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_country
            WHERE
              /* %JoinFKPK( %New,rf_country," = "," AND") */
               new.countryid = rf_country.countryid
        ) 
        /* %JoinPKPK(rf_unlocode, %New," = "," AND") */
        rf_unlocode.unlocodeid =  new.unlocodeid;


-- erwin Builtin Trigger
END;
/() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_unlocode  oar_roro_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0003ea72", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_140", FK_COLUMNS="unlocodeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_unlocode because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  oar_travel_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_125", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_unlocode because oar_travel_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  rf_location on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
         *  %JoinFKPK(rf_location, %Old," = "," AND") * 
        rf_location.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_unlocode because rf_location exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  leg on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="leg"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="leg_unlocodeid_fkey", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM leg
      WHERE
         *  %JoinFKPK(leg, %Old," = "," AND") * 
        leg.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_unlocode because leg exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_unlocode AFTER DELETE ON public."rf_unlocode" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_unlocode();

CREATE  TRIGGER tI_rf_unlocode BEFORE INSERT ON rf_unlocode for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_unlocode 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * rf_country  rf_unlocode on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00010439", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" * 
    UPDATE rf_unlocode
      SET
         * %SetFK(rf_unlocode,NULL) * 
        rf_unlocode.countryid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_country
            WHERE
               * %JoinFKPK( %New,rf_country," = "," AND") * 
               new.countryid = rf_country.countryid
        ) 
         * %JoinPKPK(rf_unlocode, %New," = "," AND") * 
        rf_unlocode.unlocodeid =  new.unlocodeid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_rf_unlocode() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_unlocode  oar_roro_details on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="0003ea72", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_140", FK_COLUMNS="unlocodeid" */
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete rf_unlocode because oar_roro_details exists.';
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  oar_travel_details on parent delete restrict * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_125", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete rf_unlocode because oar_travel_details exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  rf_location on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
         *  %JoinFKPK(rf_location, %Old," = "," AND") * 
        rf_location.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_unlocode because rf_location exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * rf_unlocode  leg on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="leg"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="leg_unlocodeid_fkey", FK_COLUMNS="unlocodeid" * 
    SELECT count(*) INTO NUMROWS
      FROM leg
      WHERE
         *  %JoinFKPK(leg, %Old," = "," AND") * 
        leg.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE rf_unlocode because leg exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_rf_unlocode AFTER DELETE ON public."rf_unlocode"" for each row
EXECUTE PROCEDURE before_insert_tD_rf_unlocode AFTER DELETE ON public."rf_unlocode" for each row
EXECUTE PROCEDURE aft_delete_tD_rf_unlocode();

CREATE  TRIGGER tI_rf_unlocode BEFORE INSERT ON rf_unlocode for each row
-- erwin Builtin Trigger
-- INSERT trigger on rf_unlocode 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* rf_country  rf_unlocode on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00010439", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" */
    UPDATE rf_unlocode
      SET
        /* %SetFK(rf_unlocode,NULL) */
        rf_unlocode.countryid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_country
            WHERE
              /* %JoinFKPK( %New,rf_country," = "," AND") */
               new.countryid = rf_country.countryid
        ) 
        /* %JoinPKPK(rf_unlocode, %New," = "," AND") */
        rf_unlocode.unlocodeid =  new.unlocodeid;


-- erwin Builtin Trigger
END;
/();


CREATE OR REPLACE FUNCTION aft_update_U_rf_unlocode() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* rf_unlocode  oar_roro_details on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00054d0d", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_roro_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_140", FK_COLUMNS="unlocodeid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.unlocodeid <>  new.unlocodeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_roro_details
      WHERE
        /*  %JoinFKPK(oar_roro_details, %Old," = "," AND") */
        oar_roro_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update rf_unlocode because oar_roro_details exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_unlocode  oar_travel_details on parent update restrict * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="oar_travel_details"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_125", FK_COLUMNS="unlocodeid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.unlocodeid <>  new.unlocodeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM oar_travel_details
      WHERE
         *  %JoinFKPK(oar_travel_details, %Old," = "," AND") * 
        oar_travel_details.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_unlocode because oar_travel_details exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_unlocode  rf_location on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="rf_location"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="locationunlocodeid", FK_COLUMNS="unlocodeid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.unlocodeid <>  new.unlocodeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM rf_location
      WHERE
         *  %JoinFKPK(rf_location, %Old," = "," AND") * 
        rf_location.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_unlocode because rf_location exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * rf_unlocode  leg on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_unlocode"
    CHILD_OWNER="", CHILD_TABLE="leg"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="leg_unlocodeid_fkey", FK_COLUMNS="unlocodeid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.unlocodeid <>  new.unlocodeid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM leg
      WHERE
         *  %JoinFKPK(leg, %Old," = "," AND") * 
        leg.unlocodeid =  old.unlocodeid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update rf_unlocode because leg exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * rf_country  rf_unlocode on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_country"
    CHILD_OWNER="", CHILD_TABLE="rf_unlocode"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rf_unlocode_countryid_fkey", FK_COLUMNS="countryid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_rf_unlocode AFTER UPDATE ON public."rf_unlocode" for each row
EXECUTE PROCEDURE aft_update_U_rf_unlocode();



CREATE OR REPLACE FUNCTION before_insert_I_shift () 
RETURNS trigger AS
$$

RAISE EXCEPTION ;ECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * team  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00093498", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftteamid", FK_COLUMNS="teamid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.teamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
               * %JoinFKPK( %New,team," = "," AND") * 
               new.teamid = team.teamid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * staff  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftstaffid", FK_COLUMNS="staffid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.staffid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM staff
            WHERE
               * %JoinFKPK( %New,staff," = "," AND") * 
               new.staffid = staff.staffid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_location  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftlocationid", FK_COLUMNS="locationid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftcommandid", FK_COLUMNS="commandid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.commandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_subcommandid_fkey", FK_COLUMNS="subcommandid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.subcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.subcommandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * shifthistory  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_shifthistoryid_fkey", FK_COLUMNS="shifthistoryid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.shifthistoryid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM shifthistory
            WHERE
               * %JoinFKPK( %New,shifthistory," = "," AND") * 
               new.shifthistoryid = shifthistory.shifthistoryid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_location  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_commandid_fkey", FK_COLUMNS="commandid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.commandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;

     * erwin Builtin Trigger * 
     * rf_location  shift on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    UPDATE shift
      SET
         * %SetFK(shift,NULL) * 
        shift.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shift, %New," = "," AND") * 
        shift.shiftid =  new.shiftid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_shift BEFORE INSERT ON public."shift" for each row
EXECUTE PROCEDURE before_insert_I_shift ();


CREATE OR REPLACE FUNCTION aft_update_U_shift() 
RETURNS trigger AS
$$

RAISE EXCEPTION ;ECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * team  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="0005c2f3", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftteamid", FK_COLUMNS="teamid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * staff  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftstaffid", FK_COLUMNS="staffid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftlocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftcommandid", FK_COLUMNS="commandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_subcommandid_fkey", FK_COLUMNS="subcommandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * shifthistory  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_shifthistoryid_fkey", FK_COLUMNS="shifthistoryid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_commandid_fkey", FK_COLUMNS="commandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shift on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_shift AFTER UPDATE ON public."shift" for each row
EXECUTE PROCEDURE aft_update_U_shift();



CREATE OR REPLACE FUNCTION before_insert_tD_shifthistory AFTER DELETE ON public."shifthistory" for each row
EXECUTE PROCEDURE aft_delete_tD_shifthistory();

CREATE  TRIGGER tI_shifthistory BEFORE INSERT ON shifthistory for each row
-- erwin Builtin Trigger
-- INSERT trigger on shifthistory 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="0007b8ea", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.teamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
              /* %JoinFKPK( %New,team," = "," AND") */
               new.teamid = team.teamid
        ) 
        /* %JoinPKPK(shifthistory, %New," = "," AND") */
        shifthistory.shifthistoryid =  new.shifthistoryid;

    /* erwin Builtin Trigger */
    /* staff  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.staffid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM staff
            WHERE
              /* %JoinFKPK( %New,staff," = "," AND") */
               new.staffid = staff.staffid
        ) 
        /* %JoinPKPK(shifthistory, %New," = "," AND") */
        shifthistory.shifthistoryid =  new.shifthistoryid;

    /* erwin Builtin Trigger */
    /* rf_location  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
              /* %JoinFKPK( %New,rf_location() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* shifthistory  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000309e4", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="shifthistoryid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete shifthistory because OAR_Records exists.';
    END IF;

     * erwin Builtin Trigger * 
     * shifthistory  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_shifthistoryid_fkey", FK_COLUMNS="shifthistoryid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE shifthistory because shift exists.';
    END IF;

     * erwin Builtin Trigger * 
     * shifthistory  borderforceevent on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="borderforceevent"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforceeventshifthistoryid", FK_COLUMNS="shifthistoryid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforceevent
      WHERE
         *  %JoinFKPK(borderforceevent, %Old," = "," AND") * 
        borderforceevent.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE shifthistory because borderforceevent exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_shifthistory AFTER DELETE ON public."shifthistory" for each row
EXECUTE PROCEDURE aft_delete_tD_shifthistory();

CREATE  TRIGGER tI_shifthistory BEFORE INSERT ON shifthistory for each row
-- erwin Builtin Trigger
-- INSERT trigger on shifthistory 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * team  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="0007b8ea", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.teamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
               * %JoinFKPK( %New,team," = "," AND") * 
               new.teamid = team.teamid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * staff  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.staffid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM staff
            WHERE
               * %JoinFKPK( %New,staff," = "," AND") * 
               new.staffid = staff.staffid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorycommandid", FK_COLUMNS="commandid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.commandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistory_commandid_fkey", FK_COLUMNS="commandid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.commandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
    UPDATE shifthistory
      SET
         * %SetFK(shifthistory,NULL) * 
        shifthistory.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(shifthistory, %New," = "," AND") * 
        shifthistory.shifthistoryid =  new.shifthistoryid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_shifthistory() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* shifthistory  OAR_Records on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="000309e4", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="shifthistoryid" */
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete shifthistory because OAR_Records exists.';
    END IF;

     * erwin Builtin Trigger * 
     * shifthistory  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_shifthistoryid_fkey", FK_COLUMNS="shifthistoryid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE shifthistory because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * shifthistory  borde"rforceevent on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="borderforceevent"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforceeventshifthistoryid", FK_COLUMNS="shifthistoryid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforceevent
      WHERE
         *  %JoinFKPK(borderforceevent, %Old," = "," AND") * 
        borderforceevent.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE shifthistory because borderforceevent exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_shifthistory AFTER DELETE ON public."shifthistory" for each row
EXECUTE PROCEDURE before_insert_tD_shifthistory AFTER DELETE ON public."shifthistory" for each row
EXECUTE PROCEDURE aft_delete_tD_shifthistory();

CREATE  TRIGGER tI_shifthistory BEFORE INSERT ON shifthistory for each row
-- erwin Builtin Trigger
-- INSERT trigger on shifthistory 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="0007b8ea", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.teamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
              /* %JoinFKPK( %New,team," = "," AND") */
               new.teamid = team.teamid
        ) 
        /* %JoinPKPK(shifthistory, %New," = "," AND") */
        shifthistory.shifthistoryid =  new.shifthistoryid;

    /* erwin Builtin Trigger */
    /* staff  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.staffid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM staff
            WHERE
              /* %JoinFKPK( %New,staff," = "," AND") */
               new.staffid = staff.staffid
        ) 
        /* %JoinPKPK(shifthistory, %New," = "," AND") */
        shifthistory.shifthistoryid =  new.shifthistoryid;

    /* erwin Builtin Trigger */
    /* rf_location  shifthistory on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" */
    UPDATE shifthistory
      SET
        /* %SetFK(shifthistory,NULL) */
        shifthistory.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
              /* %JoinFKPK( %New,rf_location();


CREATE OR REPLACE FUNCTION aft_update_U_shifthistory() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* shifthistory  OAR_Records on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00087260", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="OAR_Records"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="shifthistoryid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.shifthistoryid <>  new.shifthistoryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OAR_Records
      WHERE
        /*  %JoinFKPK(OAR_Records, %Old," = "," AND") */
        OAR_Records.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update shifthistory because OAR_Records exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * shifthistory  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shift_shifthistoryid_fkey", FK_COLUMNS="shifthistoryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.shifthistoryid <>  new.shifthistoryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update shifthistory because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * shifthistory  borderforceevent on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="shifthistory"
    CHILD_OWNER="", CHILD_TABLE="borderforceevent"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforceeventshifthistoryid", FK_COLUMNS="shifthistoryid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.shifthistoryid <>  new.shifthistoryid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM borderforceevent
      WHERE
         *  %JoinFKPK(borderforceevent, %Old," = "," AND") * 
        borderforceevent.shifthistoryid =  old.shifthistoryid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update shifthistory because borderforceevent exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * team  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * staff  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorylocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorycommandid", FK_COLUMNS="commandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistory_commandid_fkey", FK_COLUMNS="commandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  shifthistory on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="currentlocationid", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_shifthistory AFTER UPDATE ON public."shifthistory" for each row
EXECUTE PROCEDURE aft_update_U_shifthistory();



CREATE OR REPLACE FUNCTION before_insert_tD_staff AFTER DELETE ON public."staff" for each row
EXECUTE PROCEDURE aft_delete_tD_staff();

CREATE  TRIGGER tI_staff BEFORE INSERT ON staff for each row
-- erwin Builtin Trigger
-- INSERT trigger on staff 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* identity  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00044862", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.identityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM identity
            WHERE
              /* %JoinFKPK( %New,identity," = "," AND") */
               new.identityid = identity.identityid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_grade  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.gradetypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_grade
            WHERE
              /* %JoinFKPK( %New,rf_grade," = "," AND") */
               new.gradetypeid = rf_grade.gradetypeid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.defaultsubcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.defaultsubcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.defaultcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.defaultcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;


-- erwin Builtin Trigger
END;
/() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* staff  taskcomment on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0007c839", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="taskcomment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="taskcomment_staffid_fkey", FK_COLUMNS="staffid" */
    SELECT count(*) INTO NUMROWS
      FROM taskcomment
      WHERE
        /*  %JoinFKPK(taskcomment, %Old," = "," AND") */
        taskcomment.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE staff because taskcomment exists.';
    END IF;

     * erwin Builtin Trigger * 
     * staff  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE staff because shifthistory exists.';
    END IF;

     * erwin Builtin Trigger * 
     * staff  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftstaffid", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  securityclearance on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="securityclearance"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="securityclearance_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM securityclearance
      WHERE
         *  %JoinFKPK(securityclearance, %Old," = "," AND") * 
        securityclearance.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because securityclearance exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  qualification on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="qualification"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="qualification_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM qualification
      WHERE
         *  %JoinFKPK(qualification, %Old," = "," AND") * 
        qualification.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because qualification exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incidentresponses on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_resolver_fke", FK_COLUMNS="resolver" * 
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.resolver =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incidentresponses exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incidentresponses on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_notification", FK_COLUMNS="notificationrecipient" * 
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.notificationrecipient =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incidentresponses exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incident on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incident exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_staff AFTER DELETE ON public."staff" for each row
EXECUTE PROCEDURE aft_delete_tD_staff();

CREATE  TRIGGER tI_staff BEFORE INSERT ON staff for each row
-- erwin Builtin Trigger
-- INSERT trigger on staff 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * identity  staff on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00044862", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" * 
    UPDATE staff
      SET
         * %SetFK(staff,NULL) * 
        staff.identityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM identity
            WHERE
               * %JoinFKPK( %New,identity," = "," AND") * 
               new.identityid = identity.identityid
        ) 
         * %JoinPKPK(staff, %New," = "," AND") * 
        staff.staffid =  new.staffid;

     * erwin Builtin Trigger * 
     * rf_grade  staff on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" * 
    UPDATE staff
      SET
         * %SetFK(staff,NULL) * 
        staff.gradetypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_grade
            WHERE
               * %JoinFKPK( %New,rf_grade," = "," AND") * 
               new.gradetypeid = rf_grade.gradetypeid
        ) 
         * %JoinPKPK(staff, %New," = "," AND") * 
        staff.staffid =  new.staffid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" * 
    UPDATE staff
      SET
         * %SetFK(staff,NULL) * 
        staff.defaultsubcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.defaultsubcommandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(staff, %New," = "," AND") * 
        staff.staffid =  new.staffid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" * 
    UPDATE staff
      SET
         * %SetFK(staff,NULL) * 
        staff.defaultcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.defaultcommandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(staff, %New," = "," AND") * 
        staff.staffid =  new.staffid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_staff() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* staff  taskcomment on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0007c839", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="taskcomment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="taskcomment_staffid_fkey", FK_COLUMNS="staffid" */
    SELECT count(*) INTO NUMROWS
      FROM taskcomment
      WHERE
        /*  %JoinFKPK(taskcomment, %Old," = "," AND") */
        taskcomment.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE staff because taskcomment exists.';
    END IF;

     * erwin Builtin Trigger * 
     * staff  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftstaffid", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  securityclearance on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="securityclearance"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="securityclearance_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM securityclearance
      WHERE
         *  %JoinFKPK(securityclearance, %Old," = "," AND") * 
        securityclearance.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because securityclearance exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  qualification on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="qualification"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="qualification_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM qualification
      WHERE
         *  %JoinFKPK(qualification, %Old," = "," AND") * 
        qualification.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because qualification exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incidentresponses on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_resolver_fke", FK_COLUMNS="resolver" * 
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.resolver =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incidentresponses exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incidentresponses on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_notification", FK_COLUMNS="notificationrecipient" * 
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.notificationrecipient =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incidentresponses exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * staff  incident on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_staffid_fkey", FK_COLUMNS="staffid" * 
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE staff because incident exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_staff AFTER DELETE ON public."staff"" for each row
EXECUTE PROCEDURE before_insert_tD_staff AFTER DELETE ON public."staff" for each row
EXECUTE PROCEDURE aft_delete_tD_staff();

CREATE  TRIGGER tI_staff BEFORE INSERT ON staff for each row
-- erwin Builtin Trigger
-- INSERT trigger on staff 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* identity  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00044862", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.identityid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM identity
            WHERE
              /* %JoinFKPK( %New,identity," = "," AND") */
               new.identityid = identity.identityid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_grade  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.gradetypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_grade
            WHERE
              /* %JoinFKPK( %New,rf_grade," = "," AND") */
               new.gradetypeid = rf_grade.gradetypeid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.defaultsubcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.defaultsubcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  staff on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" */
    UPDATE staff
      SET
        /* %SetFK(staff,NULL) */
        staff.defaultcommandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.defaultcommandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(staff, %New," = "," AND") */
        staff.staffid =  new.staffid;


-- erwin Builtin Trigger
END;
/();


CREATE OR REPLACE FUNCTION aft_update_U_staff() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* staff  taskcomment on parent update no action */
  /* ERWIN_RELATION CHECKSUM="000bb71c", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="taskcomment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="taskcomment_staffid_fkey", FK_COLUMNS="staffid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM taskcomment
      WHERE
        /*  %JoinFKPK(taskcomment, %Old," = "," AND") */
        taskcomment.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update staff because taskcomment exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistorystaffid", FK_COLUMNS="staffid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftstaffid", FK_COLUMNS="staffid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  securityclearance on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="securityclearance"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="securityclearance_staffid_fkey", FK_COLUMNS="staffid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM securityclearance
      WHERE
         *  %JoinFKPK(securityclearance, %Old," = "," AND") * 
        securityclearance.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because securityclearance exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  qualification on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="qualification"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="qualification_staffid_fkey", FK_COLUMNS="staffid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM qualification
      WHERE
         *  %JoinFKPK(qualification, %Old," = "," AND") * 
        qualification.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because qualification exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  incidentresponses on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_resolver_fke", FK_COLUMNS="resolver" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.resolver =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because incidentresponses exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  incidentresponses on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incidentresponses"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incidentresponses_notification", FK_COLUMNS="notificationrecipient" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM incidentresponses
      WHERE
         *  %JoinFKPK(incidentresponses, %Old," = "," AND") * 
        incidentresponses.notificationrecipient =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because incidentresponses exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * staff  incident on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="staff"
    CHILD_OWNER="", CHILD_TABLE="incident"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="incident_staffid_fkey", FK_COLUMNS="staffid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.staffid <>  new.staffid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM incident
      WHERE
         *  %JoinFKPK(incident, %Old," = "," AND") * 
        incident.staffid =  old.staffid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update staff because incident exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * identity  staff on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="identity"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_identityid_fkey", FK_COLUMNS="identityid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_grade  staff on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_grade"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_gradetypeid_fkey", FK_COLUMNS="gradetypeid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultsubcommandid_fkey", FK_COLUMNS="defaultsubcommandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  staff on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="staff"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="staff_defaultcommandid_fkey", FK_COLUMNS="defaultcommandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_staff AFTER UPDATE ON public."staff" for each row
EXECUTE PROCEDURE aft_update_U_staff();



CREATE OR REPLACE FUNCTION before_insert_tD_team AFTER DELETE ON public."team" for each row
EXECUTE PROCEDURE aft_delete_tD_team();

CREATE  TRIGGER tI_team BEFORE INSERT ON team for each row
-- erwin Builtin Trigger
-- INSERT trigger on team 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00041972", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.parentteamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
              /* %JoinFKPK( %New,team," = "," AND") */
               new.parentteamid = team.teamid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_location  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
              /* %JoinFKPK( %New,rf_location," = "," AND") */
               new.locationid = rf_location.locationid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.commandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_bffunctiontypes  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bffunctiontypes"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_bffunctiontypeid_fkey", FK_COLUMNS="bffunctiontypeid" */
    UPDATE team() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  team on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0003a323", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" */
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
        /*  %JoinFKPK(team, %Old," = "," AND") */
        team.parentteamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE team because team exists.';
    END IF;

     * erwin Builtin Trigger * 
     * team  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE team because shifthistory exists.';
    END IF;

     * erwin Builtin Trigger * 
     * team  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftteamid", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE team because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * team  borderforcedog on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedogteam", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE team because borderforcedog exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_team AFTER DELETE ON public."team" for each row
EXECUTE PROCEDURE aft_delete_tD_team();

CREATE  TRIGGER tI_team BEFORE INSERT ON team for each row
-- erwin Builtin Trigger
-- INSERT trigger on team 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * team  team on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00041972", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" * 
    UPDATE team
      SET
         * %SetFK(team,NULL) * 
        team.parentteamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
               * %JoinFKPK( %New,team," = "," AND") * 
               new.parentteamid = team.teamid
        ) 
         * %JoinPKPK(team, %New," = "," AND") * 
        team.teamid =  new.teamid;

     * erwin Builtin Trigger * 
     * rf_location  team on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" * 
    UPDATE team
      SET
         * %SetFK(team,NULL) * 
        team.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
               * %JoinFKPK( %New,rf_location," = "," AND") * 
               new.locationid = rf_location.locationid
        ) 
         * %JoinPKPK(team, %New," = "," AND") * 
        team.teamid =  new.teamid;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  team on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" * 
    UPDATE team
      SET
         * %SetFK(team,NULL) * 
        team.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
               * %JoinFKPK( %New,rf_organisationcommand," = "," AND") * 
               new.commandid = rf_organisationcommand.commandid
        ) 
         * %JoinPKPK(team, %New," = "," AND") * 
        team.teamid =  new.teamid;

     * erwin Builtin Trigger * 
     * rf_bffunctiontypes  team on child insert set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bffunctiontypes"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_bffunctiontypeid_fkey", FK_COLUMNS="bffunctiontypeid" * 
    UPDATE team
      SET
         * %SetFK(team,NULL) * 
        team.bffunctiontypeid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_bffunctiontypes
            WHERE
               * %JoinFKPK( %New,rf_bffunctiontypes," = "," AND") * 
               new.bffunctiontypeid = rf_bffunctiontypes.bffunctiontypeid
        ) 
         * %JoinPKPK(team, %New," = "," AND") * 
        team.teamid =  new.teamid;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_team() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  team on parent delete no action */
    /* ERWIN_RELATION CHECKSUM="0003a323", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" */
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
        /*  %JoinFKPK(team, %Old," = "," AND") */
        team.parentteamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot DELETE team because team exists.';
    END IF;

     * erwin Builtin Trigger * 
     * team  shifthistory on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE team because shifthistory exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * team  shift on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftteamid", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE team because shift exists.'
      );
    END IF;

     * erwin Builtin Trigger * 
     * team  borde"rforcedog on parent delete no action * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedogteam", FK_COLUMNS="teamid" * 
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot DELETE team because borderforcedog exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_team AFTER DELETE ON public."team" for each row
EXECUTE PROCEDURE before_insert_tD_team AFTER DELETE ON public."team" for each row
EXECUTE PROCEDURE aft_delete_tD_team();

CREATE  TRIGGER tI_team BEFORE INSERT ON team for each row
-- erwin Builtin Trigger
-- INSERT trigger on team 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* team  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00041972", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.parentteamid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM team
            WHERE
              /* %JoinFKPK( %New,team," = "," AND") */
               new.parentteamid = team.teamid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_location  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.locationid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_location
            WHERE
              /* %JoinFKPK( %New,rf_location," = "," AND") */
               new.locationid = rf_location.locationid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_organisationcommand  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" */
    UPDATE team
      SET
        /* %SetFK(team,NULL) */
        team.commandid = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM rf_organisationcommand
            WHERE
              /* %JoinFKPK( %New,rf_organisationcommand," = "," AND") */
               new.commandid = rf_organisationcommand.commandid
        ) 
        /* %JoinPKPK(team, %New," = "," AND") */
        team.teamid =  new.teamid;

    /* erwin Builtin Trigger */
    /* rf_bffunctiontypes  team on child insert set null */
    /* ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bffunctiontypes"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_bffunctiontypeid_fkey", FK_COLUMNS="bffunctiontypeid" */
    UPDATE team();


CREATE OR REPLACE FUNCTION aft_update_U_team() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* team  team on parent update no action */
  /* ERWIN_RELATION CHECKSUM="0006e259", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.teamid <>  new.teamid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM team
      WHERE
        /*  %JoinFKPK(team, %Old," = "," AND") */
        team.parentteamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update team because team exists.';
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * team  shifthistory on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shifthistory"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shifthistoryteamid", FK_COLUMNS="teamid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.teamid <>  new.teamid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shifthistory
      WHERE
         *  %JoinFKPK(shifthistory, %Old," = "," AND") * 
        shifthistory.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update team because shifthistory exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * team  shift on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="shift"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="shiftteamid", FK_COLUMNS="teamid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.teamid <>  new.teamid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM shift
      WHERE
         *  %JoinFKPK(shift, %Old," = "," AND") * 
        shift.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update team because shift exists.'
      );
    END IF;
  END IF;

   * erwin Builtin Trigger * 
   * team  borderforcedog on parent update no action * 
   * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="borderforcedog"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="borderforcedogteam", FK_COLUMNS="teamid" * 
  IF
     * %JoinPKPK( %Old, %New," <> "," OR ") * 
     old.teamid <>  new.teamid
  THEN
    SELECT count(*) INTO NUMROWS
      FROM borderforcedog
      WHERE
         *  %JoinFKPK(borderforcedog, %Old," = "," AND") * 
        borderforcedog.teamid =  old.teamid;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update team because borderforcedog exists.'
      );
    END IF;
  END IF;

     * erwin Builtin Trigger * 
     * team  team on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="team"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_parentteamid_fkey", FK_COLUMNS="parentteamid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_location  team on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_location"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_locationid_fkey", FK_COLUMNS="locationid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_organisationcommand  team on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_organisationcommand"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_commandid_fkey", FK_COLUMNS="commandid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;

     * erwin Builtin Trigger * 
     * rf_bffunctiontypes  team on child update set null * 
     * ERWIN_RELATION CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="rf_bffunctiontypes"
    CHILD_OWNER="", CHILD_TABLE="team"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="team_bffunctiontypeid_fkey", FK_COLUMNS="bffunctiontypeid" * 
     * Not Implemented due to an ORA-04091 Mutating Table Issue * 
    NULL;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_team AFTER UPDATE ON public."team" for each row
EXECUTE PROCEDURE aft_update_U_team();

