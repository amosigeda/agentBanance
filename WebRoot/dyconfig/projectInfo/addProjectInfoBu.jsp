<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ page autoFlush="true" %>
<%@ page import="com.care.app.LoginUser"%>
<%@ page import="com.care.common.config.Config"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/public/public.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.8.2.js" type="text/javascript"></script>  --%>
<title>无标题文档</title>
</head>
<script type="text/javascript">
function onAdd(){
	/* if(frmGo.projectNo.value.trim() == ""){
		alert("项目编号不能为空，请重新输入");
		frmGo.projectNo.focus();
		return false;
	}
	if(frmGo.projectName.value.trim() == ""){
		alert("项目名称不能为空，请重新输入");
		frmGo.projectName.focus();
		return false;
	} */
	frmGo.submit();
} 

function preViews(){
    document.getElementById('preView').style.display="none"
	 document.getElementById('rePicture').style.display="none"
	 document.getElementById('pictureView').style.display="block"
}
/* $(document).ready(function(){ 
$("#province").change(function(){ 
$("#province option").each(function(i,o){ 
if($(this).attr("selected")) 
{ 
$(".city").hide(); 
$(".city").eq(i).show(); 
} 
}); 
}); 
$("#province").change(); 
});  */
</script>
<body>
<span class="title_1"></span>
<form name="frmGo" method="post" action="doProjectInfo.do?method=insertProjectInfoxmlBu" encType="multipart/form-data"  onsubmit="return onAdd()">
<% LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER);
	String loginUserCode = loginUser.getUserCode();
%>
<!-- <input type="hidden" name="addUser" value="<%=loginUserCode %>"> -->
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11">
  <tr>
        <th colspan="3" nowrap="nowrap" align="left">
                                    添加商户
        </th>
       </tr>
  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;客户名</td>
    <td align="left" width="20%" colspan="1">
      <input name="username" size="50" id="username" type="text" class="txt_1" maxlength="100"/><font color="red">*</font>
    </td>
    </tr>
    
    
    
   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;昵称</td>
    <td align="left" width="20%" colspan="2">
      <input name="nickname" size="50" id="nickname"  type="text" class="txt_1" maxlength="100"><font color="red">*</font>
    </td>
  </tr>
  
      <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;回调url</td>
    <td align="left" width="20%" colspan="2">
      <input name="url" size="150" id="url"  type="text" class="txt_1" maxlength="100"><font color="red">*</font>
    </td>
  </tr>
    <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;备注</td>
    <td align="left" width="20%" colspan="2">
      <input name="avatar" size="50" id="avatar"  type="text" class="txt_1" maxlength="100"><font color="red">*</font>
    </td>
  </tr>
  
  
      <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;是否有效</td>
    <td align="left" width="20%" colspan="2">
     <input type="radio" name="use_status" value="1" checked="checked"/>是
    		<input type="radio" name="use_status" value="0" />否
    </td>
  </tr>
  
    <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;上游配置</td> 
    <td align="left" width="20%" colspan="2">
		<%=request.getAttribute("companyList")%><font color="red">*</font>
    </td>
  </tr>
    
   <!--   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;语言</td>
    <td align="left" width="20%" colspan="2">
    
    <select name="companyId"  value="companyId">     
  <option value="cn">cn</option>     
  <option value="en">en</option>  
 </select>   -->
    <!-- <input type="radio" name="companyId" value="cn" checked="checked"/>en
    		<input type="radio" name="companyId" value="en" />cn -->
      <!-- <input name="companyId" size="50" type="text" class="txt_1"maxlength="100"><font color="red">*</font> -->
   <!--  </td>
  </tr>
   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;标题</td>
    <td align="left" width="20%" colspan="2">
      <input name="adTitle" size="50" type="text" class="txt_1"maxlength="100"><font color="red">*</font>
    </td>
  </tr>
   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;内容</td>
    <td align="left" width="20%" colspan="2">
      <input name="adDetail" size="50" type="text" class="txt_1"maxlength="100"><font color="red">*</font>
    </td>
  </tr>
   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;图片名</td>
    <td width="20%">
    					<input type="file" name="channelId" id="channelId" multiple="multiple" class="imagePath"/>
    					<img alt="" src="" id="image1" class="showImage">
    				</td>
  </tr> -->
  
 <!-- <tr>
    				<td width="10%" align="right">&nbsp;&nbsp;&nbsp;</td>
    				<td width="20%">
    					<input type="file" name="downloadpath1" id="downloadpath1" multiple="multiple" class="imagePath"/>
    					<img alt="" src="" id="image1" class="showImage">
    				</td>
    			</tr> -->
    
  <%-- <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;客户</td> 
    <td align="left" width="20%" colspan="2">
		<%=request.getAttribute("companyList")%><font color="red">*</font>
    </td>
  </tr>
  <!-- <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;渠道</td> 
    <td align="left" width="20%" colspan="2">
		<%=request.getAttribute("channelList")%><font color="red">*</font>
    </td>
  </tr> -->
  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;备注</td>
    <td align="left" width="20%">
      <textarea name="remark" id="remark" rows="5" cols="50" class="txt_1"></textarea>
    </td>
    <td><font color="red">（字数不能超过30字）</font></td>
  </tr> --%>
  <tr class="tr_11">
  	<td></td><td></td>
  </tr>
  <tr class="tr_11">
  <td width="7%"></td>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;<input type="button" name="ok"accesskey="y" tabindex="y"  value="确 定" class="but_1" onclick="onAdd()" style="font-size:12;width:40px;height:21px;">
      <input type="button" name="back"accesskey="b" tabindex="b" value="返 回" class="but_1" onclick="location='doProjectInfo.do?method=queryProjectInfoXml'" style="font-size:12;width:40px;height:21px;">
  
    </td>
  </tr>
</table>
</form>
</body>
</html>