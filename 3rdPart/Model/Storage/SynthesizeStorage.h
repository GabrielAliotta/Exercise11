//
//  SynthesizeStorage.h
//  CocoaWithLove
//
//  Created by Gustavo Halperin on 14/02/12.
//  Copyright 2012 Gustavo Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//


#define SYNTHESIZE_MANAGEDOBJECTCONTEXT \
- (NSManagedObjectContext*)managedObjectContext\
{\
    if (_managedObjectContext == nil) {\
        _managedObjectContext = [ManagerStorage sharedManagerStorage].managedObjectContext;\
    }\
    return _managedObjectContext;\
}

#define SYNTHESIZE_FETCHREQUEST(entityname, key) \
- (NSFetchRequest *)fetchRequest {\
    if (_fetchRequest != nil) { return _fetchRequest; }\
	_fetchRequest = [[NSFetchRequest alloc] init];\
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityname inManagedObjectContext:self.managedObjectContext];\
	[_fetchRequest setEntity:entity];\
	NSSortDescriptor *name = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];\
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:name, nil];\
	[_fetchRequest setSortDescriptors:sortDescriptors];\
	return _fetchRequest;\
} 

#define SYNTHESIZE_ENTITIES \
- (NSArray*) entities\
{\
    NSError *error = nil;\
    NSArray *array = [self.managedObjectContext executeFetchRequest:self.fetchRequest\
                                                               error:&error];\
    if (error) NSLog(@"Error: %@", error.description);\
        return array;\
}


