import SwiftUI

struct RangeSlider: View {
    @Binding var range: ClosedRange<Double>
    let bounds: ClosedRange<Double>
    let step: Double
    
    init(
        range: Binding<ClosedRange<Double>>,
        bounds: ClosedRange<Double> = 0...100,
        step: Double = 1
    ) {
        self._range = range
        self.bounds = bounds
        self.step = step
    }
    
    var body: some View {
        GeometryReader { geometry in
            let trackWidth = geometry.size.width
            let thumbSize: CGFloat = 24
            let trackHeight: CGFloat = 6
            
            ZStack(alignment: .leading) {
                // Background track
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .fill(Color.grey400)
                    .frame(height: trackHeight)
                
                // Active track
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .fill(Color.brandPrimary)
                    .frame(
                        width: activeTrackWidth(trackWidth: trackWidth),
                        height: trackHeight
                    )
                    .offset(x: activeTrackOffset(trackWidth: trackWidth))
                
                // Lower thumb
                Circle()
                    .fill(Color.brandPrimary)
                    .frame(width: thumbSize, height: thumbSize)
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                    .offset(x: thumbOffset(for: range.lowerBound, trackWidth: trackWidth) - thumbSize / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                updateLowerBound(dragValue: value, trackWidth: trackWidth)
                            }
                    )
                
                // Upper thumb
                Circle()
                    .fill(Color.brandPrimary)
                    .frame(width: thumbSize, height: thumbSize)
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                    .offset(x: thumbOffset(for: range.upperBound, trackWidth: trackWidth) - thumbSize / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                updateUpperBound(dragValue: value, trackWidth: trackWidth)
                            }
                    )
            }
            .frame(height: thumbSize)
        }
        .frame(height: 24)
    }
    
    // MARK: - Helper Functions
    
    private func thumbOffset(for value: Double, trackWidth: CGFloat) -> CGFloat {
        let percent = (value - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)
        return trackWidth * CGFloat(percent)
    }
    
    private func activeTrackOffset(trackWidth: CGFloat) -> CGFloat {
        thumbOffset(for: range.lowerBound, trackWidth: trackWidth)
    }
    
    private func activeTrackWidth(trackWidth: CGFloat) -> CGFloat {
        let startOffset = thumbOffset(for: range.lowerBound, trackWidth: trackWidth)
        let endOffset = thumbOffset(for: range.upperBound, trackWidth: trackWidth)
        return endOffset - startOffset
    }
    
    private func updateLowerBound(dragValue: DragGesture.Value, trackWidth: CGFloat) {
        let percent = dragValue.location.x / trackWidth
        let newValue = bounds.lowerBound + (bounds.upperBound - bounds.lowerBound) * Double(percent)
        let steppedValue = round(newValue / step) * step
        let clampedValue = min(max(steppedValue, bounds.lowerBound), range.upperBound - step)
        range = clampedValue...range.upperBound
    }
    
    private func updateUpperBound(dragValue: DragGesture.Value, trackWidth: CGFloat) {
        let percent = dragValue.location.x / trackWidth
        let newValue = bounds.lowerBound + (bounds.upperBound - bounds.lowerBound) * Double(percent)
        let steppedValue = round(newValue / step) * step
        let clampedValue = max(min(steppedValue, bounds.upperBound), range.lowerBound + step)
        range = range.lowerBound...clampedValue
    }
}

#Preview {
    VStack(spacing: 30) {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Level range")
                    .font(.custom("Fredoka-Medium", size: 16))
                    .foregroundColor(Color.text1)
                
                Spacer()
                
                Text("1-99")
                    .font(.body1)
                    .foregroundColor(Color.text1)
            }
            
            RangeSlider(
                range: .constant(1...99),
                bounds: 1...99,
                step: 1
            )
        }
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Price range")
                    .font(.custom("Fredoka-Medium", size: 16))
                    .foregroundColor(Color.text1)
                
                Spacer()
                
                Text("$10-$90")
                    .font(.body1)
                    .foregroundColor(Color.text1)
            }
            
            RangeSlider(
                range: .constant(10...90),
                bounds: 0...100,
                step: 5
            )
        }
    }
    .padding(20)
}