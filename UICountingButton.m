//
//  UICountingButton.h
//
//
//  Created by kimi on 3/6/14.
//  Copyright (c) 2016 kimi. All rights reserved.


#import "UICountingButton.h"


@interface UICountingButton ()

@property float startingValue;
@property float destinationValue;
@property NSTimeInterval progress;
@property NSTimeInterval lastUpdate;
@property NSTimeInterval totalTime;
@property float easingRate;
@property float rate;

@end
@implementation UICountingButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)countFrom:(float)startValue to:(float)endValue withDuration:(NSTimeInterval)duration
{
    if(duration == 0.0){
        // No animation
        [self runCompletionBlock];
        return;
    }
    
    self.easingRate = 3.0f;
    self.startingValue = startValue;
    self.destinationValue = endValue;
    self.progress = 0;
    self.totalTime = duration;
    self.lastUpdate = [NSDate timeIntervalSinceReferenceDate];
    
    if(self.format == nil){
        self.format = @"重新获取验证码（%d秒）";
    
    NSTimer* timer = [NSTimer timerWithTimeInterval:(1.0f/30.0f) target:self selector:@selector(updateValue:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
}

-(void)updateValue:(NSTimer*)timer
{
    // update progress
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    self.progress += now - self.lastUpdate;
    self.lastUpdate = now;
    
    if(self.progress >= self.totalTime)
    {
        [timer invalidate];
        self.progress = self.totalTime;
    }
    
    float percent = self.progress / self.totalTime;
    float updateVal =percent;
    float value =  self.startingValue -  (updateVal * (self.startingValue -self.destinationValue));
    
    
    [self setTextValue:value];
    
    if(self.progress == self.totalTime)
    {
        [self runCompletionBlock];
    }
}

- (void)setTextValue:(float)value
{
    if([self.format rangeOfString:@"%(.*)d" options:NSRegularExpressionSearch].location != NSNotFound || [self.format rangeOfString:@"%(.*)i"].location != NSNotFound )
    {
        [self setTitle:[NSString stringWithFormat:self.format,(int)value] forState:UIControlStateNormal];
        [self setTitle:[NSString stringWithFormat:self.format,(int)value] forState:UIControlStateDisabled];
        [self setTitle:[NSString stringWithFormat:self.format,(int)value] forState:UIControlStateSelected];
    }
    else
    {
        [self setTitle:[NSString stringWithFormat:self.format,value] forState:UIControlStateNormal];
        [self setTitle:[NSString stringWithFormat:self.format,(int)value] forState:UIControlStateDisabled];
        [self setTitle:[NSString stringWithFormat:self.format,(int)value] forState:UIControlStateSelected];

    }
    self.enabled =NO;
}

- (void)runCompletionBlock
{
	if(self.completionBlock != nil)
	{
		self.completionBlock();
		self.completionBlock = nil;
	}
    self.enabled=YES;
    [self setTitle:@"重新获取验证码" forState:UIControlStateNormal];
}


@end
