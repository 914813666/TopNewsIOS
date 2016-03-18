# TopNewsIOS

` 新闻头条IOS+ReactNative混合版本(Layout采用Masonry) `

 ![](https://github.com/ymcao/TopNewsIOS/raw/master/screenshot/1.png）

 最近项目不是特别忙，本人一直做Android研发架构的，现打算用Masonry来做IOS UI AutoLayout适配，并初步实现React Native的离线包下载，然后解压到沙盒目录，可用未来IOS插件化工作!<br> 

IOS原生工程集成React Native

 1.从https://github.com/facebook/react-native.git拉取代码，然后cd 目录执行npm install（前提是你已经安装好node环境）<br> 
 2.到React目录下拖拽React.xcodeproj到原生工程，其他的需要的到Libary目录下
 React/React.xcodeproj
 Libraries/Image/RCTImage.xcodeproj
 Libraries/Network/RCTNetwork.xcodeproj
 Libraries/Text/RCTText.xcodeproj
 Libraries/Vibration/RCTVibration.xcodeproj
 Libraries/WebSocket/RCTWebSocket.xcodeproj
 Libraries/LinkingIOS/RCTLinking.xcodeproj
 Libraries/Settings/RCTSettings.xcodeproj
 3.添加对应的.a文件
 4.打开你的工程文件，选择Build Settings，然后搜索Header Search Paths，然后添加React库所在的目录（注意要选中recursive选项）

 5.创建react native单独工程，创作界面UI功能等
 6.在react native工程中使用命令react-native bundle --entry-file index.ios.js --bundle-output ./bundle/news.ios.jsbundle --platform ios --assets-dest ./bundle --dev true  打包出离线jsbundle

 7.压缩成zip放到服务器，这样就可以动态下载，然后解压，通过路径查找去加载离线jsbunle了，这块详见module/settings/ReactController.m

特地做个新闻类的，API比较好找，😄，边做还能看看新闻娱乐，此工程会持续更新，何乐而不为呢，有什么问题望大家多多意见！<br> 






