<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <#list list.role as item>
        <ul class="layui-nav layui-nav-tree"  lay-filter="nav">
            <#if item.name=="老板">
                <li class="layui-nav-item <#if controller=="UserController">layui-nav-itemed</#if>">
                    <a  class="" href="javascript:;"><i class="iconfont icon-geren"></i>用户管理</a>
                    <dl class="layui-nav-child">
                        <dd >
                            <a href="/admin/user/index"><i class="iconfont icon-yonghu"></i>用户列表</a>
                        </dd>
                    </dl>
                </li>
                <li  class="layui-nav-item <#if controller=="IssueController">layui-nav-itemed</#if>">
                    <a class="" href="javascript:;"><i class="iconfont icon-luntanguanli"></i>发布管理</a>
                    <dl class="layui-nav-child">
                        <dd >
                            <a href="/admin/issue/index"><i class="iconfont icon-pinglunguanli"></i>发布列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item <#if controller=="AdminController">layui-nav-itemed</#if>">
                    <a href="javascript:;"><i class="iconfont icon-guanliyuanguanli"></i>权限管理</a>
                    <dl class="layui-nav-child">
                        <dd  >
                            <a href="/admin/admin/index"><i class="iconfont icon-guanliyuanliebiao"></i>权限列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/admin/addAdmin">
                        <i class="iconfont icon-increase">添加管理员</i>
                    </a>
                </li>
            <#elseIf item.name!="老板" && item.name=="经理">
                <li class="layui-nav-item <#if controller=="UserController">layui-nav-itemed</#if>">
                    <a  class="" href="javascript:;"><i class="iconfont icon-geren"></i>用户管理</a>
                    <dl class="layui-nav-child">
                        <dd >
                            <a href="/admin/user/index"><i class="iconfont icon-yonghu"></i>用户列表</a>
                        </dd>
                    </dl>
                </li>
                <li  class="layui-nav-item <#if controller=="IssueController">layui-nav-itemed</#if>">
                    <a class="" href="javascript:;"><i class="iconfont icon-luntanguanli"></i>发布管理</a>
                    <dl class="layui-nav-child">
                        <dd >
                            <a href="/admin/issue/index"><i class="iconfont icon-pinglunguanli"></i>发布列表</a>
                        </dd>
                    </dl>
                </li>
                <#elseIf item.name=="组长">
                <li class="layui-nav-item <#if controller=="UserController">layui-nav-itemed</#if>">
                    <a  class="" href="javascript:;"><i class="iconfont icon-geren"></i>用户管理</a>
                    <dl class="layui-nav-child">
                        <dd >
                            <a href="/admin/user/index"><i class="iconfont icon-yonghu"></i>用户列表</a>
                        </dd>
                    </dl>
                </li>
            </#if>


        </ul>
        </#list>
    </div>
</div>