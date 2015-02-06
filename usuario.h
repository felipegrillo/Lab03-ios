//
//  Usuario.h
//  Lab03
//
//  Created by felipe on 05/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface Usuario : NSObject
@property (nonatomic,assign) NSInteger idUsuario;
@property (nonatomic,retain) NSString *nombre;
@property (nonatomic,retain) NSString *estado;;
@end
