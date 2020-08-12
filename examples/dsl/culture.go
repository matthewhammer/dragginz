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
		// Culture
		//
		Entity("Culture", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Culture is a template for a Zone's Population and Themes
				`,
			})

			// Primary
			Field("Culture", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))                                  // entity
			Field("Resource", field.Entity("Resource"))                          //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)
			Field("Population", field.ManyToMany("CultureXPopulation"))          // many to many
			Field("Themes", field.ManyToMany("CultureXTheme"))                   //

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
		Entity("CultureXPopulation", entity.Join("Culture", "Population"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("CultureXTheme", entity.Join("Culture", "Theme"), func() {
			Field("Weighting", field.Weighting())
		})

	})

}
