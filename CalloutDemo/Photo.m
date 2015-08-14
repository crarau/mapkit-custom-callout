//
//  Photo.m
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import "Photo.h"

@implementation Photo

- (id) initWithImage:(UIImage *) image {
    self = [super init];
    if (self) {
        _image = image;
    }
    return self;
}

@end
