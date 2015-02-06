//
//  segundoViewController.h
//  Lab03
//
//  Created by felipe on 04/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"

@interface segundoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textNombre;
@property (strong, nonatomic) IBOutlet UITextField *textEstado;
@property (strong, nonatomic) IBOutlet UIButton *altaUsuarios;
@property (strong, nonatomic) UsuarioDAO *DAO;

- (IBAction)altaUsuarios:(id)sender;

@end
