//
//  DescriptionView.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import SwiftUI

struct DescriptionView: View {
    
    // MARK: - Properties
    
    let info: String
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(L10n.coinInfoDescription)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(info)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    
    static let info: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eros eros, varius eget porta quis, blandit sit amet lorem. Fusce varius, metus ac mollis lobortis, sapien tortor congue lectus, ut aliquam leo orci quis mauris. Proin commodo felis vitae finibus laoreet. Sed feugiat finibus tincidunt. Fusce sagittis ornare odio vel tempor. Phasellus tincidunt risus vel lacus sagittis, eget ullamcorper nunc rutrum. Duis laoreet at purus quis fermentum. Donec cursus eget sem ac pretium. In molestie posuere magna ac sodales. Sed ultricies suscipit odio eget dignissim. Praesent finibus interdum magna, quis interdum magna venenatis sit amet. Curabitur egestas fermentum libero, eget faucibus magna eleifend quis. Phasellus at finibus massa. Curabitur quis est ante."
    
    static var previews: some View {
        DescriptionView(info: info)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        DescriptionView(info: info)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
