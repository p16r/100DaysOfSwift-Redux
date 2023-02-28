//
//	ContentView.swift
//	WeSplit
//
//	Created by Prathamesh Kowarkar on 2023-02-28.
//

import SwiftUI

struct ContentView: View {

	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20

	@FocusState private var amountIsFocused: Bool

	private var totalAmount: Double {
		let tipSelection = Double(tipPercentage)
		let tipValue = checkAmount / 100 * tipSelection

		let grandTotal = checkAmount + tipValue

		return grandTotal
	}

	private var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		let amountPerPerson = totalAmount / peopleCount

		return amountPerPerson
	}

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
						.keyboardType(.decimalPad)
						.focused($amountIsFocused)

					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2 ..< 100) {
							Text("\($0) people")
						}
					}
				}

				Section(
					content: {
						Picker("Tip percentage", selection: $tipPercentage) {
							ForEach(0..<101, id: \.self) {
								Text($0, format: .percent)
							}
						}
					},
					header: {
						Text("How much tip do you want to leave?")
					}
				)

				Section(
					content: {
						Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
					},
					header: {
						Text("Total amount")
					}
				)

				Section(
					content: {
						Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
					},
					header: {
						Text("Amount per person")
					}
				)
			}
			.navigationTitle("WeSplit")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()

					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
	}

}

struct ContentView_Previews: PreviewProvider {

	static var previews: some View {
		ContentView()
	}

}
