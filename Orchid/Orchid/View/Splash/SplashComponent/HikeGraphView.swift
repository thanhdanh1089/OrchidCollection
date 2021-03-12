//
//  HikeGraphView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/12/21.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct HikeGraphView: View {
    var hike: Hike
    var path: KeyPath<Hike.Observations, Range<Double>>
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return .red
        case \.pace:
            return .blue
        default:
            return .black
        }
    }
    
    
    var body: some View {
            let data = hike.observations
            let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
            let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
            let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

            return GeometryReader { proxy in
                HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                    ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                        GraphCapsuleView(
                            index: index,
                            height: proxy.size.height,
                            range: observation[keyPath: path],
                            overallRange: overallRange)
                            .colorMultiply(color)
                            .transition(.slide)
                            .animation(.ripple(index: index))
                    }
                    .offset(x: 0, y: proxy.size.height * heightRatio)
                }
            }
        }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

struct HikeGraphView_Previews: PreviewProvider {
    static var hike = HikeModelView().hikes[0]

    static var previews: some View {
        Group {
            HikeGraphView(hike: hike, path: \.elevation)
                .frame(height: 200)
            HikeGraphView(hike: hike, path: \.heartRate)
                .frame(height: 200)
            HikeGraphView(hike: hike, path: \.pace)
                .frame(height: 200)
        }
    }
}
