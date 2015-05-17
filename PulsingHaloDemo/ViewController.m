//
//  ViewController.m
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Modified by ShannonChou on 14-7-8
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "PulsingHaloLayer.h"
#import "MultiplePulsingHaloLayer.h"

#define kMaxRadius 160

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ViewController ()
@property (nonatomic, weak) PulsingHaloLayer *mutiHalo;
@property (nonatomic, weak) PulsingHaloLayer *halo;
@property (nonatomic, weak) IBOutlet UIImageView *beaconViewMuti;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)startPlay
{
    ///setup multiple halo layer
    //you can specify the number of halos by initial method or by instance property "haloLayerNumber"
    PulsingHaloLayer *layer = [PulsingHaloLayer layer];
    
    self.mutiHalo = layer;
    self.mutiHalo.position = self.beaconViewMuti.center;
    self.mutiHalo.useTimingFunction = NO;
    [self.view.layer insertSublayer:self.mutiHalo below:self.beaconViewMuti.layer];
    UIColor *color = UIColorFromRGB(0x71C6D8);
    [self.mutiHalo setBackgroundColor:color.CGColor];
    [self.mutiHalo setRadius:135];
}

- (void)stopPlay
{
    [self.mutiHalo removeFromSuperlayer];
    self.mutiHalo = nil;
}

- (IBAction)startPlay:(id)sender
{
    if (self.mutiHalo == nil) {
        [self startPlay];
    }
}

- (IBAction)stopPlay:(id)sender
{
    [self stopPlay];
}
@end
