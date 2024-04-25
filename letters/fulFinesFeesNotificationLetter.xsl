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
				<xsl:call-template name="toWhomIsConcerned" />

	
		<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
				<tr>
				<td style="padding:16px 0 16px 15px;">
					<!--Only send letter if user is expired-->

					@@we_would_like@@  @@debt_of@@ &#36;<xsl:value-of select="notification_data/total_fines_amount"/> because of fines or fees incurred at the <xsl:value-of select="notification_data/organization_unit/name"/>. Details&#58;
				</td>
				</tr>
				</table>

				<table align="center" cellpadding="0" class="listing" style="width:600px;text-align:left;background-color:#fff;padding:0;font-size:100%">
				

				<table align="center" cellpadding="0" class="listing" style="width:600px; text-align:left; background-color:#fff; padding:0; font-size:100%;">
				
					<tr>
						<th style="padding-left:15px;">@@fee_type@@</th>
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td style="padding-left:15px;"><xsl:value-of select="fine_fee_type_display"/></td>
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
				<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
					<tr>
						<td style="padding:16px 0 16px 15px;">
							<!-- first letter will make later conditional easier to read -->
							<xsl:variable name="feeLibraryFirstLetter" select="substring(notification_data/organization_unit/name,1,1)" />
							<p>Most fines and fees are the result of unreturned library materials.</p>
							<p><strong>Current students need these materials.</strong> If you still have them, please return them.</p>
							<p>If you return your library materials, we will be able to greatly reduce these fees or eliminate them entirely.</p>
							<xsl:if test="notification_data/general_data/current_date">
								<xsl:param name="currentDateEC" select="notification_data/general_data/current_date" />
								<xsl:param name="expiryDateEC" select="notification_data/receivers/receiver/user/expiry_date" />
								<xsl:choose>
									<xsl:when test="$expiryDateEC != ''">
										<!--Split the current date-->
										<xsl:variable name="CMONEC" select="substring($currentDateEC,1,2)" />
										<xsl:variable name="CDAYEC" select="substring($currentDateEC,4,2)" />
										<xsl:variable name="CYEAEC" select="substring($currentDateEC,7,4)" />
										<!--Split the expiry date-->
										<xsl:variable name="EMONEC" select="substring($expiryDateEC,1,2)" />
										<xsl:variable name="EDAYEC" select="substring($expiryDateEC,4,2)" />
										<xsl:variable name="EYEAEC" select="substring($expiryDateEC,7,4)" />
										<!--Create dates for checking-->
										<xsl:variable name="currentDate" select="concat($CYEAEC,$CMONEC,$CDAYEC)" />
										<xsl:variable name="expireddate" select="concat($EYEAEC,$EMONEC,$EDAYEC)" />
										<xsl:if test="$currentDate &lt; $expireddate">
											<p>To see what materials you still have on loan, please <a href="https://library.losrios.edu/my-account">view your library account</a> or contact your library:</p>
										</xsl:if>
										<xsl:if test="$currentDate &gt; $expireddate">
											<p>To find out details about what needs to be returned, please call the library&apos;s circulation desk:</p>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<p>To see what materials you still have on loan, please <a href="https://library.losrios.edu/my-account">view your library account</a> or contact your library:</p>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							
							<xsl:choose>
								<xsl:when test="$feeLibraryFirstLetter = 'A'">
									(916) 484-8455.
								</xsl:when>
								<xsl:when test="$feeLibraryFirstLetter = 'C'">
									(916) 691-7266.
								</xsl:when>
								<xsl:when test="$feeLibraryFirstLetter = 'F'">
									(916) 608-6613.
								</xsl:when>
								<xsl:when test="$feeLibraryFirstLetter = 'S'">
									(916) 558-2301.
								</xsl:when>
								<xsl:otherwise>
									<ul>
										<li>ARC Library: (916) 484-8455</li>
										<li>CRC Library: (916) 691-7266</li>
										<li>FLC Library: (916) 608-6613</li>
										<li>SCC Library: (916) 558-2301</li>
									</ul>
								</xsl:otherwise>
							</xsl:choose>
							

							
						</td>
					</tr>
					
				</table>
				<xsl:call-template name="returns" />
				</table>
				 

				<!--<xsl:call-template name="lrGoToAccount" />-->
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>