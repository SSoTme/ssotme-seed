<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="project-name" select="'Project'" />
    <xsl:param name="output-filename" select="'output.txt'" />
    <xsl:variable name="project-lines" select="document('project-lines.xml')" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>index.md</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"># <xsl:value-of select="$project-name"/> Docs
<xsl:choose xml:space="default">
                        <xsl:when test="count($project-lines//Lines/string) &lt;= 1 and normalize-space($project-lines//Lines/string) = ''">Edit the `/SSoT/ProjectDescription.txt` file to provide a description for your project.</xsl:when>
                        <xsl:otherwise>
                        <xsl:for-each select="$project-lines//Lines/string" xml:space="preserve">
<xsl:value-of select="." /></xsl:for-each>

                        </xsl:otherwise>
                    </xsl:choose>

## SSoT.me Project Summary

[SSoT.me Project Transpilers](./DSPXml/SSoTmeProject.html)
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
