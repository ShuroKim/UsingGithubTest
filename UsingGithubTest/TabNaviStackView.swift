//
//  TabNaviStackView.swift
//  UsingGithubTest
//
//  Created by Shuraw on 3/25/24.
//

import SwiftUI

struct TabNaviStackView: View {
    let appleProducts = ["Mac", "Macbook", "iPhone", "iPad"]
    @State private var stackPath: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List(appleProducts, id: \.self) { product in
                Button {
                    stackPath.append(product)
                } label: {
                    Text("\(product)")
                        .font(.largeTitle).bold()
                }
                
                Button {
                    stackPath.append(product.hashValue)
                } label: {
                    Text("\(product) 넘버로 네비게이션")
                }
            }
            .navigationTitle("네비게이션 스택")
            .navigationDestination(for: String.self) { product in
                AppleProductView(product: product, path: $stackPath)
            }
            .navigationDestination(for: Int.self) { num in
                Text("\(num) 숫자 선택")
            }
        }
    }
}

struct AppleProductView: View {
    let product: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            Text(product)
                .font(.largeTitle)
                .onTapGesture {
                    path.append("\(product) 깊게깊게")
                }
            
            Text("remove")
                .onTapGesture {
                    path.removeLast()
                }
            
            Text("all clear")
                .onTapGesture {
                    path = .init()
                }
        })
    }
}

#Preview {
    TabNaviStackView()
}
