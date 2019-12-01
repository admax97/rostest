//
//  PlayerView.m
//  videoTest
//
//  Created by Max Menkov on 29.11.19.
//  Copyright © 2019 Max Menkov. All rights reserved.
//


#import "PlayerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation PlayerView

+ (Class) layerClass {
	return AVPlayerLayer.class;
}

@end
