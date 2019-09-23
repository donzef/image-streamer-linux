# Artifact bundle scripts

## Description

Scripts to maintain this project.

## Content

* `ExtractArtifactSources.bash`: Extracts Build Plans and Plan Scripts from the supplied Artifact Bundle into the `src` directory and renames them with their meaningful names. Prepares as well the `src/ArtifactName/README.md` with the metadata of the bundle (Name, Description...).

* `ArtifactReadmeGenerator.bash`: Generates the `src/ArtifactName/README.md` file associated with each artifact bundle found in the artifact-bundle directory. It overwrites any already existing file. It must be ran after the `ExtractArtifactSources.bash` script.
