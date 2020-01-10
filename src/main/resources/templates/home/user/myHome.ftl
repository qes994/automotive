<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人主页</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
		<style>
			body{
				background: #ffffff;
			}
			.header{
				background: #ffffff;
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
			.qiugou{
				color: #46D48D;
				font-size: 0.12rem;
				font-weight: bold;
			}
			.mcen{
				position: relative;
				top: -0.2rem;
				background: #ffffff;
				border-radius: 0.25rem 0.25rem 0 0;
			}
			.mtit{
				padding: 0.2rem 0.15rem;
				font-size: 0.18rem;
				font-weight: bold;
			}
			.mtit span{
				font-size: 0.14rem;
				color: #999999;
			}
			.yonghu{
				padding: 0.1rem 0.1rem 0.3rem 0.1rem;
				background: #FFF9EB;
				margin-top: 0.25rem;
			}
			.touxiang,.touxiang img{
				width: 0.6rem;
				height: 0.6rem;
				border-radius: 0.6rem;
			}
			.usermess{
				margin-left: 0.2rem;
			}
			.username{
				font-size: 0.18rem;
				color: #333333;
				font-weight: bold;
			}
			.userid{
				font-size: 0.14rem;
				color: #999999;
				margin-top: 0.1rem;
			}
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">个人主页</h1>
	        </header>
			<input type="hidden" id="issueId" value="${issueId!}">
			<div class="main">
				<div class="yonghu flex space-between align-center">
					<div class="yhleft flex align-center">
						<div class="touxiang">
							<img src="${user.head!}" />
						</div>
						<div class="usermess">
							<div class="username">${user.name!}</div>
							<div class="userid">ID：${user.id!}</div>
						</div>
					</div>
				</div>
				<div class="mcen">
					<div class="mtit">发布列表<span>（${count!}条）</span></div>
					<div class="maincen">
						<#list list as item>
							<div onclick="toDetails(${item.id!})" class="splist clearfloat">
								<div class="spleft fl">
									<img src="${item.issuePrints[0].cover!}" />
								</div>
								<div class="spright fr">
									<div class="sptit w_s_2">${item.title!}</div>
									<div class="show flex space-between">
										<span class="price">￥${item.price!}万内</span>
										<#if item.shop=="BUY" >
											<span class="qiugou">求购</span>
											<#else >
												<span class="qiugou">售卖</span>
										</#if>
									</div>
								</div>
							</div>
						</#list>

					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js" ></script>
	<script type="text/javascript" src="/home/js/common.js" ></script>
<script>
	function toDetails(id) {
		window.location.href="/user/details?id="+id;
	}
	$(".mui-action-back").click(function () {
		var id = $("#issueId").val();
		window.location.href="/user/details?id="+id;
	})
</script>
</html>