//
//  Tween.m
//  EasingTest
//
//  Created by Takahashi Nobuhiro on 2012/12/19.
//  Copyright (c) 2012年 Takahashi Nobuhiro. All rights reserved.
//

#import "Tween.h"

@implementation Tween

static NSTimer* timer_ = nil;
static NSMutableArray *tweens_ = nil;

#pragma mark - public

+ (void)clear
{
    [tweens_ removeAllObjects];
    tweens_ = nil;
    
    [timer_ invalidate];
    timer_ = nil;
}

+ (TweenObject *)addTween:(id)parent tweenId:(int)tweenId startValue:(double)startValue endValue:(double)endValue time:(double)time delay:(double)delay easing:(NSString *)easing startSEL:(SEL)startSEL updateSEL:(SEL)updateSEL endSEL:(SEL)endSEL
{
    return [Tween addTween:parent
            tweenId:tweenId
         startValue:startValue
           endValue:endValue
               time:time
              delay:delay
             easing:easing
              param:nil
           startSEL:startSEL
          updateSEL:updateSEL
             endSEL:endSEL];
}

+ (TweenObject *)addTween:(id)parent tweenId:(int)tweenId startValue:(double)startValue endValue:(double)endValue time:(double)time delay:(double)delay easing:(NSString *)easing param:(NSMutableDictionary *)param startSEL:(SEL)startSEL updateSEL:(SEL)updateSEL endSEL:(SEL)endSEL
{
    if (timer_ == nil) {
        timer_ = [NSTimer scheduledTimerWithTimeInterval:1.0 / 60.0
                                                       target:self
                                                     selector:@selector(updateAnimations)
                                                     userInfo:nil
                                                      repeats:TRUE];
        tweens_ = [NSMutableArray array];
    }
    
    id selStart;
    if (startSEL == nil) {
        selStart = [NSNull null];
    } else {
        selStart = NSStringFromSelector(startSEL);
    }
    id selUpdate;
    if (updateSEL == nil) {
        selUpdate = [NSNull null];
    } else {
        selUpdate = NSStringFromSelector(updateSEL);
    }
    id selEnd;
    if (endSEL == nil) {
        selEnd = [NSNull null];
    } else {
        selEnd = NSStringFromSelector(endSEL);
    }
    
    
    double currentTime = CACurrentMediaTime();
    
    TweenObject *tween = [[TweenObject alloc] init];
    tween.startValue = startValue;
    tween.endValue = endValue;
    tween.parent = parent;
    tween.tweenId = tweenId;
    tween.time = time;
    tween.delay = delay;
    tween.easing = easing;
    tween.param = param;
    tween.selStart = selStart;
    tween.selUpdate = selUpdate;
    tween.selEnd = selEnd;
    tween.startTime = currentTime;
    tween.ended = NO;
    [tweens_ addObject:tween];
    
    return tween;
}

+ (void)removeTweenForId:(int)tweenId {
    NSUInteger count = [tweens_ count];
    if(count==0) return;
    
    TweenObject *tweenObj;
    for(int i=0; i<count ; i++ ){
        tweenObj = (TweenObject *) tweens_[i];
        if (tweenObj.tweenId == tweenId){
            tweenObj.ended = YES;
        }
    }
}
+ (void)removeTweenForObject:(TweenObject*)tweenObject {
    tweenObject.ended = YES;
}

#pragma mark - private

+ (void) updateAnimations {
    double currentTime = CACurrentMediaTime();
    for (TweenObject* tween in tweens_) {
        double delay = tween.delay;
        double t = currentTime - tween.startTime;
        id parent = tween.parent;
        if (t >= delay) {
            if (!tween.started) {
                tween.currentValue = tween.startValue;
                id selStart = tween.selStart;
                if (selStart != [NSNull null]) {
                    #pragma clang diagnostic push
                    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [parent performSelector:NSSelectorFromString(selStart) withObject:tween];
                    #pragma clang diagnostic pop
                }
                tween.started = YES;
            }
            
            t = currentTime - delay - tween.startTime;
    
            double d = tween.time;
            double b = tween.startValue;
            double c = tween.endValue - b;
            
            NSString *st = tween.easing;
            double currentValue = 0;
            if ([st isEqualToString:@"easeNone"]) {
                currentValue = [Tween easeNone:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInQuad"]) {
                currentValue = [Tween easeInQuad:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutQuad"]) {
                currentValue = [Tween easeOutQuad:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutQuad"]) {
                currentValue = [Tween easeInOutQuad:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInCubic"]) {
                currentValue = [Tween easeInCubic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutCubic"]) {
                currentValue = [Tween easeOutCubic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutCubic"]) {
                currentValue = [Tween easeInOutCubic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInQuart"]) {
                currentValue = [Tween easeInQuart:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutQuart"]) {
                currentValue = [Tween easeOutQuart:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutQuart"]) {
                currentValue = [Tween easeInOutQuart:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInQuint"]) {
                currentValue = [Tween easeInQuint:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutQuint"]) {
                currentValue = [Tween easeOutQuint:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutQuint"]) {
                currentValue = [Tween easeInOutQuint:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInSine"]) {
                currentValue = [Tween easeInSine:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutSine"]) {
                currentValue = [Tween easeOutSine:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutSine"]) {
                currentValue = [Tween easeInOutSine:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInExpo"]) {
                currentValue = [Tween easeInExpo:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutExpo"]) {
                currentValue = [Tween easeOutExpo:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutExpo"]) {
                currentValue = [Tween easeInOutExpo:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInCirc"]) {
                currentValue = [Tween easeInCirc:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutCirc"]) {
                currentValue = [Tween easeOutCirc:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutCirc"]) {
                currentValue = [Tween easeInOutCirc:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInElastic"]) {
                currentValue = [Tween easeInElastic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutElastic"]) {
                currentValue = [Tween easeOutElastic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutElastic"]) {
                currentValue = [Tween easeInOutElastic:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInBack"]) {
                currentValue = [Tween easeInBack:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutBack"]) {
                currentValue = [Tween easeOutBack:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutBack"]) {
                currentValue = [Tween easeInOutBack:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInBounce"]) {
                currentValue = [Tween easeInBounce:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeOutBounce"]) {
                currentValue = [Tween easeOutBounce:t b:b c:c d:d];
            } else if ([st isEqualToString:@"easeInOutBounce"]) {
                currentValue = [Tween easeInOutBounce:t b:b c:c d:d];
            }
    
            if (t >= d) {
                tween.currentValue = tween.endValue;
                id selEnd = tween.selEnd;
                if (selEnd != [NSNull null]) {
                    #pragma clang diagnostic push
                    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [parent performSelector:NSSelectorFromString(selEnd) withObject:tween];
                    #pragma clang diagnostic pop
                }
                tween.ended = YES;
            } else {
                tween.currentValue = currentValue;
                id selUpdate = tween.selUpdate;
                if (selUpdate != [NSNull null]) {
                    #pragma clang diagnostic push
                    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [parent performSelector:NSSelectorFromString(selUpdate) withObject:tween];
                    #pragma clang diagnostic pop
                }
            }
        }

    }

    NSUInteger i = [tweens_ count];
    while (i > 0) {
        TweenObject *tween = [tweens_ objectAtIndex:i-1];
        if (tween.ended) {
            [tweens_ removeObject:tween];
        }
        i--;
    }
}


#pragma mark - easing

+ (double)easeNone:(double)t b:(double)b c:(double)c d:(double)d
{
    return c*t/d + b;
}

+ (double)easeInQuad:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d;
    return c*t*t + b;
}
+ (double)easeOutQuad:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d;
    return -c *t*(t-2) + b;
}
+ (double)easeInOutQuad:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d/2;
    if (t < 1) {
        return c/2*t*t + b;
    }
    t--;
    return -c/2 * (t*(t-2) - 1) + b;
}

+ (double)easeInCubic:(double)t b:(double)b c:(double)c d:(double)d
{
    t/=d;
    return c*t*t*t + b;
}
+ (double)easeOutCubic:(double)t b:(double)b c:(double)c d:(double)d
{
    t = t/d-1;
    return c*(t*t*t + 1) + b;
}
+ (double)easeInOutCubic:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d/2;
    if (t < 1) {
        return c/2*t*t*t + b;
    }
    
    t -= 2;
    return c/2*(t*t*t + 2) + b;
}

+ (double)easeInQuart:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d;
    return c*t*t*t*t + b;
}
+ (double)easeOutQuart:(double)t b:(double)b c:(double)c d:(double)d
{
    t = t/d-1;
    return -c * (t*t*t*t - 1) + b;
}
+ (double)easeInOutQuart:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d/2;
    if (t < 1) {
        return c/2*t*t*t*t + b;
    }
    
    t-=2;
    return -c/2 * (t*t*t*t - 2) + b;
}

+ (double)easeInQuint:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d;
    return c*t*t*t*t*t + b;
}
+ (double)easeOutQuint:(double)t b:(double)b c:(double)c d:(double)d
{
    t = t/d-1;
    return c*(t*t*t*t*t + 1) + b;
}
+ (double)easeInOutQuint:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d/2;
    if(t < 1) {
        return c/2*t*t*t*t*t + b;
    }
    t -= 2;
    return c/2*(t*t*t*t*t + 2) + b;
}

+ (double)easeInSine:(double)t b:(double)b c:(double)c d:(double)d
{
    return -c * cos(t/d * (3.1419/2)) + c + b;
}
+ (double)easeOutSine:(double)t b:(double)b c:(double)c d:(double)d
{
    return c * sin(t/d * (3.1419/2)) + b;
}
+ (double)easeInOutSine:(double)t b:(double)b c:(double)c d:(double)d
{
    return -c/2 * (cos(3.1419*t/d) - 1) + b;
}

+ (double)easeInExpo:(double)t b:(double)b c:(double)c d:(double)d
{
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}
+ (double)easeOutExpo:(double)t b:(double)b c:(double)c d:(double)d
{
    return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
}
+ (double)easeInOutExpo:(double)t b:(double)b c:(double)c d:(double)d
{
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
}

+ (double)easeInCirc:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d;
    return -c * (sqrt(1 - t*t) - 1) + b;
}
+ (double)easeOutCirc:(double)t b:(double)b c:(double)c d:(double)d
{
    t = t/d-1;
    return c * sqrt(1 - t*t) + b;
}
+ (double)easeInOutCirc:(double)t b:(double)b c:(double)c d:(double)d
{
    t /= d/2;
    if (t < 1) {
        return -c/2 * (sqrt(1 - t*t) - 1) + b;
    }
    t-=2;
    return c/2 * (sqrt(1 - t*t) + 1) + b;
}

+ (double)easeInElastic:(double)t b:(double)b c:(double)c d:(double)d
{
    double s=1.70158;
    double p=0;
    double a=c;
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*3.1419) * asin (c/a);
    t--;
    return -(a*pow(2,10*t) * sin( (t*d-s)*(2*3.1419)/p )) + b;
}
+ (double)easeOutElastic:(double)t b:(double)b c:(double)c d:(double)d
{
    double s=1.70158;
    double p=0;
    double a=c;
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*3.1419) * asin (c/a);
    return a*pow(2,-10*t) * sin( (t*d-s)*(2*3.1419)/p ) + c + b;
}
+ (double)easeInOutElastic:(double)t b:(double)b c:(double)c d:(double)d
{
    double s=1.70158;
    double p=0;
    double a=c;
    if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*3.1419) * asin (c/a);
    if (t < 1) {
        t--;
        return -.5*(a*pow(2,10*t) * sin( (t*d-s)*(2*3.1419)/p )) + b;
    }
    t--;
    return a*pow(2,-10*t) * sin( (t*d-s)*(2*3.1419)/p )*.5 + c + b;
}

+ (double)easeInBack:(double)t b:(double)b c:(double)c d:(double)d
{
    double s = 1.70158;
    t /= d;
    return c*t*t*((s+1)*t - s) + b;
}
+ (double)easeOutBack:(double)t b:(double)b c:(double)c d:(double)d
{
    double s = 1.70158;
    t = t/d-1;
    return c*(t*t*((s+1)*t + s) + 1) + b;
}
+ (double)easeInOutBack:(double)t b:(double)b c:(double)c d:(double)d
{
    double s = 1.70158;
    double k = 1.525;
    t /= d/2;
    s *= k;
    if (t < 1) {
        return c/2*(t*t*((s+1)*t - s)) + b;
    } else {
        t -= 2;
        return c/2*(t*t*((s+1)*t + s) + 2) + b;
    }
}

+ (double)easeInBounce:(double)t b:(double)b c:(double)c d:(double)d
{
    return c - [Tween easeOutBounce:d-t b:0 c:c d:d] + b;
}
+ (double)easeOutBounce:(double)t b:(double)b c:(double)c d:(double)d
{
    double k = 2.75;
    if ((t/=d) < (1/k)) {
        return c*(7.5625*t*t) + b;
    } else if (t < (2/k)) {
        t-=1.5/k;
        return c*(7.5625*t*t + .75) + b;
    } else if (t < (2.5/k)) {
        t-=2.25/k;
        return c*(7.5625*t*t + .9375) + b;
    } else {
        t-=2.625/k;
        return c*(7.5625*t*t + .984375) + b;
    }
}
+ (double)easeInOutBounce:(double)t b:(double)b c:(double)c d:(double)d
{
    if (t < d*.5) return [Tween easeOutBounce:t*2 b:0 c:c d:d] * .5 + b;
    return [Tween easeOutBounce:t*2-d b:0 c:c d:d] * .5 + c*.5 + b;
}


@end
