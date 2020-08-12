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
		// Atmosphere
		//
		Entity("Atmosphere", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					description here
				`,
			})

			// Primary
			Field("Atmosphere", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))                           // entity
			Field("Resource", field.Entity("Resource"))                   //
			Field("Tags", field.EntityList("TagList"), field.Nullable())  // entity list (nullable)
			Field("Substances", field.ManyToMany("AtmosphereXSubstance")) // many to many

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
		Entity("AtmosphereXSubstance", entity.Join("Atmosphere", "Substance"), func() {
			Field("Weighting", field.Weighting())
		})

	})

}
