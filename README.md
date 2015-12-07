# 动态库和静态库demo
参考文章：<br />
1) http://www.samirchen.com/create-a-framework/ <br />
2) http://blog.db-in.com/universal-framework-for-ios/
# 注意点：
<br />
1)动态库仅支持iOS8.0以上，如果要支持7.x还是要编译静态库；
<br /> 
2)进行universal版本编译时，第一篇参考文章里面提供的合并脚本有问题，编译出来的framework在真机上无法运行，提示如下错误:
<pre><code>
/Users/yixiaoluo/ProjectProject/Demo1/Build/Products/Debug-iphoneos/GBKitDemo.app/Frameworks/GBKit.framework: unsealed contents present in the root directory of an embedded framework 
</code></pre><br />
我也没看出哪里不对，使用第二篇文章里的脚本就OK了。
