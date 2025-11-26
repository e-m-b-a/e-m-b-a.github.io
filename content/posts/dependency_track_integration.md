---
title: "Dependency track integration"
description: "EMBA now with Dependency track integration"
date: 2025-11-26T09:01:00+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
---

EMBA is now able to automatically upload the generated SBOM to your dependency track instance.

![image](/img/dep_track1.png#center)

To be able to use the dependency track API a API key and special permissions are needed. The following screenshot shows how to create a new Team with an API key and the needed permissions:

![image](/img/dep_track2.png#center)

EMBA needs the following dependency track permissions:
* BOM_UPLOAD
* PROJECT_CREATION_UPLOAD
* VIEW_PORTFOLIO

You can find further details about the API within the dependency track documentation here.

Afterwards it should be possible to upload an SBOM via the API:

```
curl -X "POST" "http://<DEPENDENCY_TRACK_HOST_IP>/api/v1/bom" \
    -H 'Content-Type: multipart/form-data' \
    -H "X-Api-Key: <DEPENDENCY_TRACK_API_KEY>" \
    -F "autoCreate=true" \
    -F "projectName=testproject" \
    -F "bom=@/Path/to/your/CycloneDX-SBOM.json" 
```

The next step is to build a configuration file for EMBA. As there is a template file available, the easiest way is to copy this file and edit it afterwards:

```
cp config/dependencytrack.env.template config/dependencytrack.env 
```

In the new env file you need to adjust the following parameters:

```
DEPENDENCY_TRACK_HOST_IP="<insert your IP address>:8081"
DEPENDENCY_TRACK_API_KEY="<insert your API key>"
```

Afterwards EMBA should be able to upload the generated SBOM to you dependency track instance.

To monitor the upload process it is needed to check the log file for the Q20 module or check the logs of the quest docker container:

![image](/img/dep_track3.png#center)

![image](/img/dep_track4.png#center)
