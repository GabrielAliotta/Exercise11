//
//  AddBeerViewController.h
//  Exercise11
//
//  Created by Gabriel Aliotta on 3/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"


@interface AddBeerViewController : UIViewController {
    
    UITextField *myTextField;
}
@property (nonatomic, retain) IBOutlet UITextField *myTextField;
@property (nonatomic, retain) Beer * beer;


@end
