//
//  Tween.h
//  EasingTest
//
//  Created by Takahashi Nobuhiro on 2012/12/19.
//  Copyright (c) 2012年 Takahashi Nobuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "TweenObject.h"

@interface Tween : NSObject

+ (void)clear;
+ (TweenObject *)addTween:(id)parent tweenId:(int)tweenId startValue:(double)startValue endValue:(double)endValue time:(double)time delay:(double)delay easing:(NSString *)easing param:(NSMutableDictionary *)param startSEL:(SEL)startSEL updateSEL:(SEL)updateSEL endSEL:(SEL)endSEL;

+ (TweenObject *)addTween:(id)parent tweenId:(int)tweenId startValue:(double)startValue endValue:(double)endValue time:(double)time delay:(double)delay easing:(NSString *)easing startSEL:(SEL)startSEL updateSEL:(SEL)updateSEL endSEL:(SEL)endSEL;

+ (void)removeTweenForId:(int)tweenId;
+ (void)removeTweenForObject:(TweenObject*)tweenObject;

+ (void) updateAnimations;

+ (double)easeNone:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInQuad:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutQuad:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutQuad:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInCubic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutCubic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutCubic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInQuart:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutQuart:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutQuart:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInQuint:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutQuint:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutQuint:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInSine:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutSine:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutSine:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInExpo:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutExpo:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutExpo:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInCirc:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutCirc:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutCirc:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInElastic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutElastic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutElastic:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInBack:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutBack:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutBack:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInBounce:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeOutBounce:(double)t b:(double)b c:(double)c d:(double)d;
+ (double)easeInOutBounce:(double)t b:(double)b c:(double)c d:(double)d;

@end
