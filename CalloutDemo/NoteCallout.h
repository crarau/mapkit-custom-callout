#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteCallout : NSObject

@property (nonatomic,copy) Note * note;

- (UIViewController *) calloutCell;
- (instancetype)initWithNote:(Note *)note;

@end
