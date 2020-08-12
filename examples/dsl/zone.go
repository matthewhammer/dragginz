package game

import (
	"dragginz-api/dragginz/behaviours/api"
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	"dragginz-api/orm/design"
	. "dragginz-api/orm/design/dsl"
)

func init() {

	Store(game.StoreName, func() {

		//
		// Zone
		//
		Entity("Zone", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Our game world is divided into a tree of Zones.
					If a Zone is ever removed for whatever reason, don't repurpose it, just set isDefunct=true
				`,
			})

			// Primary
			Field("Zone", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())
			Field("IsVirtual", field.Bool(), func() {
				Set(design.Field{
					Description: "Is this Zone physically located within the Game World?",
				})
			})
			Field("IsDefunct", field.Bool(), func() {
				Set(design.Field{
					Description: "Has this Zone been retired from the world?",
				})
			})

			// Fields - Inheritance
			Field("InheritAtmosphere", field.Bool())
			Field("InheritClimate", field.Bool())
			Field("InheritGeology", field.Bool())
			Field("InheritPopulation", field.Bool())
			Field("InheritTheme", field.Bool())

			// Relations
			Field("Resource", field.Entity("Resource"))                          // entity
			Field("Biome", field.Entity("Biome"), field.Nullable())              // entity (nullable)
			Field("Culture", field.Entity("Culture"), field.Nullable())          //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)

			// Relations - Classification
			Field("Atmosphere", field.ManyToMany("ZoneXAtmosphere")) // many to many
			Field("Climate", field.ManyToMany("ZoneXClimate"))       //
			Field("Geology", field.ManyToMany("ZoneXGeology"))       //
			Field("Population", field.ManyToMany("ZoneXPopulation")) //
			Field("Theme", field.ManyToMany("ZoneXTheme"))           //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Public:   true,
				})
			})
		})

		// Entity Templates
		Entity("ZoneClosure", entity.Closure("Zone"))
		Entity("ZoneXAtmosphere", entity.Join("Zone", "Atmosphere"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("ZoneXClimate", entity.Join("Zone", "Climate"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("ZoneXGeology", entity.Join("Zone", "Geology"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("ZoneXPopulation", entity.Join("Zone", "Population"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("ZoneXTheme", entity.Join("Zone", "Theme"), func() {
			Field("Weighting", field.Weighting())
		})
	})

}
