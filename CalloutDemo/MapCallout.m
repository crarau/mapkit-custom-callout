#import "MapCallout.h"

@implementation MapCallout

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate data:(id) calloutData
{
    self = [super init];
    if (self)
    {
        _coordinate = coordinate;
        _calloutData = calloutData;
    }
    return self;
}

- (UIViewController *)calloutViewController
{
    return self.calloutData.calloutCell;
}

- (NSString *) calloutType {
    return [NSString stringWithFormat:@"%@", self.calloutData.calloutCell.class];
}

@end
