//
//  VideoCell.h
//  Telemat
//
//  Created by Max Menkov on 29.11.19.
//  Copyright © 2019 Max Menkov. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Channel.h"

@interface VideoCell : UICollectionViewCell

+ (NSString*) identifier;

@property (nonatomic) Channel *channel;

@end
