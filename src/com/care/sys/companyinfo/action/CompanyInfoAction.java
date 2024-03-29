package com.care.sys.companyinfo.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.care.app.LoginUser;
import com.care.common.config.Config;
import com.care.common.config.ServiceBean;
import com.care.common.http.BaseAction;
import com.care.common.lang.CommUtils;
import com.care.sys.channelinfo.domain.ChannelInfo;
import com.care.sys.companyinfo.domain.CompanyInfo;
import com.care.sys.companyinfo.domain.logic.CompanyInfoFacade;
import com.care.sys.companyinfo.form.CompanyInfoForm;
import com.care.sys.projectinfo.domain.ProjectInfo;
import com.care.sys.roleinfo.domain.RoleInfo;
import com.godoing.rose.http.common.HttpTools;
import com.godoing.rose.http.common.PagePys;
import com.godoing.rose.http.common.Result;
import com.godoing.rose.lang.DataList;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.lang.SystemException;
import com.godoing.rose.log.LogFactory;

public class CompanyInfoAction extends BaseAction{
	
	Log logger = LogFactory.getLog(CompanyInfoAction.class);
	
	public ActionForward queryCompanyInfo(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String href= request.getServletPath();
		Boolean showCompany = false;
		Date start = new Date();
		Result result = new Result();//结果集
		PagePys pys = new PagePys();//页面属性
		DataList list = null; //返回页面List  用logic itrate获取。
		StringBuffer sb = new StringBuffer();//创建字符串容器
		CompanyInfoFacade info = ServiceBean.getInstance().getCompanyInfoFacade();//加载userApp工厂（取得user字典）
		
		try {
			LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER);
			if (loginUser == null) {
				return null;
			}
			if(!"1".equals(loginUser.getGroupCode())&& !"2".equals(loginUser.getGroupCode())){
				showCompany=false;
			}else{
				showCompany=true;
			}
			String id = loginUser.getCompanyId();
			CompanyInfoForm form = (CompanyInfoForm) actionForm;
			CompanyInfo vo = new CompanyInfo(); 
			String startTime = request.getParameter("startTime");
			String endTime   = request.getParameter("endTime");
			
			String user_name = request.getParameter("user_name");
			String companyName = request.getParameter("companyName");
			String com_status = request.getParameter("com_status");
			
			/*设置化排序字段*/
            form.setOrderBy("add_time"); 
            form.setSort("1");
            sb.append("1=1");
            if(!"0".equals(id)){
            	sb.append(" and id in(" + id + ")");
            }
			if(startTime != null && !"".equals(startTime)){				
				sb.append(" and substring(add_time,1,10) >= '"+startTime+"'");
			}
			if(endTime != null && !"".equals(endTime)){				
				sb.append(" and substring(add_time,1,10) <= '"+endTime+"'");
			}
			
			if(user_name != null && !"".equals(user_name)){				
				sb.append(" and user_name='"+user_name+"'");
			}
			
			if(com_status!=null && !"".equals(com_status)){
				sb.append(" and c.status ="+com_status);
				request.setAttribute("com_status", CommUtils.getComStatus("com_status", Integer.parseInt(com_status)));
			}
						
			
			request.setAttribute("fNow_date", startTime);
		    request.setAttribute("now_date", endTime);
		    request.setAttribute("user_name", user_name);
		    request.setAttribute("companyName", companyName);
		  //  request.setAttribute("company_id",company_id);
		    
		    /*查询出所有的公司信息*/
		
		    CompanyInfo ci = new CompanyInfo();
			List<DataMap> coms = ServiceBean.getInstance().getCompanyInfoFacade().getCompanyInfo(ci);
			request.setAttribute("company", coms);
		   
			vo.setCondition(sb.toString());
			
         	BeanUtils.copyProperties(vo,form);			
         	list = info.getCompanyInfoListByVo(vo);
			BeanUtils.copyProperties(pys, form); 
			pys.setCounts(list.getTotalSize());   
			/* 设置化排序字段 */ 
			 
		} catch (Exception e) { 
			e.printStackTrace();
			logger.error(request.getQueryString() + "  " + e);
			result.setBackPage(Config.ABOUT_PAGE); /* 这里为管理页面，所以出错后跳转到系统默认页面 */
			if (e instanceof SystemException) { /* 对已知异常进行解析 */
				result.setResultCode(((SystemException) e).getErrCode());
				result.setResultType(((SystemException) e).getErrType());
			} else { /* 对未知异常进行解析，并全部定义成未知异常 */
				result.setResultCode("noKnownException");
				result.setResultType("sysRunException"); 
			}
		} finally {
			request.setAttribute("result", result);
			request.setAttribute("pageList", list);
			request.setAttribute("PagePys", pys);
			request.setAttribute("showCompany", showCompany);
		}
		CommUtils.getIntervalTime(start, new Date(), href);
		return mapping.findForward("queryCompanyInfo");
	}	
	
	public ActionForward initInsert(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ChannelInfo vo = new ChannelInfo();
		DataList list = ServiceBean.getInstance().getChannelInfoFacade().getChannelInfoListByVo(vo);
		request.setAttribute("list", list);
		
		return mapping.findForward("addCompanyInfo");
	}
	
	public ActionForward insertCompanyInfo(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		String[] typeIds = HttpTools.requestArray(request, "type");
		StringBuffer sb =new StringBuffer();
		for(int i =0;i<typeIds.length;i++){
			if(sb.length()>0){
				sb.append(",");
			}
			if("1".equals(typeIds[i])){
				sb.append("移动");
			}
			if("2".equals(typeIds[i])){
				sb.append("联通");
			}
			if("3".equals(typeIds[i])){
				sb.append("电信");
			}
			
		}
		String userName =request.getParameter("user_name");
		String secretKey =request.getParameter("secret_key");
		String companyName =request.getParameter("company_name");
		String returl =request.getParameter("returl");
		String remark =request.getParameter("remark");
		Result result = new Result();
		try {
			//CompanyInfoForm form = (CompanyInfoForm) actionForm;  //把提交的表单封装到用户的form中
			CompanyInfoFacade facade = ServiceBean.getInstance().getCompanyInfoFacade();
			CompanyInfo vo = new CompanyInfo();
		     vo.setUserName(userName);
		     vo.setSecretKey(secretKey);
		     vo.setCompanyName(companyName);
		     vo.setReturl(returl);
		     vo.setRemark(remark);
   			vo.setAddTime(new Date());
			vo.setUpdateTime(new Date());
			vo.setStatus("1");
			vo.setCompanyNo(sb.toString());
			facade.insertCompanyInfo(vo);  
			
			result.setBackPage(HttpTools.httpServletPath(request,  //插入成功后，跳转到原先页面
					"queryCompanyInfo"));
			result.setResultCode("inserts");    //设置插入Code
			result.setResultType("success");    //设置插入成功
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(request.getQueryString() + "  " + e);
			result.setBackPage(HttpTools.httpServletPath(request,
					"initInsert"));
			if (e instanceof SystemException) { /* 对已知异常进行解析 */
				result.setResultCode(((SystemException) e).getErrCode());
				result.setResultType(((SystemException) e).getErrType());
			} else { /* 对未知异常进行解析，并全部定义成未知异常 */
				result.setResultCode("noKnownException");
				result.setResultType("sysRunException");
			}
		} finally {
			request.setAttribute("result", result);
		}
		return mapping.findForward("result");
	}

	public ActionForward initCompanyUpdate(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		CompanyInfo vo = new CompanyInfo();
		vo.setCondition("id='"+id+"'");
		List<DataMap> list = ServiceBean.getInstance().getCompanyInfoFacade().getCompanyInfo(vo);
		if (list == null || list.size() == 0) {
			Result result = new Result();
			result.setBackPage(HttpTools.httpServletPath(request,
					"queryCompanyInfo"));
			result.setResultCode("rowDel");
			result.setResultType("success");
			return mapping.findForward("result");
		}
		request.setAttribute("companyInfo", list.get(0));

		return mapping.findForward("updateCompanyInfo");
	}
	
public ActionForward updateCompanyInfo(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		Result result = new Result();
		Date updateTime = new Date();
		try {
			String[] typeIds = HttpTools.requestArray(request, "type");
			StringBuffer sb =new StringBuffer();
			for(int i =0;i<typeIds.length;i++){
				if(sb.length()>0){
					sb.append(",");
				}
				if("1".equals(typeIds[i])){
					sb.append("移动");
				}
				if("2".equals(typeIds[i])){
					sb.append("联通");
				}
				if("3".equals(typeIds[i])){
					sb.append("电信");
				}
				
			}
			
			String userName =request.getParameter("user_name");
			String secretKey =request.getParameter("secret_key");
			String companyName =request.getParameter("company_name");
			String returl =request.getParameter("returl");
			String remark =request.getParameter("remark");
			String status =request.getParameter("status");
			
			CompanyInfoForm form = (CompanyInfoForm) actionForm;			
			CompanyInfo vo = new CompanyInfo();
			vo.setCondition("id='" + form.getId() + "'");
			vo.setUpdateTime(updateTime);
			
			   vo.setUserName(userName);
			     vo.setSecretKey(secretKey);
			     vo.setCompanyName(companyName);
			     vo.setReturl(returl);
			     vo.setRemark(remark);
				vo.setStatus(status);
				if(sb.toString().length()>0){
					vo.setCompanyNo(sb.toString());
				}
			
			ServiceBean.getInstance().getCompanyInfoFacade().updateCompanyInfo(vo);
			
			result.setBackPage(HttpTools.httpServletPath(request,
					"queryCompanyInfo"));
			result.setResultCode("updates");
			result.setResultType("success");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(request.getQueryString() + "  " + e);
			result.setBackPage(HttpTools.httpServletPath(request,
					"queryCompanyInfo"));
			if (e instanceof SystemException) { /* ����֪�쳣���н��� */
				result.setResultCode(((SystemException) e).getErrCode());
				result.setResultType(((SystemException) e).getErrType());
			} else { /* ��δ֪�쳣���н�������ȫ�������δ֪�쳣 */
				result.setResultCode("noKnownException");
				result.setResultType("sysRunException");
			}
		} finally {
			request.setAttribute("result", result);
		}
		return mapping.findForward("result");
	}

}
