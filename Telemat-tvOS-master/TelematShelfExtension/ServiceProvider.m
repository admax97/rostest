//
//  ServiceProvider.m
//  TelematShelfExtension
//
//  Created by Max Menkov on 29.11.19.
//  Copyright © 2019 Max Menkov. All rights reserved.
//


#import "ServiceProvider.h"

@interface ServiceProvider ()

@end

@implementation ServiceProvider

- (TVTopShelfContentStyle)topShelfStyle {
    return TVTopShelfContentStyleSectioned;
}

- (NSArray *)topShelfItems {
	NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"channel" withExtension:@"json"]];
	NSArray *list = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

	NSMutableArray *items = [@[] mutableCopy];
	[list enumerateObjectsUsingBlock:^(NSDictionary *info, NSUInteger idx, BOOL *stop) {
		TVContentItem *item = [[TVContentItem alloc] initWithContentIdentifier:[[TVContentIdentifier alloc] initWithIdentifier:info[@"StreamURL"] container:nil]];
		NSURLComponents *comp = [[NSURLComponents alloc] init];
		comp.scheme = @"telemat";
		comp.path = @"video";
		comp.queryItems = @[[NSURLQueryItem queryItemWithName:@"index" value:[@(idx) stringValue]]];
		item.displayURL = [comp URL];
		NSString *imageName = info[@"Bild"];
		if ([imageName hasPrefix:@"file:"])
			item.imageURL = [[NSBundle mainBundle] URLForResource:[imageName substringWithRange:NSMakeRange(5, imageName.length - (5+4))] withExtension:@"png"];
		
		item.imageShape = TVContentItemImageShapeWide;
		item.title = info[@"SenderName"];
		[items addObject:item];
	}];
	
	TVContentItem *topItem = [[TVContentItem alloc] initWithContentIdentifier:[[TVContentIdentifier alloc] initWithIdentifier:@"Container" container:nil]];
	topItem.topShelfItems = [items copy];
	return @[topItem];
}

@end
