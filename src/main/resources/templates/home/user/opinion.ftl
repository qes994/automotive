<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
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
				border-bottom: 1px solid #EEEEEE;
			}
			.main{
				padding: 0 0.14rem;
				margin-top: 0.54rem;
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
			
			.main textarea{
				margin-bottom: 0;
				height: 1.5rem;
				padding: 0.1rem 0.14rem;
				background: none;
				border: none;
				font-size: 0.16rem;
				font-weight: bold;
				font-size: 0.16rem;
				background: #F6F6F6;
				border-radius: 0.1rem;
			}
			
			
			.queding{
				width: 100%;
				height: 0.49rem;
				line-height: 0.49rem;
				background:#FFC700;
				border-radius:0.25rem;
				text-align: center;
				color: #463C17;
				font-size: 0.16rem;
				margin-top: 0.8rem;
			}
			
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">意见反馈</h1>
	        </header>
			<div class="main">
				<textarea id="content" placeholder="谢谢你宝贵的建议"></textarea>
				<div class="queding">发布</div>
			</div>
			
			
			
		</div>
	</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
	<script>
		/*添加*/
		$(".queding").click(function () {
			var content = $("#content").val()
			$.ajax({
				url:"/user/opinion",
				data:{"content":content},
				type:'POST',
				success:function(data){
					console.log(data);
					if (data.code==1){
						showToast({
							str: data.msg
						})
						//window.location.href="/user/home"
					}else{
						showToast({
							str: data.msg
						})
					}
				}
			})
		})
		/*返回上一级*/
		$(".mui-action-back").click(function () {
			window.location.href="/user/home"
		})

	</script>
</html>