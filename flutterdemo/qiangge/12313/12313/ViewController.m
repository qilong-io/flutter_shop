//
//  ViewController.m
//  12313
//
//  Created by ql on 2020/5/16.
//  Copyright © 2020 lierda. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)device:(id)sender {
    
    FlutterViewController*  flutterVc = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    [flutterVc setInitialRoute:@"device"];
    NSString *channelName = @"com.senthink.test:about";
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVc];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        
        if ([call.method isEqualToString:@"finish"]) {
            [flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [self presentViewController:flutterVc animated:YES completion:nil];
}

- (IBAction)files:(id)sender {
    FlutterViewController*  flutterVc = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    [flutterVc setInitialRoute:@"files"];
    NSString *channelName = @"com.senthink.test:about";
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVc];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        
        if ([call.method isEqualToString:@"finish"]) {
            [flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [self presentViewController:flutterVc animated:YES completion:nil];
}

- (IBAction)refister:(id)sender {
    FlutterViewController*  flutterVc = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    [flutterVc setInitialRoute:@"register"];
    NSString *channelName = @"com.senthink.test:about";
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVc];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        
        if ([call.method isEqualToString:@"finish"]) {
            [flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [self presentViewController:flutterVc animated:YES completion:nil];
}

- (IBAction)about:(id)sender {
    FlutterViewController*  flutterVc = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    [flutterVc setInitialRoute:@"about"];
    NSString *channelName = @"com.senthink.test:about";
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVc];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        
        if ([call.method isEqualToString:@"finish"]) {
            [flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [self presentViewController:flutterVc animated:YES completion:nil];
}

@end
