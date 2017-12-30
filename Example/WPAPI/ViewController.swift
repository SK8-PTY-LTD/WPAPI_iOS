//
//  ViewController.swift
//  BL
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import UIKit
import WPAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Post.list(page: 1, perPage: 5) { (response: Result<[Post]>) in

            switch response {
            case .success(let posts):
                print("List post successful, \(posts.count) posts retrieved: ---")
                for post in posts {
                    print("- \(post.title?.html2String ?? "Empty Title")")

                    Post.get(id: post.id!, completion: { (response: Result<Post>) in
                        switch response {
                        case .success(let post):
                            print("Get post successful! \(post.title?.html2String ?? "Empty Title")")
                            print("  ---")
                        case .failure(let error):
                            print(error)
                        }
                    })
                }
                print("---------------------------------------------------------")
            case .failure(let error):
                print(error)
            }
        }

        let post = Post(title: "Test Title", content: "<p>Test<br>Content<p>", featuredMedia: 3835, categories: [35])
        post.save() { (response: Result<Post>) in

            switch response {
            case .success(let post):
                print("Create post successful! \(post.title?.html2String ?? "Empty Title")")
                print("  ---")

                post.delete(force: false, completion: { (response: Result<Post>) in
                    switch response {
                    case .success(let post):
                        print("Delete post successful! \(post.title?.html2String ?? "Empty Title")")
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

