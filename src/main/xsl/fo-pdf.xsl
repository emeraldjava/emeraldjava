<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
	<xsl:param name="base-size" select="9" />

	<!-- in points -->
	<xsl:param name="headline-size" select="1.8 * $base-size" />
	<xsl:param name="section-size" select="1.4 * $base-size" />
	<xsl:param name="subsection-size" select="1.2 * $base-size" />
	<xsl:param name="text-size" select="1.0 * $base-size" />
	<xsl:param name="footer-size" select="0.9 * $base-size" />
	<xsl:param name="item-indent" select="3" />

	<!-- in milimeters -->
	<xsl:param name="item-spacing" select="2" />

	<!-- in milimeters -->
	<xsl:param name="margin-horiz" select="25" />
	<xsl:param name="margin-vert" select="15" />
	<xsl:variable name="margin-left" select="$margin-horiz - $item-indent" />
	<xsl:variable name="margin-right" select="$margin-horiz + $item-indent" />
	<xsl:variable name="margin-top" select="$margin-vert" />
	<xsl:variable name="margin-bottom" select="$margin-vert + 10" />
	<xsl:template match="/">
		<xsl:variable name="text-fullname">
			<xsl:if test="resume/header/name/title">
				<xsl:value-of select="resume/header/name/title"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="resume/header/name/firstname"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="resume/header/name/surname"/>
		</xsl:variable>
		<xsl:variable name="text-cv">
			Curriculum vitæ
		</xsl:variable>
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4"
					page-height="29.7cm" page-width="21cm">
					
					<fo:region-body margin-left="{$margin-left}mm"
						margin-right="{$margin-right}mm" margin-top="{$margin-top}mm"
						margin-bottom="{$margin-bottom}mm" />
						<fo:region-after extent="{$margin-vert + 5}mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4" font-family="Verdana">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block margin-left="{$margin-left}mm" margin-right="{$margin-right}mm"
						font-size="{$footer-size}pt" text-align-last="justify">
						Page
						<fo:page-number />
						–
						<xsl:value-of select="$text-cv" />
						of
						<xsl:value-of select="$text-fullname" />
						<fo:leader leader-pattern="space" />
						<fo:inline font-family="Courier New" font-weight="bold">
							<xsl:value-of select="/cv/@uri" />
						</fo:inline>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="{$headline-size}pt" font-weight="bold"
						space-after="2mm" width="100%" text-align="start">
						<xsl:value-of select="$text-fullname" />
					</fo:block>
					<xsl:variable name="photo-width" select="128" />
					<xsl:variable name="photo-height" select="150" />
					<xsl:variable name="photo-scale" select="0.22" />
					<fo:block-container position="absolute"
						left="{210 - 2 * $margin-horiz - $photo-scale * $photo-width}mm"
						top="23mm" width="{$photo-scale * $photo-width}mm" height="{$photo-scale * $photo-height}mm"
						border-width="0.5pt" border-style="solid" border-color="black">
						<fo:block>
							<fo:external-graphic src="http://www.cactus/photo"
								width="{$photo-scale * $photo-width}mm" height="{$photo-scale * $photo-height}mm" />
						</fo:block>
					</fo:block-container>
					<xsl:apply-templates />
					<fo:block space-before="5mm" font-size="{$text-size}pt">
						Visit
						<fo:inline font-family="Courier New" font-weight="bold">
							<xsl:value-of select="/cv/@uri" />
						</fo:inline>
						for an online version of this CV, complete with hyperlinks to all
						the referenced projects.
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>