//
//  ViewController.h
//  HelloWorld
//
//  Created by Banson on 14-7-28.
//  Copyright (c) 2014年 cc.anr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaLumberjack.h"

#import "GCDAsyncSocket.h"

#define SRV_CONNECTED 0
#define SRV_CONNECT_SUC 1
#define SRV_CONNECT_FAIL 2
//#define HOST_IP @"52.88.252.101"
#define HOST_IP @"127.0.0.1"
#define HOST_PORT 58888


@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *userOutput;
    GCDAsyncSocket * socketClient;//socket 客户端
    
    
}
@property (retain,nonatomic) IBOutlet UILabel * userOutput;
@property(retain,nonatomic) GCDAsyncSocket *socketClinent;

-(IBAction)showMessage;

-(IBAction)commit:(id)sender;


- (void)sendMsg:(NSString *)text;
- (int) connectServer: (NSString *) hostIP port:(int) hostPort;
- (void) showMessage:(NSString *) msg;
- (IBAction) reConnect;

@end
