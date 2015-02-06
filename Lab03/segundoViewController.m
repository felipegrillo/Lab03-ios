//
//  segundoViewController.m
//  Lab03
//
//  Created by felipe on 04/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "segundoViewController.h"

@interface segundoViewController ()

@end

@implementation segundoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _DAO = [[UsuarioDAO alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)altaUsuarios:(id)sender {
    NSString *nombre=_textNombre.text;
    NSString *estado=_textEstado.text;
    [_DAO AltaUsuario:nombre estado:estado];
}
@end
