//
//  MBObservingMutableDictionary.m
//  MBObservingMutableDictionary
//
//  Created by Moonbeom Kyle KWON on 1/20/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MBObservingMutableDictionary.h"

@interface MBObservingMutableDictionary ()

@property (strong, nonatomic) NSMutableDictionary *proxy;

@end


@implementation MBObservingMutableDictionary


#pragma mark - initialize methods
-(id)init
{
    self = [super init];
    if (self != nil) {
        _proxy = [NSMutableDictionary new];
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self != nil) {
        _proxy = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    }
    
    return self;
}


#pragma mark - dictionary methods
-(id)objectForKey:(id)aKey
{
    return [_proxy objectForKey:aKey];
}

-(NSUInteger)count
{
    return [_proxy count];
}

-(NSEnumerator *)keyEnumerator
{
    return [_proxy keyEnumerator];
}

-(NSArray *)allKeys
{
    return [_proxy allKeys];
}

-(NSArray *)allValues
{
    return [_proxy allValues];
}


#pragma mark - mutable dictionary methods
-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [_proxy setObject:anObject forKey:aKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_ADD_AN_OBJECT object:nil];
}

-(void)removeAllObjects
{
    [_proxy removeAllObjects];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REMOVE_ALL_OBJECTS object:nil];
}

-(void)removeObjectForKey:(id)aKey
{
    [_proxy removeObjectForKey:aKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REMOVE_AN_OBJECT object:nil];
}

-(void)removeObjectsForKeys:(NSArray *)keyArray
{
    [_proxy removeObjectsForKeys:keyArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REMOVE_OBJECTS object:nil];
}

@end
