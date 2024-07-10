# AI PowerShell Team with RAG

[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/AIPSTeam)](https://www.powershellgallery.com/packages/AIPSTeam)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A6KYBUS)

## Table of Contents

- [AI PowerShell Team Script](#ai-powershell-team-script)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [User Guide](#user-guide)
    - [Installation](#installation)
    - [Configuration](#configuration)
    - [Usage](#usage)
  - [Developer Notes](#developer-notes)
    - [Code Structure](#code-structure)
    - [Key Functions and Logic](#key-functions-and-logic)
  - [Installation Instructions](#installation-instructions)
  - [Dependencies and Prerequisites](#dependencies-and-prerequisites)
  - [Use Cases and Expected Outputs](#use-cases-and-expected-outputs)
  - [Troubleshooting Tips and Common Issues](#troubleshooting-tips-and-common-issues)
  - [FAQ](#faq)

## Overview

This PowerShell script simulates a team of specialists working together on a PowerShell project. Each specialist has a unique role and contributes to the project in a sequential manner. The script processes user input, performs various tasks, and generates outputs such as code, documentation, and analysis reports. The application utilizes Retrieval-Augmented Generation (RAG) to enhance its capabilities and can leverage Azure OpenAI, Ollama, or LM Studio to generate the output.

**Retrieval-Augmented Generation (RAG)** combines retrieval and generation processes to produce accurate and contextually relevant outputs. The framework operates as follows:

1.	 Retrieval: The system retrieves pertinent information from extensive data sources.
2.	 Generation: A generative model uses the retrieved information to produce coherent and appropriate responses.

By integrating these two phases, RAG ensures the AI specialists deliver precise and informed outputs based on a comprehensive knowledge base.

For more information on the AI models and services used in this script, please refer to the following links:

- [Azure OpenAI](https://azure.microsoft.com/en-us/services/cognitive-services/openai-service/)
- [LM Studio](https://lmstudio.ai/)
- [Ollama](https://ollama.com/)

> [!IMPORTANT]
> You need AZURE OpenAI subscription, Ollama or LMStudio to use this script.
>
> **The quality of the project generated by the AI PowerShell Team depends significantly on the model used and the context window available. The model's ability to understand and process the input accurately is crucial for generating high-quality outputs. Ensure that the model and context window settings are optimized for the best performance and results.**

## Features

- **Team Simulation**: Emulates a team of specialists including Requirements Analyst, System Architect, PowerShell Developer, QA Engineer, Documentation Specialist, and Project Manager.
- **Sequential Processing**: Each specialist processes the input and passes the result to the next specialist in the workflow.
- **Live Streaming**: Option to stream output live.
- **Logging**: Logs actions and responses of each specialist.
- **Documentation Generation**: Automatically generates comprehensive documentation for the project.
- **Code Analysis**: Integrates with PSScriptAnalyzer for code quality checks.
- **Feedback Integration**: Collects and integrates feedback from team members to improve the response.
- **State Management**: Manages global state across different stages of the project.
- **Error Handling**: Robust error handling mechanisms to capture and log errors.
- **Version Control**: Saves and updates code versions with detailed logs.
- **Interactive Menu**: Provides an interactive menu for suggesting new features, analyzing code, generating documentation, and more.

## User Guide

### Installation

1. **Install Required Modules**: Ensure you have the required PowerShell modules installed:

   ```powershell
   Install-Module -Name PSAOAI
   Install-Module -Name PSScriptAnalyzer
   ```

2. **Install the Script**: Install script from [Powershell Gallery](https://www.powershellgallery.com/packages/AIPSTeam).

   ```powershell
   Install-Script AIPSTeam
   ```

3. **Run the Script**: Execute the script using PowerShell:

   ```powershell
   "Your project description here" | AIPSTeam.ps1
   ```

### Configuration

- **Parameters**:
  - `-userInput`: Defines the project outline as a string (can also be piped).
  - `-Stream`: Controls whether the output should be streamed live (default: `$true`).
  - `-NOPM`: Disables the Project Manager functions.
  - `-NODocumentator`: Disables the Documentator functions.
  - `-NOLog`: Disables the logging functions.
  - `-LogFolder`: Specifies the folder where logs should be stored.
  - `-DeploymentChat`: Specifies the deployment chat environment variable for Azure OpenAI (default: retrieved from environment variable `PSAOAI_API_AZURE_OPENAI_CC_DEPLOYMENT` - [PSAOAI](https://github.com/voytas75/PSAOAI)).
  - `MaxTokens`: Specifies the maximum number of tokens to generate in the response. This parameter controls the length of the generated output. The default value is set within the script, but it can be overridden by the user if needed.
  - `-LLMProvider`: Specifies the LLM provider to use (e.g., ollama, LMStudio, AzureOpenAI). Default is "AzureOpenAI".
  - `-NOTips`: Disables tips.
  - `-VerbosePrompt`: Show Prompts.
  - `-LoadProjectStatus`: Loads the project status from a specified path. Part of the 'LoadStatus' parameter set.
  - `-LLMProvider`: Specifies the LLM provider to use (e.g., ollama, LMStudio, AzureOpenAI). Default is "AzureOpenAI".

### Usage

1. **Basic Usage**:

   ```powershell
   "Monitor RAM usage and show a single color block based on the load." | AIPSTeam.ps1
   ```

   or

   ```powershell
   AIPSTeam -userInput "Monitor RAM usage and show a single color block based on the load."
   ```

2. **Disable Live Streaming**:

   ```powershell
   "Monitor RAM usage" | AIPSTeam.ps1 -Stream $false
   ```

3. **Specify Log Folder**:

   ```powershell
   "Monitor RAM usage" | AIPSTeam.ps1 -LogFolder "C:\Logs"
   ```

4. **Monitor Disk Usage**:

   ```powershell
   "Monitor disk usage and display a pie chart of used vs free space." | AIPSTeam.ps1 -Stream $false
   ```

   **Description**: This example monitors the disk usage and displays a pie chart showing the used versus free space. The `-Stream $false` parameter disables live streaming of the output.

5. **Generate System Report**:

   ```powershell
   "Script for reporting CPU, RAM, and disk usage." | AIPSTeam.ps1 -LogFolder "C:\SystemReports"
   ```

   **Description**: This example generates a comprehensive system report that includes details about CPU, RAM, and disk usage. The report is saved in the specified log folder `C:\SystemReports`.

6. **Check Network Latency**:

   ```powershell
   "Check network latency and display a line graph of latency over time." | AIPSTeam.ps1 -NOPM
   ```

   **Description**: This example checks the network latency and displays a line graph showing the latency over time. The `-NOPM` parameter disables the Project Manager functions.

7. **Analyze Event Logs**:

   ```powershell
   "Analyze Windows Event Logs and summarize critical errors." | AIPSTeam.ps1 -NODocumentator
   ```

   **Description**: This example analyzes the Windows Event Logs and provides a summary of critical errors. The `-NODocumentator` parameter disables the Documentator functions.

8. **Backup Important Files**:

   ```powershell
   "Backup important files from Documents to an external drive." | AIPSTeam.ps1 -NOLog
   ```

   **Description**: This example backs up important files from the Documents folder to an external drive. The `-NOLog` parameter disables the logging functions.

9. **Monitor GPU Usage**:

   ```powershell
   "Monitor GPU usage and display a bar chart of GPU load." | AIPSTeam.ps1 -Stream $true
   ```

   **Description**: This example monitors the GPU usage and displays a bar chart showing the GPU load. The `-Stream $true` parameter enables live streaming of the output.

10. **Check System Uptime**:

      ```powershell
      "Check system uptime and display the total uptime in days." | AIPSTeam.ps1 -NOLog -NOPM
      ```

      **Description**: This example checks the system uptime and displays the total uptime in days. The `-NOLog` parameter disables the logging functions, and the `-NOPM` parameter disables the Project Manager functions.

11. **Generate Security Audit Report**:

      ```powershell
      "Generate a security audit report for the system." | AIPSTeam.ps1 -LogFolder "C:\SecurityReports" -NODocumentator
      ```

      **Description**: This example generates a security audit report for the system. The report is saved in the specified log folder `C:\SecurityReports`. The `-NODocumentator` parameter disables the Documentator functions.

12. **Monitor Network Bandwidth**:

      ```powershell
      "Monitor network bandwidth usage and display a real-time graph." | AIPSTeam.ps1 -Stream $true -NOLog
      ```

      **Description**: This example monitors the network bandwidth usage and displays a real-time graph. The `-Stream $true` parameter enables live streaming of the output, and the `-NOLog` parameter disables the logging functions.

13. **Check Disk Health**:

      ```powershell
      "Check disk health and display a summary of SMART attributes." | AIPSTeam.ps1 -NOPM -NODocumentator
      ```

      **Description**: This example checks the disk health and displays a summary of SMART attributes. The `-NOPM` parameter disables the Project Manager functions, and the `-NODocumentator` parameter disables the Documentator functions.

14. **Generate Text Summary Using LLM Provider**:

      ```powershell
      "Recent software activities on Windows 11." | AIPSTeam.ps1 -LLMProvider "ollama" -Stream $false
      ```

      **Description**: This example generates a text summary of recent project activities using the specified LLM provider, in this case, "ollama". The `-Stream $false` parameter disables live streaming of the output.

## Developer Notes

### Code Structure

- **Main Script**: `AIPSTeam.ps1`
- **Classes**: `ProjectTeam`
- **Functions**: Various utility functions for processing input, logging, and analysis.

### Key Functions and Logic

- **ProjectTeam Class**: Represents a team member with specific expertise.
  - `ProcessInput`: Processes the input and generates a response.
  - `Feedback`: Provides feedback on the input.
  - `AddLogEntry`: Adds an entry to the log.
  - `Notify`: Sends a notification.
  - `SummarizeMemory`: Summarizes the team member's memory.
- **Utility Functions**:
  - `SendFeedbackRequest`: Sends a feedback request to a team member.
  - `Invoke-CodeWithPSScriptAnalyzer`: Analyzes the code using PSScriptAnalyzer.
  - `Export-AndWritePowerShellCodeBlocks`: Exports and writes PowerShell code blocks to a file.

## Installation Instructions

[Installation](#installation)

## Dependencies and Prerequisites

- **PowerShell Version**: Ensure you are using PowerShell 5.1 or later.
- **Modules**:
  - `PSAOAI`
  - `PSScriptAnalyzer`

## Use Cases and Expected Outputs

1. **Monitor RAM Usage**:

   ```powershell
   "Monitor RAM usage and show a single color block based on the load." | AIPSTeam.ps1
   ```

   **Expected Output**: Discussion flow with Powershell code to monitor RAM usage with color block.

2. **Monitor CPU Usage**:

   ```powershell
   "Monitor CPU usage and display dynamic graph." | AIPSTeam.ps1
   ```

   **Expected Output**: Discussion flow with Powershell code to show a dynamic graph showing CPU usage.

## Troubleshooting Tips and Common Issues

- **Module Not Found**: Ensure the required modules are installed using `Install-Module`.
- **Permission Issues**: Run PowerShell as an administrator.
- **Script Errors**: Check the log files in the specified log folder for detailed error messages.

## FAQ

1. **How do I install the required modules?**

   ```powershell
   Install-Module -Name PSAOAI
   Install-Module -Name PSScriptAnalyzer
   ```

2. **How do I disable live streaming?**

   ```powershell
   AIPSTeam.ps1 -Stream $false
   ```

3. **Where are the log files stored?**

   Log files are stored in the specified log folder or the default folder in `MyDocuments`.

4. **How do I load a saved project status?**

   ```powershell
   AIPSTeam.ps1 -LoadProjectStatus "path\to\your\Project.xml"
   ```

5. **How do I disable the Project Manager functions?**

   ```powershell
   AIPSTeam.ps1 -NOPM
   ```

6. **How do I specify a custom LLM model for ollama?**

   ```powershell
   $env:OLLAMA_MODEL = "your_custom_model"
   AIPSTeam.ps1 -LLMProvider "ollama"
   ```
