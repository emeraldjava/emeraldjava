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
      <div class="span12">
        <h1 class="brand" id="cv">Curriculum Vitae</h1>
        <div class="row show-grid contact vcard">
          <div class="span3 offset2">
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
                </span>
                <br/>
                <span class="region">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:Region"/>
                </span>
                <br/>
                <span class="postal-code">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:PostalCode"/>
                </span>
                <span class="country-name">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:CountryCode"/>
                </span>
            </div>

          </div>
          <div class="span3 offset1">
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
              </div>
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
					<xsl:value-of select="@name"/></a></dt><dd><xsl:value-of select="@description"/></dd>
				</xsl:for-each>
			</dl>
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

						<h3 class="org"><xsl:value-of select="h:EmployerOrgName"/>
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

                    <ul class="unstyled">
                    <li><xsl:value-of select="h:PositionHistory/h:UserArea"/></li>
                        <ul>
                            <xsl:for-each select="h:PositionHistory/h:Description">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </ul>
                    <!--
                    <div class="row">
                        <div class="span10">
                            <div class="row">
                                  <div class="span2">
                                      <div class="date_duration">
                                  </div>
                                  <div class="span8">
                                      <xsl:value-of select="h:PositionHistory/h:Description"/></div>
                                  </div>
                            </div>
                        </div>
                    </div>                -->


                    <!--<span class="location">
						<xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Municipality"/>, <xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Region"/>
					</span>-->
				</div>



				<!--<h3 class="title">
					<xsl:value-of select="h:PositionHistory/h:Title"/>
				</h3>-->

                <!--
                <div class="description">
					<xsl:value-of select="h:PositionHistory/h:Description"/>
				</div>             -->
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
					</span>
					<br/>
					<span class="summary">
						<xsl:value-of select="h:Degree/h:Comments"/>
					</span>
					<br/>
					<span class="org">
						<a class="url fn org" href="{h:School/h:InternetDomainName}" title="{h:School/h:SchoolName}">
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