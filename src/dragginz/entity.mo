import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "types"

module {

  // List of Entity Types
  public type Entity = {
    #Ability:        Ability;
    #AbilityGroup:   AbilityGroup;
    #Alignment:      Alignment;
    #AssetBundle:    AssetBundle;
    #Atmosphere:     Atmosphere;
    #Character:      Character;
    #Chunk:          Chunk;
    #Class:          Class;
    #Climate:        Climate;
    #Collider:       Collider;
    #Concept:        Concept;
    #Element:        Element;
    #Era:            Era;
    #HardnessCat:    HardnessCat;
    #Icon:           Icon;
    #Item:           Item;
    #Material:       Material;
    #Mesh:           Mesh;
    #Mob:            Mob;
    #Model:          Model;
    #Pet:            Pet;
    #Player:         Player;
    #Prop:           Prop;
    #Quality:        Quality;
    #Rarity:         Rarity;
    #Release:        Release;
    #Role:           Role;
    #Shader:         Shader;
    #SizeCat:        SizeCat;
    #Sound:          Sound;
    #Species:        Species;
    #Substance:      Substance;
    #Team:           Team;
    #TemperatureCat: TemperatureCat;
    #Terrain:        Terrain;
    #Texture:        Texture;
    #TextureAtlas:   TextureAtlas;
  };



  //
  // Entities
  // These work much the same as rows in a simple SQL table with a single PK
  //

  public type AbilityID        = Types.ID;
  public type AbilityGroupID   = Types.ID;
  public type AlignmentID      = Types.ID;
  public type AssetBundleID    = Types.ID;
  public type AtmosphereID     = Types.ID;
  public type CharacterID      = Types.ID;
  public type ChunkID          = Types.ID;
  public type ClassID          = Types.ID;
  public type ClimateID        = Types.ID;
  public type ColliderID       = Types.ID;
  public type ConceptID        = Types.ID;
  public type ElementID        = Types.ID;
  public type EraID            = Types.ID;
  public type HardnessCatID    = Types.ID;
  public type IconID           = Types.ID;
  public type ItemTemplateID   = Types.ID;
  public type MaterialID       = Types.ID;
  public type MeshID           = Types.ID;
  public type MobTemplateID    = Types.ID;
  public type ModelID          = Types.ID;
  public type PetID            = Types.ID;
  public type PlayerID         = Types.ID;
  public type PropTemplateID   = Types.ID;
  public type QualityID        = Types.ID;
  public type RarityID         = Types.ID;
  public type ReleaseID        = Types.ID;
  public type RoleID           = Types.ID;
  public type ShaderID         = Types.ID;
  public type SizeCatID        = Types.ID;
  public type SoundID          = Types.ID;
  public type SpeciesID        = Types.ID;
  public type SubstanceID      = Types.ID;
  public type TeamID           = Types.ID;
  public type TemperatureCatID = Types.ID;
  public type TerrainID        = Types.ID;
  public type TextureID        = Types.ID;
  public type TextureAtlasID   = Types.ID;

  // Ability
  public type Ability = {
    id:          AbilityID;
    name:        Types.EntityName;
    description: Types.Description;
    iconID:      Icon;
  };

  // AbilityGroup
  public type AbilityGroup = {
    id:          AbilityGroupID;
    name:        Types.EntityName;
    description: Types.Description;
    abilities:   [Ability];
  };

  // Alignment
  public type Alignment = {
    id:   AlignmentID;
    name: Text;
  };

  // AssetBundle
  public type AssetBundle = {
    id:       AssetBundleID;
    asset:    Types.TODO;
    models:   [ModelID];
    shaders:  [ShaderID];
    sounds:   [SoundID];
    textures: [TextureID];
  };

  // Atmosphere
  public type Atmosphere = {
    id:          AtmosphereID;
    name:        Types.EntityName;
    description: Types.Description;
  };

  // Character
  public type Character = {
    id:        CharacterID;
    name:      Types.EntityName;
    player:    Player;
    gender:    Gender;
    species:   Species;
    inventory: Inventory;
  };

  // Chunk
  public type Chunk = {
    id:       ChunkID;
    x:        Int;
    y:        Int;
    z:        Int;
    contents: ChunkData;
  };

  // Class
  public type Class = {
    id:       ClassID;
    name:     Types.EntityName;
    icon:     Icon;
    resource: Resource;
    concepts: [ConceptID]; 
  };
  
  // Climate
  public type Climate = {
    id:   ClimateID;
    name: Types.EntityName;
  };

  // Collider
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
  public type Concept = {
    id:           ConceptID;
    name:         Types.EntityName;
    asset:        Types.TODO;
    contributors: [Contributor];
    status:       Status;
  };

  // Element
  public type Element = {
    id:   ElementID;
    name: Types.EntityName;
  };
  
  // Era
  public type Era = {
    id:   EraID;
    name: Types.EntityName;
  };

  // HardnessCat
  public type HardnessCat = {
    id:   HardnessCatID;
    name: Types.EntityName;
  };

  // Icon
  public type Icon = {
    id:   IconID;
    name: Types.EntityName;
  };

  // ItemTemplate
  public type ItemTemplate = {
    id:      ItemTemplateID;
    name:    Types.EntityName;
    charges: [RNG];
    iconID:  IconID;
  };

  // Material
  public type Material = {
    id:       MaterialID;
    name:     Types.EntityName;
    colour:   Types.Colour;
    meshID:   ?MeshID;
    series:   ?Types.Series;
    status:   Status;
    textures: [TextureID];
  };

  // Mesh
  public type Mesh = {
    id:        MeshID;
    materials: [MaterialID];
    modelID:   ModelID;
    series:    ?Types.Series;
    status:    Status;
  };

  // MobTemplate
  public type MobTemplate = {
    id:       MobTemplateID;
    name:     Types.EntityName;
    iconID:   IconID;
    concepts: [ConceptID];
  };

  // Model
  public type Model = {
    id:          ModelID;
    name:        Types.EntityName;
    description: Types.Description;
    lodLevels:   Nat;   // 1 to 10
    volume:      ?Types.Volume;
    contributor: Contributor;
    meshes:      [MeshID];
  };

  // Pet
  public type Pet = {
    id:          PetID;
    name:        Types.EntityName;
    characterID: CharacterID;
  };

  // Player
  public type Player = {
    id:   PlayerID;
    name: Types.EntityName;
  };

  // PropTemplate
  public type PropTemplate = {
    id:       PropTemplateID;
    name:     Types.EntityName;
    resource: Resource;
  };

  // Quality
  public type Quality = {
    id:              QualityID;
    name:            Types.EntityName;
    iconID:          IconID;
    resource:        Resource;
    valueMultiplier: Nat;
  };

  // Rarity
  public type Rarity = {
    id:              RarityID;
    name:            Types.EntityName;
    iconID:          IconID;
    resource:        Resource;
    weighting:       Types.Weighting;
    valueMultiplier: Nat;
  };

  // Release
  public type Release = {
    id:          ReleaseID;
    name:        Types.EntityName;
    description: Types.Description;
    startTime:   Types.TODO;
    iconID:      IconID;
  };

  // Role
  public type Role = {
    id:             RoleID;
    name:           Types.EntityName;
    description:    Types.Description;
    classTODO:      Class;
    baseLevel:      Nat;
    progressLevels: Nat;  // 1 to 20
    icon:           Icon;
    resource:       Resource;
    abilityGroups:  [AbilityGroup];
    concepts:       [ConceptID];
    requirements:   [Requirement];
    costs:          [Cost];
    restrictions:   [Restriction];
  };

  // Shader
  // i tried to combine two entities here, not sure if that's a good idea or even
  // if it comes close to working
  public type Shader = {
    #external: {
      id:           ShaderID; 
      asset:        Types.TODO;
      status:       Status;
      contributors: [Contributor];
      series:       ?Types.Series;
    };
    #internal: {
      id:         ShaderID;
      name:       Types.EntityName;
      unityClass: Types.Class;
    };
  };

  // SizeCat
  public type SizeCat = {
    id: SizeCatID;
  };

  // Sound
  public type Sound = {
    id:     SoundID;
    name:   Types.EntityName;
    asset:  Types.TODO;
    status: Status;
  };

  // Species
  // TREE STRUCTURE @todo
  public type Species = {
    id:   SpeciesID;
    name: Types.EntityName;
  };

  // Substance
  public type Substance = {
    id:   SubstanceID;
    name: Types.EntityName;
  };

  // Team
  public type Team = {
    id:       TeamID;
    name:     Types.EntityName;
    players:  [Player];
  };

  // TemperatureCat
  public type TemperatureCat = {
    id: TemperatureCatID;
  };

  // Terrain
  public type Terrain = {
    id:          TerrainID;
    name:        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
    iconID:      IconID;
    materialID:  MaterialID;
    resource:    Resource;
    composition: [SubstanceID];
  };

  // Texture
  public type Texture = {
    id:   TextureID;
  };

  // TextureAtlas
  public type TextureAtlas = {
    id:       TextureAtlasID;
    asset:    Types.TODO;
    textures: [TextureID]
  };

  //
  // Data Structures
  // reuseable components for the data model
  //
  //

  // ChunkData
  public type ChunkData = {
    stuff:    Text;
  };
  
  // Cooldown
  public type Cooldown = {

  };

  // Contributor
  public type Contributor = {
    teams:   [TeamID];
    players: [PlayerID];
  };

  // Cost
  public type Cost = {
    currency:  Nat;
  };

  // Item
  public type Item = {
    name:       Types.EntityName;
    templateID: ItemTemplateID;
  };

  // Inventory
  public type Inventory = {
    items: [InventoryItem];
  };

  // InventoryItem
  public type InventoryItem = {
    item:     Item;
    quantity: Nat;
  };

  // Mob
  public type Mob = {
    name:       Types.EntityName;
    templateID: MobTemplateID;
  };
  
  // Prop
  public type Prop = {
    name:       Types.EntityName;
    templateID: PropTemplateID;
  };

  // Requirement
  public type Requirement = {
    character: [RequirementCharacter];
    pet:       [RequirementPet];
  };

  // RequirementCharacter
  public type RequirementCharacter = {
    classes:  [ClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RequirementPet
  public type RequirementPet = {
    elements: [Element];
    species:  [SpeciesID];
  };

  // Resource
  public type Resource = {
    secret: Types.UUID;
  };

  // Restriction
  public type Restriction = {
    character: [RestrictionCharacter];
    pet:       [RestrictionPet];
  };

  // RestrictionCharacter
  public type RestrictionCharacter = {
    classes:  [ClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RestrictionPet
  public type RestrictionPet = {
    elements: [Element];
    species:  [SpeciesID];
  };

  // Reward
  public type Reward = {
    currency: Nat;
    items:    [ItemTemplateID];
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
    isLive:         Bool;
    startTime:      Types.TODO;
    endTime:        Types.TODO;
    killWithFire:   Bool;
    startReleaseID: ?ReleaseID;
    endReleaseID:   ?ReleaseID;
  };

  //
  // Enums
  //

  // Axis
  public type Axis = {
    #x:  Text;
    #y:  Text;
    #z:  Text;
  };
  
  // Gender
  public type Gender = {
    #male:   Text;
    #female: Text;
  };

  // RealGender
  public type RealGender = {
    #male:    Text;
    #female:  Text;
    #neither: Text;
  };


};
 
