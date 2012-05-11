<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="http://ns.hr-xml.org/2007-04-15">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
    <!-- Le styles -->
    <link href="./css/bootstrap.css" rel="stylesheet"/>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="./css/bootstrap-responsive.css" rel="stylesheet"/>
<title>
<xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:MiddleName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/>'s Curriculum Vitae
</title>
</head>
<body>
<div class="hresume container">

    <div class="row hero-unit">
      <div id="contactvcard" class="span12 contact vcard">
        <div class="row">
          <h2>
            <div><div class="fn n"><span class="given-name"><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName"/></span><span class="family-name"> <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName"/></span></div><span>Curriculum Vitae</span></div>
            <small><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:AlternateScript"/></small>
          </h2>
        </div>
        <div class="row show-grid">
          <div class="span3">
              <div class="adr">
                <span class="street-address">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:DeliveryAddress/h:AddressLine"/>
                </span>
                <br/>
                <span class="locality">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:Municipality"/>
                </span>
                <br/>
                <span class="region">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:Region"/>
                </span>
                <br/>
                <span>
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:PostalCode"/>
                </span>
                <span class="country-name">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:CountryCode"/>
                </span>
            </div>

          </div>
          <div class="span3 offset1">
              <!-- contact details -->
              <dl class="dl-horizontal">
                <dt>Mobile</dt>
                <dd><span class="tel"><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:Telephone/h:FormattedNumber"/></span></dd>
                <dt>Email</dt>
                <dd>
                    <a class="external email" href="mailto:{/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetEmailAddress}">
                        <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:InternetEmailAddress"/>
                    </a>
                </dd>
              </dl>
          </div>
        </div>
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
			<dl class="dl-horizontal">
				<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:Qualifications/h:Competency">
					<dt>
                        <a class="skill" target="_blank" rel="tag" href="http://stackoverflow.com/questions/tagged/{@name}">
					    <xsl:value-of select="@name"/></a>
                    </dt>
                    <dd><xsl:value-of select="@description"/></dd>
				</xsl:for-each>
			</dl>
		</div>
	</div>
</div>

<!-- experience -->
<hr/>
<div>
	<h2>Professional Experience</h2>
	<ol class="vcalendar unstyled">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EmploymentHistory/h:EmployerOrg">
			<li id="{h:EmployerOrgName}vcard" class="experience vevent vcard">
				<div class="htitle">
					<h3>
                        <a class="org url" target="_blank" href="{h:EmployerContactInfo/h:InternetDomainName}">
                            <div class="fn"><span class="summary"><xsl:value-of select="h:EmployerOrgName"/></span></div>
                        </a>

                        <small class="pull-right"><xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Municipality"/>, <xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Region"/></small>
                        <small>
                            <div class="date date_duration">
                                <abbr class="dtstart" title="{h:PositionHistory/h:StartDate/h:YearMonth}">
                                <xsl:value-of select="h:PositionHistory/h:StartDate/h:YearMonth"/>
                                </abbr> - <abbr class="dtend" title="{h:PositionHistory/h:EndDate/h:YearMonth}">
                                <xsl:value-of select="h:PositionHistory/h:EndDate/h:YearMonth"/>
                                </abbr>
                            </div>
                        </small>

                    </h3>

                    <ul class="unstyled description">
                        <li><span><xsl:value-of select="h:PositionHistory/h:UserArea"/></span></li>
                        <ul>
                            <xsl:for-each select="h:PositionHistory/h:Description">
                                <li><span><xsl:value-of select="."/></span></li>
                            </xsl:for-each>
                        </ul>
                    </ul>
				</div>
			<br/>
            </li>

		</xsl:for-each>
	</ol>
</div>

<!-- experence -->
<hr/>
<div>
	<h2>Education</h2>
	<div class="vcalendar">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EducationHistory/h:SchoolOrInstitution">
			<div id="{h:Degree/h:DegreeName}vcard" class="education vevent vcard">
				<div class="htitle">
					<!-- div float container -->
					<span class="summary">
						<xsl:value-of select="h:Degree/h:DegreeName"/>
					</span>
					<br/>
					<span class="description">
						<xsl:value-of select="h:Degree/h:Comments"/>
					</span>
					<br/>
					<span>
						<a class="fn org url" href="{h:School/h:InternetDomainName}" title="{h:School/h:SchoolName}">
							<xsl:value-of select="h:School/h:SchoolName"/>
						</a>
					</span>
				</div>
				<div class="date_duration">
					<abbr class="dtstart" title="{h:Degree/h:DatesOfAttendance/h:StartDate/h:YearMonth}">
						<xsl:value-of select="h:Degree/h:DatesOfAttendance/h:StartDate/h:YearMonth"/>
					</abbr> : <abbr class="dtend" title="{h:Degree/h:DatesOfAttendance/h:EndDate/h:YearMonth}">
						<xsl:value-of select="h:Degree/h:DatesOfAttendance/h:EndDate/h:YearMonth"/>
					</abbr>
				</div>
                <br/>
				<!--<div style="clear: both">
					<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
				</div>        -->
			</div>
		</xsl:for-each>
	</div>
</div>

</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>