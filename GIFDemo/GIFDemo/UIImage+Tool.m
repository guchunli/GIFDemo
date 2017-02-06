//
//  UIImage+Tool.m
//  GIFDemo
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 guchunli. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

//解析gif文件数据的方法 block中会将解析的数据传递出来
//-(void)getGifImageWithUrl:(NSURL *)url returnData:(void(^)(NSArray * imageArray, NSArray*timeArray,CGFloat totalTime, NSArray* widths,NSArray* heights))dataBlock{
//    //通过文件的url来将gif文件读取为图片数据引用
//    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
//    //获取gif文件中图片的个数
//    size_t count = CGImageSourceGetCount(source);
//    //定义一个变量记录gif播放一轮的时间
//    float allTime=0;
//    //存放所有图片
//    NSMutableArray * imageArray = [[NSMutableArray alloc]init];
//    //存放每一帧播放的时间
//    NSMutableArray * timeArray = [[NSMutableArray alloc]init];
//    //存放每张图片的宽度 （一般在一个gif文件中，所有图片尺寸都会一样）
//    NSMutableArray * widthArray = [[NSMutableArray alloc]init];
//    //存放每张图片的高度
//    NSMutableArray * heightArray = [[NSMutableArray alloc]init];
//    //遍历
//    for (size_t i=0; i *imageArray, NSArray *timeArray, CGFloat totalTime, NSArray *widths, NSArray *heights) {
//        //添加帧动画
//        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
//        NSMutableArray * times = [[NSMutableArray alloc]init];
//        float currentTime = 0;
//        //设置每一帧的时间占比
//        for (int i=0; i

@end
