import Foundation
import UIKit

class Model {
    static let shared = Model()
    
    var dataObservers = [ObserverDelegate]()

    var user: Usuario?
    
    private init() {
        
    }
}
