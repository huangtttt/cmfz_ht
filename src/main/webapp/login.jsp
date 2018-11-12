
<%@page pageEncoding="UTF-8"  isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/black/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>

           $(function(){
               $.extend($.fn.validatebox.defaults.rules, {
                   equals: {
                       validator: function(value,param){
                           return value == $(param[0]).val();
                       },
                       message: '两次输入的密码不一致'
                   }
               });
           });
           function subForm() {
               $("#inputForm").form('submit',{
                   url:"#",
                   success:function (data) {
                       alert("登录成功！！");
                   }
               })
           }
           function closeDialog() {
               $('#dd').dialog('close');
           }
    </script>
</head>
<body>
       <div id="dd" class="easyui-dialog" data-options="href:'${pageContext.request.contextPath}/save.jsp',
       title:'用户登录',width:500,height:350,buttons:'#b'"></div>
       &lt;%&ndash;定义按钮组&ndash;%&gt;
       <div id="b">
           <a class="easyui-linkbutton" data-options="onClick:subForm,iconCls:'icon-save'">登录</a>
           <a class="easyui-linkbutton" data-options="onClick:closeDialog,iconCls:'icon-cancel'">关闭</a>
       </div>

</body>
</html>
