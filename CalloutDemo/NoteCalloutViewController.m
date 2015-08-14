#import "NoteCalloutViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NoteCalloutViewController()
@end

@implementation NoteCalloutViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noteTitle.text = self.note.title;
    self.noteContent.text = self.note.content;
}

- (IBAction)editTouchUpInside:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:[NSString stringWithFormat:@"Edit '%@;", self.note.title]
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

@end

