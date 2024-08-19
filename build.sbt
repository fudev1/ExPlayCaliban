ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.14"

val calibanVersion = "2.8.1"


lazy val root = (project in file("."))
  .settings(
    name := "ExPlayCaliban",
    libraryDependencies ++= Seq(
      "com.github.ghostdogpr"         %% "caliban"                       % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-quick"                 % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-http4s"                % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-play"                  % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-akka-http"             % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-pekko-http"            % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-zio-http"              % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-cats"                  % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-federation"            % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-tapir"                 % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-client"                % calibanVersion,
      "com.github.ghostdogpr"         %% "caliban-tools"                 % calibanVersion,
      "org.http4s"                    %% "http4s-ember-server"           % "0.23.23",
      "org.http4s"                    %% "http4s-dsl"                    % "0.23.23",
      "com.softwaremill.sttp.client3" %% "zio"                           % "3.9.7",
      "io.circe"                      %% "circe-generic"                 % "0.14.9",
      "org.playframework"             %% "play-pekko-http-server"        % "3.0.4",
      "com.typesafe.akka"             %% "akka-actor-typed"              % "2.8.6",
      "com.softwaremill.sttp.tapir"   %% "tapir-jsoniter-scala"          % "1.10.15"
    )
  )
