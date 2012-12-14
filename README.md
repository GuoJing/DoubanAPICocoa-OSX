## 简介 ##

这是一个Cocoa的DoubanAPI库，为了Mac开发使用。

**[豆瓣API](http://developers.douban.com/)**

**并且该版本不支持GData等V1版本特性，只支持V2。**

我是豆瓣的同城工程师，所以同城方面的支持会更好。其他的基本功能应该是支持的。

如果你需要iOS版本，请去:

1. 开发版：[douban-objc-client](https://github.com/lincode/douban-objc-client)
2. 官方版：[douban-objc-client](https://github.com/douban/douban-objc-client)

## 信息 ##

当前版本V0.1，主要职责为兼容iOS版本，但今后使用的方法可能会不同。

当前版本不支持GData等V1版本特性，只支持V2，所以必须使用https。

当前版本只适用于64位版本，考虑到今后32位的Mac也不多，所以暂时不打算支持。

## 使用 ##

### 使用Framework ###

下载代码之后，可以看到Sample代码里有一个`DoubanAPICocoa.framework`，直接import到自己的包里即可。

`Xcode` -> `Add files to PROJECT` -> `select the folder`

你会看到一个小的工具箱，名字为DoubanAPICocoa库已经增加完毕。

![samplecode](http://guojing.me/images/2012/samplecode.png)

在项目的`Build Phases`里的`Link Binary with Libraries`增加必要的组件，如`Security.framework`。

同样在`Build Phases`里，在右下角找到`Add Build Phase`，在下拉列表中选择`Add Build Phase`，一个新的框会出现在这个页面里，打开刚创建的框，里面把刚才添加在文件列表的framework拖动到此处。并在分类选项里选择Framework。

![sampleconfig](http://guojing.me/images/2012/sampleconfig.png)

### 直接引用Framework Project ###

直接拖动DoubanAPICocoa包到项目中。

打开自己的项目，在项目信息中，选择`TARGET`并在里面设置编译选项，搜寻`Header Search Path`，设置DoubanAPICocoa的路径。

在项目的`Build Phases`里的`Link Binary with Libraries`增加必要的组件，如`Security.framework`。

同样在`Build Phases`里，在右下角找到`Add Build Phase`，在下拉列表中选择`Add Build Phase`，一个新的框会出现在这个页面里，打开刚创建的框，把你需要使用的拷贝的项目拖动到此处。

### 编译 ###

无论是DoubanAPICocoa.framework还是Sample代码，在编译的时候都没有错误和警告，至少在我的平台下，如果在某些平台下出现问题，请通知我。

### 错误调试 ###

如果引用进来出现错误，一般是`image not found`，说明DoubanAPICocoa包引用出错了，可能以下几种方法能帮到你。

1. 增加文件时候选择 `Copy items into destination group's folder`
2. 可能需要在项目的`Build Phases`里的`Link Binary with Libraries`增加必要的组件，如`Security.framework`。
3. Header Search Path设置出错。

**TIPS：一般来说，找不到framework的主要原因在于路径设置出错。**

### 可能需要的包 ###

* SystemConfiguration.framework
* Security.framework
* libxml2.dylib
* libz.dylib
* Foundation.framework

## 使用 ##

和iOS版本的使用方法类似。

### 提供OAuth2的参数 ###

	  DOUService *service = [DOUService sharedInstance];
	  service.clientId = kAPIKey;
	  service.clientSecret = kPrivateKey;

### 发起一个异步请求 ###

	NSString *subPath = [NSString stringWithFormat:@"/v2/event/%d", event_id];
	
	DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:nil] autorelease];

	query.apiBaseUrlString = service.apiBaseUrlString;
	
	DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];

	DOUService *service = [DOUService sharedInstance];
	[service addRequest:req];

### 使用v0.1.1之后的版本 ###

通过apiKey等获得一个engine。

    DOUEngine *engine = [[DOUEngine alloc] initWithApiKey:kAPIKey
                                            withSecretKey:kPrivateKey
                                             withRedirUrl:kRedirectUrl];
                                             
通过engine获得event_engine。

    DOUEventEngine *event_engine = [self.engine getEngine:kDouEvent];
    
使用闭包进行网络请求。

    void(^successBlock)(DOUEvent *) = ^(DOUEvent *event) {
        [self updateImageUI:event];
    };
    
使用engine内封装好的方法，把闭包传进去。

    [event_engine getEventWithRemoteID:self.eid_field.title successBlock:successBlock];

具体还是请看Sample代码，简单易懂。

## Sample ##

Sample是一个简单的桌面客户端，非常简单，其作用是获取豆瓣活动信息。

![samplewindow](http://guojing.me/images/2012/samplewindow.png)

1. 首先点击`Connect`，连接到豆瓣。
2. 链接成功后，会跳转到我的页面，点击`Load`再度激活程序。
3. 在输入框中输入活动的id，并且点击`Get`，获取活动海报信息。

## 历史 ##

v0.1

1. 移植iOS版本支持MacOS并调整结构。
2. 去掉GData等老版本的支持。

## 待办 ##

v0.1.1 - **working on this**

1. 更好的api支持，可以通过id直接获得对象，而不是从列表中获取。
2. 配置自定义化。