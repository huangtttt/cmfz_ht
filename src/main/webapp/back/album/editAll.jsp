<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#albumAllInputForm").form('load','${pageContext.request.contextPath}/album/findOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="albumAllInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id">
        <div style="margin-top: 70px;">
            书籍名称: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            书籍章节: <input type="text" name="count"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            书籍封面: <input type="text" name="coverImgaa"  class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            书籍评分: <input type="text" name="star"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            书籍作者: <input type="text" name="author"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            播音员: <input type="text" name="broadCast"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            内容简介: <input type="text" name="brief"  class="easyui-textbox">
        </div>
    </form>
</div>