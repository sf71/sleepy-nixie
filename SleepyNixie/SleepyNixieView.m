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

- (void) animateOneFrame
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
        
        NSString *imageFileName = [[NSBundle bundleWithIdentifier:@"net.g42.SleepyNixie"]
                                   pathForResource:[NSString stringWithFormat:@"nx-%ld", (long)imgTag] ofType:@"tiff"];
        NSImage *numberImage = [[NSImage alloc]initWithContentsOfFile:imageFileName];
        [numberImage setSize: NSMakeSize(numberWidth, numberHeight)];

        // @todo: resize source image.  somehow.
        NSRect rect = NSMakeRect(x, y, numberWidth, numberHeight);
        [numberImage drawInRect: rect
                       fromRect: NSZeroRect
                      operation: NSCompositeSourceOver
                       fraction: 1.0];        
    }
}

//- (void) drawOldStyle
//{
//    NSBezierPath *path;
//    NSRect rect;
//    NSSize size;
//    NSColor *color;
//    float red, green, blue, alpha;
//    int shapeType;
//
//    size = [self bounds].size;
//    
//    // Calculate random width and height
//    rect.size = NSMakeSize( SSRandomFloatBetween( size.width / 100.0,
//                                                 size.width / 10.0 ),
//                           SSRandomFloatBetween( size.height / 100.0,
//                                                size.height / 10.0 ));
//
//    // Calculate random origin point
//    rect.origin = SSRandomPointForSizeWithinRect( rect.size, [self bounds] );
//    
//    // Decide what kind of shape to draw
//    shapeType = SSRandomIntBetween( 0, 2 );
//    
//    switch (shapeType)
//    {
//        case 0: // rect
//            path = [NSBezierPath bezierPathWithRect:rect];
//            break;
//            
//        case 1: // oval
//            path = [NSBezierPath bezierPathWithOvalInRect:rect];
//            break;
//        
//        case 2: // arc
//        default:
//        {
//            float startAngle, endAngle, radius;
//            NSPoint point;
//            
//            startAngle = SSRandomFloatBetween( 0.0, 360.0 );
//            endAngle = SSRandomFloatBetween( startAngle, 360.0 + startAngle );
//        
//            // Use the smallest value for the radius (either width or height)
//            radius = rect.size.width <= rect.size.height ?
//            rect.size.width / 2 : rect.size.height / 2;
//            
//            // Calculate our center point
//            point = NSMakePoint( rect.origin.x + rect.size.width / 2,
//                                rect.origin.y + rect.size.height / 2 );
//            
//            // Construct the path
//            path = [NSBezierPath bezierPath];
//            
//            [path appendBezierPathWithArcWithCenter: point
//                                             radius: radius
//                                         startAngle: startAngle
//                                           endAngle: endAngle
//                                          clockwise: SSRandomIntBetween( 0, 1 )];
//        }
//            break;
//    }
//    
//    // Calculate a random color
//    red = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
//    green = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
//    blue = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
//    alpha = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
//    
//    color = [NSColor colorWithCalibratedRed:red
//                                      green:green
//                                       blue:blue
//                                      alpha:alpha];
//    
//    [color set];
//    
//    // And finally draw it
//    if (SSRandomIntBetween( 0, 1 ) == 0)
//        [path fill];
//    else
//        [path stroke];
//}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
