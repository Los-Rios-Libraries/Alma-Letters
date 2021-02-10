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
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="barcode"/></td>
							<td><xsl:value-of select="library_name"/></td>
              <td><xsl:value-of select="due_date"/></td>

						</tr>
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

<xsl:call-template name="lrGoToAccount" />
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
