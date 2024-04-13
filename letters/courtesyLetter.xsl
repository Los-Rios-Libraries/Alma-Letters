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

			<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
              <tr>
              	<td style="padding-left:12px;">
					<xsl:if test="notification_data/short_loans='true'">
						<p>@@short_loans_message@@</p>
					</xsl:if>
					<xsl:if test="notification_data/short_loans='false'">
						<p>@@message@@</p>
					</xsl:if>
                </td>
              </tr>


              <tr>
                <td style="padding:14px 0;">
                	<table cellpadding="2" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<th>Barcode</th>
							<th>@@library@@</th>
              <th>@@due_date@@</th>
						</tr>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
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
							<td><xsl:value-of select="barcode"/></td>
							<td><xsl:value-of select="library_name"/></td>
              <td><xsl:value-of select="due_date"/></td>

						</tr>
            <xsl:variable name="renewStatus">
              <xsl:value-of select="renew_status" />
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$renewStatus!=''">
              <tr>
                  <td colspan="4" style="padding-bottom:18px;"><em>Reason: 
                <xsl:choose>
                  <xsl:when test="contains($renewStatus, 'Overdue block')">
                  Your account is blocked because of unreturned library items. Please return your items or pay any associated fees connected with lost items. You will not be able to renew your loans until you have resolved these account problems.

                  </xsl:when>
                  <xsl:when test="contains($renewStatus, 'Recalled')">
                  This item has been requested by another library patron. Items needed by others cannot be renewed.
                  </xsl:when>

                  <xsl:when test="contains($renewStatus, 'Overdue Recalls')">
                  You have at least one overdue loan. In order to renew the above item, you will need to first return any overdue loans.

                  </xsl:when>
                  <xsl:otherwise>
                  <xsl:value-of select="$renewStatus" />
                  </xsl:otherwise>
                  </xsl:choose>
               </em></td>
                </tr>
              </xsl:when>
              <xsl:when test="process_status='RECALL'">
                <tr>
                 <td colspan="4"><em>Reason: item is needed by another library patron</em></td>
                </tr>
              </xsl:when>
            </xsl:choose>
						</xsl:for-each>

                	</table>
                </td>
              </tr>
             </table>
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
<xsl:call-template name="returns" />
<xsl:call-template name="lrGoToAccount" />
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
