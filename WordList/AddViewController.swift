//
//  AddViewController.swift
//  WordList
//
//  Created by 安部瞳 on 2023/05/01.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as![Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        if englishTextField.text!.isEmpty == false && japaneseTextField.text!.isEmpty == false {
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        } else {
            let alert1 = UIAlertController(
                title: "入力エラー",
                message: "単語を入力してください",
                preferredStyle: .alert
            )
            alert1.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert1, animated: true, completion: nil)
        }
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
