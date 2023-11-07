---
title: "AI supported firmware analysis"
date: 2023-11-07T09:50:18+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - GPT
  - AI
---

# EMBA - The AI powered firmware security analyzer

_Why not use AI for firmware analysis?_ This is the idea we had since the public release of OpenAI's GPT-3 and GPT-4 earlier this year.

We started testing [OpenAI's ChatGPT](https://chat.openai.com) for different possible usage scenarios like the integration of further CVE explanation:

![image](https://github.com/e-m-b-a/emba/assets/497520/16a0efa7-7f9e-4f2a-8f58-14a2114f5820)
 
Additionally, we thought about a quick lookup for potential exploit code or POC’s:

![image](https://github.com/e-m-b-a/emba/assets/497520/1ebad598-c1b1-4f81-a351-e8748a98e877)

It can be seen that the available information is quite limited because of the limited dataset for these types of requests. As we have already integrated multiple exploit databases, we dropped this idea for now. Probably/Hopefully we will come back to this in the future.

After some poking with [OpenAI’s ChatGPT](https://chat.openai.com) via the Chat interface we decided to give it a try within _EMBA_. But, currently not for the explanation of CVE identifiers. During our testing we found out that GPT is quite good at highlighting possible weak spots in different scripting languages:

![image](https://github.com/e-m-b-a/emba/assets/497520/ebfe6fe2-3c51-491b-8f36-ec9d1f3bcc01)

The main idea of the current GPT integration into EMBA is to use AI mechanisms to give the tester a better understanding of interesting areas inside the firmware. Where should he spend his time on manual investigation? To optimize the pentesters time, we already have a lot of different mechanisms integrated into _EMBA_. The AI integration is another valuable source of information for optimizing this task and pointing _YOU_ to the next **0day** vulnerability.

# EMBA ChatGPT integration

The new Q02 quest-module provides a simple way of querying the OpenAI-API with custom questions and code snippeds. The following notes give you a short overview on how to start **AI-assisted firmware analysis with EMBA**

## Configuration Step1 - Free

Use the `config/gpt_config.env.template` file to generate the following `config/gpt_config.env` file:
   * `OPENAI_API_KEY="sk-XXXXXXXXXXXXXXXXXXXX"`
   * `GPT_QUESTION="For the following code I need you to tell me how an attacker could exploit it and point out all vulnerabilities:"`
   * `MINIMUM_GPT_PRIO=3`
-> The `OPENAI_API_KEY` variable has to be set to be able to make API calls, the other options are for tweaking results.

To generate an API key you need an OpenAI account and generate an [API-key](https://platform.openai.com/account/api-keys)

## Configuration Step2 (optional)- Requires Payment Plan for OpenAI-API (*currently in alpha phase*)

1. `export GPT_OPTION=2` will enable the Module to make unrestricted API-calls
2. changing the template under `config/gpt_template.json`, for example doing: 
  
  `"model": "gpt-4"` 

should enable gpt-4 functionality (only available on payment plan)

## Configuration Step3 - enabling the Q02-module

To enable the GPT integration in the next firmware analysis process you need to activate it via setting the _GPT_OPTION_ variable `export GPT_OPTION=<1/2>`.

_Note, that to do this you need to set it for the root user!_

The preferred way for enabling GPT is to setup a GPT enabled scan-profile like the example profile `scan-profiles/default-scan-gpt.emba`. This profile is optimized for GPT enabled firmware analysis.

## GPT during firmware analysis

During the next firmware scan the API key gets automatically tested and used from _EMBA_.

![image](https://github.com/e-m-b-a/emba/assets/497520/c82f797c-fef8-4ba6-9641-b38f2da7662c)

After the _Q container_ is started it can be further monitored with `docker ps` and `docker logs`:

![image](https://github.com/e-m-b-a/emba/assets/497520/c230030a-5bf9-4f0c-9c37-d4fe8161342a)

![image](https://github.com/e-m-b-a/emba/assets/497520/0927f1f6-e594-46b1-a44a-b5f138231914)

The monitoring should show the GPT requests and results during operation:

![image](https://github.com/e-m-b-a/emba/assets/497520/35d3a759-500d-4e83-8650-f4266220382a)

At the end of the firmware test, the finalyzer module F05 generates the relevant linking between the already available results and the GPT results:

![image](https://github.com/e-m-b-a/emba/assets/497520/8547ab6c-27c1-4c27-a43f-3f62944e1003)

The web report contains all the results that GPT provides to us:

![image](https://github.com/e-m-b-a/emba/assets/497520/a33ba71f-8580-412f-90f6-37938196a8c7)

## FAQ

### Q: Where do I get the needed API key?
Go to [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys) and generate one.

***

### Q: Do I need to pay for the OpenAI account?
No, the default settings of EMBA are working quite good with the free account.

***

### Q: Does the host system need Internet access to query OpenAI servers?
Yes, there is a second, purpose built docker container that needs Internet access.

***

### Q: I'm always running into the "Rate limit handling". What can I do?
This issue is well known with the free OpenAI account. EMBA is trying to handle these issues as good as possible. The only real fix is a payed account.

***

### Q: Is the complete firmware uploaded to OpenAI's ChatGPT?
No, only in case you enabled an AI-assisted scan of your firmware parts of your firmware (see also this [question](https://github.com/e-m-b-a/emba/wiki/AI-supported-firmware-analysis#q-what-modules-have-currently-ai-assisted-support)) are uploaded and analysed via OpenAI's GPT solution.

***

### Q: What modules have currently AI-assisted support?
Currently the following modules have AI integration:
* S20 - Shell analysis module
* S21 - Python analysis module
* S22 - PHP analysis module
* S23 - Lua analysis module

In the future more modules will be enabled.

***
### Q: I have further ideas for a better GPT integration. How can I contact you?
The easiest way is to open an issue [here](https://github.com/e-m-b-a/emba/issues)

***

### Q: I found a bug. How can I contact you?
The easiest way is to open an issue [here](https://github.com/e-m-b-a/emba/issues)
