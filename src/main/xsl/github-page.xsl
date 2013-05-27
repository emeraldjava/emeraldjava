<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="http://ns.hr-xml.org/2007-04-15">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="chrome=1"/>
    <title><xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/> CV</title>  
    <link rel="stylesheet" href="stylesheets/styles.css"/>
    <link rel="stylesheet" href="stylesheets/pygment_trac.css"/>
<!--     <script src="javascripts/scale.fix.js"></script> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/> -->
    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"/>
    <![endif]-->
  </head>
  <body>
    <div class="wrapper">
    <header>
      <h1 class="header"><xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:MiddleName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/></h1>
      <h2 class="header"><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:AlternateScript"/></h2>
      
      <p class="header">
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
       </p>
    </header>

    <section id="main-content">
    <h2>Objective</h2>
    <p><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:Objective"/></p>
        
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
	
	<h2>Professional Experience</h2>
<!-- 	<ul class="vcalendar unstyled"> -->
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EmploymentHistory/h:EmployerOrg">
			<div id="{h:EmployerOrgName}vcard" class="experience vevent vcard">
				<div class="htitle">
					<div>
                        <a class="org url" target="_blank" href="{h:EmployerContactInfo/h:InternetDomainName}" title="{h:EmployerOrgName}">
                            <h3><div class="fn"><span class="summary"><xsl:value-of select="h:EmployerOrgName"/></span></div></h3>
                        </a>

                        <h4><xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Municipality"/>, <xsl:value-of select="h:EmployerContactInfo/h:LocationSummary/h:Region"/>
                        <small>
                            <div class="date date_duration">
                                from <abbr class="dtstart" title="{h:PositionHistory/h:StartDate/h:YearMonth}">
                                <xsl:value-of select="h:PositionHistory/h:StartDate/h:YearMonth"/>
                                </abbr> until <abbr class="dtend" title="{h:PositionHistory/h:EndDate/h:YearMonth}">
                                <xsl:value-of select="h:PositionHistory/h:EndDate/h:YearMonth"/>
                                </abbr>
                            </div>
                        </small>
                        </h4>
                    </div>

                    <ol>
                    	<li><span><xsl:value-of select="h:PositionHistory/h:UserArea"/></span></li>
                        <xsl:for-each select="h:PositionHistory/h:Description">
                            <li><span><xsl:value-of select="."/></span></li>
                        </xsl:for-each>
                    </ol>
				</div>
            </div>
            <br/>
		</xsl:for-each>
<!-- 	</ul> -->
	
	<h2>Education</h2>
	<div class="vcalendar">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EducationHistory/h:SchoolOrInstitution">
			<div id="{h:Degree/h:DegreeName}vcard" class="education vevent vcard">
				<div class="htitle">
					<!-- div float container -->
					<h3 class="summary">
                        <a class="fn org url" target="_blank" href="{h:School/h:InternetDomainName}" title="{h:School/h:SchoolName}">
							<span class="summary"><xsl:value-of select="h:Degree/h:DegreeName"/></span>
						</a>
                        <small class="pull-right"><xsl:value-of select="h:School/h:SchoolName"/></small>
                        <small>
                            <div class="date_duration">
                                <abbr class="dtstart" title="{h:Degree/h:DatesOfAttendance/h:StartDate/h:YearMonth}">
                                    <xsl:value-of select="h:Degree/h:DatesOfAttendance/h:StartDate/h:YearMonth"/>
                                </abbr> : <abbr class="dtend" title="{h:Degree/h:DatesOfAttendance/h:EndDate/h:YearMonth}">
                                    <xsl:value-of select="h:Degree/h:DatesOfAttendance/h:EndDate/h:YearMonth"/>
                                </abbr>
                            </div>
                        </small>

					</h3>
					<span class="description">
						<xsl:value-of select="h:Degree/h:Comments"/>
					</span>

					<!--<span>
						<a class="fn org url" href="{h:School/h:InternetDomainName}" title="{h:School/h:SchoolName}">
							<xsl:value-of select="h:School/h:SchoolName"/>
						</a>
					</span>        -->
				</div>

                <br/>
				<!--<div style="clear: both">
					<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
				</div>        -->
			</div>
		</xsl:for-each>
	</div>


      </section>
      <footer>
        <p><small>Hosted on <a href="http://pages.github.com/">GitHub Pages</a> using the <a href="https://github.com/broccolini/dinky">Dinky theme</a></small></p>
      </footer>
    </div>
    <!--[if !IE]>
    <script>fixScale(document);</script>
    <![endif]-->
  </body>
</html>

</xsl:template>
</xsl:stylesheet>