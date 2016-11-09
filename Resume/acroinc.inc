<%
'global variable for email for candidateregisteration
varemailto = "jobs@acrocorp.com"
varemailfrom = "info@acrocorp.com"
%>
<%
function TheFieldValue (theVar)
	valTheVar = rs(theVar)
	if valTheVar <> "" then
		retval = Server.HTMLEncode (valTheVar)
	else
		retval = valTheVar
	end if
	TheFieldValue = retval
end function
%>

<%
function TheValue(TheVar)
	if Request.Form("error")<>"" then
		TheValue=Request.Form(TheVar)
	else
		TheValue = RS(TheVar)
	end if
end function
%>

<%
FUNCTION fixQuotes (theString)
	fixQuotes = REPLACE ( theString, "'", "'")
END FUNCTION
%>

<% ' Array for Skill Category

	dim skillcategoryarray(5)
	skillcategoryarray(0)="Database Design"
	skillcategoryarray(1)="Database Maintenance"
	skillcategoryarray(2)="Operating Systems"
	skillcategoryarray(3)="Programming"
	skillcategoryarray(4)="Web Development"
%>

<% ' Array for Years of experience working with Acro

	dim YearsExperienceArray(5)
	YearsExperienceArray(0)="Less than 1 year"
	YearsExperienceArray(1)="1-3 years"
	YearsExperienceArray(2)="4-10 years"
	YearsExperienceArray(3)="10-20 years"
	YearsExperienceArray(4)="20+ years"
%>

<%
'variable for pagesize on job listing pages
dim Listpagesizevar
	Listpagesizevar=25
	
%>

<%'Array for Education Level dropdown
   dim EdulevelVal (4)
   EdulevelVal(0)="Undergraduate"
   EdulevelVal(1)="Graduate"
   EdulevelVal(2)="Post-Graduate"
   EdulevelVal(3)="High School/GED"

%>   

<%'Array for Jobstatus dropdown
   dim JobstatusVal (4)
   JobstatusVal(0)="Active"
   JobstatusVal(1)="On Hold"
   JobstatusVal(2)="Closed"
   JobstatusVal(3)="Backfill"   
   
%>   

<%'Array for PoistionType dropdown
   dim PositionTypeVal (4)
   PositionTypeVal(0)="Permanent"
   PositionTypeVal(1)="Contract"
   PositionTypeVal(2)="Contract-to-Hire"
   PositionTypeVal(3)="Direct"
%>   

<% 
'Arrays for Acrogroup dropdown
dim JobgroupVal (7)
JobgroupVal(0)="GSS"
JobgroupVal(1)="IND"
JobgroupVal(2)="SSS"
JobgroupVal(3)="TCS"
JobgroupVal(4)="PEO"
JobgroupVal(5)="INT"
JobgroupVal(6)="IRM"
%>



<%
 'Array for contactname dropdown
	dim contactnameVal(14)
	 contactnameVal(0)="Parul Kakkar"
	 contactnameVal(1)="Mitra Roy"
	 contactnameVal(2)="Aru Valecha"
	 contactnameVal(3)="Rob Hannigan"
	 contactnameVal(4)="Samira Azaryayeva"
	 contactnameVal(5)="PN Gautham"
	 contactnameVal(6)="Wally Boozer"
	 contactnameVal(7)="Dara Tompkins"
	 contactnameVal(8)="Beth Patil"
	 contactnameVal(9)="Jennifer Pace"
	 contactnameVal(10)="Selwyn Leung"
	 contactnameVal(11)="Brenda Bevington"
	 contactnameVal(12)="Katrina Purdy"
	 contactnameVal(13)="Brian Daguanno"

%>


<% 'Array for fax Numbers
	dim faxVal(5)
	faxVal(0)="734-591-1217"
	faxVal(1)="734-542-9965"
	faxVal(2)="626-577-9504"
	faxVal(3)="626-577-9576"
	faxVal(4)="615-250-3250"
	%>

<% 'Array for phone Numbers
	dim phoneVal(11)
	phoneVal(0)="800-844-2276"
	phoneVal(1)="888-865-7797"	
	phoneVal(2)="877-890-7101"
	phoneVal(3)="734-437-9224"
	phoneVal(4)="615-250-3034"
	phoneVal(5)="505-995-3137"
	phoneVal(6)="313-964-0775"
	phoneVal(7)="248-619-7320"
	phoneVal(8)="248-910-5373"
	phoneVal(9)="248-758-5116"
	phoneVal(10)="734-591-1100"
	
	phoneVal(11)="Please forward resume only"	
	

%>

<% 
'Arrays for classification dropdown
dim classificationVal (19)
classificationVal(0)="ALL"
classificationVal(1)="ACC"
classificationVal(2)="ADM"
classificationVal(3)="ADV"
classificationVal(4)="BKG"
classificationVal(5)="CUS"
classificationVal(6)="ENG"
classificationVal(7)="FIN"
classificationVal(8)="HLT"
classificationVal(9)="HRS"
classificationVal(10)="ITS"
classificationVal(11)="LAW"
classificationVal(12)="LGL"
classificationVal(13)="MFG"
classificationVal(14)="OTH"
classificationVal(15)="RFS"
classificationVal(16)="RTL"
classificationVal(17)="TRW"
classificationVal(18)="TEC"

dim classificationDetail (19)
classificationDetail (0)="= = =Select All= = ="
classificationDetail (1)="Accounting"
classificationDetail (2)="Administration/Office Support"
classificationDetail (3)="Advertising/Marketing/Sales"
classificationDetail (4)="Banking"
classificationDetail (5)="Customer Service"
classificationDetail (6)="Engineering"
classificationDetail (7)="Financial Services"
classificationDetail (8)="Healthcare"
classificationDetail (9)="Human Resources"
classificationDetail (10)="Information Technology"
classificationDetail (11)="Law Enforcement/Security"
classificationDetail (12)="Legal"
classificationDetail (13)="Manufacturing"
classificationDetail (14)="Other"
classificationDetail (15)="Restaurant/Food Service"
classificationDetail (16)="Retail"
classificationDetail (17)="Transportation/Warehousing"
classificationDetail (18)="Technical"
%>


<%
dim exphrs(8)
exphrs(0)="0-500 Hours"
exphrs(1)="501-1000 Hours"
exphrs(2)="1001-1500 Hours"
exphrs(3)="1501-2000 Hours"
exphrs(4)="2001-3000 Hours"
exphrs(5)="3001-4000 Hours"
exphrs(6)="4001-5000 Hours"
exphrs(7)="5000+ Hours"
%>

<%
dim monthvalue(13)

monthvalue(00)=""
monthvalue(01)="January"
monthvalue(02)="February"
monthvalue(03)="March"
monthvalue(04)="April"
monthvalue(05)="May"
monthvalue(06)="June"
monthvalue(07)="July"
monthvalue(08)="August"
monthvalue(09)="September"
monthvalue(10)="October"
monthvalue(11)="November"
monthvalue(12)="December"
%>

<%dim availabletime(5)
	availabletime(0)="0-30 Days"
	availabletime(1)="30-60 Days"
	availabletime(2)="60-90 Dyas"
	availabletime(3)="More-90 Days"
	availabletime(4)=""
%>

<%
dim desjobtype(4)
desjobtype(0)="Permanent"
desjobtype(1)="Intern"
desjobtype(2)="Contract"
desjobtype(3)="Temporary"
%>

<%
dim sitelocate(3)
sitelocate(0)="On-Site"
sitelocate(1)="Off-Site"
sitelocate(2)="No-Preference"
%>

<%
dim desiredstat(3)
desiredstat(0)="Full-Time"
desiredstat(1)="Part-Time"
desiredstat(2)="No-Preference"
%>

<%
dim salarytype(4)
salarytype(0)="Per Year"
salarytype(1)="Per Month"
salarytype(2)="Per Week"
salarytype(3)="Per Hour"
%>

<%
  dim deglevel(8)
        deglevel(0)="High School"
        deglevel(1)="Certification"
        deglevel(2)="Vocational"
        deglevel(3)="Associate Degree"
        deglevel(4)="Bachelors Degree"
        deglevel(5)="Masters Degree"
        deglevel(6)="Doctorate"
        deglevel(7)="Professional"
%>

<%
dim skillusedval(6)
skillusedval(0)="Never"
skillusedval(1)="Currently Used"
skillusedval(2)="1 year ago"
skillusedval(3)="2 years ago"
skillusedval(4)="3 years ago"
skillusedval(5)="4 years ago"
%>

<%
dim skilllevelval(3)
skilllevelval(0)="Beginner"
skilllevelval(1)="Intermediate"
skilllevelval(2)="Expert"
%>

<%
Dim AvailYears(17)
AvailYears(0)=""
AvailYears(1)="2001"
AvailYears(2)="2002"
AvailYears(3)="2003"
AvailYears(4)="2004"
AvailYears(5)="2005"
AvailYears(6)="2006"
AvailYears(7)="2007"
AvailYears(8)="2008"
AvailYears(9)="2009"
AvailYears(10)="2010"
AvailYears(11)="2011"
AvailYears(12)="2012"
AvailYears(13)="2013"
AvailYears(14)="2014"
AvailYears(15)="2015"
AvailYears(16)="2016"

%>

   <% Dim CurrencyVal(31)
   CurrencyVal(0)="AUD"
   CurrencyVal(1)="BEF"
   CurrencyVal(2)="BRR"
   CurrencyVal(3)="CAD"	
   CurrencyVal(4)="CSK"
   CurrencyVal(5)="DEM"
   CurrencyVal(6)="ESR"
   CurrencyVal(7)="EUR"	
   CurrencyVal(8)="FJD"
   CurrencyVal(9)="BEF"
   CurrencyVal(8)="FRF"
   CurrencyVal(9)="GBP"	
   CurrencyVal(10)="GRD"
   CurrencyVal(11)="HKD"
   CurrencyVal(12)="HUF"
   CurrencyVal(13)="IDR"	
   CurrencyVal(14)="IEP"
   CurrencyVal(15)="ILS"
   CurrencyVal(16)="INR"
   CurrencyVal(17)="ITL"	
   CurrencyVal(18)="JPY"
   CurrencyVal(19)="KRW"
   CurrencyVal(20)="MXP"
   CurrencyVal(21)="MYR"	
   CurrencyVal(22)="NLG"	
   CurrencyVal(23)="NZD"
   CurrencyVal(24)="PLZ"
   CurrencyVal(25)="RUP"
   CurrencyVal(26)="SEK"	
   CurrencyVal(27)="SGD"	
   CurrencyVal(28)="TWD"
   CurrencyVal(29)="USD"
   CurrencyVal(30)="ZAR"
  %>

<%
Dim DegreeVal(8)
DegreeVal(0)="High School"
DegreeVal(1)="Certification"
DegreeVal(2)="Vocational"
DegreeVal(3)="Associate Degree"
DegreeVal(4)="Bachelors Degree"
DegreeVal(5)="Masters Degree"
DegreeVal(6)="Doctorate"
DegreeVal(7)="Professional"
%>
<% Dim Salarytypearray(4)
   Salarytypearray(0)="Per Year"
   Salarytypearray(1)="Per Month"
   Salarytypearray(2)="Per Week"
   Salarytypearray(3)="Per Hour"
   
%>   