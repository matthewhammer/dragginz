import Array "mo:base/Array";
import Iter "mo:base/Iter";
import ArrayLib "./Array";

module {

  // An implementation of the Lagged Fibonacci Generator algorithm for pseudo-
  // random numbers in Motoko. We provide an initial seed.
  //
  // https://github.com/stanleygjones/hero-app-generator/blob/master/src/hackathon/Utils/Math.mo

  public class Random() {
    var sequence : [Nat] = [8,6,7,5,3,0,9];
    var j = 2;
    var k = 6;
    let mod = 100;

    public func seed(newSequence : [Nat]) { sequence := newSequence; };

    public func rnd() : Nat {
      for (_ in Iter.range(0, 99)) { cycle(); };
      ArrayUtils.last<Nat>(sequence);
    };
 
    public func sample<A>(arr : [A]) : A { arr[rnd() % arr.len()] };
 
    func cycle() {
      let fib = (sequence[j] + sequence[k]) % mod;
      sequence := Array.append(ArrayUtils.tail<Nat>(sequence), [fib]);
    };
  };
}; F 