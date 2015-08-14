//
//  NoteLocalRef.m
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import "Note.h"

@implementation Note

- (instancetype)initWithTitle:(NSString *) title content:(NSString *) content
{
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
    }
    return self;
}
@end
