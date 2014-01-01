//
//  TweenObject.h
//  EasingTest
//
//  Created by Takahashi Nobuhiro on 2012/12/19.
//  Copyright (c) 2012年 Takahashi Nobuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweenObject : NSObject

@property (nonatomic, assign) BOOL started;
@property (nonatomic, assign) BOOL ended;
@property (nonatomic, assign) id parent;
@property (nonatomic, assign) int tweenId;
@property (nonatomic, assign) double startValue;
@property (nonatomic, assign) double endValue;
@property (nonatomic, assign) double time;
@property (nonatomic, assign) double delay;
@property (nonatomic, retain) NSString *easing;
@property (nonatomic, retain) id selStart;
@property (nonatomic, retain) id selUpdate;
@property (nonatomic, retain) id selEnd;
@property (nonatomic, assign) double startTime;
@property (nonatomic, assign) double currentValue;
@property (nonatomic, retain) NSMutableDictionary * param;

@end
