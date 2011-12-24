<!-- $Id$ -->

<xsl:template name="app_data">
	<xsl:choose>
		<xsl:when test="edit">
			<xsl:apply-templates select="edit"></xsl:apply-templates>
		</xsl:when>
		<xsl:when test="view">
			<xsl:apply-templates select="view"></xsl:apply-templates>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="list"></xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="list">
	<xsl:apply-templates select="menu"></xsl:apply-templates>
	<table width="100%" cellpadding="2" cellspacing="2" align="center">
		<xsl:choose>
			<xsl:when test="msgbox_data != ''">
				<tr>
					<td align="left" colspan="3">
						<xsl:call-template name="msgbox"></xsl:call-template>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		<tr>
			<td align="right">
				<xsl:call-template name="search_field"></xsl:call-template>
			</td>
		</tr>
		<tr>
			<td colspan="3" width="100%">
				<xsl:call-template name="nextmatchs"></xsl:call-template>
			</td>
		</tr>
	</table>
	<table width="100%" cellpadding="2" cellspacing="2" align="center">
		<xsl:call-template name="table_header"></xsl:call-template>
		<xsl:call-template name="values"></xsl:call-template>
		<xsl:apply-templates select="table_add"></xsl:apply-templates>
	</table>
</xsl:template>


<xsl:template name="table_header">
	<tr class="th">
		<xsl:for-each select="table_header">
			<td class="th_text" width="{with}" align="{align}">
				<xsl:choose>
					<xsl:when test="sort_link!=''">
						<a href="{sort}" onMouseover="window.status='{header}';return true;" onMouseout="window.status='';return true;"><xsl:value-of select="header"></xsl:value-of></a>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="header"></xsl:value-of>					
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</xsl:for-each>
	</tr>
</xsl:template>


<xsl:template name="values">
	<xsl:for-each select="values">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@class">
						<xsl:value-of select="@class"></xsl:value-of>
					</xsl:when>
					<xsl:when test="position() mod 2 = 0">
						<xsl:text>row_off</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>row_on</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:for-each select="row">
				<xsl:choose>
					<xsl:when test="link">
						<td class="small_text" align="center">
							<a href="{link}" onMouseover="window.status='{statustext}';return true;" onMouseout="window.status='';return true;"><xsl:value-of select="text"></xsl:value-of></a>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td class="small_text" align="left">
							<xsl:value-of select="value"></xsl:value-of>				
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</tr>
	</xsl:for-each>
</xsl:template>


<xsl:template match="table_add">
	<tr>
		<td height="50">
			<xsl:variable name="add_action"><xsl:value-of select="add_action"></xsl:value-of></xsl:variable>
			<xsl:variable name="lang_add"><xsl:value-of select="lang_add"></xsl:value-of></xsl:variable>
			<form method="post" action="{$add_action}">
				<input type="submit" name="add" value="{$lang_add}" onMouseout="window.status='';return true;">
					<xsl:attribute name="onMouseover">
						<xsl:text>window.status='</xsl:text>
						<xsl:value-of select="lang_add_statustext"></xsl:value-of>
						<xsl:text>'; return true;</xsl:text>
					</xsl:attribute>
				</input>
			</form>
		</td>
	</tr>
</xsl:template>

<!-- add / edit -->

	<xsl:template match="edit">
		<xsl:variable name="edit_url"><xsl:value-of select="edit_url"></xsl:value-of></xsl:variable>
		<div align="left">
			<form name="form" method="post" action="{$edit_url}">
				<table cellpadding="2" cellspacing="2" width="50%" align="center">
					<xsl:choose>
						<xsl:when test="msgbox_data != ''">
							<tr>
								<td align="left" colspan="3">
									<xsl:call-template name="msgbox"></xsl:call-template>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="value_custom_id!=''">
							<tr>
								<td width="25%" align="left">
									<xsl:value-of select="lang_custom_id"></xsl:value-of>
								</td>
								<td width="75%" align="left">
									<xsl:value-of select="value_custom_id"></xsl:value-of>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>

					<tr align="left">
						<td valign="top">
							<xsl:value-of select="lang_name"></xsl:value-of>
						</td>
						<td align="left">
							<input type="text" name="values[name]" value="{value_name}" onMouseout="window.status='';return true;">
								<xsl:attribute name="onMouseover">
									<xsl:text>window.status='</xsl:text>
									<xsl:value-of select="lang_name_statustext"></xsl:value-of>
									<xsl:text>'; return true;</xsl:text>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr align="left">
						<td valign="top">
							<xsl:value-of select="lang_sql_text"></xsl:value-of>
						</td>
						<td align="left">

							<textarea cols="60" rows="6" name="values[sql_text]" onMouseout="window.status='';return true;">
								<xsl:attribute name="onMouseover">
									<xsl:text>window.status='</xsl:text>
									<xsl:value-of select="lang_sql_statustext"></xsl:value-of>
									<xsl:text>'; return true;</xsl:text>
								</xsl:attribute>
								<xsl:value-of select="value_sql_text"></xsl:value-of>		
							</textarea>
						</td>
					</tr>

					<xsl:choose>
						<xsl:when test="value_custom_id != ''">
							<tr>
								<td valign="top">
									<xsl:value-of select="lang_columns"></xsl:value-of>
								</td>
								<td align="right">
									<xsl:call-template name="columns"></xsl:call-template>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>

					<tr height="50">
						<td valign="bottom">
							<xsl:variable name="lang_save"><xsl:value-of select="lang_save"></xsl:value-of></xsl:variable>
							<input type="submit" name="values[save]" value="{$lang_save}" onMouseout="window.status='';return true;">
								<xsl:attribute name="onMouseover">
									<xsl:text>window.status='</xsl:text>
									<xsl:value-of select="lang_save_statustext"></xsl:value-of>
									<xsl:text>'; return true;</xsl:text>
								</xsl:attribute>
							</input>
						</td>
						<td valign="bottom">
							<xsl:variable name="lang_apply"><xsl:value-of select="lang_apply"></xsl:value-of></xsl:variable>
							<input type="submit" name="values[apply]" value="{$lang_apply}" onMouseout="window.status='';return true;">
								<xsl:attribute name="onMouseover">
									<xsl:text>window.status='</xsl:text>
									<xsl:value-of select="lang_apply_statustext"></xsl:value-of>
									<xsl:text>'; return true;</xsl:text>
								</xsl:attribute>
							</input>
						</td>
						<td align="right" valign="bottom">
							<xsl:variable name="lang_cancel"><xsl:value-of select="lang_cancel"></xsl:value-of></xsl:variable>
							<input type="submit" name="values[cancel]" value="{$lang_cancel}" onMouseout="window.status='';return true;">
								<xsl:attribute name="onMouseover">
									<xsl:text>window.status='</xsl:text>
									<xsl:value-of select="lang_cancel_statustext"></xsl:value-of>
									<xsl:text>'; return true;</xsl:text>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>

<!-- view -->

	<xsl:template match="view">
		<table width="100%" cellpadding="2" cellspacing="2" align="center">
			<tr>
				<td class="small_text" valign="top" align="right">
					<xsl:variable name="link_download"><xsl:value-of select="link_download"></xsl:value-of></xsl:variable>
					<xsl:variable name="lang_download_help"><xsl:value-of select="lang_download_help"></xsl:value-of></xsl:variable>
					<xsl:variable name="lang_download"><xsl:value-of select="lang_download"></xsl:value-of></xsl:variable>
					<a href="javascript:var w=window.open('{$link_download}','','left=50,top=100')" onMouseOver="overlib('{$lang_download_help}', CAPTION, '{$lang_download}')" onMouseOut="nd()">
						<xsl:value-of select="lang_download"></xsl:value-of></a>
				</td>
			</tr>
			<tr>
				<td colspan="3" width="100%">
					<xsl:call-template name="nextmatchs"></xsl:call-template>
				</td>
			</tr>
		</table>
		<table width="100%" cellpadding="2" cellspacing="2" align="center">
			<xsl:call-template name="table_header"></xsl:call-template>
			<xsl:call-template name="values"></xsl:call-template>
			<tr height="50">
				<td>
					<xsl:variable name="done_action"><xsl:value-of select="done_action"></xsl:value-of></xsl:variable>
					<xsl:variable name="lang_done"><xsl:value-of select="lang_done"></xsl:value-of></xsl:variable>
					<form method="post" action="{$done_action}">
						<input type="submit" class="forms" name="done" value="{$lang_done}" onMouseover="window.status='Back to the list.';return true;" onMouseout="window.status='';return true;"></input>
					</form>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="columns">
		<xsl:variable name="lang_up_text"><xsl:value-of select="lang_up_text"></xsl:value-of></xsl:variable>
		<xsl:variable name="lang_down_text"><xsl:value-of select="lang_down_text"></xsl:value-of></xsl:variable>
		<table cellpadding="2" cellspacing="2" width="100%" align="left">
			<xsl:choose>
				<xsl:when test="cols!=''">
					<tr class="th">
						<td class="th_text" width="85%" align="left">
							<xsl:value-of select="lang_col_name"></xsl:value-of>
						</td>
						<td class="th_text" width="85%" align="left">
							<xsl:value-of select="lang_col_descr"></xsl:value-of>
						</td>
						<td class="th_text" width="15%" align="center">
							<xsl:value-of select="lang_sorting"></xsl:value-of>
						</td>
						<td class="th_text" width="15%" align="center">
							<xsl:value-of select="lang_delete_column"></xsl:value-of>
						</td>
					</tr>
					<xsl:for-each select="cols">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="@class">
										<xsl:value-of select="@class"></xsl:value-of>
									</xsl:when>
									<xsl:when test="position() mod 2 = 0">
										<xsl:text>row_off</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>row_on</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td align="left">
								<xsl:value-of select="name"></xsl:value-of>
								<xsl:text> </xsl:text>
							</td>
							<td align="left">
								<xsl:value-of select="descr"></xsl:value-of>
								<xsl:text> </xsl:text>
							</td>
							<td>
								<table align="left">
									<tr>
										<td>
											<xsl:value-of select="sorting"></xsl:value-of>
										</td>

										<td align="left">
											<xsl:variable name="link_up"><xsl:value-of select="link_up"></xsl:value-of></xsl:variable>
											<a href="{$link_up}" onMouseover="window.status='{$lang_up_text}';return true;" onMouseout="window.status='';return true;"><xsl:value-of select="text_up"></xsl:value-of></a>
											<xsl:text> | </xsl:text>
											<xsl:variable name="link_down"><xsl:value-of select="link_down"></xsl:value-of></xsl:variable>
											<a href="{$link_down}" onMouseover="window.status='{$lang_down_text}';return true;" onMouseout="window.status='';return true;"><xsl:value-of select="text_down"></xsl:value-of></a>
										</td>

									</tr>
								</table>
							</td>

							<td align="center">
								<input type="checkbox" name="values[delete_cols][]" value="{id}" onMouseout="window.status='';return true;">
									<xsl:attribute name="onMouseover">
										<xsl:text>window.status='</xsl:text>
										<xsl:value-of select="//lang_delete_cols_statustext"></xsl:value-of>
										<xsl:text>'; return true;</xsl:text>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:when>
			</xsl:choose>
			<tr>
				<td valign="top">
					<xsl:value-of select="lang_name"></xsl:value-of>
				</td>
				<td valign="top">
					<xsl:value-of select="lang_descr"></xsl:value-of>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="values[new_name]" onMouseout="window.status='';return true;">
						<xsl:attribute name="onMouseover">
							<xsl:text>window.status='</xsl:text>
							<xsl:value-of select="lang_new_name_statustext"></xsl:value-of>
							<xsl:text>'; return true;</xsl:text>
						</xsl:attribute>
					</input>
				</td>
				<td>
					<input type="text" name="values[new_descr]" onMouseout="window.status='';return true;">
						<xsl:attribute name="onMouseover">
							<xsl:text>window.status='</xsl:text>
							<xsl:value-of select="lang_new_descr_statustext"></xsl:value-of>
							<xsl:text>'; return true;</xsl:text>
						</xsl:attribute>
					</input>
				</td>
			</tr>
		</table>
	</xsl:template>
