<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#usereditUserInputForm").form('load','${pageContext.request.contextPath}/user/findOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="usereditUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            电话号码: <input type="text" name="phoneNum" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            用户名: <input type="text" name="username" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            密码: <input type="text" name="password"  class="easyui-textbox" readonly>
        </div>
        <div style="margin-top: 20px;">
            盐值: <input type="text" name="salt" class="easyui-textbox" readonly>
        </div>
        <div style="margin-top: 20px;">
            省份: <input type="text" name="province"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            城市: <input type="text" name="city" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            法名: <input type="text" name="nickName"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            性别: <input type="text" name="gender" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            签名: <input type="text" name="sign"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            头像: <input type="text" name="headPicdd" class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            状态: <input type="text" name="status"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            创建日期: <input type="text" name="publishDate"  class="easyui-textbox">
        </div>
        <%--
        {title:'id',field:'id',width:120,},
                    {title:'电话号码',field:'phoneNum',width:120,},
                    {title:'用户名',field:'username',width:120,},
                    {title:'密码',field:'password',width:120,},
                    {title:'盐值',field:'salt',width:120,},
                    {title:'省份',field:'province',width:120,},
                    {title:'城市',field:'city',width:120,},
                    {title:'法名',field:'nickName',width:120,},
                    {title:'性别',field:'gender',width:120,},
                    {title:'签名',field:'sign',width:120,},
                    {title:'头像',field:'headPic',width:120,},
                    {title:'状态',field:'status',width:120,},
                    {title:'创建日期',field:'publishDate',width:120,sortable:true},
        --%>

    </form>
</div>