//
//  SleepyNixieView.m
//  SleepyNixie
//
//  Created by sf71 on 2013-05-20.
//  Copyright (c) 2013 g42.net (Broken Glass Entertainment). All rights reserved.
//

#import "SleepyNixieView.h"

@implementation SleepyNixieView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
