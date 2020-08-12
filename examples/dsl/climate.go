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
		// Climate
		//
		Entity("Climate", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					description here
				`,
			})

			// Primary
			Field("Climate", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))                          // entity
			Field("Resource", field.Entity("Resource"))                  //
			Field("Tags", field.EntityList("TagList"), field.Nullable()) // entity list (nullable)
			Field("Weather", field.ManyToMany("ClimateXWeather"))        // many to many

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
		Entity("ClimateXWeather", entity.Join("Climate", "Weather"), func() {
			Field("Weighting", field.Weighting())
		})
	})

}
