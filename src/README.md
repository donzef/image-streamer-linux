# Multi distro artifact bundle sources

## Description

Artifact sources located in their respective directory. The `BuildPlans` sub-directory contains the description and the different steps of the related BuildPlan. The `PlanScripts` sub-directory contains Plan Script sources stored in text files with meaningful names. Plan Script contains as well the associated description text.

## Content

* `ExtractArtifactSources.bash`: extracts Build Plans and Plan Scripts from the supplied Artifact Bundle into the `src` dirctory and rename them with their meaningful names. Prepend the Description paragrah in the source document.
