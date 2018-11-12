<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#gurueditUserInputForm").form('load','${pageContext.request.contextPath}/guru/findOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">

    <form id="gurueditUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            名称: <input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            头像: <input type="text" name="headPiccc" class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            性别: <input type="text" name="sex"  class="easyui-textbox">
        </div>

    </form>
</div>