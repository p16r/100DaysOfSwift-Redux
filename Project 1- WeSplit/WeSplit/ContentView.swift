//
//	ContentView.swift
//	WeSplit
//
//	Created by Prathamesh Kowarkar on 2023-02-28.
//

import SwiftUI

struct ContentView: View {

	@State private var name = ""

	var body: some View {
		Form {
			TextField("Enter your name", text: $name)
			Text("Your name is \(name)")
		}
	}

}

struct ContentView_Previews: PreviewProvider {

	static var previews: some View {
		ContentView()
	}

}
