import Foundation
import RxSwift
public extension Solana {
    @available(*, deprecated, message: "Use getBlock insted")
    func getConfirmedBlock(slot: UInt64, encoding: String = "json") -> Single<ConfirmedBlock> {
        Single.create { emitter in
            self.getConfirmedBlock(slot: slot, encoding: encoding) {
                switch $0 {
                case .success(let confirmedBlock):
                    emitter(.success(confirmedBlock))
                case .failure(let error):
                    emitter(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}
