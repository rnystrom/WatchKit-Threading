//
//  InterfaceController.m
//  WatchThreading WatchKit Extension
//
//  Created by Ryan Nystrom on 12/7/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
  self = [super initWithContext:context];
  if (self){
    [self.label setText:@"Loaded at initWithContext:"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      NSURL *url = [NSURL URLWithString:@"http://placehold.it/120x100"];
      NSData *data = [NSData dataWithContentsOfURL:url];
      UIImage *kitten = [UIImage imageWithData:data];

      dispatch_async(dispatch_get_main_queue(), ^{
        [self.image setImage:kitten];
      });
    });
  }
  return self;
}

@end



