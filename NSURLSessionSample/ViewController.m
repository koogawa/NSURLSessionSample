//
//  ViewController.m
//  NSURLSessionSample
//
//  Created by koogawa on 2013/11/11.
//  Copyright (c) 2013年 Kosuke Ogawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=foursquare&entity=software"];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                        if (error)
                                        {
                                            NSLog(@"Error! %@", error);
                                            return;
                                        }
                                        
                                        // Success
                                        NSLog(@"data : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                    }];
    
    // 通信開始
    [task resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
