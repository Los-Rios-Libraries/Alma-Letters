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
        
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


        <div class="messageArea">
          <div class="messageBody">
			<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff;">
              <tr>
              	<td>
					<p>@@message@@</p>
                </td>
              </tr>
              <!--<tr>
              	<td>
					<b>@@loans@@</b>
                </td>
              </tr>-->

              <tr>
                <td>
                </td>
              </tr>
      </table>
       <table class="listing" cellspacing="0" cellpadding="0" border="0" align="center" width="600">

						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<!--reorder columns, date to right-->
            <thead>
						<tr style="font-size:0.9em;">
							<th>@@title@@</th>
							<!--<th>@@description@@</th>-->
							<th>@@author@@</th>
							<th>@@library@@</th>
							<th>@@due_date@@</th>
						</tr>
            </thead>
            <tbody>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
						<tr style="font-size:0.9em;">
							<td><xsl:value-of select="title"/></td>
							<!--<td><xsl:value-of select="description"/></td>-->
							<td><xsl:value-of select="author"/></td>
							<td><xsl:value-of select="library_name"/></td>
							<td><xsl:value-of select="due_date"/></td>
						</tr>
						</xsl:for-each>
            </tbody>
                	</table>
              <xsl:call-template name="returns" /> <!-- mailReason.xsl -->
             
				<!--
				@@additional_info_1@@
				@@additional_info_2@@
				-->
          </div>
        </div>

        <xsl:call-template name="lrGoToAccount" />
		
		<!-- footer.xsl -->
        
		<xsl:call-template name="lrPatronFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
