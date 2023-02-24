<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
         </head>

         <body>
            <xsl:apply-templates />
         </body>
      </html>
   </xsl:template>

   <xsl:template match="графика">
        <svg height="{@высота}" width="{@ширина}">
            <xsl:apply-templates select="*"/>
        </svg>
   </xsl:template>

    <xsl:template match="эллипс">
        <ellipse id="{@id}" fill="{@заливка}" stroke="{@ободок}" stroke-width="{@ширина-ободка}" cx="{@cx}" cy="{@cy}" rx="{@rx}" ry="{@ry}">
            <xsl:apply-templates select="*"/>
        </ellipse>
   </xsl:template>
</xsl:stylesheet>