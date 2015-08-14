#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteCalloutViewController : UIViewController

@property (nonatomic, strong) Note * note;

@property (strong, nonatomic) IBOutlet UILabel *noteTitle;
@property (strong, nonatomic) IBOutlet UILabel *noteContent;
@end
