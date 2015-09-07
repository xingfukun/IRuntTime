//
//  MyClass.h
//  RunTime
//
//  Created by fukun xing on 15-9-7.
//  Copyright (c) 2015年 fukun xing. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Delegate1 <NSObject>

-(void)method;

@end

@protocol Delegate2 <NSObject>

-(void)method;

@end

@protocol Delegate3 <NSObject>

-(void)method;

@end

@interface MyClass : NSObject<Delegate1,Delegate2,Delegate3>
{
    NSUInteger *age;
    
    NSString *name;
}


@property (nonatomic,retain) NSString *sex;

-(void)print;
@end
