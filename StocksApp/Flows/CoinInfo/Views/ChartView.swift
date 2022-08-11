//
//  ChartView.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI

struct ChartView: View {
    
    // MARK: - Properties
    
    let model: ChartsViewModel
    @State var selectedInterval: ChartInterval = .thirtyDays
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if let chart = model.charts[selectedInterval] {
                HStack {
                    Text(model.id)
                        .font(.title2)
                        .bold()
                        .frame(alignment: .leading)
                    Spacer()
                    Text(chart.changePercentage)
                        .font(.title3)
                        .foregroundColor(chart.chartColor)
                        .frame(alignment: .trailing)
                }
                Picker("", selection: $selectedInterval) {
                    ForEach(model.chartIntervals, id: \.self) {
                        Text($0.title)
                    }
                }.pickerStyle(.segmented)
            }
            
            chartView
        }
    }
    
    var chartView: some View {
        VStack {
            if let chart = model.charts[selectedInterval] {
                GeometryReader { geometry in
                    Path { path in
                        for (index, value) in chart.data.enumerated() {
                            
                            let xPos = geometry.size.width / CGFloat(chart.data.count) * CGFloat(index + 1)
                            let yHeight = chart.maxValue - chart.minValue
                            let yPos = (1 - CGFloat((value - chart.minValue) / yHeight)) * geometry.size.height
                            
                            if index == 0 {
                                path.move(to: .init(x: xPos, y: yPos))
                            }
                            path.addLine(to: .init(x: xPos, y: yPos))
                        }
                    }.stroke(chart.chartColor, style: StrokeStyle(lineWidth: 1.0, lineCap: .round, lineJoin: .round))
                        .shadow(color: chart.chartColor, radius: 4.0, x: 0, y: 3)
                }.background(
                    VStack {
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                    }
                ).overlay(
                    VStack {
                        Text(chart.maxValueFormatted)
                        Spacer()
                        Text(chart.midValueFormatted)
                        Spacer()
                        Text(chart.minValueFormatted)
                    }.padding(.leading, 5.0),
                    alignment: .leading)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(model: .init(title: "", data: []))
    }
}
