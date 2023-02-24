<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
            <script id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3.0.1/es5/tex-mml-chtml.js"/>
         </head>

         <body>
            <math xmlns="http://www.w3.org/1998/Math/MathML">
               <xsl:apply-templates />
            </math>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="строка">
      <mstyle displaystyle="true">
         <mrow>
            <xsl:apply-templates select="*"/>
         </mrow>
      </mstyle>
   </xsl:template>

   <xsl:template match="операнд">
      <mi>
         <xsl:value-of select="."/>
      </mi>
   </xsl:template>

   <xsl:template match="оператор">
      <mo>
         <xsl:value-of select="."/>
      </mo>
   </xsl:template>

   <xsl:template match="корень">
      <msqrt>
         <xsl:apply-templates select="*"/>
      </msqrt>
   </xsl:template>

   <xsl:template match="дробь">
      <mfrac>
         <xsl:apply-templates select="*"/>
      </mfrac>
   </xsl:template>

   <xsl:template match="число">
      <mn>
         <xsl:value-of select="."/>
      </mn>
   </xsl:template>

   <xsl:template match="низверх">
      <munderover>
         <xsl:apply-templates select="*"/>
      </munderover>
   </xsl:template>

   <xsl:template match="верх">
      <msup>
         <xsl:apply-templates select="*"/>
      </msup>
   </xsl:template>

   <xsl:template match="низ">
      <msub>
         <xsl:apply-templates select="*"/>
      </msub>
   </xsl:template>
</xsl:stylesheet>