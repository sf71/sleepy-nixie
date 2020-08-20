//
//  SleepyNixieView.m
//  SleepyNixie
//
//  Created by sf71 on 2013-05-20.
//  Copyright (c) 2013 g42.net (Broken Glass Entertainment). All rights reserved.
//

#import "SleepyNixieView.h"

@implementation SleepyNixieView

NSInteger sizeFactor = 3000;
NSRect area[10];
NSImage *img[6];
NSRect mainScreenTurnOn;

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/2.0];
    }
    mainScreenTurnOn = frame;
    return self;
}

- (void)startAnimation
{
    NSRect viewBounds = self.bounds;
    NSSize size = viewBounds.size;
 
    NSInteger numberHeight = (582 * size.width) / sizeFactor;
    NSInteger numberWidth = (345 * size.width) / sizeFactor;
    NSInteger space = 40 * size.width / sizeFactor;
    NSInteger x = NSMinX(viewBounds) + (size.width - ((6 * numberWidth) + (9 * space))) / 2;
    NSInteger y = NSMinY(viewBounds) + (size.height - numberHeight) / 2;
    NSInteger pos = 0;

//    NSDate* now = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:now];
//
//    NSInteger hour = [components hour];
//    NSInteger min = [components minute];
//    NSInteger sec = [components second];

//    NSInteger imgTag = 0;
    for (pos = 0; pos < 6; pos++) {
        switch (pos) {
            case 0:
//                imgTag = hour / 10;
                break;
            case 1:
//                imgTag = hour % 10;
                x += numberWidth + space;
                break;
            case 2:
//                imgTag = min / 10;
                x += numberWidth + space + space + space;
                break;
            case 3:
//                imgTag = min % 10;
                x += numberWidth + space;
                break;
            case 4:
//                imgTag = sec / 10;
                x += numberWidth + space + space + space;
                break;
            case 5:
//                imgTag = sec % 10;
                x += numberWidth + space;
                break;
        }

//        NSRect theValue = NSMakeRect(x, y, numberWidth, numberHeight);
        area[pos] = NSMakeRect(x, y, numberWidth, numberHeight);
//        [area addObject:theValue];
        //[NSValue valueWithRect:theValue];

//        [area addObject:[[NSRect alloc]NSMakeRect(x, y, numberWidth, numberHeight)];
        
//        [numberImage drawInRect: myRect
//                       fromRect: NSZeroRect
//                      operation: NSCompositingOperationSourceOver
//                       fraction: 1.0];
    }

    for (pos = 0; pos <= 9; pos++) {
        img[pos] = [[NSImage alloc]initWithContentsOfFile:[[NSBundle bundleWithIdentifier:@"net.g42.SleepyNixie"] pathForResource:[NSString stringWithFormat:@"nx-%ld", (long)pos] ofType:@"png"]];
    }

    [super startAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];

    if (mainScreenTurnOn.size.width != rect.size.width || mainScreenTurnOn.size.height != rect.size.height) {
        // only apply to screen that is the same size as the first screen.
        return;
    }
    
//    NSRect viewBounds = self.bounds;
//    NSSize size = viewBounds.size;

//    NSInteger numberHeight = (582 * size.width) / sizeFactor;
//    NSInteger numberWidth = (345 * size.width) / sizeFactor;
//    NSInteger space = 40 * size.width / sizeFactor;
//    NSInteger x = NSMinX(viewBounds) + (size.width - ((6 * numberWidth) + (9 * space))) / 2;
//    NSInteger y = NSMinY(viewBounds) + (size.height - numberHeight) / 2;

    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[NSDate date]];

    NSInteger hour = [components hour];
    NSInteger min = [components minute];
    NSInteger sec = [components second];

    NSInteger pos = 0;
    NSInteger imgTag = 0;
    for (pos = 0; pos < 6; pos++) {
        switch (pos) {
            case 0:
                imgTag = hour / 10;
                break;
            case 1:
                imgTag = hour % 10;
//                x += numberWidth + space;
                break;
            case 2:
                imgTag = min / 10;
//                x += numberWidth + space + space + space;
                break;
            case 3:
                imgTag = min % 10;
//                x += numberWidth + space;
                break;
            case 4:
                imgTag = sec / 10;
//                x += numberWidth + space + space + space;
                break;
            case 5:
                imgTag = sec % 10;
//                x += numberWidth + space;
                break;
        }

//        NSString *imageFileName = [[NSBundle bundleWithIdentifier:@"net.g42.SleepyNixie"]
//                                   pathForResource:[NSString stringWithFormat:@"nx-%ld", (long)imgTag] ofType:@"png"];
//        NSImage *numberImage = [[NSImage alloc]initWithContentsOfFile:imageFileName];
//        [numberImage setSize: NSMakeSize(numberWidth, numberHeight)];
//
//        NSRect myRect = NSMakeRect(x, y, numberWidth, numberHeight);
//        [numberImage drawInRect: myRect
//                       fromRect: NSZeroRect
//                      operation: NSCompositingOperationSourceOver
//                       fraction: 1.0];

//        NSRect myRect = area[pos];//[area objectAtIndex:1];
        [img[imgTag] drawInRect: area[pos]
                       fromRect: NSZeroRect
                      operation: NSCompositingOperationCopy //NSCompositingOperationSourceOver
                       fraction: 1.0];

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

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void) animateOneFrame
{
    [self setNeedsDisplay: YES];
}

@end
