# MVPDemo
OC 实现 MVP设计模式

前一段时间，业界关于iOS架构模式的讨论可谓是如火如荼。从讨伐人人得而诛之的MVC开始，MVCS、MVVM、MVP等设计的思想，普天盖地的出现在iOSer的视野中。由于RAC的出现，MVVM这个被大家讨论的最多的词汇，更是如日中天。从基础的MVVM教程开始（iOS 程序猿的，英文好的朋友可以看看Ray上的Toturial），乃至到批判的文章（唐巧的《被神话的MVVM》），一应俱全。但是关于其他的MVP此类的，大家都是用来做为比较的例子，一笔带过。在我的阅读的范围之内，好像没有见过有谁去详细的解释了一下，至少侧重点不在于此。鉴于此，发表一下个人对于MVP的看法，并且附上相应的Demo。

我们知道，上述所有的设计模式的目的，都是为了解放负担过重的Controller。超过了500行的Controller，基本上就要靠搜索来定位代码了，于己于人，都非常不友好。
MVP，不是Most Valuable Player，是从MVC思想中，淡化了Controller的概念，把Controller的大部分业务逻辑，转交到Presenter中，弱化了Controller和Model、View之间的强依赖关系。Presenter可以剥离Controller中`View的事件处理`，同时也可以`负责与Model`的交互，Controller自身的一些比如Controller之间的跳转，还是自身负责。这儿的Model，我们可以理解成一个Manager，一个操作数据层（网络or本地），不仅仅是一个继承自NSObject的对象。相比于MVVM，缺少了双向绑定的机制，好处是不会有那么高的耦合，提高了自身的可扩展性和灵活性。

**MVP简意**
![MVP简意](http://7xpoeq.com1.z0.glb.clouddn.com/MVP%E7%AE%80%E6%84%8F.jpg)

其中还有好多的数据回调、传递。

我看完很多文章之后仅仅有了一个概念，“哦，原来是这么回事”，然后想写一个Demo实践一下，感觉又远远不止如此。不知道有多人是和我这样。所以，我参照各方资料写了一个我理解的中的[示例](https://github.com/kRadius/MVPDemo)。实现从网络获取json数据，然后点击进入详细界面这么一个需求。

**ListViewController 的结构**
![ListViewController的结构](http://7xpoeq.com1.z0.glb.clouddn.com/MVP_1_1.jpg)

可以看到，VC直接持有了Presenter和DataManager（放下手中的西瓜刀，这DataManager其实是给Presneter用的）。还有一个DataSource是用来分离TableView的代理方法，这个给ViewContrller减负的技巧，objc.io开篇就讲了，有兴趣的可以回去翻阅。UIActivityIndicatorView就是象征VC可能持有的一系列变量（诸如刷洗按钮等）。ListViewProtocol是把ViewController里边的一些处理定义成协议，交给Presenter。做这些所有的目的，都是为了给VC瘦身，合理的减负。

`ListViewProtocol`中，把VC中可以或者需要分离的逻辑，定义成协议。
![ListViewProtocol](http://7xpoeq.com1.z0.glb.clouddn.com/MVP_2.jpg)
之前我们看到，其实是ListViewController实现了这个协议，只不过这些协议方法的调用地方是在Presenter里。比如说，在请求开始之前，-(void)startLoading。获取到了数据之后，就调用-(void)receivedListData:(NSArray *)array，然后刷新tableView之类的事情就可以做了。因为有些事情还是适合在VC里边自个儿做。

DataManager在这需求里边就需要有一个获取数据的方法，用的是block回调。
![DataManager](http://7xpoeq.com1.z0.glb.clouddn.com/MVP_4.jpg)
另外那个DataArray可以让VC去持有。

最关键的`Presenter`
![Presenter实现](http://7xpoeq.com1.z0.glb.clouddn.com/MVP_3.jpg)
在MVP里边，P就是核心的调度者。干的就是以前VC的活。前面提到，DataManager其实是最主要是给Presenter用的。Prensenter需要有个可以初始化这俩变量的地方，并且发起数据请求。Demo就是在config这个方法里做的。有一点需要注意的是，他们之间的`循环引用问题`，该用weak的地方就用weak。这里解释一下为什么定义那么多协议。我觉得协议里的方法可以理解成需求，然后甭管你是谁，只要能够实现这些需求，就能够成为Presenter，成为Manager。这样不知道算不算是一种解耦的方式。

Demo里的核心部分就是这些了，详情页面的和这个差不多，看到了工程里边的东西，一下就会明白的。

总的来说，MVP提供了良好的灵活性和扩展性，对于写单元测试的来说，也是较为可控。不过，于我们所见，代码量多了不少，另外也没有那View和Model的绑定机制。还是那句话，没有最好的设计模式，合适自己需求的才是最好的。

PS：Demo里的数据来自豆瓣，偶尔会有福利。玩的开心 :D

请尊重原创,保持原链接 :D
