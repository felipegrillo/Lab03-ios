//
//  showViewController.m
//  Lab03
//
//  Created by felipe on 05/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "showViewController.h"
#import "myCell.h"
@interface showViewController ()

@end

@implementation showViewController

- (void)viewDidLoad {
    _DAO = [[UsuarioDAO alloc] init];
    _lista = [[NSMutableArray alloc] init];
    _lista = [_DAO getUsuarios];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated{
    _lista = [[NSMutableArray alloc] init];
    _lista = [_DAO getUsuarios];
    
   // [self.tableViews reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/* funciones */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableViews
{
//     Retorna el numero de seccion
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Retorna numero de fila en cada seccion
    return [_lista count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"celta";
    myCell *cell = (myCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[myCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.lblNombre.text=[[_lista objectAtIndex:[indexPath row]] valueForKey:@"nombre"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 ///   ModVehiculoViewController *destino = [self.storyboard instantiateViewControllerWithIdentifier:@"visualizacion"];
  ///  Vehiculo *tmp = [vehiculos objectAtIndex:[indexPath row]];
  //  destino.vehiculo = tmp;
    
   // [self.navigationController pushViewController:destino animated:YES];
    
}

@end
