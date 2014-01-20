//
//  MBObservingMutableDictionary.h
//  MBObservingMutableDictionary
//
//  Created by Moonbeom Kyle KWON on 1/20/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NOTIFICATION_ADD_AN_OBJECT @"notification_add_an_object"

#define NOTIFICATION_REMOVE_AN_OBJECT @"notification_remove_an_object"
#define NOTIFICATION_REMOVE_ALL_OBJECTS @"notification_remove_all_objects"
#define NOTIFICATION_REMOVE_OBJECTS @"notification_remove_objects"

@interface MBObservingMutableDictionary : NSObject

-(id)init;
-(id)initWithDictionary:(NSDictionary *)dictionary;


-(id)objectForKey:(id)aKey;
-(NSUInteger)count;
-(NSEnumerator *)keyEnumerator;
-(NSArray *)allKeys;
-(NSArray *)allValues;


-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
-(void)removeAllObjects;
-(void)removeObjectForKey:(id)aKey;
-(void)removeObjectsForKeys:(NSArray *)keyArray;

@end
