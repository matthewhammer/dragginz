import Hash "mo:base/Hash";
import Result "mo:base/Result";

module {

  // Special, ie. not sure if this should actually be here
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
  public type Interval = Nat;

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
  // A data structure used by Unity measure the rotation of an object in three dimensions
  public type Quaternion = {
    w: Float;
    x: Float;
    y: Float;
    z: Float;
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
  public type Area        = Float;    // m^2,    0.001 to 1e6
  public type Density     = Float;    // kg/m^3  0.001 to 1e6
  public type Distance    = Float;    // m       0.001 to 500
  public type Friction    = Percent;  // %       0 to 100
  public type Hardness    = Nat;      // H       1 to 15 (Mohs + 5 extra fantasy levels)
  public type Mass        = Float;    // kg      0.001 to 1e6
  public type Opacity     = Percent;  // %       0 to 100
  public type Resonance   = Percent;  // %       0 to 100 (fantasy world concept)
  public type Temperature = Nat;      // °C      -200 to 10,000      
  public type Velocity    = Float;    // m/s     0.01 to 500 
  public type Volume      = Float;    // m^3     0.001 to 1e6

  //
  // Game Concepts
  //
  public type GameYear = Int;

  //
  // Maths
  //
  public type Percent = Nat;

};

