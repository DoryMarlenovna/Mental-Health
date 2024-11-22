//
//  CarouselView.swift
//  Mental Health
//
//  Created by bakebrlk on 23.11.2024.
//

import SwiftUI

struct CarouselView: View {
    
    let items: [OnBordingModel] // Replace String with your model type if needed
    @State private var currentPage = 0 // Отслеживание текущей страницы
    
    init(items: [OnBordingModel]) {
        self.items = items
        
        // Customize page indicator colors
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "green")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray3
    }
    
    var body: some View {
        
        TabView(selection: $currentPage) {
            ForEach(items.indices, id: \.self) { index in
                
                CarouselItemView(item: items[index])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    .shadow(radius: 5)
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(maxWidth: .infinity,
               maxHeight: UIScreen.main.bounds.height * 0.6) // Adjust height based on your content
    }
    
    
}

struct CarouselItemView: View {
    let item: OnBordingModel
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.system(size: 28))
                .lineLimit(nil)
                .padding()
            
            
            Image(item.imageName)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
        
    }
}

