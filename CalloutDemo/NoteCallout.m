#import "NoteCallout.h"
#import "NoteCalloutViewController.h"

@implementation NoteCallout

- (instancetype)initWithNote:(Note *)note
{
    self = [super init];
    if (self)
    {
        _note = note;
    }
    return self;
}


- (UIViewController *)calloutCell
{
    NoteCalloutViewController * cellController = [NoteCalloutViewController new];
    cellController.note = _note;
    return cellController;
}

@end
