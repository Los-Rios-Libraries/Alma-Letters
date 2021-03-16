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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


        <div class="messageArea">
          <div class="messageBody">

			<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px; table-layout:fixed;">

			  <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">

	              <tr>
	              	<td>
						@@reminder_message@@
	                </td>
	              </tr>

	              <xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">

		              <tr>
		              	<td>
							<h2>@@overdue_loans@@</h2>
		                </td>
		              </tr>

					<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
						  <tr>
							<td>
								<table cellpadding="5" style="padding:8px;" >
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="6">
											<h3><xsl:value-of select="organization_unit/name" /></h3>
										</td>
									</tr>
									<tr>
										<th>@@title@@</th>
										<th>@@due_date@@</th>
                    <th>@@fine@@</th>									
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="due_date"/></td>
                      <td>
                        <xsl:choose>
                        <xsl:when test="normalized_fine != ''">
                          <xsl:value-of select="normalized_fine"/>
                        </xsl:when>
                        <xsl:otherwise>
                          0
                        </xsl:otherwise>
                      </xsl:choose>
                      </td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:if>

				<xsl:if test="notification_data/loans_by_library/library_loans_for_display">

				  <tr>
					<td>
						<h2>@@loans@@</h2>
					</td>
				  </tr>

					<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
						<tr>
							<td>
								<table cellpadding="5" style="padding:8px;" >
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="4">
											<h3><xsl:value-of select="organization_unit/name" /></h3>
										</td>
									</tr>
									<tr>
										<th>@@title@@</th>
										<th>@@due_date@@</th>
										<th>@@fine@@</th>
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="due_date"/></td>
											<td>
                        <xsl:choose>
                        <xsl:when test="normalized_fine != ''">
                          <xsl:value-of select="normalized_fine"/>
                        </xsl:when>
                        <xsl:otherwise>
                          0
                        </xsl:otherwise>
                      </xsl:choose>
                      </td>
											
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:if>

			  </xsl:if>

			  <xsl:if test="notification_data/organization_fee_list/string">
	              <tr>
	              	<td>
						@@debt_message@@
	                </td>
	              </tr>

	              <xsl:for-each select="notification_data/organization_fee_list/string">
                  
	              	<tr>
						<td>
              <xsl:call-template name="replace-string">
              <xsl:with-param name="text" select="."/>
              <xsl:with-param name="replace" select="' USD'" />
              <xsl:with-param name="with" select="''"/>
            </xsl:call-template>
              
              </td>
					</tr>
	              </xsl:for-each>

				  <tr>
	              	<td>
						
						@@total@@ &#36;
            <xsl:call-template name="replace-string">
              <xsl:with-param name="text" select="notification_data/total_fee"/>
              <xsl:with-param name="replace" select="' USD'" />
              <xsl:with-param name="with" select="''"/>
            </xsl:call-template>
						
	                </td>
	              </tr>

	              <tr>
	              	<td>
						@@please_pay_message@@
	                </td>
	              </tr>

			  </xsl:if>
            </table>

          </div>
        </div>

        <!-- footer.xsl -->
		<xsl:call-template name="lrGoToAccount" />
		<xsl:call-template name="lrPatronFooter" />
      </body>
    </html>
    <!-- replace string template -->
  </xsl:template>
          <xsl:template name="replace-string">
                <xsl:param name="text"/>
                <xsl:param name="replace"/>
                <xsl:param name="with"/>
                <xsl:choose>
                        <xsl:when test="contains($text,$replace)">
                                <xsl:value-of select="substring-before($text,$replace)"/>
                                <xsl:value-of select="$with"/>
                                <xsl:call-template name="replace-string">
                                        <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                                        <xsl:with-param name="replace" select="$replace"/>
                                        <xsl:with-param name="with" select="$with"/>
                                </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:value-of select="$text"/>
                        </xsl:otherwise>
                </xsl:choose>
        </xsl:template>

</xsl:stylesheet>