//
//  UIImage+Tool.h
//  GIFDemo
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 guchunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface UIImage (Tool)

/** 解析gif文件数据的方法 block中会将解析的数据传递出来 */
-(void)getGifImageWithUrk:(NSURL *)url returnData:(void(^)(NSArray * imageArray,NSArray*timeArray,CGFloat totalTime, NSArray* widths, NSArray* heights))dataBlock;

/** 为UIImageView添加一个设置gif图内容的方法： */
-(void)yh_setImage:(NSURL *)imageUrl;

@end
