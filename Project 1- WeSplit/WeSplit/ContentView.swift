//
//	ContentView.swift
//	WeSplit
//
//	Created by Prathamesh Kowarkar on 2023-02-28.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		NavigationStack {
			Form {
				Section {
					Text("Hello, world!")
				}
			}
			.navigationTitle("SwiftUI")
			.navigationBarTitleDisplayMode(.inline)
		}
	}

}

struct ContentView_Previews: PreviewProvider {

	static var previews: some View {
		ContentView()
	}

}
