//
//  UseStaticLibrary.m
//  DynamicFramework
//
//  Created by Jiang Wei on 2021/3/2.
//

#import "UseStaticLibrary.h"
#include <CppA.hpp>

@implementation UseStaticLibrary

-(void)test
{
  
    CppA t;
    t.test2();
};


@end
