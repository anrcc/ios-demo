//
//  Dog.m
//  MyOc
//
//  Created by Banson on 15/6/11.
//  Copyright (c) 2015年 cc.anr. All rights reserved.
//

#import "Dog.h"

@implementation Dog

@synthesize dogName;

-(id) init{
    
    return nil;
}

-(id) initWithAge:(int) newAge{
    NSLog(@"这是initWithAge 里面的age=%d",newAge);
    return nil;
}

-(void) setAge:(int)newAge setSex:(int) sex setTelphone:(NSString *) telphone{
    [self initWithAge:100];
    
    NSLog(@"Hello, World age= s%d sex=%d  %@!",newAge,sex,telphone);
}

-(int) age{
    return age;
}
-(void) setAge:(int)newAge{
    age=newAge;
}

@end