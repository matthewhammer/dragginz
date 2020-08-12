import Hash "mo:base/Hash";
import Result "mo:base/Result";

module {

  // Template Types
  // here we want to define Name as a Text string, but it
  // also has special rules on validation and sanitisation
  public type Name = Text;

  // List of Entities
  public type Entity = {
    #alignment:  Alignment;
    #atmosphere: Atmosphere;
    #climate:    Climate;
    #element:    Element;
    #era:        Era;
    #gender:     Gender;
    #species:    Species;
    #character:  Character;
    #concept:    Concept;
    #player:     Player;
    #prop:       Prop;
    #quality:    Quality;
    #rarity:     Rarity;
    #resource:   Resource;
    //.. and about 150 other ones I need to add
  };

  //
  // Entities
  //

  // TO SORT @todo
  public type Alignment = {name:Text};
  public type Atmosphere = {name:Text};
  public type Climate = {name:Text};
  public type Element = {name:Text};
  public type Era = {name:Text};
  public type Gender = {name:Text};
  public type Species = {name:Text};

  // Character
  public type Character = {
    name:   Name;
    player: Player;
  };

  // Concept
  public type Concept = {
    name: Text;
  };

  // Player
  public type Player = {
    name: Text;
  };

  // Prop
  public type Prop = {
    name:     Text;
    resource: Resource;
  };

  // Quality
  public type Quality = {
    name:     Text;
    resource: Resource;
  };

  // Rarity
  public type Rarity = {
    name:      Text;
    weighting: Float;
    resource:  Resource;
  };

  // Resource
  public type Resource = {
    secret: Text;
  };

};

