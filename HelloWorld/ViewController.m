//
//  ViewController.m
//  HelloWorld
//
//  Created by Banson on 14-7-28.
//  Copyright (c) 2014年 cc.anr. All rights reserved.
//



#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController
@synthesize userOutput;
@synthesize socketClinent;




DDTTYLogger *logger=nil;
DDFileLogger *fileLogger =nil;





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self connectServer:HOST_IP port:HOST_PORT];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewDidUnload
{

    self.socketClinent=nil; //释放对象
}




- (IBAction)commit:(id)sender {
    UIAlertView *conmitAlert = [[ UIAlertView alloc ] initWithTitle:@"提交提示" message:@"谁让你提交了?" delegate:nil cancelButtonTitle:@"滚吧!" otherButtonTitles:nil, nil];
    [conmitAlert show];
    
    //1.创建一个终端显示日志
    
      if (logger == nil) {
    
          logger = [DDTTYLogger sharedInstance]; //只需要初始化一次
          //1.1将日志网终端上输出
          [DDLog addLogger:logger];
      }
    
    //2.创建一个文件日志 Log信息往文件输出
    if(fileLogger==nil){
        fileLogger = [[DDFileLogger alloc]init]; //只需要初始化一次
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7; //log 文件最多允许 7个
        //2.1让日志文件logger输出
        [DDLog addLogger:fileLogger];
    }
    //2.2打印日志文件目录
    NSLog(@"dir is %@", fileLogger.logFileManager.logsDirectory);

    
    DDLogError(@"Broken sprocket detected!");
    DDLogVerbose(@"User selected file:%@ withSize:%@",@"a",@"b");
    DDLogInfo(@"User selected file:%@ withSize:%@",@"a",@"b");
    
    [self sendMsg:@"aaaaaa" ];
    

}



-(IBAction)showMessage
{
    UIAlertView *helloWorldAlert=[[UIAlertView alloc] initWithTitle:@"你妹" message:@"不好吃!" delegate:self cancelButtonTitle:@"滚" otherButtonTitles:@"有虫",@"好吃", nil ];
    
    [helloWorldAlert show];
 

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSString * buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"有虫"]) {
        userOutput.text=@"有虫";
        NSLog(@"有虫");
    }else if([buttonTitle isEqualToString:@"好吃"]){
         userOutput.text=@"好吃";
          NSLog(@"好吃");
    }else{
        userOutput.text=@"滚";
          NSLog(@"滚");
    }
}







- (void)sendMsg:(NSString*) text {
    
    NSLog(@"sendMsg");
    
    NSLog(@"%a",text);
    NSData *data = [text dataUsingEncoding:NSISOLatin1StringEncoding];
    [socketClinent writeData:data withTimeout:-1 tag:0];
}

- (int) connectServer: (NSString *) hostIP port:(int) hostPort{
    
    NSLog(@"connectServer");
    if (socketClinent == nil) {
        socketClinent = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:self];
        NSError *err = nil;
        //192.168.110.128
        if (![socketClinent connectToHost:hostIP onPort:hostPort error:&err]) {
            NSLog(@"%@ %@", [err code], [err localizedDescription]);
            
        
//            [alert show];
//            [alert release];
            
            //client = nil;
            return SRV_CONNECT_FAIL;
        } else {
            NSLog(@"Conectou!");
            return SRV_CONNECT_SUC;
        }
    }
    else {
        [socketClinent readDataWithTimeout:-1 tag:0];
        return SRV_CONNECTED;
    }
    
}

- (IBAction) reConnect{
    int stat = [self connectServer:HOST_IP port:HOST_PORT];
    NSLog(@"reconnect:%@",stat);
    switch (stat) {
        case SRV_CONNECT_SUC:
            [self showMessage:@"connect success"];
            break;
        case SRV_CONNECTED:
            [self showMessage:@"It's connected,don't agian"];
            break;
        default:
            break;
    }
}

- (IBAction) sendMsg{
    
    /* NSLog(@"sendMsg");
     
     NSString *inputMsgStr = self.inputMsg.text;
     NSString * content = [inputMsgStr stringByAppendingString:@"\r\n"];
     NSLog(@"%a",content);
     NSData *data = [content dataUsingEncoding:NSISOLatin1StringEncoding];
     [client writeData:data withTimeout:-1 tag:0];
     */
    //[data release];
    //[content release];
    //[inputMsgStr release];
    //继续监听读取
    //[client readDataWithTimeout:-1 tag:0];
}  








//socket连接成功后的回调代理
//-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
//    NSLog(@"onSocket:%p didConnectToHost:%@ port:%hu", sock, host, port);
////    [delegate networkConnected];
////    [self listenData];
//}

////socket连接断开后的回调代理
//-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
//    NSLog(@"DisConnetion");
//    [socket disconnect];
//    [delegate networkDisconnect];
//    //    if (needConnect)
//    //        [self getConnection];
//}
//
////读到数据后的回调代理
//-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
//    NSLog(@"receive datas from method 1");
//    //    NSLog(@"Data length = %d",[data length]);
//    [self listenData];
//    [delegate readData:data];
//    //    [self splitData:data];
//    //    [self listenData];
//}
//
//
////发起一个读取的请求，当收到数据时后面的didReadData才能被回调
//-(void)listenData {
//    //    NSString* sp = @"\n";
//    //    NSData* sp_data = [sp dataUsingEncoding:NSUTF8StringEncoding];
//    [socket readDataToData:[GCDAsyncSocket LFData] withTimeout:-1 tag:1];
//    //    [socket readDataWithTimeout:-1 tag:1];
//}

@end
