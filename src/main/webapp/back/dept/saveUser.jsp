<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center;">
    <form id="saveUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            图片: <input type="text" name="imgPathbb"  class="easyui-filebox">
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