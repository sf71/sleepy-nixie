//
//  SleepyNixieSLView.m
//  SleepyNixieSL
//
//  SL is SNOW LEOPARD, backported from Mountain Lion.
//
//  Created by sf71 on 2013-05-22.
//  Copyright (c) 2013 g42.net (Broken Glass Entertainment). All rights reserved.
//

#import "SleepyNixieSLView.h"

@implementation SleepyNixieSLView

NSInteger sizeFactor = 3000;

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/2.0];
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
    NSSize size = [self bounds].size;
    
    NSInteger numberHeight = (582 * size.width) / sizeFactor;
    NSInteger numberWidth = (345 * size.width) / sizeFactor;
    NSInteger space = 40 * size.width / sizeFactor;
    NSInteger x = (size.width - ((6 * numberWidth) + (9 * space))) / 2;
    NSInteger y = (size.height - numberHeight) / 2;
    NSInteger pos = 0;
    
    NSDate* now = [NSDate date];
    NSInteger hour = [[now dateWithCalendarFormat:nil timeZone:nil] hourOfDay];
    NSInteger min = [[now dateWithCalendarFormat:nil timeZone:nil] minuteOfHour];
    NSInteger sec = [[now dateWithCalendarFormat:nil timeZone:nil] secondOfMinute];
    NSInteger imgTag = 0;
    
    for (pos = 0; pos < 6; pos++) {
        switch (pos) {
            case 0:
                imgTag = hour / 10;
                break;
            case 1:
                imgTag = hour % 10;
                x += numberWidth + space;
                break;
            case 2:
                imgTag = min / 10;
                x += numberWidth + space + space + space;
                break;
            case 3:
                imgTag = min % 10;
                x += numberWidth + space;
                break;
            case 4:
                imgTag = sec / 10;
                x += numberWidth + space + space + space;
                break;
            case 5:
                imgTag = sec % 10;
                x += numberWidth + space;
                break;
        }
        
        NSString *imageFileName = [[NSBundle bundleWithIdentifier:@"net.g42.SleepyNixieSL"]
                                   pathForResource:[NSString stringWithFormat:@"nx-%ld", (long)imgTag] ofType:@"tiff"];
        NSImage *numberImage = [[NSImage alloc]initWithContentsOfFile:imageFileName];
        [numberImage setSize: NSMakeSize(numberWidth, numberHeight)];
        
        NSRect rect = NSMakeRect(x, y, numberWidth, numberHeight);
        [numberImage drawInRect: rect
                       fromRect: NSZeroRect
                      operation: NSCompositeSourceOver
                       fraction: 1.0];

        // Snow Leopard wants us to manually release our allocated vars.  (Mountain Lion doesn't)
        [numberImage release];
    }
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
