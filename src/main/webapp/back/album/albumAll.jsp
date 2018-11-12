<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function(){
        $("#albumDatagrid").treegrid({
            url:'${pageContext.request.contextPath}/album/findAll',
            height:630,
            pagination:true,//显示分页工具栏
            pageNumber:1,//当前页
            pageSize:5,//每页显示记录数
            pageList:[2,5,10,15,30,500],
            striped:true,
            rowNumbers:true,
            singleSelect:false,
            ctrlSelect:true,
            queryParams:{
                name:"xiaohei",
            },
            remoteSort:false,
            multiSort:true,
            method:'post',
            fitColumns:true,
            idField:'id',
            treeField:'title',
            toolbar:'#albumtb',
            columns:[[
                {title:'标题',field:'title',width:130},
                {field:'size',title:'大小',width:60,align:'right'},
                {field:'duration',title:'时长',width:80,align:'right'},
                {field:'downPath',title:'下载路径',width:80,align:'right'},
                {field:'uploadTime',title:'上传时间',width:80,align:'right'},
                {title:'options',field:'options',width:200,
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"albumdelRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>" ;
                    }
                }
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },

        });
    });

    //删除一行的事件
    function albumdelRow(id){
        //获取当前点击id发送ajax请求删除id这个人的信息
        if(id.length>=36){
            $.post("${pageContext.request.contextPath}/chapter/remove",{"id":id},function (result) {//响应成功之后回调
                //刷新datagrid数据
                $("#albumDatagrid").treegrid('reload');//刷新当前datagrid
            });
        }else {
            $.post("${pageContext.request.contextPath}/album/motify",{"id":id},function (result) {//响应成功之后回调
                //刷新datagrid数据
                $("#albumDatagrid").treegrid('reload');//刷新当前datagrid
            });
        }

    }

    //添加章节
    function albumSaveChapter(){
        $("#ChapterSaveDialog").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#albumsaveUserInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/chapter/add',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObject=$.parseJSON(result);
                            if(resultObject.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"添加成功!!!"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObject.message});
                            }
                            //关闭对话框
                            $("#ChapterSaveDialog").dialog('close');
                            //刷新datagrid
                            $("#albumDatagrid").treegrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#ChapterSaveDialog").dialog('close');
                }
            }]
        });
    }



    //添加专辑
    function albumaddAll(){
        $("#AlbumSaveDialog").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#albumSaveInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/album/add',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObject=$.parseJSON(result);
                            if(resultObject.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObject.message});
                            }
                            //关闭对话框
                            $("#AlbumSaveDialog").dialog('close');
                            //刷新datagrid
                            $("#albumDatagrid").treegrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#AlbumSaveDialog").dialog('close');
                }
            }]
        });
    }



    //打开专辑详情的对话框
    function albumshowAll(id){
        var rows = $("#albumDatagrid").datagrid('getSelected');
        console.log(rows.id);
        $("#AlbumAllDialog").dialog({
            href:'${pageContext.request.contextPath}/back/album/editAll.jsp?id='+rows.id,
        });

    }


    function albumupload() {
        var rows = $("#albumDatagrid").treegrid('getSelected');
        console.log(rows.id);
        console.log(rows.downPath);
        if (rows == null || rows.id.length < 36) {
            $.messager.show({title: '提示', msg: '请选中一个音频！！！'});
        } else {
            $("#DownDialog").dialog({
                href: '${pageContext.request.contextPath}/back/album/down.jsp?id='+rows.downPath,
                buttons: [{
                    iconCls: 'icon-cancel',
                    text: '关闭',
                    handler: function () {
                        $("#DownDialog").dialog('close');
                    }
                }]
            });
        }
    }




</script>


<%--//  <div id="albumDatagrid"></div>--%>

<table id="albumDatagrid" class="easyui-treegrid" >

</table>


<div id="albumtb">
    <a href="#" class="easyui-linkbutton" onclick="albumshowAll();" data-options="iconCls:'icon-add',plain:true">专辑详情</a>
    <a href="#" class="easyui-linkbutton" onclick="albumaddAll();" data-options="iconCls:'icon-remove',plain:true">添加专辑</a>
    <a href="#" class="easyui-linkbutton" onclick="albumSaveChapter();" data-options="iconCls:'icon-add',plain:true">添加章节</a>
    <a href="#" class="easyui-linkbutton" onclick="albumupload();" data-options="iconCls:'icon-remove',plain:true">下载音频</a>
</div>


<%--添加章节对话框--%>
<div id="ChapterSaveDialog" data-options="href:'${pageContext.request.contextPath}/back/album/saveUser.jsp',
        draggable:false,iconCls:'icon-save',width:600,height:400,title:'添加专辑信息'">
</div>

<%--添加专辑对话框--%>
<div id="AlbumSaveDialog" data-options="href:'${pageContext.request.contextPath}/back/album/edit.jsp',
        draggable:false,iconCls:'icon-save',width:600,height:400,title:'添加专辑信息'">
</div>

<%--专辑详情对话框--%>
<div id="AlbumAllDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,
        title:'专辑详情信息'">
</div>

<%--文件下载对话框--%>
<div id="DownDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,
        title:'文件下载信息'">
</div>

