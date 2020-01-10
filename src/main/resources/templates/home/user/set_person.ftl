<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改个人资料</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/icon/iconfont.css" />
	<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>
	<style>
			body{
				background: #F7F7F7;
			}
			.header{
				background: #ffffff;
				border-bottom: 1px solid #EEEEEE;
			}
			.person{
				background: #ffffff;
				padding: 0 0.15rem;
				margin-bottom: 0.1rem;
			}
			.plist{
				padding: 0.18rem 0;
			}
			.usertou,.usertou img{
				width: 0.48rem;
				height: 0.48rem;
			}
			.border{
				border-bottom: 1px solid #EEEEEE;
			}
			.iconarrowRight{
				font-size: 0.14rem;
				color: #CCCCCC;
			}
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">个人资料</h1>
	        </header>
			<div class="main font16">
				<div class="person">
					<div class="plist flex space-between align-center border">
						<div class="cor3">头像</div>
						<div id="uploader" class="wu-example"></div>
						<div id="fileList" class="uploader-list"></div>
						<div class="usertou">
							<#if user.head??>
								<img src="${user.head!}" class="srcs">
							<#else>
								<img class="srcs" src="/home/image/tou.png" />
							</#if>
							<input type="hidden" name="head" id="head">
						</div>
						<a id="csvPicker"style="display:none;">修改</a>
					</div>
					<div class="plist flex space-between align-center">
						<div class="cor3">昵称</div>
						<div class="username flex align-center">
							<#if user.name??>
								<span class="cor9">${user.name}</span>
								<#else >
								<span class="cor9">车友</span>
							</#if>
							<span class="iconfont iconarrowRight marl5"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/home/js/common.js"></script>
	<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
<script type="text/javascript">

		$(function($) {

		});
		var $list = $('#fileList');
		var uploader = WebUploader.create({
			// 存在文件自动上传
			auto: true,
			// swf文件路径
			swf: '/home/webuploader/Uploader.swf',
			// 文件接收服务端地址。
			server: '/upload/image',
			// 选择文件的按钮。
			pick: {id: '.usertou'},
			// 限制文件类型
			accept:  {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/*'
			},
			// 是否分片上传
			chunked: false,
			// 设置分片大小
			chunkSize: 5242880,
			// 最高并发线程 1
			threads: 1,
			//允许重复上传
			duplicate: true,
			// 压缩文件
			resize: false,
			/** 上传方式 */
			method: 'post',
			//设定单个文件大小 不能超过20M
			fileSingleSizeLimit: 20 * 1024 * 1024,
			fileNumLimit:1
		})
		/** 完成上传 */
		uploader.on('uploadSuccess', function (file, reponse) {
			console.log(reponse);
			$("#head").val(reponse.url)
			$(".srcs").attr("src",reponse.url)
			/*修改头像*/
				var head = reponse.url;
				$.ajax({
					url:"/user/head",
					data:{"head":head},
					type:"POST",
					dataType: "json",
					success:function(data){
						console.log(data)
						if(data.code==1){
							showToast({
								str: data.msg
							})
						}else {
							showToast({
								str:data.msg
							})
						}

					}
				})

			if(reponse.state == 'succ'){
				console.log(response);
				//alert(reponse.msg);
				//alert(reponse.url);
				//this.options.formData.type = '';
				this.options.formData.age = '';
				this.options.formData.uname = '';
				this.options.formData.pw = '';
				uploader.removeFile(uploader.getFile(file.id));
				uploader.getFiles('inited');
			}else{
				//上传失败将文件从队列中移出避免再次添加统一文件时不显示名称
				uploader.removeFile(uploader.getFile(file.id));
				uploader.getFiles('inited');
				//alert(reponse.msg);
			}
		});
		/** 上传失败 */
		uploader.on('uploadError', function (file) {
			$('#' + file.id).find('.state').text('上传出错！');
		});

		/*前往修改名称*/
	$(".username").click(function () {
		window.location.href="/user/setName";
	})
	/*返回上一级*/
	$(".mui-action-back").click(function () {
		window.location.href="/user/home"
	})
</script>
</html>