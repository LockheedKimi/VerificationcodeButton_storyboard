//
//  UICountingButton.h
//
//
//  Created by kimi on 3/6/14.
//  Copyright (c) 2016 kimi. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UICountingButton : UIButton

@property (nonatomic, strong) NSString *format; // 计数输出格式 例如@"%d"
@property (nonatomic, copy) void (^completionBlock)();

-(void)countFrom:(float)startValue to:(float)endValue withDuration:(NSTimeInterval)duration;
@end
