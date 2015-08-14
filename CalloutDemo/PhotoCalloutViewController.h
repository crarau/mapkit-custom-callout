//
//  PhotoViewController.h
//  CalloutDemo
//
//  Created by Ciprian Rarau on 2015-08-13.
//
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoCalloutViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) Photo * photo;
@end
