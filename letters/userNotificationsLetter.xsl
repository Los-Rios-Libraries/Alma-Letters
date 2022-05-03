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
								
							</xsl:choose>
						</table>
					</div>
				</div>
				<xsl:call-template name="lrGoToAccount" />
				<xsl:call-template name="lrPatronFooter" />
				<!--<xsl:call-template name="lrDOFooter" />-->

				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>