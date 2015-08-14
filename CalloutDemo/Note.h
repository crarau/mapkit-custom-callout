//
//  NoteLocalRef.h
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * content;

- (id) initWithTitle:(NSString *) title content:(NSString *) content;
@end
