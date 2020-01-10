<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改名称</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/icon/iconfont.css" />
	<link href="/home/css/common.css" rel="stylesheet" />
		<style>
			body{
				background: #F4F4F4;
			}
			.header{
				background: #ffffff;
				border-bottom: 1px solid #EEEEEE;
			}
			
			input::-webkit-input-placeholder,
			input:-moz-placeholder,
			input:-moz-placeholder,
			input::-moz-placeholder,
			input:-ms-input-placeholder {
				color: #999999;
				font-size: 0.16rem;
				font-weight: normal;
			}
			
			.mbox{
				background: #ffffff;
				border-radius:0 0 0.1rem 0.1rem;
				padding-bottom: 0.2rem;
				box-shadow:0px 4px 6px 0px rgba(192,192,192,0.2);
			}
			
			.int{
				border-bottom: 1px solid #DDDDDD;
				padding: 0.2rem 0 0.07rem 0;
				margin:  0 0.14rem;
			}
			.int input{
				height: 0.21rem;
				line-height: 0.21rem;
				padding: 0;
				border: none;
				margin-bottom: 0;
			}
			
			.queding{
				width: 2.97rem;
				height: 0.49rem;
				line-height: 0.49rem;
				background:#FFC700;
				border-radius:0.25rem;
				text-align: center;
				color: #463C17;
				font-size: 0.16rem;
				margin: 0 auto;
				margin-top: 0.5rem;
			}
			
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
						<h1 class="mui-title">请输入昵称</h1>
	        </header>
			<div class="main">
				<div class="mbox">
					<div class="int">
						<#if user.name??>
							<input class="name" type="text" placeholder="${user.name!}" />
						<#else>
							<input class="name" type="text" placeholder="请输入昵称" />
						</#if>
					</div>
				</div>
				<div class="queding">确认</div>
			</div>
			
			
			
		</div>
	</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
	<script type="text/javascript">
		$(".queding").click(function () {
			var name = $(".name").val()
			$.ajax({
				url:"/user/setName",
				data:{"name":name},
				type:"POST",
				success:function(data){
					console.log(data)
					if(data.code==1){
						showToast({
							str: data.msg
						})
						window.location.href="/user/head";
					}else{
						showToast({
							str:data.msg
						})
					}
				}
			})
		})
	</script>
</html>