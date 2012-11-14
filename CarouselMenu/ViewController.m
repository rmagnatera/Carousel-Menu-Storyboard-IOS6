//
//  ViewController.m
//  CarouselMenu
//
//  Created by Ricardo Guillermo Magnatera on 13/11/12.
//  Copyright (c) 2012 Ricardo Guillermo Magnatera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize carousel;
@synthesize items;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Eligo el tipo de iCarousel
    carousel.type = iCarouselTypeWheel;

}

//Configuro las propiedades del iCarousel
- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //Opcion de YES o NO para saber si cuando llega al ultimos imagenes empieze de nuevo
            return YES;
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionArc:
        {
            return value;
        }
        case iCarouselOptionRadius:
        {
             return 450;
        }
        case iCarouselOptionTilt:
        {
             return value;
        }
        case iCarouselOptionSpacing:
        {
            return 1.30;
        }
        default:
        {
            return value;
        }
    }
}

//Opcion si giral el iCarousel al girar el equipo
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

//Devuelvo la Cantidad de elementos (botones, imagenes, etc) que va a tener el iCarousel
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"page.png"];
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
		button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//Le pongo el numero al Label
	[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
	
	return button;
}

#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
	//Genero una alerta cuando pulsan algun boton
	NSInteger index = [carousel indexOfItemViewOrSubview:sender];
	
    [[[[UIAlertView alloc] initWithTitle:@"Button Tapped"
                                 message:[NSString stringWithFormat:@"You tapped button number %i", index]
                                delegate:nil
                       cancelButtonTitle:@"OK"
                       otherButtonTitles:nil] autorelease] show];
}

//Aviso de memoria
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
