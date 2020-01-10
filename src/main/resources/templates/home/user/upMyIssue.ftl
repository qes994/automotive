<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>编辑页</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>
	<#--<link rel="stylesheet" type="text/css" href="/home/css/globle.css" />-->
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/css/common.css" />
	<link href="/home/css/mui.indexedlist.css" rel="stylesheet" />
	<link href="/home/css/mui.picker.css" rel="stylesheet" />
	<link href="/home/css/mui.poppicker.css" rel="stylesheet" />
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
			.fabulist{
				margin-top: 0.1rem;
			}
			.fbname{
				width: 0.62rem;
				line-height: 0.41rem;
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
			.int{
				width: 2.7rem;
				height: 0.41rem;
				background: #F6F6F6;
				border-radius: 0.1rem;
				padding: 0 0.14rem;
			}
			.intwid1{
				width: 2rem;
			}
			.intwid2{
				width: 0.6rem;
			}
			.int input{
				width: 2.2rem;
				margin-bottom: 0;
				height: 0.21rem;
				padding: 0;
				background: none;
				border: none;
				font-size: 0.16rem;
				font-weight: bold;
				font-size: 0.16rem;
			}
			.int span.iconfont{
				font-size: 0.12rem;
				color: #999999;
			}
			.intheight{
				height: 1.3rem;
			}
			.int textarea{
				width: 2.2rem;
				margin-bottom: 0;
				height: 1.3rem;
				padding: 0.1rem 0;
				background: none;
				border: none;
				font-size: 0.16rem;
				font-weight: bold;
				font-size: 0.16rem;
			}
			.upload{
				width: 2.7rem;
			}
			.upimg{
				float: left;
				margin-right: 0.07rem;
				position: relative;
			}
			.upimg,.upimg img{
				width: 0.85rem;
				height: 0.85rem;
				border-radius: 0.03rem;
				position: relative;
			}
			.upimg .del-mask{
				height: 0.20rem;
				color: #fff;
				line-height: 0.20rem;
				background-color:rgba(0, 0, 0, 0.4);
				text-align: center;
				position: absolute;
				bottom: 0px;
				width: 100%;
			}
			.upimg .del-mask1{
				height: 0.20rem;
				color: #fff;
				line-height: 0.20rem;
				background-color:rgba(0, 0, 0, 0.4);
				text-align: center;
				position: absolute;
				bottom: 0px;
				width: 100%;
			}
			.upadd{
				float: right;
			}
			.upadd,.upadd img{
				width: 0.85rem;
				height: 0.85rem;
				border-radius: 0.03rem;
			}
			.uptishi{
				margin-top: 0.1rem;
				margin-bottom: 0.08rem;
			}
			.footer{
				width: 100%;
				height: 0.49rem;
				line-height: 0.49rem;
				background:linear-gradient(90deg,rgba(255,223,148,1),rgba(255,155,46,1));
				border-radius:0.1rem 0.1rem 0px 0px;
				position: fixed;
				bottom: 0;
				text-align: center;
				color: #FFFFFF;
				font-size: 0.16rem;
				font-weight: bold;
			}
			.tanchuang{
				width: 3rem;
				height: 1.8rem;
				position: fixed;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
				margin: auto;
				z-index: 8;
				display: none;
			}
			.tcbox{
				height: 1.2rem;
				background: #FFFFFF;
				border-radius: 0.1rem;
			}
			.tcbox div{
				height: 0.6rem;
				line-height: 0.6rem;
				text-align: center;
				border-radius: 0.1rem;
				font-size: 0.18rem;
			}
			.tcbox div.active{
				background: #FFC700;
				font-weight: bold;
			}
			.queding{
				height: 0.4rem;
				background: #FFFFFF;
				line-height: 0.4rem;
				text-align: center;
				border-radius: 0.1rem;
				margin-top: 0.2rem;
				font-size: 0.18rem;
			}
			.mui-btn {
				font-size: 16px;
				padding: 8px;
				margin: 3px;
			}
			h5.mui-content-padded {
				margin-left: 3px;
				margin-top: 20px !important;
			}
			h5.mui-content-padded:first-child {
				margin-top: 12px !important;
			}
			.ui-alert {
				text-align: center;
				padding: 20px 10px;
				font-size: 16px;
			}
		</style>
	</head>
	<body>

		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">编辑</h1>
	        </header>
<input id="id" type="hidden" value="${issue.id!}" name="id">
			<div class="main">
				<form id="forms">
				<div class="fabulist flex space-between">
					<div class="fbname">发布类型</div>
					<div class="int flex align-center xuanze">
						<#--<#if issue.shop =="BUY">
							<input type="text" placeholder="请选择发布类型" readonly="readonly" class="xzcen" value="求购"/>
							<#else >
							<input type="text" placeholder="请选择发布类型" readonly="readonly" class="xzcen" value="售卖"/>
						</#if>-->
						<input type="text" name="shop" placeholder="请选择发布类型" id="shop" readonly="readonly" class="xzcen" value="售卖"/>
						<span class="iconfont iconxiajiantou"></span>
					</div>
				</div>

				<div class="fabulist flex space-between">
					<div class="fbname">标题</div>
					<div class="int flex align-center">
						<input type="text" name="title" id="title" placeholder="请输入标题" value="${issue.title!}"/>
					</div>
				</div>
				
				<div class="fabulist flex space-between">
					<div class="fbname">价格</div>
					<div class="int intwid1 flex align-center">
						<input type="text" name="price" id="price" placeholder="请输入价格" value="${issue.price!}"/>
					</div>
					<div class="int intwid2 flex align-center">
						<span class="qubie">万起</span>
						<span class="iconfont iconxiajiantou marl5"></span>
					</div>
				</div>
				
				<div class="fabulist flex space-between xuhide">
					<div class="fbname">品牌</div>
					<div id="brand" class="int flex align-center">
						<input type="text" name="brand" id="brands" value="${issue.brand!}" readonly="readonly"/>
						<span class="iconfont iconarrowRight"></span>
					</div>
				</div>
				
				<div class="fabulist flex space-between xuhide">
					<div class="fbname">车型</div>
					<div id='showUserPicker'  class="int flex align-center">
						<input class="userResult" type="text" name="arctic" id="arctic" placeholder="${issue.arctic!}" readonly="readonly"/>
						<span class="iconfont iconarrowRight"></span>
					</div>
				</div>

				<div class="fabulist flex space-between">
					<div class="fbname">详细描述</div>
					<div class="int intheight flex align-center">

						<textarea id="details" name="details" placeholder="${issue.details}" value=""></textarea>
					</div>
				</div>


				<div class="fabulist flex space-between">
					<div class="fbname">详情图片</div>
					<div class="upload">
						<div class="font12 cor9 uptishi">最多上传6张图片</div>
						<div class="upcen">
							<div class="upbox" id="upbox">
								<#list print as item>
								<div class="upimg">
									<img src="${item.cover!}" />
									<div id="del" onclick="del(${item.id})" class="del-mask">删除</div>
								</div>
								</#list>
							</div>
							<input type="hidden" id="cover" value="<#list print as item>${item.cover},</#list>" name="cover">
							<div id="remove" class="upadd">
								<img src="/home/image/upadd.png" />
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>

			<div class="footer">编辑</div>
			<input type="hidden" id="issueId" name="id" value="${issue.id!}">
			<!--弹窗-->
			<div class="bg_rgba"></div>
			<div class="tanchuang">
				<div class="tcbox">
					<div class="active">售卖</div>
					<div>求购</div>
				</div>
				<div class="queding">确定</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="/home/js/common.js" ></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
<script src="/home/js/mui.min.js"></script>
<script src="/home/js/mui.picker.js"></script>
<script src="/home/js/mui.poppicker.js"></script>
<script src="/home/js/mui.indexedlist.js"></script>
	<script>
		var temp = $("#remove");
		var html = '售卖';
		var index = 0;
		$('.tcbox').on('click','div',function(){
			$('.tcbox  div').removeClass('active');
			$(this).addClass('active');
			index = $(this).index();
			html = $(this).html();
		})
		$('.xuanze').click(function(){
			$('.tanchuang').show();
			$('.bg_rgba').show();
		})
		$('.queding').click(function(){
			$('.tanchuang').hide();
			$('.bg_rgba').hide();
			$('.xzcen').val(html);
			if(index==1){
				$('.xuhide').hide();
				$('.qubie').html('万起');
			}else{
				$('.xuhide').show();
				$('.qubie').html('万起');
			}
		})
		//input输入键盘顶起定位元素代码
		 var win_h = $(window).height(); //关键代码
         window.addEventListener('resize', function() {
            if($(window).height() < win_h) {
                $('.tijiao').hide();
            } else {
                $('.tijiao').show();
                
            }
         });
		/*点击品牌,前往品牌前保存数据*/
		$("#brand").click(function () {
			//保存from表单数据
			var data = {}
			var object = $("#forms").serializeArray();
			$.each(object,function () {
				data[this.name]=this.value;
			})
			var issue = JSON.stringify(data);//转换成字符串
			//保存
			/*var shop = $("#shop").val();
			var title = $("#title").val();
			var price = $("#price").val();
			var arctic = $("#arctic").val();
			var details = $("#details").val();
			var data = {"shop":shop,"title":title,"price":price,"arctic":arctic,"details":details}
		*/
			console.log("表单信息=="+issue)
			localStorage.setItem('data',issue);//保存
			var id = $("#issueId").val();
			window.location.href="/user/brand?id="+id;
		})
		/*页面加载*/
		$(function(){
			//var cover = $("#cover").val();
			//console.log("图片地址"+cover)
			var data = JSON.parse(localStorage.getItem('data'));
			if(data!=null){
				var shop = data.shop　//存储进去的是数字，但是log出的是string
				if(shop!=null&&shop!=""){
					$(".xzcen").val(shop);
				}
				var title = data.title
				if(title!=null&&title!=""){
					$("#title").val(title)
				}
				var price = parseInt(data.price)
				if(price!=null&&price!=0&&price!=''){
					console.log(data.price)
					$("#price").val(price);
				}
				var arcticId = data.arctic
				if(arcticId!=null&&arcticId!=""){
					$("#arctic").val(arcticId);
				}
				var details = data.details
				if(details!=null&&details!=""){
					$("#details").val(details);
				}
				/*var images = data.cover
				if(images!=null&&images!=""){
					var arr=images.split(",");
					//var tmp=[];
					for (var i=0;i<arr.length;i++){
						var html='<div class="upimg"><img src="'+arr[i]+'" /><div class="del-mask">删除</div></div>';
						$("#upbox").append(html)
					}
				}*/
				//赋值就删除完
				if(data!=null){
					localStorage.removeItem("data")
				}
			}
		})
		//车型
		/*车型*/
		mui.init();
		mui.ready(function() {
			var userPicker = new mui.PopPicker();
			$.ajax({
				url: "/user/arctic",
				type: "POST",
				success: function (ret) {
					console.log(ret)
					var data = ret.object
					//var jsonObj =  JSON.parse(data)
					var result=[];
					for(var i =0 ;i < data.length;i++){
						console.log(data[i])
						var item={
							value:data[i].id,
							text: data[i].name,
						}
						result.push(item)
					}
					console.log(result)
					userPicker.setData(result);
					var showUserPickerButton = document.getElementById('showUserPicker');
					//var userResult = document.getElementById('.userResult');
					showUserPickerButton.addEventListener('tap', function(event) {
						userPicker.show(function(items) {
							console.log(items)
							var val = $(".userResult").val(items[0].text);
							console.log(val);
							//返回 false 可以阻止选择框的关闭
							//return false;
						});
					}, false);
				}
			})
		});

		var uplaoder=WebUploader.create({
			swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
			// 存在文件自动上传
			pick:".upadd",
			auto: true,
			// 文件接收服务端地址。
			server: '/upload/image',
			// 限制文件类型
			accept:  {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/!*'
			},
			fileNumLimit:6,
			//允许重复上传
			duplicate: true,
			//上传方式
			method: 'post',
			//设定单个文件大小 不能超过20M
			fileSingleSizeLimit: 20 * 1024 * 1024

		});
		uplaoder.on('uploadSuccess', function (file, reponse) {
			if(reponse.code==1){
				var images=$("#cover").val();
				var arr=images.split(",");
				var image=[];
				for (var i=0;i<arr.length;i++){
					image.push(arr[i])
				}
				if (image.length<=6){
					var html='<div class="upimg"><img src="'+reponse.url+'" /><div class="del-mask">删除</div></div>';
					$("#upbox").append(html)
				}
				//console.log("图片多少="+image.length)
				if (image.length==6){
					$(".upadd").addClass(".aaaaaaaaa");
					showToast({
						str: "图片已到6个,可删除其他,否则在添加无效"
					})
					//$("#remove").remove();
				}
					if (image.length<=6){
						if(images==""){
							$("#cover").val(reponse.url)
						}else{
							$("#cover").val(images+","+reponse.url)
						}
					}

			}
		});
		/** 上传失败 */
		uplaoder.on('uploadError', function (file) {
			$('#' + file.id).find('.state').text('上传出错！');
		});

		$("#upbox").on("click",".del-mask",function(){
			var $parent=$(this).parents(".upimg");
			var src=$parent.find("img").attr("src");
			$parent.remove();
			var images=$("#cover").val();
			var arr=images.split(",");
			var tmp=[];
			for (var i=0;i<arr.length;i++){
				if(arr[i]!=src && arr[i]!=''){
					tmp.push(arr[i])
				}
			}
			$("#cover").val(tmp.join(","))
		})
		function del(id) {
			var msg = "您真的确定要删除吗？\n\n删除不可恢复!!!";
			if (confirm(msg)==true){
				$.ajax({
					url:"/user/delRecord",
					type:"Post",
					data:{"id":id},
					success:function (data) {
						if (data.code==1){
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
				return true;
			}else{
				window.location.reload()
				return false;
			}
		}

		/*最終修改*/
		$(".footer").click(function () {
			//图片
			var images = $("#cover").val();
			var arr=images.split(",");
			var image=[];
			for (var i=0;i<arr.length;i++){
				image.push(arr[i])
			}

			//文章id
			var id = $("#id").val()
			//类型
			var shop = $("#shop").val();
			//标题
			var title = $("#title").val();
			//价格
			var price = $("#price").val();
			//品牌
			var brand = $("#brands").val();
			//车型
			var arctic = $("#arctic").val();
			//详情描述
			var details = $("#details").val();
			var item = {"id":id,"shop":shop,"title":title,
				"price":price,"brand":brand,"arctic":arctic,
				"details":details,"image":image
			}
			console.log("数据="+item)
			$.ajax({
				url:"/user/updateIssue",
				data:JSON.stringify(item),
				type:"POST",
				contentType:"application/json;charset=utf-8",
				success:function(data){
					if (data.code==0){
						showToast({
							str: data.msg
						})
					}else{
						showToast({
							str: data.msg
						})
						localStorage.removeItem("data")
						window.location.href="/user/home";
					}
				}
			})


		})








	</script>
</html>