//
//  ViewController.h
//  CarouselMenu
//
//  Created by Ricardo Guillermo Magnatera on 13/11/12.
//  Copyright (c) 2012 Ricardo Guillermo Magnatera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, retain) IBOutlet iCarousel *carousel;
@property (nonatomic, retain) NSMutableArray *items;

@end
