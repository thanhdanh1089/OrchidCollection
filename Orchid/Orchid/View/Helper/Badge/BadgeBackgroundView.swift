//
//  BadgeBackgroundView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/18/21.
//

import SwiftUI

struct BadgeBackgroundView: View {
    static let symbolColor = Color(red: 232 / 255, green: 159 / 255, blue: 77 / 255)
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffSet: CGFloat = (width * (1.0 - xScale)) / 2
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffSet,
                        y: height * (0.2 + HexagonParameters.adjustment))
                )
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffSet,
                            y: height * segment.line.y))
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffSet,
                            y: height * segment.curve.y),
                        control: CGPoint(
                            x: width * segment.control.x + xOffSet,
                            y: height * segment.control.y))
                }
                
            }
            .fill(
                LinearGradient(
                    gradient: .init(colors: [Color.green, Color.blue]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.5)
            ))
        }
    }
}

struct BadgeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackgroundView()
    }
}
