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
				
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				
				<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px; ">
					<tr>
						<td><p>@@following_loaned_item_which_has@@</p>
					

					<xsl:for-each select="notification_data">
						<ul style="list-style-type:none !important;">
							
							<li><b>@@title@@: </b> <xsl:value-of select="item_loan/title"/></li>
							<xsl:if test="item_loan/description !=''">
								<li><b>@@loan_details@@: </b><xsl:value-of select="item_loan/description"/></li>
							</xsl:if>
								
								
								
								<li><b>@@author@@: </b><xsl:value-of select="item_loan/author"/></li>
								
								<li><b>@@library@@: </b><xsl:value-of select="organization_unit/name"/></li>
								
								<li><b>@@loan_date@@: </b><xsl:value-of select="item_loan/loan_date"/></li>
								
								<li><b>@@due_date@@: </b><xsl:value-of select="item_loan/due_date"/></li>
								
								<li><b>@@your_account_balance_will_be_credited@@: </b>
																
																@@bellow_details_charges_credits_due@@</li>
							
						</ul>
	
								
							
					
				</xsl:for-each>
					</td>
</tr>
					<tr>
						<td>
							
						<table cellspacing="0" cellpadding="0" border="0" align="center"  style="padding: 12px 60px;">

						<tr style="text-align:left !important;">
							<th>@@fee_type@@</th>
							<th align="right" >@@fee_amount@@</th>
							<xsl:if test="finecomment != ''">
								<th>@@note@@</th>
							</xsl:if>
							
						</tr>
					
						<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
						<tr>
							<td><xsl:value-of select="fine_fee_type_display"/></td>
							<td align="right">&#36;<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;</td>
							<xsl:if test="finecomment != ''">
								<td><xsl:value-of select="finecomment"/></td>
							</xsl:if>
							
						</tr>
						</xsl:for-each>

						<tr>
							<td align="right"><b>@@total@@:</b></td>
							<td align="right">&#36;<xsl:value-of select="notification_data/total_fines_amount"/></td>
						</tr>
						
						

					</table>

						</td>
					</tr>
					<tr>
							<td>
								<p>
								If you have returned all materials and the above still shows a processing fee, please note that this processing fee will be removed. Please check your library account for current balance.
							</p>
							</td>
							
						</tr>
				</table>
				
				<xsl:call-template name="lrGoToAccount" />
				
				<xsl:call-template name="lrPatronFooter" /> <!-- footer.xsl -->
				
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>