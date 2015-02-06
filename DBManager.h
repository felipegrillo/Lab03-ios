//
//  DBManager.h
//  Lab03
//
//  Created by felipe on 04/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DBManager : NSObject{
    int id;
    NSString *estado;
    
    NSString *nombre;
}


@end
