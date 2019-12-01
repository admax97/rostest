//
//  Channel.h
//  Telemat
//
//  Created by Max Menkov on 29.11.19.
//  Copyright © 2019 Max Menkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Channel : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSURL *streamURL;
@property (nonatomic) NSURL *programURL;
@property (nonatomic) NSArray <NSString*> *programmRegExpRules;

- (instancetype) initFromDictionary:(NSDictionary*) dict;
- (void) requestCurrentName:(void (^)(NSString *name))completion;

@end
