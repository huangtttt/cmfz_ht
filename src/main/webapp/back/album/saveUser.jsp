<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center;">
    <form id="albumsaveUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id">
            <div style="margin-top: 70px;">
                书籍名称: <input type="text" name="title" class="easyui-textbox">
            </div>
            <div style="margin-top: 20px;">
                书籍大小: <input type="text" name="size"  class="easyui-textbox">
            </div>
            <div style="margin-top: 20px;">
                书籍时长: <input type="text" name="duration"  class="easyui-textbox">
            </div>
            <div style="margin-top: 20px;">
                书籍位置: <input type="text" name="downPathaa"  class="easyui-filebox">
            </div>
            <div style="margin-top: 20px;">
                所属专辑: <input type="text" name="album_id"  class="easyui-textbox">
            </div>

    </form>
</div>