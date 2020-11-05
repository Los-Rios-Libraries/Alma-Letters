<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<head>
			<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
			<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
			<title>Exlibris Email</title>
		</head>
		<body style = "padding: 0; font-family: Source Sans Pro,Helvetica Neue,Helvetica,Arial,sans-serif;">
			<table cellpadding="0" cellspacing="0" style="margin: auto; width: 600px;">
				<tr>
					<td style="background-color: #4d6b82; border-top-left-radius: 15px; border-top-right-radius: 15px;">
						<img alt="The library Logo" style="width: 100px; height: 35px; padding: .85em;">
							<xsl:attribute name="src">
								<xsl:value-of select="/notification_data/logo_path"/>
							</xsl:attribute>
						</img>
					</td>
				</tr>
				<tr>
					<td style="background-color: #53738c; padding: 0 15px; color: #fff; box-shadow: inset 0 3px 10px -2px rgba(0,0,0,0.3)">
						<h2 style="font-weight: 600; margin: 30px 0 10px 0;">
							<xsl:value-of select="/notification_data/alert_title"/>
						</h2>
						<h3 style="font-size: 1rem; margin: 0 0 30px 0; font-weight: normal;">
							<xsl:value-of select="/notification_data/alert_heading"/>
							<a style="font-style: italic; text-decoration: none;">
								<xsl:attribute name="href">
									<xsl:value-of select="/notification_data/link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/search_query"/>
							</a>
						</h3>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f3f3f3; padding: 15px; box-shadow: inset 0 3px 10px -2px rgba(0,0,0,0.3); font-style: italic;">
						<h3 style="font-size: 15px; margin: 0; font-weight: normal;">
							<xsl:value-of select="/notification_data/alert_subtitle"/>
						</h3>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f3f3f3; padding: 15px 0; box-shadow: inset 0 4px 5px -2px rgba(0,0,0,0.3)">
						<table style="width: 100%">
							<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
								<tr style="background-color: #fff; text-decoration: none;">
									<td style="padding: 15px 15px; position: relative;">
										<span style="text-transform: uppercase; letter-spacing: .07em; font-weight: 600; font-size: .8em; color: #6d6d6d">
											<xsl:value-of select="type" disable-output-escaping="yes"/>
										</span>
										<br/>
										<a style="display: block; margin: 5px 0; text-decoration: none; color: #44707b; font-size: 1.4em; font-weight: 600;">
											<xsl:attribute name="href">
												<xsl:value-of select="url" disable-output-escaping="yes"/>
											</xsl:attribute>
											<xsl:value-of select="title" disable-output-escaping="yes"/>
										</a>
										<br/>
										<span style="color: #3a3a3a; font-weight: 400; font-size: .65rem;">
											<xsl:value-of select="creator" disable-output-escaping="yes"/>
										</span>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
				</tr>
				<tr>
					<td style="background-color: #4d6b82; text-align:center; padding: 15px">
							<a style="color: #fff">
								<xsl:attribute name="href">
									<xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/alert_unsubscribe"/>
							</a>
					</td>
				</tr>
			</table>
		</body>
	</xsl:template>
</xsl:stylesheet>