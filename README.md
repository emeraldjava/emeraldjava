The CV of emeraldjava
=====================

TEST

# Json Resume

https://github.com/hacksalot/HackMyResume

https://github.com/jsonresume/resume-schema

https://jsonresume.org/schema/

https://resumefodder.com/generate.html

https://represent.io/

https://www.npmjs.com/package/cv-schema

https://github.com/erming/jsonresume-theme-flat

http://themes.jsonresume.org/flat

https://github.com/steve-perkins/ResumeFodder-templates

http://registry.jsonresume.org/#simplistic

http://registry.jsonresume.org/#modern

# Resume Schema

https://github.com/elevate/sharpresume/blob/master/HRXML200704/HR-XML-2_5/SEP/Resume.xsd

http://schemas.liquid-technologies.com/HR-XML/2007-04-15/

[![Build Status](https://travis-ci.org/emeraldjava/emeraldjava.svg?branch=master)](https://travis-ci.org/emeraldjava/emeraldjava)

This project allows me to maintains details of my working career in an XML format, to which i then apply XSLT transforms to create PFD and github specific formats.

I have a CI build process setup at

    https://travis-ci.org/emeraldjava/emeraldjava/builds

the next step is for this build to automatically update the github page at

	http://emeraldjava.github.io/emeraldjava/

Mini project to track my CV so that various output formats can be generated.

XML Format
- I looked at xml resume but decided to us hr-xml in the end.

xml -> html using hresume microformat.
xml -> pdf

To handle the transformation of the xml to output formats I am using

     http://code.google.com/p/docbkx-tools/

Maven commands

     mvn xml:transform
     mvn docbkx:generate-pdf

Resources     

     http://lab.madgex.com/hresume/

     http://gergo.erdi.hu/projects/cv-xsl/

     http://onesparrow.com/cv-page.html

     http://onesparrow.com/xhtml2fo.xsl

     http://gergo.erdi.hu/projects/cv-xsl/download/cv.xsl

     http://xmlgraphics.apache.org/fop/0.95/output.html#rtf

     http://ns.hr-xml.org/2_5/HR-XML-2_5/SEP/Resume.xsd
     http://www.xmlhelpline.com/blog/2007/08/18.html

     http://suda.co.uk/cv/

	 http://lab.madgex.com/api/hresumeconversion1_0/?url=https://raw.github.com/emeraldjava/emeraldjava/master/src/main/html/resume.html&format=pdf&section-order=name,summary,skills,work,education,affiliation,publications,contact-details&terminology=en-gb

     http://lab.madgex.com/api/hresumeconversion1_0/?url=https://raw.github.com/emeraldjava/emeraldjava/master/src/main/html/resume.html&format=word&section-order=name,summary,skills,work,education,affiliation,publications,contact-details&terminology=en-us

     http://emeraldjava.github.com/emeraldjava/cv

     http://hcard.geekhood.net/?url=http%3A%2F%2Femeraldjava.github.com%2Femeraldjava%2Fcv#result

     http://careers.stackoverflow.com/users/info/103036

     http://hcard.geekhood.net/?url=http%3A%2F%2Femeraldjava.github.com%2Femeraldjava%2Fcv#result

	http://wrapbootstrap.com/preview/WB0057UJ3

    http://hermanfeuerwerker.com/

	http://lab.madgex.com/api/hresumeconversion1_0/?url=http://emeraldjava.github.com/emeraldjava/cv&format=pdf&section-order=name,summary,work,education,skills,affiliation,publications,contact-details&terminology=en-gb

	http://lab.madgex.com/api/hresumeconversion1_0/?url=http://emeraldjava.github.com/emeraldjava/cv&format=pdf&section-order=name,summary,skills,work,education,affiliation,publications,contact-details&terminology=en-gb

	http://lab.madgex.com/api/hresumeconversion1_0/?url=http://emeraldjava.github.com/emeraldjava/cv&format=pdf&section-order=name,contact-details,summary,skills,work,educations&terminology=en-gb
