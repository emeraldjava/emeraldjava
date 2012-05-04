<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="http://ns.hr-xml.org/2007-04-15">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>
<xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:MiddleName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/>'s Curriculum Vitae
</title>
</head>
<body>
<div class="hresume">
	<h1 id="cv">Curriculum Vitae</h1>
	<div class="contact vcard">
		<div class="fn n" id="j">
			<span class="given-name">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName"/>
			</span>
			<span class="family-name">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName"/>
			</span>
			<span class="middle-name">
, <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:AlternateScript"/>
			</span>
		</div>
		<div class="adr">
			<span class="street-address">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:DeliveryAddress/h:AddressLine"/>
			</span>
			<br/>
			<span class="locality">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:Municipality"/>
			</span>, <span class="region">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:Region"/>
			</span>
			<span class="postal-code">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:PostalCode"/>
			</span>
			<span class="country-name">
				<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:CountryCode"/>
			</span>
		</div>
		<!-- contact details -->
		<div style="float: left; padding-right: 15px;">
			<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod">
				<span class="tel">
					<span class="value">
						<xsl:value-of select="h:Telephone/h:FormattedNumber"/>
					</span>
				</span>
			</xsl:for-each>
		</div>
		<br/>
<div style="float: left;">
Email: <a class="external email fn" href="mailto:{/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetEmailAddress}">
<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetEmailAddress"/>
</a>
<br/>
<!-- Web: <a class="url" href="{/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetWebAddress}">
<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetWebAddress"/>
</a>
<br/>
<a class="url" href="{/h:Resume/h:StructuredXMLResume/h:ResumeAdditionalItems/h:ResumeAdditionalItem/h:Description}">
<xsl:value-of select="substring-after(/h:Resume/h:StructuredXMLResume/h:ResumeAdditionalItems/h:ResumeAdditionalItem/@type,'x:')"/>
</a>-->
</div>
<div style="clear: both;">
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
</div>
</div>
<hr/>
<div>
	<h2>Objective</h2>
	<p class="summary">
	<xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:Objective"/>
	</p>
</div>
<hr/>
<div>
	<h2>Skills</h2>
	<div>
		<div class="tags">
			<ul>
				<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:Qualifications/h:Competency">
					<li>
						<a class="skill" target="_blank" rel="tag" href="http://stackoverflow.com/questions/tagged/{@name}">
						<xsl:value-of select="@name"/></a> : <xsl:value-of select="@description"/>
					</li>
				</xsl:for-each>
			</ul>
		</div>
	</div>
</div>

<!-- experience -->
<hr/>
<div>
	<h2>Professional Experience</h2>
	<div class="vcalendar">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EmploymentHistory/h:EmployerOrg">
			<div class="experience vevent vcard">
				<div class="htitle">
					<!-- div float container -->
					

					<span class="org">
						<xsl:value-of select="h:EmployerOrgName"/>
					</span>, <span class="location">
						<xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Municipality"/>, <xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Region"/>
					</span>
				</div>
				<div class="date_duration">
					<abbr class="dtstart" title="{h:PositionHistory/h:StartDate/h:YearMonth}">
						<xsl:value-of select="h:PositionHistory/h:StartDate/h:YearMonth"/>
					</abbr> - <abbr class="dtend">
						<xsl:value-of select="h:PositionHistory/h:EndDate/h:YearMonth"/>
					</abbr>
				</div>

				<span class="title">
					<xsl:value-of select="h:PositionHistory/h:Title"/>
				</span>
				<div class="description">
					<xsl:value-of select="h:PositionHistory/h:Description"/>
				</div>
			</div>
				<div style="clear: both">
					<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
				</div>
		</xsl:for-each>
	</div>
</div>

<!-- experence -->
<hr/>
<div>
	<h2>Education</h2>
	<div class="vcalendar">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EducationHistory/h:SchoolOrInstitution">
			<div class="education vevent vcard">
				<div class="htitle">
					<!-- div float container -->
					<span class="summary">
						<xsl:value-of select="h:Degree/h:DegreeName"/>
						<xsl:value-of select="h:Degree/h:DegreeMajor/h:Name"/>
					</span>
					<br/>
					<span class="org">
						<xsl:value-of select="h:School/h:SchoolName"/>
					</span>
				</div>
				<div class="date_duration">
					<abbr class="dtend" title="{h:Degree/h:DegreeDate/h:YearMonth}">
						<xsl:value-of select="h:Degree/h:DegreeDate/h:YearMonth"/>
					</abbr>
				</div>
				<div style="clear: both">
					<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
				</div>
			</div>
		</xsl:for-each>
	</div>
</div>

</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>