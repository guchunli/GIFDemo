//
//  ViewController.m
//  GIFDemo
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 guchunli. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tool.h"
#import "YLGIFImage.h"
#import "YLImageView.h"
#import "FLAnimatedImage.h"
#import "GifView.h"
#import "ShowGifImageViewController.h"
#import "ShowGifImageView.h"
#import "Defines.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //0.image array
//    [self showGifImageWithImageArray];
    
    //1.UIWebView  特点:加载速度略长,性能更优，播放的gif动态图更加流畅。
//    [self showGifImageWithWebView];
    
    //2.UIImagView扩展  加载的方式更加快速,性能不如UIWebView,优点:易于扩展
    //要引入ImageIO库
//    [self showGifImageWithImageViewCategory];
    
    //3.第三方:YLGIFImage
//    [self showGifImageWithYLImageView];
    
    //4.FLAnimatedImage
//    [self showGifImageWithFLAnimatedImage];
    
    //5.GifView
//    [self showGifImageWithGifViewLocol];
    
    //-----------bug
    [self showGifImageWithGifViewNetwork];
    
    ////6.GifView Controller
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(showGifImageWithGifViewController) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

//0.image array
- (void)showGifImageWithImageArray{

    //创建UIImageView，添加到界面
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120, 100, 100)];
    [self.view addSubview:imageView];
    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=1; i<7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"clock%02d.png",i]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 6*0.15;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
    [imageView startAnimating];
    //停止播放动画  - (void)stopAnimating;
    //判断是否正在执行动画  - (BOOL)isAnimating;
}

//1.UIWebView  特点:加载速度略长,性能更优，播放的gif动态图更加流畅。
//动态展示GIF图片-WebView
-(void)showGifImageWithWebView{
    //读取gif图片数据
    NSData *gifData = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"beiliwo" ofType:@"gif"]];
    //UIWebView生成
    UIWebView *imageWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 150, 200, 200)];
    //用户不可交互
    imageWebView.userInteractionEnabled = NO;
    //自动调整尺寸
    imageWebView.scalesPageToFit = YES;
    //禁止滚动
    imageWebView.scrollView.scrollEnabled = NO;
    //设置透明效果
    imageWebView.backgroundColor = [UIColor clearColor];
    imageWebView.opaque = 0;
    //加载gif数据
    [imageWebView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    //视图添加此gif控件
    [self.view addSubview:imageWebView];
}

//2.UIImagView扩展  加载的方式更加快速,性能不如UIWebView,优点:易于扩展
//要引入ImageIO库
-(void)showGifImageWithImageViewCategory{
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(112, 342, 132, 102)];
    NSURL * url = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle]pathForResource:@"beiliwo.gif" ofType:nil]];
//    [imageView yh_setImage:url];
    [self.view addSubview:imageView];
}

//3.第三方:YLGIFImage
-(void)showGifImageWithYLImageView{
    YLImageView* imageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 150, 200, 200)];
//    CGFloat centerX = self.view.center.x;
//    [imageView setCenter:CGPointMake(centerX, 402)];
    [self.view addSubview:imageView];
    imageView.image = [YLGIFImage imageNamed:@"beiliwo.gif"];
}

//4.FLAnimatedImage
-(void)showGifImageWithFLAnimatedImage{
    //GIF 转 NSData
    //Gif 路径
    NSString *pathForFile = [[NSBundle mainBundle] pathForResource: @"beiliwo" ofType:@"gif"];
    //转成NSData
    NSData *dataOfGif = [NSData dataWithContentsOfFile: pathForFile];
    //初始化FLAnimatedImage对象
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:dataOfGif];
    //初始化FLAnimatedImageView对象
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    //设置GIF图片
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(0, 150, 200, 200);
    [self.view addSubview:imageView];
}

//5.GifView
#pragma mark 播放动态图片方式3 第三方显示本地动态图片
-(void)showGifImageWithGifViewLocol
{
    //方式一
    //将图片转为NSData数据
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bird" ofType:@"gif"]];
    //创建一个第三方的View显示图片
    GifView *dataView = [[GifView alloc] initWithFrame:CGRectMake(0, 300, 200, 100) data:localData];
    [self.view addSubview:dataView];
    
    //方式二
    //得到图片的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"gif"];
    GifView *dataView2 = [[GifView alloc] initWithFrame:CGRectMake(200, 300, 150, 100) filePath:path];
    [self.view addSubview:dataView2];
}

#pragma mark 播放动态图片方式3 第三方显示从网络获取的动态图片
-(void)showGifImageWithGifViewNetwork
{
    // 网络图片
    NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
    //创建一个第三方的View显示图片
    GifView *dataViewWeb = [[GifView alloc] initWithFrame:CGRectMake(20, 420, 280, 100) data:urlData];
    [self.view addSubview:dataViewWeb];
}

//6.GifView Controller
- (void)showGifImageWithGifViewController{
    
    NSString *pathForFile = [[NSBundle mainBundle] pathForResource: @"beiliwo" ofType:@"gif"];
    //转成NSData
    NSData *gifImageData = [NSData dataWithContentsOfFile: pathForFile];

    ShowGifImageViewController* showGifViewCrl = [[ShowGifImageViewController alloc] init];
    
    CGSize showSize = CGSizeMake(200, 200);
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)gifImageData, NULL);
    if (src)
    {
        NSDictionary *properties = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(src, 0, NULL);
        CGFloat width = [[properties valueForKey:(NSString*)kCGImagePropertyPixelWidth] floatValue];
        CGFloat height = [[properties valueForKey:(NSString*)kCGImagePropertyPixelHeight] floatValue];
        showSize = compressImageWith(self.view.frame.size, CGSizeMake(width, height));
        CFRelease((__bridge CFTypeRef)(properties));
        CFRelease(src);
    }
    showGifViewCrl.showViewSize = showSize;
    showGifViewCrl.imageData = gifImageData;
    [self.navigationController pushViewController:showGifViewCrl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
