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
				<!--<xsl:call-template name="head" />-->
				<xsl:call-template name="head-do" />
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
											<h3>@@Line_1@@</h3>
											<xsl:value-of select="notification_data/temp_password" />
										</td>

									</tr>
									<tr>

										<td>
											<h3>@@Line_2@@</h3>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'DO_CHROMEBOOK_EXCHANGE'">
									<tr>
										<td>
											<p>The Los Rios district has a limited number of refurbished desktop computers. You may be eligible to trade your Chromebook loan in for a desktop computer that will be yours to keep.</p>
											<p>Desktop specs:</p>
											<ul>
												<li>23&quot; screen</li>
												<li>30 lbs.</li>
												<li>compact, all-in-one device (no separate tower)</li>
												<li>Windows 10</li>
												<li>enough memory and disk space for additional software.</li>
											</ul>
											<p>If you are interested in exchanging your Chromebook for a desktop, please fill out a request form.</p>
										</td>
									</tr>
									<tr>
										<td>
											<table align="center" cellpadding="0" style="width:auto !important;">
												<tr>
													<td>
														<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px; text-align:center;" href="https://hub.losrios.edu/secure/forms/studentDeviceRequest/exchange.php">Computer Exchange Request</a>
													</td>
												</tr>
											</table>
											<p>If desktops are available we will make arrangements for you to come in to pick it up.</p>

										</td>
									</tr>
									
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'RETURN_DAYS'">
									<tr>
										<td>
											<p>If you have borrowed library materials, including technology such as laptops or Chromebooks, you may return them at specified times during Finals week.</p>
											<p><strong>If you are not continuing as a student for the spring 2021 semester:</strong></p>
											<p style="padding-left:1em;">Please return your device and any other library materials to the college you checked them out from.</p>
											<p><strong>If you are continuing as a student for the spring 2021 semester:</strong> </p>
											<p style="padding-left:1em;">Please keep the device if you still need it. Your due date will be extended.</p>
											<p>Visit the web pages linked below for information on how to return any devices or library materials:</p>
											<ul>
												<li><a href="https://answers.library.losrios.edu/arc/faq/334191">ARC Library returns</a></li>
												<li><a href="https://answers.library.losrios.edu/crc/faq/320267">CRC Library returns</a></li>
												<li><a href="https://answers.library.losrios.edu/flc/faq/327551">FLC Library returns</a> </li>
												<li><a href="https://answers.library.losrios.edu/scc/faq/316527">SCC Library returns</a></li></ul>
										</td>
									</tr>
									
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_SCC'">
									<tr>
										<td>
											<p>Do you need help finding materials for your research paper or projects?</p>
  
											<p>Do you have questions about citations?</p>
											<p style="margin-bottom:10px;">Do you have other general questions?</p>
											<p>Friendly SCC faculty librarians are here to help you!</p>
											<ul>
												<li>Chat with a librarian 24/7 by clicking the "Ask a Librarian" button on the <a href="https://www.scc.losrios.edu/library">SCC Library website</a> or <a href="https://caccl-lrccd.primo.exlibrisgroup.com/discovery/search?vid=01CACCL_LRCCD&#58;scc">OneSearch</a></li>
												<li><a href="https://www.library.losrios.edu/ask-us/?scc">Send us an email</a></li>
												<li><a href="https://caccl-lrccd.primo.exlibrisgroup.com/discovery/search?vid=01CACCL_LRCCD&#58;scc">Use OneSearch</a> to find online resources like ebooks, articles, and videos.</li>
												<li>For more in-depth reference, research, or citations questions, students can book a <a href="https://www.supersaas.com/schedule/SCC_Library/Research_Appointments?m=0">Zoom Research Appointment</a> with a librarian.</li>
												<li><a href="https://www.scc.losrios.edu/student-resources/library/research/pilot-tutorials">PILOT Tutorials</a> (Pathway to Information Literacy) will improve your research skills, including finding sources, evaluating sources for reliability, and MLA or APA citation. You can self-enroll through Canvas and choose which modules to complete.</li>
												<li>Also: <a href="https://researchguides.scc.losrios.edu/election-2020">Election 2020 Guide</a> for the presidential, CA State and local elections.</li>
											</ul>
											<p>Please do not reply to this email. Responses will not be monitored.</p>
										</td>
									</tr>
									
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_FLC'">
									<tr>
										<td>
											<p>Do you need help finding materials for your research paper or projects?</p>
  
											<p>Do you have questions about citations?</p>
											<p style="margin-bottom:10px;">Do you have other general questions?</p>
											<p>Friendly FLC faculty librarians are here to help you!</p>
											<ul>
												<li>Chat with a librarian 24/7 by clicking the "Ask a Librarian" button on the <a href="https://flc.losrios.edu/student-resources/library">FLC Library website</a> or <a href="https://caccl-lrccd.primo.exlibrisgroup.com/discovery/search?vid=01CACCL_LRCCD&#58;flc">OneSearch</a></li>
												<li><a href="https://www.library.losrios.edu/ask-us/?flc">Send us an email</a></li>
												<li><a href="https://caccl-lrccd.primo.exlibrisgroup.com/discovery/search?vid=01CACCL_LRCCD&#58;flc">Use OneSearch</a> to find online resources like ebooks, articles, and videos.</li>
												<li>For more in-depth reference, research, or citations questions, students can book a <a href="https://flc.losrios.edu/student-resources/library/research/research-appointments">Zoom Research Appointment</a> with a librarian.</li>
												<li><a href="https://lrccd.instructure.com/enroll/EJMM9N">Library Research Tutorials</a> will improve your research skills, including finding sources, evaluating sources for reliability, and MLA or APA citation. You can self-enroll through Canvas and choose which modules to complete.</li>
											</ul>
											<p>Please do not reply to this email. Responses will not be monitored.</p>
										</td>
									</tr>
									
								</xsl:when>




							</xsl:choose>
						</table>
					</div>
				</div>
				<!--<xsl:call-template name="lrGoToAccount" />
				<xsl:call-template name="lrPatronFooter" />-->
				<xsl:call-template name="lrDOFooter" />

				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>