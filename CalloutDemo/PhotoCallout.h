//
//  PhotoCallout.h
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface PhotoCallout : NSObject

@property (nonatomic,copy) Photo * photo;

- (UIViewController *) calloutCell;
- (instancetype)initWithPhoto:(Photo *) photo;


@end
