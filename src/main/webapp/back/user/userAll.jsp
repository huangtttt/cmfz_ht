<%@page pageEncoding="UTF-8" isELIgnored="false" %>

    <script>
        $(function () {

            //通过js创建datagrid
            $("#user").datagrid({
                url:'${pageContext.request.contextPath}/user/findAll',//用来请求远程数据
                height:630,
                pagination:true,//显示分页工具栏
                pageNumber:1,//当前页
                pageSize:5,//每页显示记录数
                pageList:[2,5,10,15,30,500],
                striped:true,
                rowNumbers:true,
                singleSelect:false,
                ctrlSelect:true,
                remoteSort:false,
                multiSort:true,
                queryParams:{
                    name:"xiaohei",
                },
                remoteSort:false,
                multiSort:true,
                columns:[[
                    {title:'cks',field:"cks",checkbox:true},
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
                    {title:'options',field:'options',width:200,
                        formatter:function(value,row,index){
                            return "<a href='javascript:;' class='options' onclick=\"userdelRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                                "<a href='javascript:;' class='options' onclick=\"useropenEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                        }
                    }
                ]],
                onLoadSuccess:function () {
                    $(".options").linkbutton();
                },
                toolbar:'#usertb',
                view: detailview,
                detailFormatter: function(rowIndex, rowData){
                    return '<table><tr>' +
                        '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/'+rowData.headPic+'" style="height:50px;"></td>' +
                        '<td style="border:0">' +
                        '<p>Attribute: ' + rowData.username + '</p>' +
                        '<p>Status: ' + rowData.status + '</p>' +
                        '</td>' +
                        '</tr></table>';
                }


            });


        });


        //打开修改用户的对话框
        function useropenEditUserDialog(id){
            $("#usereditUserDialog").dialog({
                href:'${pageContext.request.contextPath}/back/user/edit.jsp?id='+id,
                buttons:[
                    {
                        iconCls:'icon-save',
                        text:"修改",
                        handler:function(){
                            $("#usereditUserInputForm").form('submit',{
                                url:"${pageContext.request.contextPath}/user/motifyuser",
                                success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                    var resultObject=$.parseJSON(result);
                                    if(resultObject.success){
                                        //提示信息
                                        $.messager.show({title:'提示',msg:"用户修改成功!!!"});
                                    }else{
                                        //提示信息
                                        $.messager.show({title:'提示',msg:resultObject.message});
                                    }
                                    //关闭dialog
                                    $("#usereditUserDialog").dialog('close');
                                    //刷新datagrid
                                    $("#user").datagrid('reload');//刷新当前datagrid
                                }
                            })
                        }
                    },
                    {
                        iconCls:'icon-cancel',
                        text:"取消",
                        handler:function(){
                            $("#usereditUserDialog").dialog('close');
                        }
                    },
                ]
            });

        }

        //删除一行的事件
        function userdelRow(id){
            //获取当前点击id发送ajax请求删除id这个人的信息
            $.post("${pageContext.request.contextPath}/user/removeAll",{"id":id},function (result) {//响应成功之后回调
                //刷新datagrid数据
                $("#user").datagrid('reload');//刷新当前datagrid
            });
        }

        //打开保存用户对话框函数
        function useropenSaveUserDialog(){
            $("#usersaveUserDialog").dialog({
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#usersaveUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/user/add',
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
                                $("#usersaveUserDialog").dialog('close');
                                //刷新datagrid
                                $("#user").datagrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#usersaveUserDialog").dialog('close');
                    }
                }]
            });
        }
        //批量删除多行
        function userdelBatchRows(){
            var rows = $("#user").datagrid('getSelections');
            if(rows.length<=0){
                $.messager.show({title:'提示',msg:"至少选中一行!!!"});
            }else{
                var ids = [];
                for (var i = 0; i < rows.length ; i++) {
                    console.log(rows[i].id);
                    ids.push(rows[i].id);
                }
                console.log(ids);
                //发送ajax请求传递数组  注意: $.get $.post 只能传递简单数据(key=value) 不能数组类型的数据
                //                        如果想要传递数组类型的数据只能使用  $.ajax 并且还要设置其中的一个属性
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/removeAll",
                    type:"POST",
                    traditional:true,//传递数据类型的数据时必须设置这个属性为true
                    data:{ids:ids},
                    success:function(result){
                        //消息提示
                        $.messager.show({title:'提示',msg:"删除成功!!!"});
                        //刷新datagrid
                        $("#user").datagrid('reload');
                    },
                    error:function(){
                        //消息提示
                        $.messager.show({title:'提示',msg:"删除失败!!!"});
                        //刷新datagrid
                        $("#user").datagrid('reload');
                    }
                })
            }
        }




        //打开测试登录测试框
        function LoginUser(){
            $("#LoginUserDialog").dialog({
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#loginUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/user/findByName',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var resultObject=$.parseJSON(result);
                                if(resultObject.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObject.message});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObject.message});
                                }
                                //关闭对话框
                                $("#LoginUserDialog").dialog('close');
                                //刷新datagrid
                                $("#user").datagrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#LoginUserDialog").dialog('close');
                    }
                }]
            });
        }

    </script>


<%--datagrid数据表格--%>
<table id="user"></table>

<%--datagrid工具栏--%>
<div id="usertb">
    <a href="#" class="easyui-linkbutton" onclick="useropenSaveUserDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton" onclick="userdelBatchRows();" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    <a href="#" class="easyui-linkbutton" onclick="LoginUser();" data-options="iconCls:'icon-remove',plain:true">测试登录</a>
</div>

<%--保存用户对话框--%>
        <div id="usersaveUserDialog" data-options="href:'${pageContext.request.contextPath}/back/user/saveUser.jsp',
        draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存用户信息'">
</div>

<%--更新用户对话框--%>
        <div id="usereditUserDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,
        title:'更新用户信息'"></div>

<%--测试登录对话框--%>
        <div id="LoginUserDialog" data-options="href:'${pageContext.request.contextPath}/back/user/loginUser.jsp',draggable:false,iconCls:'icon-edit',width:600,height:400,
        title:'测试登录'"></div>

