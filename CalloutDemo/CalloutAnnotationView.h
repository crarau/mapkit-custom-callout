//
//  MultiRowCalloutAnnotationView.h
//  Created by Greg Combs on 11/29/11.
//
//  based on work at https://github.com/grgcombs/MultiRowCalloutAnnotationView
//
//  A portion of this class is based on James Rantanen's work at Asynchrony Solutions
//    http://blog.asolutions.com/2010/09/building-custom-map-annotation-callouts-part-1/
//    http://blog.asolutions.com/2010/09/building-custom-map-annotation-callouts-part-2/
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. 
//  To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
//  or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
//
//

#import "CalloutAnnotationProtocol.h"
#import "NoteCalloutViewController.h"

@interface CalloutAnnotationView : MKAnnotationView

+ (CalloutAnnotationView *)calloutWithAnnotation:(id<CalloutAnnotationProtocol>)annotation;

- (instancetype)initWithAnnotation:(id<CalloutAnnotationProtocol>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;

@property (nonatomic,strong) UIViewController *viewController;
@property (nonatomic,strong) MKAnnotationView *parentAnnotationView;
@property (nonatomic,unsafe_unretained) MKMapView *mapView;

@end

