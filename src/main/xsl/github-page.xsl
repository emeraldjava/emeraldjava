<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="http://ns.hr-xml.org/2007-04-15">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
  <head>
    <meta charset='utf-8'/>
    <meta http-equiv="X-UA-Compatible" content="chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link href='https://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="stylesheets/stylesheet.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="stylesheets/pygment_trac.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="stylesheets/print.css" media="print" />

    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <title><xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:MiddleName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/></title>
  </head>

  <body>
    <header>
      <div class="inner">
        <h1><xsl:value-of select="concat(/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:MiddleName,' ',/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName)"/></h1>
        <h2>Curriculum Vitae</h2>
        <h3><b><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:Objective"/></b></h3>
      </div>
    </header>

    <div id="content-wrapper">
      <div class="inner clearfix">
        <section id="main-content">
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
	<ol class="vcalendar unstyled">
		<xsl:for-each select="/h:Resume/h:StructuredXMLResume/h:EmploymentHistory/h:EmployerOrg">
			<li id="{h:EmployerOrgName}vcard" class="experience vevent vcard">
				<div class="htitle">
					<h3>
                        <a class="org url" target="_blank" href="{h:EmployerContactInfo/h:InternetDomainName}" title="{h:EmployerOrgName}">
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
            </li>
            <br/>
		</xsl:for-each>
	</ol>
	
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

        <aside id="sidebar">
        
        <div class="row">
          <h2>
            <div><div class="fn n"><span class="given-name"><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:GivenName"/></span><span class="family-name"> <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:FamilyName"/></span></div><span>Curriculum Vitae</span></div>
            <small><xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:PersonName/h:AlternateScript"/></small>
          </h2>
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
                <span>
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:PostalCode"/>
                </span>
                <span class="country-name">
                    <xsl:value-of select="/h:Resume/h:StructuredXMLResume/h:ContactInfo/h:ContactMethod/h:PostalAddress/h:CountryCode"/>
                </span>
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
        
<!--           <a href="https://github.com/emeraldjava/emeraldjava/zipball/master" class="button"> -->
<!--             <small>Download</small> -->
<!--             .zip file -->
<!--           </a> -->
<!--           <a href="https://github.com/emeraldjava/emeraldjava/tarball/master" class="button"> -->
<!--             <small>Download</small> -->
<!--             .tar.gz file -->
<!--           </a> -->

<!--           <p class="repo-owner"><a href="https://github.com/emeraldjava/emeraldjava"></a> is maintained by <a href="https://github.com/emeraldjava">emeraldjava</a>.</p> -->

<!--           <p>This page was generated by <a href="pages.github.com">GitHub Pages</a> using the Architect theme by <a href="http://twitter.com/jasonlong">Jason Long</a>.</p> -->
        </aside>
      </div>
    </div>

</body>
</html>
</xsl:template>
</xsl:stylesheet>