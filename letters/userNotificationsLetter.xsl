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
								<xsl:when test="notification_data/notification_type = 'RETURN_DAYS'">
									<tr>
										<td>
											<h3>Another Opportunity to Return Borrowed Items</h3>
											<p style="margin-bottom:10px;">If you have borrowed books, videos, or technology, you can return them at specified times over the next two weeks.</p>
  
											<p style="margin-bottom:10px;">When returning a laptop or other device, you must return it to the college where you checked it out. If you have library books or videos, you may return them to any Los Rios college.</p>
											
											<table style="border:1px solid #ccc; width:80%; max-width:800px;margin-bottom:10px; padding:8px;"><caption style="text-align:left; font-weight:bold;">Schedule</caption>
											<thead style="text-align:left;">
												<tr>
													<th style="text-align:left; width:35%;">Days</th>
													<th style="text-align:left;">Times</th>
												</tr>
												<tr style="margin-bottom:10px;">
													<td style="text-align:left; width:35%;">Monday, August 10 - Thursday, August 13 </td>
													<td>10:00 am to 1:00 pm</td>
												</tr>
												<tr>
													<td style="text-align:left; width:35%;">Monday, August 17 - Thursday, August 20 </td>
													<td>10:00 am to 1:00 pm</td>
												</tr>
											</thead>
											</table>
											<p style="margin-bottom:10px;">In addition, evening opportunities will be available on <strong>Tuesday, August 11 and 18, from 6:00 to 8:00 pm at ARC, CRC and SCC only</strong>. Remember: you can return books and videos to any of the colleges.</p>
											<p style="margin-bottom:10px;">Exact drop-off locations vary by college. Students should have received email with college-specific information in their Los Rios Gmail. <strong>We recommend you check your Los Rios Gmail regularly since all plans are subject to change.</strong></p>
											<p style="margin-bottom:10px;">If you are receiving this email, we believe you currently have at least one item on loan. To find out what you have checked out, go to your <a href="https://www.library.losrios.edu/my-account">Library Account</a>. Note that when you return items, your account might continue to show that you have it borrowed for a week or longer.</p>
											 
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
				<xsl:call-template name="lrGoToAccount" />
				<xsl:call-template name="lrPatronFooter" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>