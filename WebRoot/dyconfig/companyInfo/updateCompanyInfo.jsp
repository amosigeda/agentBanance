<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import = "com.godoing.rose.http.common.*" %>
<%@ page import = "com.godoing.rose.lang.*" %>

<jsp:useBean id = "companyInfo" scope = "request"  class = "com.godoing.rose.lang.DataMap"/>
<%@ page autoFlush="true" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function onUpdate(){
/* 	if(frmGo.companyName.value.trim() == ''){
		alert("��˾���Ʋ���Ϊ��");
		frmGo.ProjectName.focus();
		return false;
	}
	if(frmGo.companyName.value.trim().length > 10){
		alert("�������ܳ���10��");
		frmGo.remark.focus();
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
<form name="frmGo" method="post" action="doCompanyInfo.do?method=updateCompanyInfo" onsubmit="return onUpdate()">
<input name="id" type="hidden" value="<%=companyInfo.getAt("id")%>" >
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11"> 
  <tr>
     <th colspan="13" nowrap="nowrap" align="left">
                         ��������
     </th>
   </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��˾�˺�</td>
    <td width="20%" align="left">
    	<input name="user_name" id="user_name" type="text" class="txt_1" maxlength="20" value="<%=companyInfo.getAt("user_name")==null?" ":companyInfo.getAt("user_name")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Կ</td>
    <td width="20%" align="left">
    	<input name="secret_key" id="secret_key" type="text" class="txt_1" maxlength="20" value="<%=companyInfo.getAt("secret_key")==null?" ":companyInfo.getAt("secret_key")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��˾����</td>
    <td width="20%" align="left">
    	<input name="company_name" id="company_name" type="text" class="txt_1" maxlength="20" value="<%=companyInfo.getAt("company_name")==null?" ":companyInfo.getAt("company_name")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Ӫ������</td>
    <td width="20%" align="left">
    	<input name="contain_type" style="border:none;" readonly= "true" id="contain_type" type="text" class="txt_1" maxlength="20" value="<%=companyInfo.getAt("contain_type")==null?" ":companyInfo.getAt("contain_type")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;��Ӫ���޸�Ϊ</td>
     <td align="left" width="10%">&nbsp; 
					<input type="checkbox" name="type" value="1" />�ƶ�  <input type="checkbox" name="type" value="2" />��ͨ<input type="checkbox" name="type" value="3" />���� 
					</td>
					 <td align="left"><font color="red">��ѡ��ʾ���޸�</font></td>
  </tr>
  
  
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�ص���ַ</td>
    <td width="20%" align="left">
    	<input name="returl" id="returl" type="text" class="txt_1" maxlength="20" value="<%=companyInfo.getAt("returl")==null?" ":companyInfo.getAt("returl")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Ӫ״̬</td>
    <td width="20%" align="left">
    	<input name="status" type="radio" class="txt_1" value="0" <%=companyInfo.getAt("status").equals("0")? "checked":"" %>>��ͣ
    	<input name="status" type="radio" class="txt_1" value="1" <%=companyInfo.getAt("status").equals("1")? "checked":"" %> >����
    </td>
    <td align="left"></td>
  </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��ע</td>
    <td width="20%" align="left">
      <textarea name="remark" id="remark" rows="5" cols="30" class="txt_1" maxlength="30"><%=companyInfo.getAt("remark")==null?" ":companyInfo.getAt("remark")%></textarea>
    </td>
    <td align="left"><font color="red">(�������ܳ���30��)</font></td>
  </tr>
  <tr  class="tr_11"> 
    <td></td>
    <td  align="left">&nbsp;&nbsp;&nbsp;<input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onUpdate()">
	
      <input type="button" name="back" accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doCompanyInfo.do?method=queryCompanyInfo'">
       <input type="reset" name="back" accesskey="b" tabindex="b" value="����" class="but_1" >
    </td>	     
    </td>
    <td></td>
  </tr>
</table>
</form>
</body>
</html>