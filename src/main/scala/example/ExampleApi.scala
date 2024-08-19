package example

import caliban._
import caliban.schema.Schema
import zio._


object ExampleApi {

  // Define the Character case class for GraphQL response
  case class Character(name: String, nicknames: List[String], origin: String, role: Option[String])

  // Define Queries for the simplified API
  case class Queries(
                      getAllCharacters: UIO[List[Character]],
                      getCharacterByName: String => UIO[Option[Character]]
                    )

  // Define a GraphQL Schema for the simplified API
  implicit val characterSchema: Schema[Any, Character] = Schema.gen
  implicit val queriesSchema: Schema[Any, Queries] = Schema.gen

  private def makeApi(exampleService: ExampleService): GraphQL[Any] = {
    def characterToGraphQLCharacter(ch: example.ExampleData.Character): Character =
      Character(
        name = ch.name,
        nicknames = ch.nicknames,
        origin = ch.origin.toString,
        role = ch.role.map {
          case example.ExampleData.Role.Captain(ship)  => s"Captain of $ship"
          case example.ExampleData.Role.Pilot(ship)    => s"Pilot of $ship"
          case example.ExampleData.Role.Engineer(ship) => s"Engineer of $ship"
          case example.ExampleData.Role.Mechanic(ship) => s"Mechanic of $ship"
        }
      )

    graphQL(
      RootResolver(
        Queries(
          exampleService.getCharacters(None).map(_.map(characterToGraphQLCharacter)),
          name => exampleService.findCharacter(name).map(_.map(characterToGraphQLCharacter))
        )
      )
    )
  }

  val layer: ZLayer[ExampleService, Nothing, GraphQL[Any]] =
    ZLayer(ZIO.serviceWith[ExampleService](makeApi))
}
