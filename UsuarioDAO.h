//
//  UsuarioDAO.h
//  Lab03
//
//  Created by felipe on 05/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface UsuarioDAO : NSObject{
    sqlite3 *BDUsuario;
}
- (void) AltaUsuario: (NSString *)nombre estado:(NSString *) estado;
-(NSMutableArray *) getUsuarios;
-(void) borrarUsuario:(NSInteger) idUsuario;
- (void) actualizarUsuario: (NSInteger) idUsuario nombre:(NSString *)nombre estado:(NSString *) estado;
-(NSString *) getRutaDB;

@end
