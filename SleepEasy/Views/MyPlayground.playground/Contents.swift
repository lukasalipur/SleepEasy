import SwiftUI

struct TestView: View {
    var body: some View {
        VStack{
            ForEach(0..<5) { number in
                List{
                    Text("\(number)")
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
