//
//  CustomRefreshIndicator.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 20/05/25.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct CustomRefreshableScrollView<Content: View>: UIViewRepresentable {
    let content: Content
    @Binding var isRefreshing: Bool
    let onRefresh: () -> Void
    let tintColor: UIColor
    let backgroundColor: UIColor

    init(isRefreshing: Binding<Bool>,
         tintColor: UIColor = .systemBlue,
         backgroundColor: UIColor = .clear,
         onRefresh: @escaping () -> Void,
         @ViewBuilder content: () -> Content) {
        self._isRefreshing = isRefreshing
        self.onRefresh = onRefresh
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()

        let hostedView = UIHostingController(rootView: content)
        hostedView.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hostedView.view)

        NSLayoutConstraint.activate([
            hostedView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostedView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostedView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostedView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostedView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = tintColor
        refreshControl.backgroundColor = backgroundColor

        refreshControl.addTarget(context.coordinator,
                                 action: #selector(Coordinator.handleRefresh),
                                 for: .valueChanged)

        scrollView.refreshControl = refreshControl
        context.coordinator.refreshControl = refreshControl

        return scrollView
    }

    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        if isRefreshing {
            scrollView.refreshControl?.beginRefreshing()
        } else {
            scrollView.refreshControl?.endRefreshing()
        }
    }

    class Coordinator: NSObject {
        var parent: CustomRefreshableScrollView
        weak var refreshControl: UIRefreshControl?

        init(parent: CustomRefreshableScrollView) {
            self.parent = parent
        }

        @objc func handleRefresh() {
            parent.onRefresh()
        }
    }
}
