//
//  ContentView.swift
//  CoverterUnits
//
//  Created by Raul Sfirlogea on 22/07/2020.
//  Copyright © 2020 Raul Sfirlogea. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var unitSelect1 = 0
    @State private var unitSelect2 = 1
    @State private var unitsSelect = ["sec", "min", "hours"]

    var calcul: Double{
        let aaa = Double (amount) ?? 0
        var unit1rez = UnitDuration.seconds
        var unit2rez = UnitDuration.minutes
        let unit1 = String(unitsSelect[unitSelect1])
        let unit2 = String(unitsSelect[unitSelect2])
        
        switch unit1 {
        case "sec":
            unit1rez = UnitDuration.seconds
        case "min":
            unit1rez = UnitDuration.minutes
        default:
            unit1rez = UnitDuration.hours
        }
        
        switch unit2 {
        case "sec":
            unit2rez = UnitDuration.seconds
        case "min":
            unit2rez = UnitDuration.minutes
        default:
            unit2rez = UnitDuration.hours
        }
        

        let amountstart = Measurement(value: aaa , unit: unit1rez)
        let amountend = amountstart.converted(to: unit2rez).value
        
        return amountend
        
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amoun", text: $amount)
                        .keyboardType(.numberPad)
                    
                    Picker ("From Unit", selection: $unitSelect1){
                    ForEach (0 ..< unitsSelect.count){
                        Text("\(self.unitsSelect[$0])")
                        }
                    }
                }
                Section {
                    Picker ("To Unit", selection: $unitSelect2){
                        ForEach (0 ..< unitsSelect.count){
                            Text("\(self.unitsSelect[$0])")
                        }
                    }
                    Text("\(calcul, specifier: "%.d2")")


                    
                }
            }
        .navigationBarTitle("Converter")
        }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
