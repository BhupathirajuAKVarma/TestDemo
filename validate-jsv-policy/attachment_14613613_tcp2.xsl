<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:dp="http://www.datapower.com/extensions" extension-element-prefixes="dp" exclude-result-prefixes="dp"
>

<dp:output-mapping href="http://dp4-l3.boeblingen.de.ibm.com/String.ffd" type="ffd"/>

<xsl:template match="/">
<xsl:variable name="tcp-url" select="'tcp://dp4-l3.boeblingen.de.ibm.com:8080'" />
<xsl:variable name="commit">
<commit><![CDATA[0&DocClass=CMBS&xxFileDirxx=/MSAR/cmbs_store/&xxFileNamexx=test&xxFileExtxx=txt&FormatType=TXT&xxNumPgxx=0]]>
</commit>
</xsl:variable>

<xsl:variable name="response">
<dp:url-open target="{$tcp-url}" response="binaryNode" data-type="xml">
<xsl:value-of select="$commit" />
</dp:url-open>
</xsl:variable>
<Conversion>
<str>
<xsl:value-of select="dp:decode(dp:binary-encode($response/result/binary),'base-64')"/>
</str>
</Conversion>

<xsl:variable name="text" select="/Conversion/str/text()" />
<dp:set-variable name="'var://context/ECM/text'" value="$text" />

<dp:set-variable name="'var://service/routing-url'" value="'http://services-sitce1.bankofamerica.com:80/wsi/FNCEWS35SOAP/'" />

</xsl:template>
</xsl:stylesheet>


</xsl:temp