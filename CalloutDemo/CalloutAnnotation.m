//
//  MultiRowAnnotation.m
//  Created by Greg Combs on 11/30/11.
//
//  based on work at https://github.com/grgcombs/MultiRowCalloutAnnotationView
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. 
//  To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
//  or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
//
//

#import "CalloutAnnotation.h"

@implementation CalloutAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate calloutViewController:(UIViewController *)calloutCell
{
    self = [super init];
    if (self)
    {
        _coordinate = coordinate;
        _calloutViewController = calloutCell;
    }
    return self;
}

- (NSString *) calloutType {
    return [NSString stringWithFormat:@"%@", self.calloutViewController.class];
}

// For selection/deselection of the callout in the map view controller, we need to make a copy of the annotation
- (id)copyWithZone:(NSZone *)zone
{
    return [[CalloutAnnotation allocWithZone:zone] initWithCoordinate:_coordinate calloutViewController:_calloutViewController];
}

- (void)copyAttributesFromAnnotation:(NSObject <CalloutAnnotationProtocol> *)annotation
{
    _coordinate = annotation.coordinate;
    _calloutViewController = [annotation calloutViewController];
}

@end
