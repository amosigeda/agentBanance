<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
	/*页面属性*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
	LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER); 
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>无标题文档</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- 调用此方法 -->
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script language="javascript">
function finds(){
   /*  var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("开始时间不能大于结束时间!");
		return false;
	} */
	   frmGo.submit();
}
function add(){
	frmGo.action = "doCompanyInfo.do?method=initInsert";
	frmGo.submit();
}
function c(){
	 document.all.user_name.value="";
   /*  document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.companyName.value="";
    document.getElementById("com_status").options[0].selected = true; */
} 
function update(id){
	frmGo.action="doCompanyInfo.do?method=initCompanyUpdate&id="+id;
	frmGo.submit();
}

function changeCompany(obj){
	$.ajax({
		type:"get",
		url:"doProjectInfo.do?method=getProjectByCompanyId",
		data:"companyId="+obj,
		success:function(msg){
			var projectSelect = document.getElementById("projectId");
			projectSelect.length=1;
			if(msg.trim() != ""){				
				var projects = msg.split("&");
				for(i=0;i<projects.length; i++){
					var project = projects[i].split(",");
					if(project.length == 2){
						projectSelect.options[projectSelect.length] = new Option(project[1],project[0]);
						
					}
					
				}
			}
			
		}
	});
}


</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doCompanyInfo.do?method=queryCompanyInfo">
			
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                                             上游信息
                     <input name="addCompany" type="button" class="but_1" accesskey="a"
							tabindex="a" value="添 加" onclick="add()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
                                                                                        公司账号
						    <input id="user_name" name="user_name" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"user_name");%>" size="20">
				<%-- 	  创建时间
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>
					<%if((Boolean)request.getAttribute("showCompany")){ %>			
						公司名称	
						<%String company_id = (String)request.getAttribute("company_id"); %>			
							<select id="company_id" name="company_id" onchange="changeCompany(this.value)">
								<option value="">全部</option>
								<logic:iterate id="com" name="company">
									<bean:define id="company" name="com" property="id" type="java.lang.Integer" />																	
									<option value='<%=company %>' <%=String.valueOf(company).equals(company_id)? "selected" : "" %>>
										<bean:write name="com" property="company_name"/>
									</option>
								</logic:iterate>
							</select>
					<%} %>			
						运营状态
						<%if(request.getAttribute("com_status")!=null && !"".equals(request.getAttribute("com_status"))){ %>
						<%=request.getAttribute("com_status")%>
						<%}else{%>
						<select id="com_status" name="com_status">
							<option value="">全部</option>
							<option value="0">暂停</option>
							<option value="1">正常</option>	
					   </select>
					   <%}%>	
							--%>
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="搜 索" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="清除搜索" onclick="c()">
				</tr>  
				<%int i=1; %>
                  <tr class="title_2">
                  	
					<td width="10%">
						公司账号
					</td>
					<td width="10%">
						秘钥
					</td>
					<td width="10%">
						公司名称
					</td>
					<td width="10%">
						类型
					</td>
					<td width="10%">
						回调地址
					</td>
					
					<td width="6%">
						运营状态
					</td>
					<td width="10%">
						创建时间
					</td>
					<td width="10%">
						备注
					</td>
					  <td width="10%">
					   更新时间
					</td>
					  <td width="10%">
						操作区
					</td>
					
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"'
						onmouseout='this.className="tr_5"'>
						
						<td>							
							<bean:write name="element" property="user_name" />
						</td>
							<td>							
							<bean:write name="element" property="secret_key" />
						</td>
						<td>							
							<bean:write name="element" property="company_name" />
						</td>
						<%-- 	<td>							
							<bean:write name="element" property="type"   contain_type/>
						</td> --%>
						<td>
						<bean:write name="element" property="contain_type" />
						  <%--  <logic:empty name="element" property="type">无</logic:empty>							
							<logic:equal name="element" property="type" value="1"><font color="black">移动</font></logic:equal>							
							<logic:equal name="element" property="type" value="2"><font color="black">联通</font></logic:equal>
							<logic:equal name="element" property="type" value="3"><font color="black">电信</font></logic:equal> --%>
						</td>
						
						<td>							
							<bean:write name="element" property="returl" />
						</td>
						<%-- <td>							
							<bean:write name="element" property="company_name" />
						</td> --%>
						<%-- <td>
							<logic:empty name="element" property="count_id">0</logic:empty>
							<a style="color: #0000FF" href="../projectInfo/doProjectInfo.do?method=queryProjectInfo&companyId=
								<bean:write name="element" property="id"/>">
								<bean:write name="element" property="count_id"/>
							</a>							
						</td> --%>
						
						<td>
						   <logic:empty name="element" property="status">无</logic:empty>							
							<logic:equal name="element" property="status" value="0"><font color="red">暂停</font></logic:equal>							
							<logic:equal name="element" property="status" value="1"><font color="green">正常</font></logic:equal>
						</td>
						<td>							
							<bean:write name="element" property="add_time" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>							
							<logic:empty name="element" property="remark">无</logic:empty>
							<logic:notEmpty name="element" property="remark">			
							<bean:write name="element" property="remark" />
							</logic:notEmpty>
						</td>	
						<td>
						<logic:empty name="element" property="update_time">无</logic:empty>
							<logic:notEmpty name="element" property="update_time">			
							<bean:write name="element" property="update_time" format="yyyy-MM-dd HH:mm:ss"/>
							</logic:notEmpty>							
							
						</td>
						 <td>
							<a href=# onclick="update('<bean:write name="element" property="id" />')" style="color:#0000FF">【配置】</a>
						</td> 
					
					</tr>
				</logic:iterate>

			  	<tr class="title_3">
					<td colspan="12" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>