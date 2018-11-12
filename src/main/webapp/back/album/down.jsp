<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
   /*$(function () {
       alert("${param.id}")
   })*/
</script>
<div style="text-align: center;" id="abc">
    <div style="margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/album/download?fileName=${param.id}&openStyle=inline" class="easyui-linkbutton" data-options="">在线播放</a>
    </div>
    <div style="margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/album/download?fileName=${param.id}&openStyle=attachment" class="easyui-linkbutton" data-options="">下载音频</a>
    </div>
</div>

