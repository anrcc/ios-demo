//
//  Dog.h
//  MyOc
//
//  Created by Banson on 15/6/11.
//  Copyright (c) 2015年 cc.anr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    int age;
    //NSString *dogName;
}

-(id) init;
-(id) initWithAge:(int) newAge;
-(void) setAge:(int)newAge setSex:(int) sex setTelphone:(NSString *) telphone;

-(void) setAge:(int) newAge;
-(int) age;

@property NSString *dogName;

@end