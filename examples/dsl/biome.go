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
		// Biome
		//
		Entity("Biome", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Biome is a template for a Zone's Atmosphere,
					Climate and Geology.
				`,
			})

			// Primary
			Field("Biome", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))                                  // entity
			Field("Resource", field.Entity("Resource"))                          //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)
			Field("Atmosphere", field.ManyToMany("BiomeXAtmosphere"))            // many to many
			Field("Climate", field.ManyToMany("BiomeXClimate"))                  //
			Field("Geology", field.ManyToMany("BiomeXGeology"))                  //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Icon", "Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

		// Entity Templates
		Entity("BiomeXAtmosphere", entity.Join("Biome", "Atmosphere"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("BiomeXClimate", entity.Join("Biome", "Climate"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("BiomeXGeology", entity.Join("Biome", "Geology"), func() {
			Field("Weighting", field.Weighting())
		})
	})

}
