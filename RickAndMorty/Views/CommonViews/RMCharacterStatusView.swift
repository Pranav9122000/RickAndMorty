//
//  RMCharacterStatusView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 28/02/24.
//

import SwiftUI

struct RMCharacterStatusView: View {
    
    let status: RMCharacterStatus
    let color: Color = Color.black
    
    func getColor(status: RMCharacterStatus) -> Color {
        switch status {
        case .alive:
            return Color.green
        case .dead:
            return Color.red
        case .unknown:
            return Color.gray
        }
    }
    
    init(status: RMCharacterStatus) {
            self.status = status
        }
    
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(getColor(status: status))
            Text(status.text)
                .font(.subheadline)
        }
    }
}

#Preview {
    RMCharacterStatusView(status: RMCharacterStatus.alive)
}
