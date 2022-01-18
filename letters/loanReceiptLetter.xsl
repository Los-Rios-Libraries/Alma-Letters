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
						<p>@@inform_loaned_items@@ <xsl:value-of select="notification_data/organization_unit/name" />:</p>
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
										<td><xsl:value-of select="title"/></td>
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
