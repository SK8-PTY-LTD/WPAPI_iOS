//
//  ViewController.swift
//  BL
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let wpClient = WPClient(authorizationToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYmVhbmxpbmtlZC5zazh0ZWNoLmlvIiwiaWF0IjoxNTE0MzMzMDY5LCJuYmYiOjE1MTQzMzMwNjksImV4cCI6MTUxNDkzNzg2OSwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMzk3In19fQ.4E4_ihynD2QW5ZXrscE9XnSMmjtT5nP53UFvgAtC7Vs")
        
        Post.list(page: 1, perPage: 5, search: "Lab") { (response: Result<[Post]>) in

            switch response {
            case .success(let posts):
                for post in posts {
                    print("List post successful! \(post.title?.html2String ?? "Empty Title")")
                    print("  ---")

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

        Ad.list(page: 1, perPage: 5, search: "Pod") { (response: Result<[Ad]>) in

            switch response {
            case .success(let ads):
                for ad in ads {
                    print("List ads successful! \(ad.currency ?? "Empty Title")")
                    print("  ---")

                    Ad.get(id: ad.id!, completion: { (response: Result<Ad>) in
                        switch response {
                        case .success(let ad):
                            print("Get ad successful! \(ad.unit ?? "Empty Title")")
                            print("  ---")
                        case .failure(let error):
                            print(error)
                        }
                    })
                }
            case .failure(let error):
                print("FUCK")
                print(error)
            }
        }

        let ad = Ad(title: "test ad", content: "<p>test<br>content</p>", featured_media: nil, categories: nil, expiryDate: Date(), vendor: 130, productUrl: "https://google.com", currency: "AUD", unit: "Kilo", imageArray: ["123"], totalPriceInCent: 2990)
        ad.save() { (response: Result<Ad>) in

            switch response {
            case .success(let ad):
                print("Create ad successful! \(ad.title?.html2String ?? "Empty Title")")
                print("  ---")

                ad.delete(force: false, completion: { (response: Result<Ad>) in
                    switch response {
                    case .success(let ad):
                        print("Delete ad successful! \(ad.content?.html2String ?? "Empty Title")")
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

