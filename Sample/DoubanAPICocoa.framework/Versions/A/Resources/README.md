## 概要 ##

DoubanAPICocoa是一个Cocoa封装的豆瓣API库，非官方版，可以使用于OS X，并支持10.6及之后的版本。[iOS 版本请参考这里](https://github.com/GuoJing/DoubanAPICocoa-iOS)。

DoubanAPICocoa的底层支持并兼容老版本的[douban-objc-client](https://github.com/lincode/douban-objc-client)，熟悉[douban-objc-client](https://github.com/lincode/douban-objc-client)开发的同学也可以不用更新代码，直接移植到新的库里并且编译通过。但推荐使用DoubanAPICocoa提供的DOUEngine来实现代码。

注意：示例请自行替换apiKey，并且自行申请相关权限，如豆邮和线上活动以及更多高级的功能。

### 目的 ###

1. 使开发更加容易，不用关注网络层的细节

### 特点 ###

1. 封装网络层
2. 简单
3. 使用闭包让开发者开发更简单
3. All consts
3. No Warning, No Error and No Build Analyze Errors

### 样例 ###

#### 验证 ####

声明一个engine：

    engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];

打开豆瓣验证url：

    NSString *url_str = [self.engine getConnectUrl];

从豆瓣返回code并初始化engine：

    [self.engine didLoadWithCode:code];

验证通过。

#### 我是谁 ###

    [u getWhoAmI:successUserBlock failedBlock:failBlock];

#### 发广播 ####
    
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    [s say:self.shuo_field.title successBlock:successBlock failedBlock:failBlock];

#### 获取同城活动 ####

    DOUEventEngine *event_engine = [self.engine getEngine:kDOUEvent];
    [event_engine getEventWithRemoteID:self.eid_field.title successBlock:successBlock failedBlock:failedBlock];

### 变量 ###

该库封装了常用的变量，比如发日记如果是发私有的日记，可以直接使用kDOUPrivacyPrivate，同样相册的排序方式可以使用kDOUOrderDesc，无需自己写变量。

常用的变量文件在库的Engine/Utils里。

1. DOUAPIConsts.h
2. DOUAPIConsts.h
3. DOUAPIErrorConsts.h

### 开发 ###

这个库支持最老的底层的实现方法，也可以非常容易的使用engine进行api开发，可以通过kDOU产品线获得相应的engine，每个engine都有getEngine方法。不过推荐在外面包装一个单例的共享engine，方便在代码各处使用。

可以删除任意不需要的模块并重新打包和分发，减少代码。

### 示例 ###

大部分接口都有基本的示例，今后会提供更多更丰富的示例。

## 其他 ##

**[豆瓣API](http://developers.douban.com/)**

**并且该版本不支持GData等V1版本特性，只支持V2。**

如果你需要iOS版本，请去:

1. 开发版：[douban-objc-client](https://github.com/lincode/douban-objc-client)
2. 官方版：[douban-objc-client](https://github.com/douban/douban-objc-client)

## 信息 ##

当前版本V0.1.3，主要职责为兼容iOS版本并且封装网络层，今后使用的方法可能会不同。

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

    DOUEventEngine *event_engine = [self.engine getEngine:kDOUEvent];
    
使用闭包进行网络请求。

    void(^successBlock)(DOUEvent *) = ^(DOUEvent *event) {
        [self updateImageUI:event];
    };
    
使用engine内封装好的方法，把闭包传进去。

    [event_engine getEventWithRemoteID:self.eid_field.title successBlock:successBlock];

具体还是请看Sample代码，简单易懂。

## 示例 ##

Sample是一个简单的客户端，用来演示各种功能。

可以在菜单栏里打开相应的Sample，Sample并不是同步更新完善。但基本上重要的接口都会有示例。

示例有：

1. 豆瓣读书
2. 豆瓣电影
3. 豆瓣音乐
4. 豆瓣同城
5. 豆瓣社区
6. 豆瓣用户
7. 豆瓣相册
8. 豆瓣评论
9. 豆瓣回复
10. 豆瓣广播
11. 豆瓣日记
12. 豆瓣豆邮
13. 线上活动

## 历史 ##

v0.1

1. 移植iOS版本支持MacOS并调整结构。
2. 去掉GData等老版本的支持。

v0.1.1

1. 使用封装的DOUEngine开发api，更加简单。
2. 增加一些常用的model。

v0.1.2

1. 完善Engine。