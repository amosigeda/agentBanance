<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import = "com.godoing.rose.http.common.*" %>
<%@ page import = "com.godoing.rose.lang.*" %>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>

<jsp:useBean id = "projectInfo" scope = "request" class = "com.godoing.rose.lang.DataMap"/>
<%@ page autoFlush="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function selectProject(obj){
    var a=frmGo.projectName1.value;
    var b=frmGo.projectName.value;
	$.ajax({
		type:"get",
		url:"doProjectInfo.do?method=queryProjectName",
		data:"projectName="+obj,
		success:function(msg){
			 if(msg.trim() != ""&&b!=a){	
				alert("��Ŀ���Ѿ�����,���������룡");
				 document.all.projectName.value=""; 
			} 
			}
	});

}
function onUpdate(){
/* 	if(frmGo.projectName.value.trim() == ''){
		alert("��Ŀ���Ʋ���Ϊ��");
		frmGo.ProjectName.focus();
		return false;
	}
	if(frmGo.remark.value.trim().length > 30){
		alert("�������ܳ���30��");
		frmGo.remark.focus();
		return false;
	} */
	frmGo.submit();
}

</script>
<body>
<span class="title_1"></span>
<form name="frmGo" method="post" action="doProjectInfo.do?method=updateProjectInfoBu" encType="multipart/form-data" onsubmit="return onUpdate()">
<input name="id" type="hidden" value="<%=projectInfo.getAt("id")%>" >
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11">
  <tr>
     <th colspan="3" nowrap="nowrap" align="left">
                           �̻���Ϣ�޸�
     </th>
   </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�̻���(��¼��)</td>
    <td align="left" >
      <input type="text" size="50"  name="username" readonly= "true" id="username" value=<%=projectInfo.getAt("username")%>
       >
 <!--      onchange="selectProject(this.value)"> -->
       <%-- <td align="left" >
      <input type="text" name="project_name" id="projectName1" value=<%=projectInfo.getAt("project_name")%>
      style="display:none"> --%>
    </td>
    <td></td>
  </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��˾����</td>
    <td align="left" >
      <input type="text" size="50" name="nickname" id="nickname" value=<%=projectInfo.getAt("nickname")%>>
    </td>
    <td></td>
  </tr>
 
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�Ƿ���Ч</td>
    <td align="left">
    	<input name="use_status" type="radio" class="radio_1" value="1" <%if("1".equals("" + projectInfo.getAt("use_status"))){%>checked<%}%>>����
	    <input name="use_status" type="radio" class="radio_1" value="0" <%if("0".equals("" + projectInfo.getAt("use_status"))){%>checked<%}%>>����
    </td>   
    <td></td>
  </tr>
  
    <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;��������</td> 
    <td align="left" width="20%" colspan="2">
		<%=request.getAttribute("companyList")%><font color="red">*</font>
    </td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�ص�url</td>
    <td align="left" >
      <input type="text" size="150" name="url" id="url" value=<%=projectInfo.getAt("url")%>>
    </td>
    <td></td>
  </tr>
  
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��ע</td>
    <td align="left" >
      <input type="text"  size="50" name="avatar" id="adTitle" value=<%=projectInfo.getAt("avatar")%>
       >
    </td>
    <td></td>
  </tr>
  <%--  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����</td>
    <td align="left" >
      <input type="text"  size="50" style="vertical-align:bottom"  name="adDetail" id="adDetail" value=<%=projectInfo.getAt("adDetail")%>
       >
    </td>
    <td></td>
  </tr>
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;ͼƬ </td>
    <td>
    	 <img src="<%=projectInfo.getAt("channel_id")%>"  style="vertical-align:bottom"  width = "100%" height = "30%"></img> 
						</td>
						
    <td align="left" >
     
    					<input type="file" name="channelId" id="channelId" multiple="multiple" class="imagePath"/>
    					<img alt="" src="" id="image1" class="showImage">
    				</td>
 
   
  </tr> --%>
  <%--  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;advertisingUrl</td>
    <td align="left">
    	<input name="status" type="radio" class="radio_1" value="1" <%if("1".equals("" + projectInfo.getAt("status"))){%>checked<%}%>>����
	    <input name="status" type="radio" class="radio_1" value="0" <%if("0".equals("" + projectInfo.getAt("status"))){%>checked<%}%>>����
    </td>
  </tr> --%>
    <%-- <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��ע</td>
    <td width="20%" align="left">
      <textarea name="remark" id="remark" rows="5" cols="50" class="txt_1" maxlength="30"><%=projectInfo.getAt("remark")%></textarea>
    </td>
    <td align="left">(�������ܳ���30��)</font></td>
  </tr> --%>
  
  <tr  class="tr_11">
    <td></td>
    <td  align="left">&nbsp;&nbsp;&nbsp;<input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onUpdate()">
	
      <input type="button" name="back" accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doProjectInfo.do?method=queryProjectInfoXml'">
      <input type="reset" name="back" accesskey="b" tabindex="b" value="����" class="but_1" >
    </td>
  </tr>
</table>
</form>
</body>
</html>