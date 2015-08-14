//
//  MultiRowAnnotation.h
//  Created by Greg Combs on 11/30/11.
//
//  based on work at https://github.com/grgcombs/MultiRowCalloutAnnotationView
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. 
//  To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
//  or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
//
//

#import "CalloutAnnotationProtocol.h"

@interface CalloutAnnotation : NSObject <CalloutAnnotationProtocol>
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

@property (nonatomic,copy) UIViewController *calloutViewController;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate calloutViewController:(UIViewController *)calloutCell NS_DESIGNATED_INITIALIZER;
- (void)copyAttributesFromAnnotation:(NSObject <CalloutAnnotationProtocol> *)annotation;
@end
