<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/black/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/login/js/datagrid-detailview.js"></script>
    <script type="text/javascript">
        $(function () {
            //页面加载完成之后显示菜单数据
            $.post("${pageContext.request.contextPath}/menu/findAll",function (menu) {
                //通过accordion的添加方法追加菜单
                // console.log(menu);
                //遍历一级菜单
                $.each(menu,function(index,m){
                    //遍历二级菜单
                    var content="<div style='text-align: center;'>";
                    $.each(m.children,function (idx,child) {
                        content += "<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px aquamarine solid;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>";
                    });
                    content +="</div>"
                    //添加菜单
                    $("#menu").accordion('add',{
                        title:m.name,
                        iconCls:m.icon,
                        content:content,
                    });
                });
            });
        });
        //点击菜单追加选项卡
        function addTabs(title,iconCls,href) {
            //添加以前先判断tabs中是否存在这个选项卡
            if(!$("#tabs").tabs('exists',title)){
                $("#tabs").tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    closable:true,
                    fit:true,
                    href:"${pageContext.request.contextPath}"+href,
                });
            }else{
                $("#tabs").tabs('select',title);
            }
        }

    </script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>

    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 320px;float:right;padding-top:15px">欢迎&nbsp;${sessionScope.admin.username}&nbsp;登录&nbsp;<a href="${pageContext.request.contextPath}/back/login/edit.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/remove" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出系统</a></div>


    	</div>
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="menu" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(${pageContext.request.contextPath}/back/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>


<%--
 页面的头部分
    <div data-options="region:'north',split:false,href:'${pageContext.request.contextPath}/back/main/head.jsp'" style="height: 40px;background: #00bbee;line-height: 8px;font-family:楷体;">

    </div>
    页面的左侧位置
    <div data-options="region:'west',title:'系统菜单',split:false" style="width: 200px;">
        <div id="menu" class="easyui-accordion" data-options="fit:true,"></div>
    </div>
    页面中间位置
    <div data-options="region:'center'">
        选项卡
        <div id="tabs" class="easyui-tabs" data-options="fit:true"></div>
    </div>
    页面尾部分
    <div data-options="region:'south',split:false,href:'${pageContext.request.contextPath}/back/main/footer.jsp'" style="height: 60px;text-align: center;">&ndash;%&gt;
--%>

</body> 
</html>