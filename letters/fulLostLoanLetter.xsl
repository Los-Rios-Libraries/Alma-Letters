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
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


				<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff;">
				<tr>
				<td style="padding-left:15px;">
					<p>@@inform_you_item_below@@ @@decalred_as_lost@@.</p>
				</td>
				</tr>
				</table>

				<table class="listing" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
				
				<xsl:for-each select="notification_data">
				<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
					<tr>
						<td>
							<ul style="list-style-type:none;">
								<li><b>@@lost_item@@:</b>&#160; <xsl:value-of select="item_loan/title"/></li>
						 
						
						<li><b> @@by@@:</b>&#160;<xsl:value-of select="item_loan/author"/></li>
						
						<li><b>@@library@@:</b>&#160;<xsl:value-of select="organization_unit/name"/></li>
					
						<li><b>@@loan_date@@:</b>&#160;<xsl:value-of select="item_loan/loan_date"/></li>
						<li><b>@@due_date@@:</b>&#160;<xsl:value-of select="item_loan/due_date"/></li>
					
						<li><b>@@barcode@@:</b>&#160;<xsl:value-of select="item_loan/barcode"/></li>
				
						</ul>
						
								
							
						
						</td>
					</tr>
				</table>
				</xsl:for-each>

				<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" class="listing">
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
						<td><xsl:value-of select="ff"/></td>
					</tr>
					</xsl:for-each>

				</table>
				<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff;">
					<tr>
						<td style="padding:15px;">
							@@additional_info_1@@
						</td>
					</tr>
				</table>

				</table>
	
				<xsl:call-template name="lrPatronFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>