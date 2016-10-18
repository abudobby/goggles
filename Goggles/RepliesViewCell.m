//
//  TableViewCell.m
//  UITableViewCellAutolayout
//
//  Created by hejun on 9/27/16.
//  Copyright © 2016 teamleader. All rights reserved.
//

#import "RepliesViewCell.h"
#import "Reply.h"

@interface RepliesViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end

@implementation RepliesViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        

    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)setReply:(Reply *)model {
    
    
    user.text = model.name;
    questionLabel.text = model.comment;
    avater.image = [UIImage imageNamed:model.avatar];
    

    
    
}

@end
