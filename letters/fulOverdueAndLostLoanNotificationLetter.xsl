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
				<div class="messageArea">
        <div class="messageBody">


				<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff;">
				<tr>
				<td style="padding-left:15px;">
					<p>@@inform_you_item_below@@</p>
					<p>@@decalred_as_lost@@</p>
				</td>
				</tr>
				</table>

				<table class="listing" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">

					<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
						<tr>
							<td>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="8">
											<h3><xsl:value-of select="organization_unit/name" /></h3>
										</td>
									</tr>
									<tr>
										<th>@@lost_item@@</th>
										<th>@@due_date@@</th>
										<th>@@barcode@@</th>
										<th>@@charged_with_fines_fees@@</th>
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
										<tr>
											<td>
												<xsl:choose>
													<xsl:when test="string-length(item_loan/title) &gt; 110">
														<xsl:value-of select="substring(item_loan/title,0,100)" />
														<xsl:text>...</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="item_loan/title"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td><xsl:value-of select="item_loan/due_date"/></td>
											<td><xsl:value-of select="item_loan/barcode"/></td>
											<td>
												<xsl:for-each select="fines_fees_list/user_fines_fees">
													<b><xsl:value-of select="fine_fee_type_display"/>: </b>&#36;<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
													<br />
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="/overdue_notification_fee_amount/sum !=''">
						<tr>
							<td>
								<b>@@overdue_notification_fee@@</b>
								<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>&#160;<xsl:value-of select="ff"/>
							</td>
						</tr>
					</xsl:if>

					

				</table>
				 <xsl:call-template name="returns" /> <!-- mailReason.xsl -->
				<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff; padding-left:12px;">
						<tr>
							<td>
								<p>
									@@additional_info_1@@
								</p>
								<p>
									@@additional_info_2@@
								</p>
							</td>
						</tr>

				</table>
		</div>
				</div>

				<xsl:call-template name="lrGoToAccount" />
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>