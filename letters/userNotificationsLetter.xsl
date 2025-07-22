<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!--<xsl:call-template name="head-do" />-->
				<!-- header.xsl -->

				<!--<xsl:call-template name="senderReceiver" />--> <!-- SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">



						<table cellspacing="0" cellpadding="5" border="0" width="600" style="width:600px; background:#fff; padding:0 8px 0 8px;" align="center">
							<xsl:choose>
								<xsl:when test="notification_data/notification_type = 'NOTIFY_PASSWORD_CHANGE' ">
									<tr>
										<td>
											<h3>@@Line_19@@</h3>
											<xsl:value-of select="notification_data/temp_password" />
										</td>

									</tr>
									<tr>

										<td>
											<h3>@@Line_20@@</h3>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'END_TERM_RETURNS'">
									<tr>
										<td>
											<p>You are receiving this message because you have one or more items on loan from a Los Rios Community College library.</p>

											<p>We hope you have enjoyed the use of these materials. Please note that all materials are due by Wednesday, May 18.</p>

											<p>When returning items, please return them to the library that they were borrowed from. If you have any questions, please contact your library.</p>

											<h2>Return and contact information</h2>
											<h3>American River College</h3>
											<ul>
												<li>Contact: Jane Hoff HoffJ@arc.losrios.edu (916) 484-8744</li>
												<li>Return information: <a href="https://answers.library.losrios.edu/arc/faq/334191">https://answers.library.losrios.edu/arc/faq/334191</a></li>
											</ul>

											<h3>Cosumnes River College</h3>
											<ul>
												<li>Contact: Emily Bond bonde@crc.losrios.edu</li>
												<li>Return information: <a href="https://answers.library.losrios.edu/crc/faq/320267">https://answers.library.losrios.edu/crc/faq/320267</a> </li>
											</ul>
											<h3>Folsom Lake College</h3>
											<ul>
												<li>Contact: (916) 608-6613</li>
												<li>Return information: <a href="https://answers.library.losrios.edu/flc/faq/327551">https://answers.library.losrios.edu/flc/faq/327551</a></li>
											</ul>

											<h3>Sacramento City College</h3>
											<ul>
												<li>Contact: (916) 558-2301</li>
												<li>Return information: <a href="https://answers.library.losrios.edu/scc/faq/316527">https://answers.library.losrios.edu/scc/faq/316527</a></li>
											</ul>


										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_ARC'">
									<tr>
										<td>
											<p>@@Line_1@@</p>
											<p>@@Line_2@@</p>
											<p>@@Line_3@@</p>
											<p>@@Line_4@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_CRC'">
									<tr>
										<td>
											<p>@@Line_5@@</p>
											<p>@@Line_6@@</p>
											<p>@@Line_7@@</p>
											<p>@@Line_8@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_FLC'">
									<tr>
										<td>
											<p>@@Line_9@@</p>
											<p>@@Line_10@@</p>
											<p>@@Line_11@@</p>
											<p>@@Line_12@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_SCC'">
									<tr>
										<td>
											<p>@@Line_13@@</p>
											<p>@@Line_14@@</p>
											<p>@@Line_15@@</p>
											<p>@@Line_16@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'SCC_SURVEY'">
									<tr>
										<td>
											<p>Thank you for using the Sacramento City College Library! According to our records, you&apos;ve checked out at least one book with us this semester. We would love to hear about your experience.</p>

											<p>We&apos;re conducting our annual Library Survey to gather feedback from people who have used our services. Your input will help us improve our services for the whole campus community.</p>

											<p>The survey takes only a few minutes to complete.</p>

											<table align="center" cellpadding="0" style="width:auto !important;" role="presentation">
												<tr>
													<td>
														<a style="display:block;color:#ffffff;background:#8a0028;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #8a0028;border-radius: 4px;" href="https://www.surveymonkey.com/r/FW5CYBL">Open the survey</a>
													</td>
												</tr>
											</table>


										</td>
									</tr>
								</xsl:when><xsl:when test="notification_data/notification_type = 'SCC_SURVEY'">
									<tr>
										<td>
											<p>Thank you for using the Sacramento City College Library! According to our records, you&apos;ve checked out at least one book with us this semester. We would love to hear about your experience.</p>

											<p>We&apos;re conducting our annual Library Survey to gather feedback from people who have used our services. Your input will help us improve our services for the whole campus community.</p>

											<p>The survey takes only a few minutes to complete.</p>

											<table align="center" cellpadding="0" style="width:auto !important;" role="presentation">
												<tr>
													<td>
														<a style="display:block;color:#ffffff;background:#8a0028;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #8a0028;border-radius: 4px;" href="https://www.surveymonkey.com/r/FW5CYBL">Open the survey</a>
													</td>
												</tr>
											</table>


										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'SCC_SEMESTER_RETURNS'">
									<tr>
										<td>
											<p>We are contacting you because you currently have a Chromebook or other laptop checked out from the SCC Library for the full summer term. We hope that this equipment has been helpful to you in your studies.</p>

											<p>Please be aware that all items are due back to the library by the end of the summer term: Thursday, August 7 at 6:00 pm. Items that are not returned by a certain point will generate a Lost Item Replacement Fee in eServices. Please avoid hassles by returning your items! For details on returning items, <a href="https://answers.library.losrios.edu/scc/faq/316527">see our FAQ</a>.</p>

											<p>If you are enrolled in fall courses and would like to continue using the equipment, you may request that your loan be extended.</p>
											
											<p>To request an extension of your loan, please call the Circulation Desk at (916) 558-2301. Staff will look up your account and verify that you are enrolled in fall semester classes before extending the loan.</p>

										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'FEE_PAYMENT'">
									<tr>
										<td>
											<p>
												According to our records, one or more library fees you had incurred for unreturned library items were paid last week. We are reaching out to you to confirm that we have received the payment.
											</p>
											<p>
												In some cases fees are paid in eServices by credits to your student account, so you might not be aware that the fees were paid.</p>
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
																<p>To see which fees were cleared, please <a href="https://library.losrios.edu/my-account?section=fines">view your library account</a> and, under the Fees section, switch the dropdown to <i>Closed</i>.</p>
															</xsl:if>
										<xsl:if test="$currentDate &gt; $expireddate">
											<p>If you need information about which items fees were paid for, contact your library:</p>
											<ul>
												<li>
													ARC: (916) 484-8455
												</li>
												<li>
													CRC: (916) 691-7266
												</li>
												<li>
													FLC: (916) 608-6613
												</li>
												<li>
													SCC: (916) 558-2301
												</li>

											</ul>
											
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<p>To see which fees were cleared, please <a href="https://library.losrios.edu/my-account?section=fines">view your library account</a> and, under the Fees section, switch the dropdown to <i>Closed</i>.</p>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<p><strong>If you return these items promptly in good condition, we will coordinate a refund for you.</strong></p>

										
										</td>
										
									</tr>
									<xsl:call-template name="returns" />


								</xsl:when>
								
							</xsl:choose>
						</table>
					</div>
				</div>
				<xsl:if test="notification_data/notification_type != 'SCC_SURVEY' and notification_data/notification_type != 'FEE_PAYMENT'">
					<xsl:call-template name="lrGoToAccount" />
				</xsl:if>
				<xsl:call-template name="lrPatronFooter" />
				<!--<xsl:call-template name="lrDOFooter" />-->

				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>