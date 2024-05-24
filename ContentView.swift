import SwiftUI

struct ContentView: View {
    @State var CurrentGrade : Int = 0 
    @State var DesiredGrade : Int = 0 
    @State var FinalWeight : Int = 0 
    @State var GradeYouNeed : Int = 0
    @State var showingAlert = false
    @State var stepOne = 0
    @State var stepTwo = 0
    @State var stepThree = 0 
    @State var neededGrade = 0
    
    var body: some View {
        VStack{
            Text("Final Grade Calculator")
                .font(.largeTitle)
                .padding()
            Text("Enter Information Below")
            
            TextField("Enter Current Grade:", value: $CurrentGrade, formatter: NumberFormatter())
                .font(.title)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding()  
            TextField("Enter Desired Grade:", value: $DesiredGrade, formatter: NumberFormatter())
                .font(.title)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding()  
            TextField("Enter Final Weight on Grade:", value : $FinalWeight, formatter:  NumberFormatter())
                .font(.title)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding()  
            
            Button("Calculate Final Grade"){
                showingAlert = true
                stepOne = (1 - FinalWeight / 100)
                stepTwo = (stepOne * CurrentGrade)
                stepThree = (DesiredGrade - stepTwo)
                neededGrade = (stepThree / FinalWeight)
                //Alert(title: "You need a:", message: "\(GradeYouNeed)")
                //Alert(title: "You need a: ", message: "good luck", dismissButton: .cancel())
            }
            .frame(width: 200, height: 30, alignment: .center)
            .foregroundColor(.white)
            .background(.red)
            .position(x: 220, y: 15)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("You need a: "), message: Text("\(neededGrade)"), dismissButton: .default(Text("Got it")))
            }
        }
    }
}

