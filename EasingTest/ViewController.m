//
//  ViewController.m
//  EasingTest
//
//  Created by Takahashi Nobuhiro on 2012/12/19.
//  Copyright (c) 2012年 Takahashi Nobuhiro. All rights reserved.
//

#import "ViewController.h"
#import "Tween.h"
#import "TweenObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (IBAction)buttonWasTapped:(id)sender
{
    [Tween addTween:self tweenId:0  startValue:10 endValue:290 time:2 delay:0 easing:@"easeNone" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:1  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInQuad" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:2  startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutQuad" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:3  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInOutQuad" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:4  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInCubic" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:5  startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutCubic" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:6  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInOutCubic" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:7  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInQuart" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:8  startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutQuart" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:9  startValue:10 endValue:290 time:2 delay:0 easing:@"easeInOutQuart" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:10 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInQuint" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:11 startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutQuint" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:12 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInOutQuint" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:13 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInBounce" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:14 startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutBounce" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:15 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInElastic" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:16 startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutElastic" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:17 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInBounce" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:18 startValue:10 endValue:290 time:2 delay:0 easing:@"easeOutBounce" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    [Tween addTween:self tweenId:19 startValue:10 endValue:290 time:2 delay:0 easing:@"easeInOutBounce" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
    
    // add test
    CGSize size = CGSizeMake(100, 100);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - size.width) * 0.5,
                                                             ([UIScreen mainScreen].bounds.size.height - size.height) * 0.5,
                                                             size.width,
                                                             size.height)];
    view.backgroundColor = [UIColor blueColor];
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0, 0);
    view.transform = transform;    
    [self.view addSubview:view];
    
    [Tween addTween:self
            tweenId:20
         startValue:0
           endValue:1
               time:1.0
              delay:0
             easing:@"easeOutBounce"
              param:[@{ @"view":view } mutableCopy]
           startSEL:nil
          updateSEL:@selector(update:)
             endSEL:@selector(end:)];
}

- (void)update:(TweenObject *)tween
{
    switch(tween.tweenId) {
        case 0:  { self.view1.frame  = CGRectMake(tween.currentValue,  5,20,20); break; }
        case 1:  { self.view2.frame  = CGRectMake(tween.currentValue, 30,20,20); break; }
        case 2:  { self.view3.frame  = CGRectMake(tween.currentValue, 55,20,20); break; }
        case 3:  { self.view4.frame  = CGRectMake(tween.currentValue, 80,20,20); break; }
        case 4:  { self.view5.frame  = CGRectMake(tween.currentValue,105,20,20); break; }
        case 5:  { self.view6.frame  = CGRectMake(tween.currentValue,130,20,20); break; }
        case 6:  { self.view7.frame  = CGRectMake(tween.currentValue,155,20,20); break; }
        case 7:  { self.view8.frame  = CGRectMake(tween.currentValue,180,20,20); break; }
        case 8:  { self.view9.frame  = CGRectMake(tween.currentValue,205,20,20); break; }
        case 9:  { self.view10.frame = CGRectMake(tween.currentValue,230,20,20); break; }
        case 10: { self.view11.frame = CGRectMake(tween.currentValue,255,20,20); break; }
        case 11: { self.view12.frame = CGRectMake(tween.currentValue,280,20,20); break; }
        case 12: { self.view13.frame = CGRectMake(tween.currentValue,305,20,20); break; }
        case 13: { self.view14.frame = CGRectMake(tween.currentValue,330,20,20); break; }
        case 14: { self.view15.frame = CGRectMake(tween.currentValue,355,20,20); break; }
        case 15: { self.view16.frame = CGRectMake(tween.currentValue,380,20,20); break; }
        case 16: { self.view17.frame = CGRectMake(tween.currentValue,405,20,20); break; }
        case 17: { self.view18.frame = CGRectMake(tween.currentValue,430,20,20); break; }
        case 18: { self.view19.frame = CGRectMake(tween.currentValue,455,20,20); break; }
        case 20:
        {
            UIView * view = [tween.param objectForKey:@"view"];
            CGAffineTransform transform = CGAffineTransformIdentity;
            transform = CGAffineTransformScale(transform, tween.currentValue, tween.currentValue);
            view.transform = transform;
        }
    }
}
- (void)end:(TweenObject *)tween
{
    switch(tween.tweenId) {
        case 0:  { self.view1.frame  = CGRectMake(tween.currentValue,  5,20,20); break; }
        case 1:  { self.view2.frame  = CGRectMake(tween.currentValue, 30,20,20); break; }
        case 2:  { self.view3.frame  = CGRectMake(tween.currentValue, 55,20,20); break; }
        case 3:  { self.view4.frame  = CGRectMake(tween.currentValue, 80,20,20); break; }
        case 4:  { self.view5.frame  = CGRectMake(tween.currentValue,105,20,20); break; }
        case 5:  { self.view6.frame  = CGRectMake(tween.currentValue,130,20,20); break; }
        case 6:  { self.view7.frame  = CGRectMake(tween.currentValue,155,20,20); break; }
        case 7:  { self.view8.frame  = CGRectMake(tween.currentValue,180,20,20); break; }
        case 8:  { self.view9.frame  = CGRectMake(tween.currentValue,205,20,20); break; }
        case 9:  { self.view10.frame = CGRectMake(tween.currentValue,230,20,20); break; }
        case 10: { self.view11.frame = CGRectMake(tween.currentValue,255,20,20); break; }
        case 11: { self.view12.frame = CGRectMake(tween.currentValue,280,20,20); break; }
        case 12: { self.view13.frame = CGRectMake(tween.currentValue,305,20,20); break; }
        case 13: { self.view14.frame = CGRectMake(tween.currentValue,330,20,20); break; }
        case 14: { self.view15.frame = CGRectMake(tween.currentValue,355,20,20); break; }
        case 15: { self.view16.frame = CGRectMake(tween.currentValue,380,20,20); break; }
        case 16: { self.view17.frame = CGRectMake(tween.currentValue,405,20,20); break; }
        case 17: { self.view18.frame = CGRectMake(tween.currentValue,430,20,20); break; }
        case 18: { self.view19.frame = CGRectMake(tween.currentValue,455,20,20); break; }
        case 20:
        {
            UIView * view = [tween.param objectForKey:@"view"];
            [view removeFromSuperview];
            view = nil;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
