<!-- $Id$ -->

	<xsl:template name="app_data">
		<xsl:choose>
			<xsl:when test="edit">
				<xsl:apply-templates select="edit"></xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="user_input"></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


<!-- add / edit  -->
	<xsl:template xmlns:php="http://php.net/xsl" match="edit">
		<xsl:variable name="form_action"><xsl:value-of select="form_action"></xsl:value-of></xsl:variable>
		<table cellpadding="2" cellspacing="2" width="80%" align="center">
			<tr>
				<td>
					<table cellpadding="2" cellspacing="2" align="left">
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
							<xsl:when test="value_id != ''">
								<tr>
									<td valign="top">
										<xsl:value-of select="php:function('lang', 'id')"></xsl:value-of>
									</td>
									<td>
										<xsl:value-of select="value_id"></xsl:value-of>
									</td>
								</tr>
							</xsl:when>
						</xsl:choose>
						<form name="form_app" method="post" action="{$form_action}">
							<tr>
								<td>
									<xsl:value-of select="php:function('lang', 'application')"></xsl:value-of>
								</td>
								<td align="left">
									<select name="app" onChange="this.form.submit();">
										<xsl:attribute name="title">
											<xsl:value-of select="php:function('lang', 'application')"></xsl:value-of>
										</xsl:attribute>
										<xsl:apply-templates select="apps_list"></xsl:apply-templates>
									</select>
								</td>
							</tr>
						</form>
					</table>
					<tr>
						<td>
							<form ENCTYPE="multipart/form-data" name="form" method="post" action="{$form_action}">
								<table cellpadding="2" cellspacing="2" align="left">
									<tr>
										<td>
											<input type="hidden" name="values[app]" value="{value_app}"></input>
											<xsl:value-of select="php:function('lang', 'location')"></xsl:value-of>
										</td>
										<td>
											<select name="values[location]">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'Select submodule')"></xsl:value-of>
												</xsl:attribute>
												<option value="">
													<xsl:value-of select="php:function('lang', 'No location')"></xsl:value-of>
												</option>
												<xsl:apply-templates select="location_list"></xsl:apply-templates>
											</select>
										</td>
									</tr>

									<xsl:choose>
										<xsl:when test="value_file_name != ''">
											<tr>
												<td valign="top">
													<xsl:value-of select="php:function('lang', 'filename')"></xsl:value-of>
												</td>
												<td>
													<xsl:value-of select="value_file_name"></xsl:value-of>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>

									<tr>
										<td valign="top">
											<xsl:value-of select="php:function('lang', 'file')"></xsl:value-of>
										</td>
										<td>
											<input type="file" size="50" name="file">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'upload file')"></xsl:value-of>
												</xsl:attribute>
											</input>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="php:function('lang', 'title')"></xsl:value-of>
										</td>
										<td>
											<input type="text" name="values[title]" value="{value_title}" size="60">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'title')"></xsl:value-of>
												</xsl:attribute>
											</input>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<xsl:value-of select="php:function('lang', 'descr')"></xsl:value-of>
										</td>
										<td>
											<textarea cols="60" rows="10" name="values[descr]">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'descr')"></xsl:value-of>
												</xsl:attribute>
												<xsl:value-of select="value_descr"></xsl:value-of>
											</textarea>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<xsl:value-of select="php:function('lang', 'format type')"></xsl:value-of>
										</td>
										<td>
											<table>
												<xsl:apply-templates select="format_type_list"></xsl:apply-templates>
											</table>
										</td>
									</tr>

									<tr>
										<td class="th_text" valign="top">
											<xsl:value-of select="php:function('lang', 'details')"></xsl:value-of>
										</td>
										<td>
											<table width="100%" cellpadding="2" cellspacing="2" align="center">
												<!--  DATATABLE 0-->
												<td><div id="paging_0"></div><div id="datatable-container_0"></div> </td>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="php:function('lang', 'input type')"></xsl:value-of>
										</td>
										<td>
											<select name="values[input_type]">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'input type')"></xsl:value-of>
												</xsl:attribute>
												<option value="">
													<xsl:value-of select="php:function('lang', 'input type')"></xsl:value-of>
												</option>
												<xsl:apply-templates select="input_type_list"></xsl:apply-templates>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="php:function('lang', 'input name')"></xsl:value-of>
										</td>
										<td>
											<input type="text" name="values[input_name]" value="{value_input_name}" size="12">
												<xsl:attribute name="title">
													<xsl:value-of select="php:function('lang', 'input name')"></xsl:value-of>
												</xsl:attribute>
											</input>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="php:function('lang', 'is id')"></xsl:value-of>
										</td>
										<td>
											<input type="checkbox" name="values[is_id]" value="1">
											</input>
										</td>
									</tr>

									<tr>
										<td>
											<xsl:value-of select="php:function('lang', 'private')"></xsl:value-of>
										</td>
										<td>
											<input type="checkbox" name="values[access]" value="True">
												<xsl:if test="value_access = 'private'">
													<xsl:attribute name="checked">
														checked
													</xsl:attribute>
												</xsl:if>
											</input>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<table cellpadding="2" cellspacing="2" width="50%" align="center">
												<xsl:variable name="lang_save"><xsl:value-of select="php:function('lang', 'save')"></xsl:value-of></xsl:variable>
												<xsl:variable name="lang_apply"><xsl:value-of select="php:function('lang', 'apply')"></xsl:value-of></xsl:variable>
												<xsl:variable name="lang_cancel"><xsl:value-of select="php:function('lang', 'cancel')"></xsl:value-of></xsl:variable>
												<tr height="50">
													<td>
														<input type="submit" name="values[save]" value="{$lang_save}">
															<xsl:attribute name="title">
																<xsl:value-of select="php:function('lang', 'save')"></xsl:value-of>
															</xsl:attribute>
														</input>
													</td>
													<td>
														<input type="submit" name="values[apply]" value="{$lang_apply}">
															<xsl:attribute name="title">
																<xsl:value-of select="php:function('lang', 'apply')"></xsl:value-of>
															</xsl:attribute>
														</input>
													</td>
													<td>
														<input type="submit" name="values[cancel]" value="{$lang_cancel}">
															<xsl:attribute name="title">
																<xsl:value-of select="php:function('lang', 'cancel')"></xsl:value-of>
															</xsl:attribute>
														</input>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</td>
			</tr>
		</table>

		<!--  DATATABLE DEFINITIONS-->
		<script type="text/javascript">
			var property_js = <xsl:value-of select="property_js"></xsl:value-of>;
			var base_java_url = <xsl:value-of select="base_java_url"></xsl:value-of>;
			var datatable = new Array();
			var myColumnDefs = new Array();
			var myButtons = new Array();
			var td_count = <xsl:value-of select="td_count"></xsl:value-of>;

			<xsl:for-each select="datatable">
				datatable[<xsl:value-of select="name"></xsl:value-of>] = [
				{
				values			:	<xsl:value-of select="values"></xsl:value-of>,
				total_records	: 	<xsl:value-of select="total_records"></xsl:value-of>,
				is_paginator	:  	<xsl:value-of select="is_paginator"></xsl:value-of>,
				<!--		permission		:	<xsl:value-of select="permission"/>, -->
				footer			:	<xsl:value-of select="footer"></xsl:value-of>
				}
				]
			</xsl:for-each>
			<xsl:for-each select="myColumnDefs">
				myColumnDefs[<xsl:value-of select="name"></xsl:value-of>] = <xsl:value-of select="values"></xsl:value-of>
			</xsl:for-each>
			<xsl:for-each select="myButtons">
				myButtons[<xsl:value-of select="name"></xsl:value-of>] = <xsl:value-of select="values"></xsl:value-of>
			</xsl:for-each>
		</script>
	</xsl:template>

	<xsl:template match="format_type_list">
		<tr>
			<td>
				<xsl:value-of select="name"></xsl:value-of>
			</td>
			<td>
				<input type="checkbox" name="values[formats][]" value="{id}">
					<xsl:if test="selected != 0">
						<xsl:attribute name="checked">
							checked
						</xsl:attribute>
					</xsl:if>
				</input>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="apps_list">
		<option value="{id}">
			<xsl:if test="selected != 0">
				<xsl:attribute name="selected" value="selected"></xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="name"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="input_type_list">
		<option value="{id}">
			<xsl:if test="selected != 0">
				<xsl:attribute name="selected" value="selected"></xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="descr"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="location_list">
		<option value="{id}">
			<xsl:if test="selected != 0">
				<xsl:attribute name="selected" value="selected"></xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="name"></xsl:value-of>
		</option>
	</xsl:template>


<!-- user_input  -->
	<xsl:template xmlns:php="http://php.net/xsl" match="user_input">
		<xsl:choose>
			<xsl:when test="lookup_functions != ''">
				<script type="text/javascript">
					self.name="first_Window";
					<xsl:value-of select="lookup_functions"></xsl:value-of>
				</script>
			</xsl:when>
		</xsl:choose>

		<div class="yui-content">
			<xsl:variable name="form_action"><xsl:value-of select="form_action"></xsl:value-of></xsl:variable>
			<form name="form" method="post" action="{$form_action}">
				<table cellpadding="2" cellspacing="2" width="80%" align="center">
					<xsl:choose>
						<xsl:when test="msgbox_data != ''">
							<tr>
								<td align="left" colspan="3">
									<xsl:call-template name="msgbox"></xsl:call-template>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>
					<xsl:for-each select="attributes">
						<tr>
							<td align="left" valign="top">
								<xsl:value-of select="input_name"></xsl:value-of>
							</td>
							<td align="left">
								<xsl:choose>
									<xsl:when test="input_name!=''">
										<input type="hidden" name="values_attribute[{counter}][input_name]" value="{input_name}"></input>
										<input type="hidden" name="values_attribute[{counter}][datatype]" value="{datatype}"></input>
										<input type="hidden" name="values_attribute[{counter}][counter]" value="{counter}"></input>
										<input type="hidden" name="values_attribute[{counter}][is_id]" value="{is_id}"></input>
										<input type="hidden" name="values_attribute[{counter}][nullable]" value="{nullable}"></input>
										<xsl:choose>
											<xsl:when test="datatype='R'">
												<xsl:call-template name="choice"></xsl:call-template>
											</xsl:when>
											<xsl:when test="datatype='CH'">
												<xsl:call-template name="choice"></xsl:call-template>
											</xsl:when>
											<xsl:when test="datatype='LB'">
												<select name="values_attribute[{counter}][value]" class="forms">
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
													<option value=""><xsl:value-of select="//lang_none"></xsl:value-of></option>
													<xsl:for-each select="choice">
														<xsl:variable name="id"><xsl:value-of select="id"></xsl:value-of></xsl:variable>
														<xsl:choose>
															<xsl:when test="checked='checked'">
																<option value="{$id}" selected="selected"><xsl:value-of disable-output-escaping="yes" select="value"></xsl:value-of></option>
															</xsl:when>
															<xsl:otherwise>
																<option value="{$id}"><xsl:value-of disable-output-escaping="yes" select="value"></xsl:value-of></option>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</select>
											</xsl:when>
											<xsl:when test="datatype='AB'">
												<table>
													<tr>
														<td>
															<xsl:variable name="contact_name"><xsl:value-of select="name"></xsl:value-of><xsl:text>_name</xsl:text></xsl:variable>
															<xsl:variable name="lookup_function"><xsl:text>lookup_</xsl:text><xsl:value-of select="name"></xsl:value-of><xsl:text>();</xsl:text></xsl:variable>
															<xsl:variable name="clear_function"><xsl:text>clear_</xsl:text><xsl:value-of select="name"></xsl:value-of><xsl:text>();</xsl:text></xsl:variable>
															<input type="hidden" name="{name}" value="{value}" onClick="{$lookup_function}" readonly="readonly" size="5">
																<xsl:choose>
																	<xsl:when test="disabled!=''">
																		<xsl:attribute name="disabled">
																			<xsl:text> disabled</xsl:text>
																		</xsl:attribute>
																	</xsl:when>
																</xsl:choose>
															</input>
															<input size="30" type="text" name="{$contact_name}" value="{contact_name}" onClick="{$lookup_function}" readonly="readonly"> 
																<xsl:choose>
																	<xsl:when test="disabled!=''">
																		<xsl:attribute name="disabled">
																			<xsl:text> disabled</xsl:text>
																		</xsl:attribute>
																	</xsl:when>
																</xsl:choose>
															</input>
															<input type="checkbox" name="clear_{name}_box" onClick="{$clear_function}">
																<xsl:attribute name="title">
																	<xsl:value-of select="php:function('lang', 'delete')"></xsl:value-of>
																</xsl:attribute>
																<xsl:attribute name="readonly">
																	<xsl:text>readonly</xsl:text>
																</xsl:attribute>
															</input>
														</td>
													</tr>
													<xsl:choose>
														<xsl:when test="contact_tel!=''">
															<tr>
																<td>
																	<xsl:value-of select="contact_tel"></xsl:value-of>
																</td>
															</tr>
														</xsl:when>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="contact_email!=''">
															<tr>
																<td>
																	<a href="mailto:{contact_email}"><xsl:value-of select="contact_email"></xsl:value-of></a>
																</td>
															</tr>
														</xsl:when>
													</xsl:choose>
												</table>
											</xsl:when>
											<xsl:when test="datatype='ABO'">
												<table>
													<tr>
														<td>
															<xsl:variable name="org_name"><xsl:value-of select="name"></xsl:value-of><xsl:text>_name</xsl:text></xsl:variable>
															<xsl:variable name="lookup_function"><xsl:text>lookup_</xsl:text><xsl:value-of select="name"></xsl:value-of><xsl:text>();</xsl:text></xsl:variable>
															<input type="hidden" name="{name}" value="{value}" onClick="{$lookup_function}" readonly="readonly" size="5">
																<xsl:choose>
																	<xsl:when test="disabled!=''">
																		<xsl:attribute name="disabled">
																			<xsl:text> disabled</xsl:text>
																		</xsl:attribute>
																	</xsl:when>
																</xsl:choose>
															</input>
															<input size="30" type="text" name="{$org_name}" value="{org_name}" onClick="{$lookup_function}" readonly="readonly"> 
																<xsl:choose>
																	<xsl:when test="disabled!=''">
																		<xsl:attribute name="disabled">
																			<xsl:text> disabled</xsl:text>
																		</xsl:attribute>
																	</xsl:when>
																</xsl:choose>
															</input>
														</td>
													</tr>
												</table>
											</xsl:when>
											<xsl:when test="datatype='VENDOR'">
												<xsl:variable name="vendor_name"><xsl:value-of select="name"></xsl:value-of><xsl:text>_org_name</xsl:text></xsl:variable>
												<xsl:variable name="lookup_function"><xsl:text>lookup_</xsl:text><xsl:value-of select="name"></xsl:value-of><xsl:text>();</xsl:text></xsl:variable>
												<input type="text" name="{name}" value="{value}" onClick="{$lookup_function}" readonly="readonly" size="6">
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
												<input size="30" type="text" name="{$vendor_name}" value="{vendor_name}" onClick="{$lookup_function}" readonly="readonly"> 
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
											</xsl:when>
											<xsl:when test="datatype='user'">
												<xsl:variable name="user_name"><xsl:value-of select="name"></xsl:value-of><xsl:text>_user_name</xsl:text></xsl:variable>
												<xsl:variable name="lookup_function"><xsl:text>lookup_</xsl:text><xsl:value-of select="name"></xsl:value-of><xsl:text>();</xsl:text></xsl:variable>
												<input type="text" name="{name}" value="{value}" onClick="{$lookup_function}" readonly="readonly" size="6">
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
												<input size="30" type="text" name="{$user_name}" value="{user_name}" onClick="{$lookup_function}" readonly="readonly"> 
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
											</xsl:when>
											<xsl:when test="datatype='date'">
												<input type="text" id="values_attribute_{counter}" name="values_attribute[{counter}][value]" value="{value}" size="12" maxlength="12">
													<xsl:attribute name="readonly">
														<xsl:text> readonly</xsl:text>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
												<img id="values_attribute_{counter}-trigger" src="{img_cal}" alt="{lang_datetitle}" title="{lang_datetitle}" style="cursor:pointer; cursor:hand;"></img>
											</xsl:when>
											<xsl:when test="datatype='timestamp'">
												<input type="text" id="values_attribute_{counter}" name="values_attribute[{counter}][value]" value="{value}" size="12" maxlength="12">
													<xsl:attribute name="readonly">
														<xsl:text> readonly</xsl:text>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
												<img id="values_attribute_{counter}-trigger" src="{img_cal}" alt="{lang_datetitle}" title="{lang_datetitle}" style="cursor:pointer; cursor:hand;"></img>
											</xsl:when>
											<xsl:otherwise>
												<input type="text" name="values_attribute[{counter}][value]" value="{value}" size="30">
													<xsl:choose>
														<xsl:when test="disabled!=''">
															<xsl:attribute name="disabled">
																<xsl:text> disabled</xsl:text>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</input>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td align="left" valign="top">
							<xsl:value-of select="php:function('lang', 'format type')"></xsl:value-of>
						</td>
						<td>
							<select name="sel_format">
								<xsl:attribute name="title">
									<xsl:value-of select="php:function('lang', 'select format')"></xsl:value-of>
								</xsl:attribute>
								<xsl:apply-templates select="formats"></xsl:apply-templates>
							</select>
						</td>
					</tr>
					<xsl:variable name="lang_save"><xsl:value-of select="php:function('lang', 'save')"></xsl:value-of></xsl:variable>
					<tr height="50">
						<td align="left">
							<input type="submit" name="values[save]" value="{$lang_save}">
								<xsl:attribute name="title">
									<xsl:value-of select="php:function('lang', 'save')"></xsl:value-of>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>

	<xsl:template match="formats">
		<option value="{id}">
			<xsl:if test="selected != 0">
				<xsl:attribute name="selected" value="selected"></xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="name"></xsl:value-of>
		</option>
	</xsl:template>
