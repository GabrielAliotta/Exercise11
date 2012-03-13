//
//  ModelTests.m
//  ModelTests
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

#import "ModelTests.h"
#import "Time.h"
#import "TimeStorage.h"
#import "ManagerStorage.h"

@implementation ModelTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testTimeStorage
{
    
    NSArray *array = [[TimeStorage sharedTimeStorage] entities];
    int savedEntities = array.count;
    NSString *timeStr = [[[NSDate alloc] init] description];
    Time *time = [[TimeStorage sharedTimeStorage] time:timeStr];
    STAssertNotNil(time, @"TimeStorage fail creating new Time");
    array = [[TimeStorage sharedTimeStorage] entities];
    STAssertTrue(array.count == 1+savedEntities, @"There is not 1 entity saved");
    
    time = [[TimeStorage sharedTimeStorage] time:timeStr];
    STAssertNotNil(time, @"TimeStorage fail creating the second new Time");
    array = [[TimeStorage sharedTimeStorage] entities];
    STAssertTrue(array.count == 1+savedEntities, @"The is not 1 entity saved");
    
    timeStr = [[[[NSDate alloc] init] dateByAddingTimeInterval:1] description];
    time = [[TimeStorage sharedTimeStorage] time:timeStr];
    STAssertNotNil(time, @"TimeStorage fail creating the second new Time");
    array = [[TimeStorage sharedTimeStorage] entities];
    STAssertTrue(array.count == 2+savedEntities, @"The are not 2 entities saved");
    STAssertTrue([[ManagerStorage sharedManagerStorage] contextHasChanges], @"Context wasn't changed");
    [[ManagerStorage sharedManagerStorage] saveContext];
    NSLog(@"\n The entities are: %@ \n", array.description);
}

@end
