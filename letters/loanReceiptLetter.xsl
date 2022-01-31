<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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

        	<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;table-layout:fixed; word-wrap:break-word;" role="presentation">
				<tr>
					<td>
            <xsl:choose>
              <xsl:when test="/notification_data/organization_unit/code != 'FLOCKERS' and /notification_data/organization_unit/code != 'SLOCKERS'">
                <p>@@inform_loaned_items@@ <xsl:value-of select="notification_data/organization_unit/name" />:</p>
              </xsl:when>
              <xsl:otherwise>
                Your recent library request has been checked out to you and will be placed in the <xsl:value-of select="/notification_data/organization_unit/name" /> shortly:

              </xsl:otherwise>
            </xsl:choose>
					</td>
				</tr>

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table  cellspacing="0" cellpadding="5" border="0" align="center" style="background:#fff;">
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="5">
										<h3><xsl:value-of select="organization_unit/name" /></h3>
									</td>
								</tr>
								
								<!--Reorder table columns, loan and due dates to the right; remove description column-->
								<tr align="left">
									<th>@@title@@</th>
                  <xsl:if test="item_loans/overdue_and_lost_loan_notification_display/item_loan/author !=''">
                    <th>@@author@@</th>
                  </xsl:if>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<!--<th>@@description@@</th>-->
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td>
                      <xsl:choose>
                        <xsl:when test="string-length(title) &gt; 110">
                        	<xsl:value-of select="substring(title,0,100)" />
                          <xsl:text>...</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                        	<xsl:value-of select="title"/>
                      	</xsl:otherwise>
                    	</xsl:choose>	
                    </td>
                    <xsl:if test="author !=''">
                      <td><xsl:value-of select="author"/></td>
                    </xsl:if>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<!--<td><xsl:value-of select="description"/></td>-->
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:for-each>
        <xsl:if test="/notification_data/organization_unit/code = 'FLOCKERS' or /notification_data/organization_unit/code = 'SLOCKERS'">
          <tr>
            <td>
              <p>Watch for an email from <i>support@luxerone.com</i> that will include your locker access code.</p>
              <p>
                If you need a wheelchair-accessible locker, please
                <xsl:choose>
                  <xsl:when test="/notification_data/organization_unit/code = 'FLOCKERS'">
                   contact the library at (916) 608-6613
                  </xsl:when>
                   <xsl:when test="/notification_data/organization_unit/code = 'SLOCKERS'">
                    call us at (916) 558-2301 or email us at circlib@scc.losrios.edu
                    </xsl:when>
                </xsl:choose>
                , and we will make sure your library materials are placed in a locker you can reach.
              </p>
              <p>For more information about picking up items from library lockers, please
                <xsl:choose>
                  <xsl:when test="/notification_data/organization_unit/code = 'FLOCKERS'">
                    <a href="https://answers.library.losrios.edu/flc/faq/361527">see our instructions.</a>
                  </xsl:when>
                   <xsl:when test="/notification_data/organization_unit/code = 'SLOCKERS'">
                     <a href="https://answers.library.losrios.edu/scc/faq/360910">see our instructions.</a>
                    </xsl:when>
                </xsl:choose>
              </p>
            </td>
          </tr>
        </xsl:if>
                
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
