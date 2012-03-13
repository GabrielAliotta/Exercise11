//
//  ManagerStorage.h
//  CinesHoyts
//
//  Created by gustavo halperin on 2/22/12.
//  Copyright 2012 Gustavo Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import <Foundation/Foundation.h>

extern const NSString *datamodel_name;

@interface ManagerStorage : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (ManagerStorage *)sharedManagerStorage;

- (BOOL)contextHasChanges;
- (void)saveContext;

@end
