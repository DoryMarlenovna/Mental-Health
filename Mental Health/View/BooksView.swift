//
//  ContentView.swift
//  Mental Health
//
//  Created by Kalmakhanbet Dariga on 15.11.2024.
//

import SwiftUI

struct BooksView: View {
    
    @State private var searchText: String = ""
    
    private var data: [BookModel] = [
        BookModel(imageName: "1",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every"),
        BookModel(imageName: "2",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every"),
        BookModel(imageName: "3",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every"),
        BookModel(imageName: "4",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every"),
        BookModel(imageName: "5",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every"),
        BookModel(imageName: "6",
                  title: "The good guy",
                  avtor: "Mark mcallister",
                  discription: "A story about a guy who was very good until the very end when every")
    ]
    
    var body: some View {
        VStack{
            topView()
            
            searchView()
            
            booksView()
            Spacer()
        }
    }
    
    
    private let columns = [
        GridItem(.flexible()), // Flexible columns
        GridItem(.flexible()),
    ]
    
    private func booksView() -> some View {
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: columns, spacing: 20) {
                
                ForEach(data, id: \.self) { book in
                    bookView(book: book)
                }
            }
        }
        .padding()
    }
    
    private func bookView(book: BookModel) -> some View {
        VStack(alignment: .leading){
            Image(book.imageName)
                .resizable()
                .scaledToFit()
            
            Text(book.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .font(.system(size: 14, weight: .bold))
            
            Text(book.avtor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .font(.system(size: 12, weight: .medium))

            Text(book.discription)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 10, weight: .regular))

            
            HStack {
                
                HStack{
                    Image("icon1")
                        .resizable()
                        .scaledToFit()

                    Text("5m")
                        .foregroundColor(.white)
                       
                }
                .padding([.top, .bottom], 5)
                .frame(maxWidth: .infinity, maxHeight: 24)
                .background {Color("green")}
                .cornerRadius(8)
                
                HStack{
                    Image("icon2")
                        .resizable()
                        .scaledToFit()
                        .padding(2)
                    
                    Text("8m")
                        .foregroundColor(.white)
                }
                .padding([.top, .bottom], 5)
                .frame(maxWidth: .infinity, maxHeight: 24)
                .background {Color(.systemGray3)}
                .cornerRadius(8)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("greenWithOpacity"))
        .shadow(radius: 5)
    }
    
    
    private func searchView() -> some View {
        
        HStack{
            TextField("Search Book", text: $searchText)
                .frame(maxWidth: .infinity, maxHeight: 13)
                .padding()
            
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.gray)
                .padding(.trailing)
        }
        .background(Color("greenWithOpacity"))
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color("green"), lineWidth: 3)
        )
        .cornerRadius(50)
        
        .padding()
    }
    
    private func topView() -> some View {
        HStack {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal")
                .imageScale(.large)
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
