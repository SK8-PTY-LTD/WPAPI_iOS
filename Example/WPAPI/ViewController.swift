//
//  ViewController.swift
//  BL
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import UIKit
import WPAPI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var postArray = [BLPost]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BLPost.list(page: 1, perPage: 5, categories: [32, 23], filters: ["vendor": 399 as AnyObject]) { (response: Result<[BLPost]>) in
            
            switch response {
            case .success(let posts):
                print("List post successful, \(posts.count) posts retrieved: ---")
                for post in posts {
                    print("- \(post.title?.html2String ?? "Empty Title")")
                    
                }
                print("---------------------------------------------------------")

                self.postArray = posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
//        Post.list(page: 1, perPage: 5, categories: [32, 12]) { (response: Result<[Post]>) in
//
//            switch response {
//            case .success(let posts):
//                print("List post successful, \(posts.count) posts retrieved: ---")
//
//                self.postArray = posts
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//
//                for post in posts {
//                    print("- \(post.title?.html2String ?? "Empty Title")")
//
////                    Post.get(id: post.id!, completion: { (response: Result<Post>) in
////                        switch response {
////                        case .success(let post):
////                            print("Get post successful! \(post.title?.html2String ?? "Empty Title")")
////                            print("  ---")
////                        case .failure(let error):
////                            print(error)
////                        }
////                    })
//                }
//                print("---------------------------------------------------------")
//            case .failure(let error):
//                print(error)
//            }
//        }

//        let post = Post(title: "Test Title", content: "<p>Test<br>Content<p>", featuredMedia: 3835, categories: [35])
//        post.save() { (response: Result<Post>) in
//
//            switch response {
//            case .success(let post):
//
//                print("Create post successful! \(post.title?.html2String ?? "Empty Title")")
//                print("  ---")
//
//                post.delete(force: false, completion: { (response: Result<Post>) in
//                    switch response {
//                    case .success(let post):
//                        print("Delete post successful! \(post.title?.html2String ?? "Empty Title")")
//                        print("  ---")
//                    case .failure(let error):
//                        print(error)
//                    }
//                })
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true) {
            print("Finished picking")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = postArray[indexPath.row].title
        cell.detailTextLabel?.text = postArray[indexPath.row].content
        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        let media = Media(image: image)
        media.save { (response: Result<Media>) in
            
            
            switch response {
            case .success(let media):
                
                print("Create media successful! \(String(media.id!))")
                print("  ---")
                
                media.delete(force: false, completion: { (response: Result<Media>) in
                    switch response {
                    case .success(let media):
                        print("Delete media successful! \(String(media.id!))")
                        print("  ---")
                    case .failure(let error):
                        print(error)
                    }
                })
            case .failure(let error):
                print(error)
            }
        }
        
    }


}

