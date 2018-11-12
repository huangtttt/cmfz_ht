<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#editUserInputForm").form('load','${pageContext.request.contextPath}/banner/findOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="editUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            图片: <input type="text" name="imgPathbb" value="${param.imgPath}" class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            简介: <input type="text" name="descA"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            状态: <input type="text" name="status"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            创建时间: <input type="text" name="creationdate"  class="easyui-datebox">
        </div>
    </form>
</div>