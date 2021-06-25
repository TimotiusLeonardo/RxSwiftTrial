import UIKit
import RxSwift
import RxCocoa
import RxRelay

// Publisher Object
let pSub = PublishSubject<String>()
pSub.onNext("PS E1 1")

let ob1 = pSub.subscribe(onNext: { element in
    print(element)
    // nothing will happen until the next .onNext
})

pSub.onNext("PS E1 2")

// Behaviour Subject
let bSub = BehaviorSubject<String>(value: "BS E1 1")
let ob2 = bSub.subscribe { element in
    if let value = element.element {
        print(value)
    }
}

// Replay Subject
let rSub = ReplaySubject<Int>.create(bufferSize: 3)
rSub.onNext(1)
rSub.onNext(2)
rSub.onNext(3)

let ob3 = rSub.subscribe(onNext: { element in
    print(element)
})

// Async Subject
let aSub = AsyncSubject<String>()
aSub.onNext("aSub E1 1")
aSub.onNext("aSub E1 2")

aSub.onCompleted()

let ob4 = aSub.subscribe(onNext: { element in
    print(element)
})

// Publish Relay
let pRel = PublishRelay<String>()
pRel.accept("pRel E1 1")

let ob5 = pRel.subscribe(onNext: { element in
    print(element)
})

pRel.accept("pRel E1 2")


// Behaviour Relay
let bRel = BehaviorRelay<String>(value: "bRel E1 1")

let ob6 = bRel.subscribe(onNext: {
    element in
    print(element)
})

bRel.accept("bRel E1 2")

