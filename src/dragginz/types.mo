import Hash "mo:base/Hash";
import Result "mo:base/Result";

module {

  // Special
  public type ID = Word32;

  // TODO
  public type TODO = Nat;

  // Template Types
  // here we want to define Name as a Text string, but it
  // also has special rules on validation and sanitisation
  //
  public type EntityName = Text;  // generic name for any entity
  public type Description = Text;
  public type Level = Nat;
  public type Class = Text;
  public type Series = Nat;
  public type UUID = Text;
  public type Weighting = Nat;

  //
  // Compound Types
  //

  // Colour
  public type Colour = {
    r: Float;
    g: Float;
    b: Float;
    a: Float;  
  };

  // GameDate
  public type GameDate = {
    year: Nat;
    day:  Nat;
  };

  // Quaternion
  public type Quaternion = {
    foo: Float;
    bar: Float;
  };

  // Vector
  public type Vector = {
    x: Float;
    y: Float;
    z: Float;
  };

  //
  // Physics
  // These will eventually have strict ranges and validation rules
  //
  public type Density   = Float;
  public type Distance  = Float; // @todo, 0.001m to 10^9m?
  public type Resonance = Nat;
  public type Volume    = Nat;

  //
  // Maths
  //
  public type Percent = Nat;

};

