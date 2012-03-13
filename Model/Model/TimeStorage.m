//
//  TimeStorage.m
//  Model
//
//  Created by gustavo halperin on 3/13/12.
//  Copyright 2012 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "TimeStorage.h"
#import "SynthesizeSingleton.h"
#import "SynthesizeStorage.h"
#import "ManagerStorage.h"
#import "Time.h"

@interface TimeStorage()
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchRequest *fetchRequest;
@end


@implementation TimeStorage
@synthesize managedObjectContext = _managedObjectContext;

@synthesize fetchRequest = _fetchRequest;

SYNTHESIZE_SINGLETON_FOR_CLASS(TimeStorage);
SYNTHESIZE_MANAGEDOBJECTCONTEXT;
SYNTHESIZE_FETCHREQUEST(@"Time", @"time");
SYNTHESIZE_ENTITIES;

- (Time*)time: (NSString*)iTime
{
    NSError *error = nil;
    NSArray *array = [self.managedObjectContext executeFetchRequest:self.fetchRequest
                                                              error:&error];
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    for (Time *time in array) {
        if ([iTime isEqualToString:time.time]) {
            return time;
        }
    }
    
    Time *time = [[Time alloc] initWithEntity:self.fetchRequest.entity 
               insertIntoManagedObjectContext:self.managedObjectContext];
    time.time = iTime;
    return time;
}

@end
