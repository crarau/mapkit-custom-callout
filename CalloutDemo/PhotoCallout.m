//
//  PhotoCallout.m
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import "PhotoCallout.h"
#import "PhotoCalloutViewController.h"

@implementation PhotoCallout

- (instancetype)initWithPhoto:(Photo *)photo
{
    self = [super init];
    if (self)
    {
        _photo = photo;
    }
    return self;
}

- (UIViewController *)calloutCell
{
    PhotoCalloutViewController * viewController = [PhotoCalloutViewController new];
    viewController.photo = _photo;
    return viewController;
}
@end
