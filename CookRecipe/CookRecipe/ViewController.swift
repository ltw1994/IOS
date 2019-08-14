//
//  ViewController.swift
//  CookRecipe
//
//  Created by 임태완 on 2019. 8. 9..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recipes : [RecipeInfo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let decoder : JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let dataAsset : NSDataAsset = NSDataAsset(name: "recipies") else {
            print("Data asset 가져올 수 없음")
            return
        }
        
        let jsonData : Data = dataAsset.data
        
        do {
            recipes = try decoder.decode([RecipeInfo].self, from: jsonData)
        } catch {
            print("json decoding 실패 : ", error.localizedDescription)
        }
        print("\(recipes.count)개 레시피 불러옴")
    }

    // 화면의 이동을 준비하는 메서드(함수)
    // 다음 화면으로 넘어가기 전에 해야 할 일을 적으시오
    // segue - 스토리보드 이동선
    // sender - 이 화면 이동을 일으킨 객체
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let button : UIButton = sender as? UIButton else {
            print("sender가 버틴으 아님")
            return
            
        }
        
        let tag : Int = button.tag
        
        guard let nextViewController = segue.destination as? RecipeViewController else {
            print("목적지가 RecipeeViewController가 아닙니다.")
            return
        }
        
        nextViewController.recipe = recipes[tag]
        
        if tag == 0 {
            print("0번 버튼 선택됨")
        } else if tag == 1 {
            print("1번 버튼 선택됨")
        } else if tag == 2 {
            print("2번 버튼 선택됨")
        } else if tag == 3 {
            print("3번 버튼 선택됨")
        }
        
    }

}

