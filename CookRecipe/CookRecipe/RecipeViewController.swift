//
//  RecipeViewController.swift
//  CookRecipe
//
//  Created by 임태완 on 2019. 8. 9..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var indegrantLabel : UILabel! 
    @IBOutlet var recipeTextView : UITextView!
    
    var recipe : RecipeInfo!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        indegrantLabel.text = recipe.ingredient
        recipeTextView.text = recipe.recipe
        self.navigationItem.title = recipe.title
        let image = UIImage(named : recipe.imageName)
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
