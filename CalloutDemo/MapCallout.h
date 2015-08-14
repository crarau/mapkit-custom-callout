#import <MapKit/MapKit.h>
#import "CalloutAnnotationProtocol.h"
#import "NoteCallout.h"

@interface MapCallout : NSObject <CalloutAnnotationProtocol>
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate data:(id) calloutData;

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

@property (unsafe_unretained, nonatomic,readonly) UIViewController *calloutViewController;
@property (nonatomic,strong) NoteCallout *calloutData;

@end
