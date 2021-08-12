<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="recordTitle.xsl" />

    <xsl:template match="/">
        <html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

            <head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

                <xsl:call-template name="generalStyle" />
            </head>
            <body>
                <xsl:attribute name="style">
                <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
            </xsl:attribute>
                <xsl:call-template name="head" /> <!-- header.xsl -->
                <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

                <div class="messageArea">
                    <div class="messageBody">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 12px 12px 15px;">
                            <tr>
                                <td>
                                    <p>As
                                    <xsl:choose>
                                        <xsl:when test="/notification_data/receivers/receiver/user/user_group = 'STUDENT'">
                                            a student
                                        </xsl:when>
                                        
                                   
                                     <xsl:when test="/notification_data/receivers/receiver/user/user_group = 'EMPLOYEE'">
                                         an employee
                                    </xsl:when>
                                     <xsl:otherwise>
                                        a student or employee
                                     </xsl:otherwise>
                                      </xsl:choose>
                                    in the Los Rios Community College District, you have access to services and resources from your college library.
                                    </p>
                                    <p>
                                        Take a minute to explore:
                                        <ul>
                                            <li>Your <a href="https://library.losrios.edu">library website</a>, where you&apos;ll find current information regarding library services.</li>
                                            <li><a href="https://library.losrios.edu/onesearch">OneSearch</a>, your main search tool for finding books, articles, video and other library materials.</li>
                                            <li><a href="https://library.losrios.edu/databases/">Research Databases</a> providing online resources in various subject areas.
                                            <xsl:if test="/notification_data/receivers/receiver/user/user_group = 'STUDENT'">
                                                <em>Note:</em> access to databases may not be available between semesters.
                                            </xsl:if> </li>
                                            <li>Your <a href="https://library.losrios.edu/my-account">library account</a>, which will allow you to monitor your loans, renew items, and store favorite searches and articles.</li>
                                        </ul>
                                    </p>
                                    <p>Once the semester has started, you can ask librarians questions 24/7 using the Ask a Librarian icons you&apos;ll find on your library&apos;s website, in OneSearch, and certain other places. If a Los Rios librarian is not available when you ask, a professional librarian from another college will field your questions. </p>
                                    <p>During the pandemic, access to print library materials is more limited than normal. Please check your library website and read messages in OneSearch for updated information.</p>
                                    <p>@@closing_message@@</p>
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                </div>
                <xsl:call-template name="lrPatronFooter" /> <!-- footer.xsl -->

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>