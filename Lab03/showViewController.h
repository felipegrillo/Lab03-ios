//
//  showViewController.h
//  Lab03
//
//  Created by felipe on 05/02/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"
#import "myCell.h"
@interface showViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (strong,nonatomic) UsuarioDAO *DAO;
@property (strong,nonatomic) NSMutableArray *lista;
@property (strong, nonatomic) IBOutlet UITableView *table;

//@property (strong, nonatomic) IBOutlet UITableView *tableViews;

@end
