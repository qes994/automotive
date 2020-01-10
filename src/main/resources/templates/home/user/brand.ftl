<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>选择品牌</title>
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/css/common.css" />
		<link href="/home/css/mui.indexedlist.css" rel="stylesheet" />
		<style>
			html,
			body {
				height: 100%;
				overflow: hidden;
				background: #F7F7F7;
			}
			.mui-table-view{
				background: #f7f7f7;
			}
			.header{
				background: #ffffff;
				border-bottom: 1px solid #EEEEEE;
			}
			.mui-table-view-cell span{
				width:28%;
				height: 0.35rem;
				line-height: 0.35rem;
				text-align: center;
				border-radius: 0.18rem;
				background: #ffffff;
				display: inline-block;
				margin-right: 0.1rem!important;
				margin: 0.05rem 0;
				font-size: 0.14rem;
			}
			.mui-table-view-cell.mui-checkbox.mui-left, .mui-table-view-cell.mui-radio.mui-left{
				padding: 11px 15px;
			}
			.mui-table-view-divider:before,.mui-table-view-divider:after{
				background-color: #f7f7f7;;
			}
			.mui-bar-nav~.mui-content {
			    padding-top: 0.44rem;
			}
			.mui-indexed-list{
				border-top: none;
			}
			.mui-table-view{
				padding-bottom: 0.4rem;
			}
		</style>
	</head>

	<body>
		<header class="header mui-bar mui-bar-nav">
            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
            <h1 class="mui-title">汽车品牌</h1>
        </header>
		<div class="mui-content">
			<div id='list' class="mui-indexed-list">
				<div class="mui-indexed-list-search mui-input-row mui-search" style="display: none;">
					<input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="搜索品牌">
				</div>
				<div class="mui-indexed-list-bar">
					<a>A</a>
					<a>B</a>
					<a>C</a>
					<a>D</a>
					<a>E</a>
					<a>F</a>
					<a>G</a>
					<a>H</a>
					<a>I</a>
					<a>J</a>
					<a>K</a>
					<a>L</a>
					<a>M</a>
					<a>N</a>
					<a>O</a>
					<a>P</a>
					<a>Q</a>
					<a>R</a>
					<a>S</a>
					<a>T</a>
					<a>U</a>
					<a>V</a>
					<a>W</a>
					<a>X</a>
					<a>Y</a>
					<a>Z</a>
				</div>
				<div class="mui-indexed-list-alert"></div>
				<div class="mui-indexed-list-inner">
					<div class="mui-indexed-list-empty-alert">没有数据</div>
					<ul class="mui-table-view">
						<li data-group="A" class="mui-table-view-divider mui-indexed-list-group">A</li>
						<li data-group="B" class="mui-table-view-divider mui-indexed-list-group">B</li>
						<li data-group="C" class="mui-table-view-divider mui-indexed-list-group">C</li>
						<li data-group="D" class="mui-table-view-divider mui-indexed-list-group">D</li>
						<li data-group="E" class="mui-table-view-divider mui-indexed-list-group">E</li>
						<li data-group="F" class="mui-table-view-divider mui-indexed-list-group">F</li>
						<li data-group="G" class="mui-table-view-divider mui-indexed-list-group">G</li>
						<li data-group="H" class="mui-table-view-divider mui-indexed-list-group">H</li>
						<li data-group="I" class="mui-table-view-divider mui-indexed-list-group">I</li>
						<li data-group="J" class="mui-table-view-divider mui-indexed-list-group">J</li>
						<li data-group="K" class="mui-table-view-divider mui-indexed-list-group">K</li>
						<li data-group="L" class="mui-table-view-divider mui-indexed-list-group">L</li>
						<li data-group="M" class="mui-table-view-divider mui-indexed-list-group">M</li>
						<li data-group="N" class="mui-table-view-divider mui-indexed-list-group">N</li>
						<li data-group="O" class="mui-table-view-divider mui-indexed-list-group">O</li>
						<li data-group="P" class="mui-table-view-divider mui-indexed-list-group">P</li>
						<li data-group="Q" class="mui-table-view-divider mui-indexed-list-group">Q</li>
						<li data-group="R" class="mui-table-view-divider mui-indexed-list-group">R</li>
						<li data-group="S" class="mui-table-view-divider mui-indexed-list-group">S</li>
						<li data-group="T" class="mui-table-view-divider mui-indexed-list-group">T</li>
						<li data-group="U" class="mui-table-view-divider mui-indexed-list-group">U</li>
						<li data-group="V" class="mui-table-view-divider mui-indexed-list-group">V</li>
						<li data-group="W" class="mui-table-view-divider mui-indexed-list-group">W</li>
						<li data-group="X" class="mui-table-view-divider mui-indexed-list-group">X</li>
						<li data-group="Y" class="mui-table-view-divider mui-indexed-list-group">Y</li>
						<li data-group="Z" class="mui-table-view-divider mui-indexed-list-group">Z</li>
					</ul>
				</div>
			</div>
			<input type="hidden" name="id" id="issueId" value="${id!}">
			<!--<div class="loading">
	            <div class="middle">
	                <span class="left"></span>
	                <span class="right"></span>
	            </div>
	        </div>-->
		</div>
		<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js" ></script>
		<script type="text/javascript" src="/home/js/common.js" ></script>
		<script src="/home/js/mui.min.js"></script>
		<script src="/home/js/mui.indexedlist.js"></script>
		<script src="/home/js/pinyinUtil.js"></script>
		<script type="text/javascript" charset="utf-8">
			var data = [];
			mui.init();
			mui.ready(function() {
				loadList();//得到
				/*选择*/
				$('.mui-table-view').on('click','.mui-table-view-cell',function(){
					var id = $(this).attr('brand_id');
					var name = $(this).html();
					//alert("品牌="+name+"id="+id)
					var issueId=$("#issueId").val()
					//alert("文章id="+issueId)
					window.location.href="/user/editIssue?name="+name+"&id="+issueId;
				})
			});



			function loadList(){
				$.ajax({
					url: "/user/brand",
					dataType: "json",
					/*cache: false,
					async: false,
					data: {},*/
					type: "POST",
					success: function (ret) {
						console.log(ret)
							if (ret.code==1) {
								$(".mui-table-view .mui-indexed-list-group").nextAll().not(".mui-indexed-list-group").remove();
								//UIloading();
								var data=ret.data;
								console.log(data)
								for (var i in data) {
									//console.log(i)
									//console.log(data[i])
									//取出中文转换的第一个拼音字母
									var pinyin = ConvertPinyin(data[i].name).substring(0, 1);
									//循环字母列表
									$(".mui-table-view .mui-indexed-list-group").each(function () {
										if ($(this).html() == pinyin) {
											var html = '<li class="mui-table-view-cell mui-indexed-list-item" brand_id="' + data[i].id + '">' + data[i].name + '</li>'
											$(this).after(html);
										}
									})
								}
								//将后面没有值得字母列表隐藏
								$(".mui-table-view .mui-indexed-list-group").each(function () {
									if ($(this).next().hasClass("mui-indexed-list-group")) {
										$(this).remove();
									}
								})
								var list = document.getElementById('list');
								list.style.height = (document.body.offsetHeight) + 'px';
								window.indexedList = new mui.IndexedList(list);
							}
					}
					})
			}
		</script>
	</body>

</html>