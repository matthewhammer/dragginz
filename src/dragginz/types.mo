import Hash "mo:base/Hash";

module {

  // List of Entities
  public type Entity = {
    #concept  : Concept;
    #rarity   : Rarity;
    #quality  : Quality;
    #prop     : Prop;
    #resource : Resource;
  };

  // Entities

  public type Concept = {
    name: Text;
  };

  public type Prop = {
    name: Text;
    resource : Resource;
  };

  public type Quality = {
    name: Text;
    resource : Resource;
  };

  public type Rarity = {
    name      : Text;
    weighting : Float;
    resource  : Resource;
  };

  public type Resource = {
    secret : Text;
  };

};

