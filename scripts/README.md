# Multi distro artifact bundles scripts

## Description

Scripts to maintain this project

## Content

* `ExtractArtifactSources.bash`: Extracts Build Plans and Plan Scripts from the supplied Artifact Bundle into the `src` directory and rename them with their meaningful names.

* `ArtifactReadmeGenerator.bash`: Generates the `<ArtifactName>-README.md` file associated with each artifact bundle found in the artifact-bundle directory. It overwrites any already existing file. It must be ran after the `ExtractArtifactSources.bash` script.
