Value Tween Library for Objective-C
=======

1. link "QuartzCore.framework".
2. copy "Tween.h" "Tween.m" "TweenObject.h" "TweenObject.m" to your project.
3. import "Tween.h" and import "TweenObject.h".
4. call and implement a callback.
5. enjoy!!


Example Usage
=============

```objc

- (IBAction)buttonWasTapped:(id)sender
{
    [Tween addTween:self tweenId:0  startValue:10 endValue:290 time:2 delay:0 easing:@"easeNone" startSEL:nil updateSEL:@selector(update:) endSEL:@selector(end:)];
}

- (void)update:(TweenObject *)tween
{
    self.view.frame  = CGRectMake(tween.currentValue,  5,20,20);
}
- (void)end:(TweenObject *)tween
{
    self.view.frame  = CGRectMake(tween.currentValue,  5,20,20);
}
```


Licensed
=============

Licensed under the MIT License

Copyright (c) 2012 Nobuhiro Takahashi

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
