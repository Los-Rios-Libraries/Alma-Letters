<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>@@dear@@ </h> <br />
					<h>@@we_would_like@@ <xsl:value-of select="notification_data/organization_unit/name"/> @@debt_of@@ <b><xsl:value-of select="notification_data/total_fines_amount"/>
					&#160;<xsl:value-of select="notification_data/total_fines_currency"/></b></h>
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="fine_comment"/></td>
					</tr>
					</xsl:for-each>

				</table>
				<xsl:if test="notification_data/fine_fee_notification_fee_amount/sum !=''">
		        	<tr>
		            	<td>
		                	<b>@@fine_fee_notification_fee@@ </b>
		                    <xsl:value-of select="notification_data/fine_fee_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="notification_data/fine_fee_notification_fee_amount/currency"/>&#160;<xsl:value-of select="ff"/>
		                </td>
		            </tr>
		        </xsl:if>
				<h><b>@@please_settle@@</b></h>

				<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
				</table>
				</table>
				 

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>