import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "types"

module {

  // Template Types
  // here we want to define Name as a Text string, but it
  // also has special rules on validation and sanitisation
  public type Name = Text;

  // List of Entities
  public type Entity = {
    #Alignment:   Alignment;
    #Atmosphere:  Atmosphere;
    #Axis:        Axis;
    #Character:   Character;
    #Class:       Class;
    #Climate:     Climate;
    #Concept:     Concept;
    #Cooldown:    Cooldown;
    #Element:     Element;
    #Era:         Era;
    #Gender:      Gender;
    #Icon:        Icon;
    #Mob:         Mob;
    #Pet:         Pet;
    #Player:      Player;
    #Prop:        Prop;
    #Quality:     Quality;
    #Rarity:      Rarity;
    #Requirement: Requirement;
    #Resource:    Resource;
    #Reward:      Reward;
    #Species:     Species;
    #Substance:   Substance;
  };

  //
  // Entities
  //

  // Alignment
  public type AlignmentID = Types.ID;
  public type Alignment = {
    id:   AlignmentID;
    name: Text;
  };
 
  // Atmosphere
  public type Atmosphere = {
    name:        Text;
    description: Text;
  };

   // Axis
  public type Axis = {
    #x:  Text;
    #y:  Text;
    #z:  Text;
  };

  // Character
  public type CharacterID = Types.ID;
  public type Character = {
    name:   Name;
    player: Player;
  };

  // Chunk
  public type ChunkID = Types.ID;
  public type Chunk = {
    id:       ChunkID;
    name:     Name;
    x:        Int;
    y:        Int;
    z:        Int;
    contents: ChunkData;
  };

  // ChunkData
  public type ChunkData = {
    stuff:    Text;
  };

   // Class
  public type Class = {
    name:     Text;
    icon:     Icon;
    resource: Resource;
    concepts: [ConceptID]; // @todo
  };
  
  // Climate
  public type Climate = {
    name: Text;
  };

  // Collider
  public type ColliderID = Types.ID;
  public type Collider = {
    id:            ColliderID;
    isTrigger:     Bool;
    rotation:      Types.Quaternion;
    boxSize:       Types.Vector;
    capsuleLength: Types.Distance;
    capsuleRadius: Types.Distance; 
    meshScale:     Float;
    sphereRadius:  Types.Distance;
    axis:          Axis;
    meshID:        MeshID;
  };

  // Concept
  public type ConceptID = Types.ID;
  public type Concept = {
    id:           ConceptID;
    name:         Text;
    asset:        Text; // @todo
    contributors: [Contributor];
    status:       Status;
  };

  // Contributor
  public type Contributor = {
    teamID:  ?TeamID;
    players: [PlayerID];
  };

  // Cooldown
  public type Cooldown = {
    name: Text;
  };

  // Cost
  public type Cost = {
    name: Text;
  };

  // Element
  public type Element = {
    name: Text;
  };
  
  // Era
  public type Era = {
    name: Text;
  };
  
  // Gender
  public type Gender = {
    #male:   Text;
    #female: Text;
  };

  // Icon
  public type IconID = Types.ID;
  public type Icon = {
    id:   IconID;
    name: Text;
  };

  // Item
  public type ItemID = Types.ID;
  public type Item = {
    id:      ItemID;
    name:    Types.Name;
    charges: [RNG];
    iconID:  IconID;
  };

  // Material
  public type MaterialID = Types.ID;
  public type Material = {
    id:       MaterialID;
    name:     Types.Name;
  };

  // Mesh
  public type MeshID = Types.ID;
  public type Mesh = {
    id:        MeshID;
    series:    Text;
    materials: [MaterialID];
    modelID:   ModelID;
    status:    Status;
  };

  // Mob
  public type MobID = Types.ID;
  public type Mob = {
    id:       MobID;
    name:     Text;
    iconID:   IconID;
    concepts: [ConceptID];
  };

  // Model
  public type ModelID = Types.ID;
  public type Model = {
    id:          ModelID;
    name:        Types.Name;
    description: Types.Description;
    lodLevels:   Nat;   // 1 to 10
    volume:      ?Types.Volume;
    contributor: Contributor;
    meshes:      [MeshID];
  };

  // Pet
  public type PetID = Types.ID;
  public type Pet = {
    id:          PetID;
    name:        Name;
    characterID: CharacterID;
  };

  // Player
  public type PlayerID = Types.ID;
  public type Player = {
    id:   PlayerID;
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

  // Release
  public type ReleaseID = Types.ID;
  public type Release = {
    id:          ReleaseID;
    name:        Types.Name;
    description: Types.Description;
    startTime:   Types.Timestamp;
    iconID:      IconID;
  };

  // Requirement
  public type Requirement = {
    secret: Text;
  };

  // Resource
  public type Resource = {
    secret: Text;
  };

  // Reward
  public type Reward = {
    name: Text;
  };

  // RNG
  public type RNG = {
    chance:     Types.Percent;
    dice:       Nat;
    faces:      Nat;
    dropHigh:   Nat;
    dropLow:    Nat;
    modifier:   Nat;
    multiplier: Nat;
  };

  // Status
  public type Status = {
    isLive:       Bool;
    startTime:    Types.Timestamp;
    endTime:      Types.Timestamp;
    killWithFire: Bool;
    startRelease: ?ReleaseID;
    endRelease:   ?ReleaseID;
  };

  // Species
  // TREE STRUCTURE @todo
  public type Species = {
    name: Types.Name;
  };

  // Substance
  public type SubstanceID = Types.ID;
  public type Substance = {
    id:   SubstanceID;
    name: Text;
  };

  // Team
  public type TeamID = Types.ID;
  public type Team = {
    id:       TeamID;
    name:     Text;
    players:  [TeamPlayer];
  };

  // TeamPlayer
  public type TeamPlayer = {
    player:   Player;
    position: TeamPosition;
  };

  // TeamPosition
  public type TeamPosition = {
    #one: Text;
    #two: Text;
  };

  // Terrain
  public type Terrain = {
    name:        Types.Name;
    description: Types.Description;
    resonance:   Types.Resonance;
    iconID:      IconID;
    materialID:  MaterialID;
    resource:    Resource;
    composition: [SubstanceID];
  };

};
 
