//
//  AppDelegate.h
//  Telemat
//
//  Created by Max Menkov on 29.11.19.
//  Copyright © 2019 Max Menkov. All rights reserved.
//

#import "AppDelegate.h"
#import "VideoPlayerViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	if (launchOptions[UIApplicationLaunchOptionsURLKey]) {
		[self openURL:launchOptions[UIApplicationLaunchOptionsURLKey]];
	}
	return YES;
}

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
	[self openURL:url];
	return YES;
}

- (void) openURL:(NSURL*) url {
	NSURLComponents *comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
	NSURLQueryItem *queryItem = comp.queryItems.firstObject;
	if (queryItem.value.length) {
		[[NSUserDefaults standardUserDefaults] setInteger:[queryItem.value integerValue] forKey:@"lastChannel"];
		VideoPlayerViewController *videoPlayer = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VideoPlayerViewController"];
		self.window.rootViewController = videoPlayer;
	}
}

@end
