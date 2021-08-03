//
//  OrchidModelView.swift
//  Orchid
//
//  Created by Thao Huynh on 8/3/21.
//

import Foundation

class OrchidModelView: ObservableObject {
    @Published private(set) var orchidModel: [OrchidModel] = []
    @Published private(set) var isLoading = false
    
    private var request: APIRequest<OrchidResource>?
    
    func fetchOrchid() {
        guard !isLoading else { return }
        isLoading = true
        let resource = OrchidResource()
        let request = APIRequest(resource: resource)
        self.request = request
        request.execute { [weak self] orchids in
//            self?.orchidModel = orchids ?? []
            self?.isLoading = false
        }
    }
}
