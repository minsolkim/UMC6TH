//
//  ContentView.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/1/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Button(action: {
                                
                            }) {
                                HStack {
                                    Text("광명동")
                                        .foregroundColor(.black)
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                            }) {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.black)
                            }
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                            }
                            
                            Button(action: {
                            }) {
                                Image(systemName: "bell")
                                    .foregroundColor(.black)
                            }
                        }
                    }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
            }
            
            NavigationView {
                NearbyView()
                    .navigationTitle("동네생활")
            }
            .tabItem {
                Image(systemName: "location.fill")
                Text("동네생활")
            }
            
            NavigationView {
                ChatView()
                    .navigationTitle("채팅")
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("채팅")
            }
            
            NavigationView {
                ProfileView()
                    .navigationTitle("나의 당근")
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("나의 당근")
            }
        }
    }
}

struct HomeView: View {
    @StateObject private var horizItemList = HorizItemList()
    @StateObject private var itemList = ItemList()
    
    var body: some View {
        List {
            ForEach(createTotalItems()) { totalItem in
                switch totalItem {
                case .item(let item):
                    ItemRow(item: item)
                case .horizItem:
                    HorizScrollView(horizItemList: horizItemList)
                        .frame(height: 250)
                }
            }
        }
        
    }
    
    func createTotalItems() -> [TotalItem] {
        var totalItems: [TotalItem] = []
        
        for item in itemList.items.prefix(3) {
            totalItems.append(.item(item))
        }
        
        if let firstHorizItem = horizItemList.items.first {
            totalItems.append(.horizItem(firstHorizItem))
        }
        
        for item in itemList.items.dropFirst(3) {
            totalItems.append(.item(item))
        }
        return totalItems
    }
    
}

struct NearbyView: View {
    var body: some View {
        VStack {
            Image(systemName: "location.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Nearby")
        }
        .padding()
    }
}

struct ChatView: View {
    var body: some View {
        VStack {
            Image(systemName: "message.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Chat")
        }
        .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Profile")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

