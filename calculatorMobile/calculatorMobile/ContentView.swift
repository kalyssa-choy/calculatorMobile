//
//  ContentView.swift
//  calculatorMobile
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    
    //variables that keep track of the number being displayed, the 2 numbers being calculated, and if the all clear button should display C or AC
    @State private var tempNum:String = "0"
    @State private var num1:String = "0"
    @State private var num2:String = "0"
    @State private var opp:String = ""
    @State private var displayClear:Bool = false
    
    var body: some View {
        //background
        ZStack{
            //making the background black
            Color.black
                .ignoresSafeArea()
                .overlay{
                    
                    //calculator screen layout
                    VStack {
                        //displayed number section
                        Text("\(tempNum)")
                        //styling the display
                            .padding()
                            .frame(maxWidth: 325, alignment: .trailing)
                            .foregroundColor(.white)
                            .font(tempNum.count > 6 ? .system(size:50) : .system(size: 80))
                        
                        
                        //first row
                        HStack{
                            //The clear button
                            Button(action: {
                                //checks if there is a num1 that can be cleared
                                if tempNum == num1{
                                    num1 = "0"
                                    tempNum = "0"
                                    displayClear = false
                                }
                                //checks if there is a num2 that can be cleared
                                else if tempNum == num2{
                                    num2 = "0"
                                    tempNum = "0"
                                    displayClear = false
                                }
                                //checks for clearing
                                else if tempNum == "0" || tempNum == "ERROR"{
                                    opp = ""
                                    num1 = "0"
                                    num2 = "0"
                                    tempNum = "0"
                                    displayClear = false
                                }
                                
                            }, label: {
                                //styling
                                //checks if it should display C or AC
                                Text(displayClear ? "C" : "AC")
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                                    
                            })
                            //positive/negative button
                            Button(action: {
                                //checks if you are trying to change the num1 sign
                                if tempNum == num1{
                                    //allows for 0 to be negative
                                    if tempNum == "0" || tempNum == "-0"{
                                        if tempNum.contains("-"){
                                            tempNum = "0"
                                        }
                                        else{
                                            tempNum = "-0"
                                        }
                                        displayClear = false
                                    }
                                    //for making all non 0 numbers neg/pos
                                    else{
                                        //double math
                                        if tempNum.contains("."){
                                            tempNum = "\(Double(tempNum)! * (-1))"
                                        }
                                        //int math
                                        else{
                                            tempNum = "\(Int(tempNum)! * (-1))"
                                        }
                                        displayClear = true
                                    }
                                    //updates num 1
                                    num1 = tempNum
                                    
                                }
                                //checks if you are trying to change the num2 sign
                                else if tempNum == num2{
                                    //allows for 0 to be negative
                                    if tempNum == "0" || tempNum == "-0"{
                                        if tempNum.contains("-"){
                                            tempNum = "0"
                                        }
                                        else{
                                            tempNum = "-0"
                                        }
                                        displayClear = false
                                    }
                                    //for making all non 0 numbers neg/pos
                                    else{
                                        //double math
                                        if tempNum.contains("."){
                                            tempNum = "\(Double(tempNum)! * (-1))"
                                        }
                                        //int math
                                        else{
                                            tempNum = "\(Int(tempNum)! * (-1))"
                                        }
                                        displayClear = true
                                    }
                                    //updating num2
                                    num2 = tempNum
                                }
                                
                            }, label: {
                                Text("+/-")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            //percentage button (makes number a percent)
                            Button(action: {
                                //making num1 a percent
                                if tempNum == num1{
                                    tempNum = "\(Double(tempNum)!/100)"
                                    num1 = tempNum
                                }
                                //making num2 a percent
                                else{
                                    tempNum = "\(Double(tempNum)!/100)"
                                    num2 = tempNum
                                }
                                displayClear = true
                            }, label: {
                                Text("%")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            //button for choosing the division opperand
                            Button(action: {
                                //updating temp num and the operator
                                opp = "÷"
                                tempNum = "0"
                            }, label: {
                                Text("÷")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                //ternary opperator to check if it is in use for styling properties
                                    .foregroundColor(opp == "÷" ? .orange : .white)
                                    .background(opp == "÷" ? Color.white : Color.orange)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                        }
                        //second row
                        HStack{
                            //button for #7
                            Button(action: {
                                //checks to see if more numbers can be displayed
                                if tempNum.count < 9{
                                    //checking if the user wants to change to num1
                                    if opp == ""{
                                        //gets rid of the 0 and makes it 7
                                        if num1 == "0"{
                                            num1 = "7"
                                        }
                                        //ensures the 7 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-7"
                                        }
                                        //adding 7 to the end of the number
                                        else{
                                            num1 += "7"
                                        }
                                        
                                        //updating display
                                        tempNum = num1
                                    }
                                    //checks to see if the user wants to change to num2
                                    else{
                                        //removes 0 and makes it 7
                                        if num2 == "0"{
                                            num2 = "7"
                                        }
                                        //ensures the 7 will be negatie if 0 is negatie
                                        else if num2 == "-0"{
                                            num2 = "-7"
                                        }
                                        //adding 7 to the end of the number
                                        else{
                                            num2 += "7"
                                        }
                                        
                                        //updating display
                                        tempNum = num2
                                    }
                                    //updating if clear should be displayed
                                    displayClear = true
                                }
                                
                            }, label: {
                                Text("7")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            //button for #8
                            Button(action: {
                                //ensures the user can only add numbers if there is space to (9 characters max)
                                if tempNum.count < 9{
                                    //checking to see if num1 needs to be updated
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "8"
                                        }
                                        else if num1 == "-0"{
                                            num1 = "-8"
                                        }
                                        else{
                                            num1 += "8"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0"{
                                            num2 = "8"
                                        }
                                        else if num2 == "-0"{
                                            num2 = "-8"
                                        }
                                        else{
                                            num2 += "8"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("8")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            //button for #9
                            Button(action: {
                                //ensuring that there is space to add more numbers to the end of a num
                                if tempNum.count < 9{
                                    //checking to see if num1 needs to be updated
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "9"
                                        }
                                        else if num1 == "-0"{
                                            num1 = "-9"
                                        }
                                        else{
                                            num1 += "9"
                                        }
                                        tempNum = num1
                                    }
                                    //checking to see if num2 needs to be updated
                                    else{
                                        if num2 == "0"{
                                            num2 = "9"
                                        }
                                        else if num2 == "-0"{
                                            num2 = "-9"
                                        }
                                        else{
                                            num2 += "9"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("9")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            //button for choosing the multiplication opperand
                            Button(action: {
                                //updating operator to be multiplication
                                opp = "x"
                                //resetting display
                                tempNum = "0"
                            }, label: {
                                Text("x")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                //ternary operator to check if operand is in use
                                    .foregroundColor(opp == "x" ? .orange : .white)
                                    .background(opp == "x" ? Color.white : Color.orange)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                        }
                        //third row
                        HStack{
                            Button(action: {
                                //checking there's space to add more numbers
                                if tempNum.count < 9{
                                    //checking to see if num1 should be updated
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "4"
                                        }
                                        else if num1 == "-0"{
                                            num1 = "-4"
                                        }
                                        else{
                                            num1 += "4"
                                        }
                                        tempNum = num1
                                    }
                                    //checking to see if num2 should be updated
                                    else{
                                        if num2 == "0"{
                                            num2 = "4"
                                        }
                                        else if num2 == "-0"{
                                            num2 = "-4"
                                        }
                                        else{
                                            num2 += "4"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("4")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //checking to see if there's space to add more nubers
                                if tempNum.count < 9{
                                    //checking to see if num1 should be updated
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "5"
                                        }
                                        //ensures the 5 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-5"
                                        }
                                        else{
                                            num1 += "5"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num 2
                                    else{
                                        if num2 == "0"{
                                            num2 = "5"
                                        }
                                        //ensures the 5 will be negative if 0 is negative
                                        else if num2 == "-0"{
                                            num2 = "-5"
                                        }
                                        else{
                                            num2 += "5"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("5")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //checking for space to add more numbers
                                if tempNum.count < 9{
                                    //updating num1
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "6"
                                        }
                                        //ensures the 6 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-6"
                                        }
                                        else{
                                            num1 += "6"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0"{
                                            num2 = "6"
                                        }
                                        //ensures the 6 will be negative if 0 is negative
                                        else if num2 == "-0"{
                                            num2 = "-6"
                                        }
                                        else{
                                            num2 += "6"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("6")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //updating operand to subtraction
                                opp = "-"
                                //resetting display
                                tempNum = "0"
                            }, label: {
                                Text("-")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                //ternary operator to change styling while button in use
                                    .foregroundColor(opp == "-" ? .orange : .white)
                                    .background(opp == "-" ? Color.white : Color.orange)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                        }
                        //fourth row
                        HStack{
                            Button(action: {
                                //checking if theres more space for more numbers
                                if tempNum.count < 9{
                                    //updating num1
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "1"
                                        }
                                        //ensures the 1 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-1"
                                        }
                                        else{
                                            num1 += "1"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0"{
                                            num2 = "1"
                                        }
                                        //ensures the 1 will be negative if 0 is negative
                                        else if num2 == "-0"{
                                            num2 = "-1"
                                        }
                                        else{
                                            num2 += "1"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("1")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //ensuring there's space to add more numbers
                                if tempNum.count < 9{
                                    //updating num1
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "2"
                                        }
                                        //ensures the 2 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-2"
                                        }
                                        else{
                                            num1 += "2"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0"{
                                            num2 = "2"
                                        }
                                        //ensures the 2 will be negative if 0 is negative
                                        else if num2 == "-0"{
                                            num2 = "-2"
                                        }
                                        else{
                                            num2 += "2"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("2")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //ensuring there's space to add more nums
                                if tempNum.count < 9{
                                    //updating num1
                                    if opp == ""{
                                        if num1 == "0"{
                                            num1 = "3"
                                        }
                                        //ensures the 3 will be negative if 0 is negative
                                        else if num1 == "-0"{
                                            num1 = "-3"
                                        }
                                        else{
                                            num1 += "3"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0"{
                                            num2 = "3"
                                        }
                                        //ensures the 3 will be negative if 0 is negative
                                        else if num2 == "-0"{
                                            num2 = "-3"
                                        }
                                        else{
                                            num2 += "3"
                                        }
                                        tempNum = num2
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text("3")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //updating opp to be addition
                                opp = "+"
                                //resetting display
                                tempNum = "0"
                            }, label: {
                                Text("+")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                //ternary operator for changing styling when button in use
                                    .foregroundColor(opp == "+" ? .orange : .white)
                                    .background(opp == "+" ? Color.white : Color.orange)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                        }
                        //fifth row
                        HStack{
                            Button(action: {
                                //ensures there's space to add numbers
                                if tempNum.count < 9{
                                    //updating num1
                                    if opp == ""{
                                        if num1 == "0" || num1 == ""{
                                            num1 = "0"
                                            displayClear = false
                                        }
                                        else{
                                            num1 += "0"
                                            displayClear = true
                                            tempNum = "wrong"
                                        }
                                        tempNum = num1
                                    }
                                    //updating num2
                                    else{
                                        if num2 == "0" || num2 == ""{
                                            num2 = "0"
                                        }
                                        else{
                                            num2 += "0"
                                        }
                                        displayClear = true
                                        tempNum = num2
                                    }
                                    
                                }
                            }, label: {
                                Text("0")
                                //styling
                                    .frame(width:120, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            Button(action: {
                                //ensuring there's space to add decimal
                                if tempNum.count < 9{
                                    //updating num 1
                                    if opp == ""{
                                        if !num1.contains("."){
                                            if num1 == "" || num1 == "0"{
                                                num1 = "0."
                                            }
                                            else{
                                                num1 += "."
                                            }
                                            tempNum = num1
                                        }
                                        
                                        
                                    }
                                    //updating num 2
                                    else{
                                        if !num2.contains("."){
                                            if num2 == "" || num2 == "0"{
                                                num2 = "0."
                                            }
                                            else{
                                                num2 += "."
                                            }
                                            tempNum = num2
                                        }
                                        
                                    }
                                    //updating AC/C button
                                    displayClear = true
                                }
                            }, label: {
                                Text(".")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                            
                            //equals button: finds answer
                            Button(action: {
                                //calculating the quotient
                                if opp == "÷"{
                                    if num2 == "" || num2 == "0" || num2 == "0." || Double(num2)! == 0{
                                        tempNum = "ERROR"
                                    }
                                    else{
                                        if num1.contains(".") || num2.contains("."){
                                            tempNum = "\(Double(num1)!/Double(num2)!)"
                                        }
                                        else{
                                            tempNum = "\(Int(num1)!/Int(num2)!)"
                                        }
                                        num1 = tempNum
                                        num2 = "0"
                                    }
                                    opp = ""
                                    
                                }
                                //calculating the product
                                else if opp == "x"{
                                    if num1.contains(".") || num2.contains("."){
                                        tempNum = "\(Double(num1)! * Double(num2)!)"
                                    }
                                    else{
                                        tempNum = "\(Int(num1)! * Int(num2)!)"
                                    }
                                    opp = ""
                                    num1 = tempNum
                                    num2 = "0"
                                }
                                //calculating the difference
                                else if opp == "-"{
                                    if num1.contains(".") || num2.contains("."){
                                        tempNum = "\(Double(num1)! - Double(num2)!)"
                                    }
                                    else{
                                        tempNum = "\(Int(num1)! - Int(num2)!)"
                                    }
                                    opp = ""
                                    num1 = tempNum
                                    num2 = "0"
                                }
                                //calculating the sum
                                else if opp == "+"{
                                    if num1.contains(".") || num2.contains("."){
                                        tempNum = "\(Double(num1)! + Double(num2)!)"
                                    }
                                    else{
                                        tempNum = "\(Int(num1)! + Int(num2)!)"
                                    }
                                    opp = ""
                                    num1 = tempNum
                                    num2 = "0"
                                }
                                
                            }, label: {
                                Text("=")
                                //styling
                                    .frame(width:40, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.orange)
                                    .cornerRadius(100)
                                    .font(.system(size: 25))
                            })
                        }
                        
                        
                    }
                }
        }
    }
    
}

#Preview {
    ContentView()
}
