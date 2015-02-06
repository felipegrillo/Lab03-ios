//
//  UsuarioDAO.m
//  Lab03
//
//  Created by felipe on 05/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "UsuarioDAO.h"
#import "Usuario.h"
@implementation UsuarioDAO
- (NSString *) getRutaDB{
    NSString *dir;
    NSArray *rutas;
    NSString *rutaBD;
    rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dir = [rutas objectAtIndex:0];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    rutaBD = [[NSString alloc] initWithString:[dir stringByAppendingPathComponent:@"usuario.sqlite"]];
    if([fileMgr fileExistsAtPath:rutaBD] == NO){
        [fileMgr copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"usuario.sqlite"] toPath:rutaBD error:NULL];
    }
    
    return rutaBD;
}

-(void) AltaUsuario:(NSString *)nombre estado:(NSString *)estado{
    NSString *ubicacionDB = [self getRutaDB];
    if(!(sqlite3_open([ubicacionDB UTF8String], &BDUsuario) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSLog(@"Entra");
        NSString *sqlInsert = [NSString stringWithFormat:@"INSERT INTO Usuario (nombre,estado) VALUES ('%@','%@')", nombre, estado];
        const char *sql = [sqlInsert UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(BDUsuario, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(BDUsuario);
                NSLog(@"Exito");
            }
        }
        
    }
}
-(NSMutableArray *) getUsuarios{
   	NSMutableArray *listaVehiculos = [[NSMutableArray alloc] init];
    NSString *ubicacionDB = [self getRutaDB];
    
    if(!(sqlite3_open([ubicacionDB UTF8String], &BDUsuario) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
    }
    
    const char *sentenciaSQL = "SELECT id, nombre,estado FROM usuario";
    sqlite3_stmt *sqlStatement;
    
    if(sqlite3_prepare_v2(BDUsuario, sentenciaSQL, -1, &sqlStatement, NULL) != SQLITE_OK){
        NSLog(@"Problema al preparar el statement");
    }
    
    while(sqlite3_step(sqlStatement) == SQLITE_ROW){
        Usuario *usuario= [[Usuario alloc] init];
        usuario.idUsuario = sqlite3_column_int(sqlStatement, 0);
        usuario.nombre = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
        usuario.estado = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
        
        [listaVehiculos addObject:usuario];
    }
    return listaVehiculos;
}

- (void) actualizarUsuario: (NSInteger) idUsuario nombre:(NSString *)nombre estado:(NSString *) estado;{
    NSString *ubicacionBD = [self getRutaDB];
    
    if(!(sqlite3_open([ubicacionBD UTF8String], &BDUsuario) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlUpdate = [NSString stringWithFormat:@"UPDATE usuario SET nombre = '%@', estado = %@ WHERE id = %d",nombre,estado,(int)idUsuario];
        const char *sql = [sqlUpdate UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(BDUsuario, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement.");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(BDUsuario);
                NSLog(@"Exito");
            }
        }
    }
}


-(void) borrarUsuario:(NSInteger) idUsuario{
    NSString *ubicacionBD = [self getRutaDB];
    
    if(!(sqlite3_open([ubicacionBD UTF8String], &BDUsuario) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlDelete = [NSString stringWithFormat:@"DELETE FROM usuario WHERE id = %d",(int)idUsuario];
        const char *sql = [sqlDelete UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(BDUsuario, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement.");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(BDUsuario);
            }
        }
    }
}

@end
