<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<style>
			body {
				background: #F9F9F9;
			}
			.header{
				background: #ffffff;
			}
			.main{
				margin-top: 0.54rem;
			}
			.splist{
				width: 3.47rem;
				padding: 0.1rem;
				background:rgba(255,255,255,1);
				box-shadow:0px 1px 6px 0px rgba(232,235,238,1);
				border-radius:0.1rem;
				margin: 0 auto; 
				margin-bottom: 0.1rem;
			}
			.spleft,.spleft img{
				width: 1.25rem;
				height: 0.9rem;
				border-radius: 0.03rem;
			}
			.spright{
				width: 1.9rem;
				margin-left: 0.1rem;
			}
			.sptit{
				font-size: 0.16rem;
				color: #333333;
				font-weight: bold;
				line-height: 0.18rem;
				margin-top: 0.05rem;
			}
			.show{
				margin-top: 0.3rem;
			}
			.price{
				font-size: 0.18rem;
				color: #FF5757;
				font-weight: bold;
			}
			.zaishou{
				color: #5F97FF;
				font-size: 0.12rem;
				font-weight: bold;
			}
			.qiugou{
				color: #46D48D;
				font-size: 0.12rem;
				font-weight: bold;
			}
			.spright2{
				width: 100%;
			}
			.spright .del-link{
				float: right;
				font-size: 0.10rem;
				font-weight: normal;
			}
		</style>
	</head>

	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">我的发布</h1>
	        </header>
			<div class="main">
				<#list issue as item>
					<div onclick="toDetails(${item.id!})" class="splist clearfloat">
						<div class="spleft fl">
							<img src="${item.issuePrints[0].cover!}" />
						</div>
						<div class="spright fr">
							<div class="sptit w_s_2">
								${item.title!}
								<a class="del-link" onclick="del(${item.id!})">删除</a>
							</div>
							<div class="show flex space-between">
								<span class="price">￥${item.price!}万</span>
							<#if item.shop =="BUY">
								<span class="zaishou">求购</span>
								<#else >
									<span class="zaishou">售卖</span>
							</#if>
							</div>
						</div>

					</div>
				</#list>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	/*返回上一级*/
	$(".mui-action-back").click(function () {
		window.location.href="/user/home";
	})

	/*前往个人详情*/
	function  toDetails(id) {
		window.location.href="/user/details?id="+id;
	}
	//window.location.href="/user/editIssue?id="+id;
	/*删除*/
	function del(id) {
		$.ajax({
			url:"/user/delIssue",
			data:{"id":id},
			type:"GET",
			success:function(data){
				console.log(data)
				if (data.code==1){
					//alert(data.msg)
					showToast({
						str: data.msg
					})
					window.location.reload()
				}else{
					showToast({
						str: data.msg
					})
				}
			}
		})
	}
</script>
</html>