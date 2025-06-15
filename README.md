<div id="top" class="">

<div align="center" class="text-center">
<h1>REPO-COMMANDS</h1>
<p><em>Powerful Command Line Tools for Repository Management</em></p>

<img alt="last-commit" src="https://img.shields.io/github/last-commit/Uporabnik/repo-commands?style=flat&logo=git&logoColor=white&color=0080ff" class="inline-block mx-1" style="margin: 0px 2px;">
<img alt="repo-top-language" src="https://img.shields.io/github/languages/top/Uporabnik/repo-commands?style=flat&color=0080ff" class="inline-block mx-1" style="margin: 0px 2px;">
<img alt="repo-language-count" src="https://img.shields.io/github/languages/count/Uporabnik/repo-commands?style=flat&color=0080ff" class="inline-block mx-1" style="margin: 0px 2px;">
<p><em>Built with the tools and technologies:</em></p>
<img alt="PowerShell" src="https://img.shields.io/badge/PowerShell-5391FE.svg?style=flat&logo=PowerShell&logoColor=white" class="inline-block mx-1" style="margin: 0px 2px;">
<img alt="Windows" src="https://img.shields.io/badge/Windows-0078D6.svg?style=flat&logo=Windows&logoColor=white" class="inline-block mx-1" style="margin: 0px 2px;">
<img alt="Markdown" src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" class="inline-block mx-1" style="margin: 0px 2px;">
</div>
<br>
<hr>
<h2>Table of Contents</h2>
<ul class="list-disc pl-4 my-0">
<li class="my-0"><a href="#overview">Overview</a></li>
<li class="my-0"><a href="#getting-started">Getting Started</a>
<ul class="list-disc pl-4 my-0">
<li class="my-0"><a href="#prerequisites">Prerequisites</a></li>
<li class="my-0"><a href="#installation">Installation</a></li>
<li class="my-0"><a href="#usage">Usage</a></li>
</ul>
</li>
</ul>
<hr>
<h2>Overview</h2>
<p>repo-commands is a collection of powerful command-line tools designed to streamline repository management tasks. Built with PowerShell and Windows compatibility in mind, it provides a robust set of utilities for developers working in Windows environments.</p>

<p><strong>Why repo-commands?</strong></p>
<p>This project enhances developer productivity with the following features:</p>
<ul class="list-disc pl-4 my-0">
<li class="my-0">⚡ <strong>Fast Command Execution:</strong> Quick access to common repository operations through simple commands.</li>
<li class="my-0">🛠️ <strong>Windows Integration:</strong> Seamlessly integrates with Windows PowerShell environment.</li>
<li class="my-0">📦 <strong>Easy Setup:</strong> Simple path configuration for immediate use.</li>
<li class="my-0">🔄 <strong>Repository Management:</strong> Streamlined commands for common Git operations.</li>
</ul>
<hr>
<h2>Getting Started</h2>
<h3>Prerequisites</h3>
<p>This project requires the following:</p>
<ul class="list-disc pl-4 my-0">
<li class="my-0"><strong>Operating System:</strong> Windows 10 or later</li>
<li class="my-0"><strong>Shell:</strong> PowerShell</li>
</ul>
<h3>Installation</h3>
<p>Add repo-commands to your system path:</p>
<pre><code class="language-powershell">$Env:Path += ";C:\path\repo-commands"</code></pre>
<h3>Usage</h3>
<p>After installation, you can use the commands directly from your PowerShell terminal. The commands will be available system-wide once the path is properly configured.</p>

<h2>Available Commands</h2>
<p>repo-commands provides a set of powerful commands to streamline your repository management workflow. Here are all available commands and their usage:</p>

<h3>Basic Commands</h3>
<ul class="list-disc pl-4 my-0">
<li class="my-0">
<strong>repo -new "project-name"</strong>
<p>Creates a new repository with the specified project name.</p>
<pre><code class="language-powershell">repo -new "my-awesome-project"</code></pre>
</li>

<li class="my-0">
<strong>repo -clone "repository-url"</strong>
<p>Clones a repository from the provided URL.</p>
<pre><code class="language-powershell">repo -clone "https://github.com/username/repository.git"</code></pre>
</li>
</ul>

<h3>Repository Management</h3>
<ul class="list-disc pl-4 my-0">
<li class="my-0">
<strong>repo -edit</strong>
<p>Opens the repository in your default editor for making changes.</p>
<pre><code class="language-powershell">repo -edit</code></pre>
</li>

<li class="my-0">
<strong>repo -commit "message"</strong>
<p>Creates a new commit with the specified message.</p>
<pre><code class="language-powershell">repo -commit "Add new feature"</code></pre>
</li>

<li class="my-0">
<strong>repo -push</strong>
<p>Pushes your changes to the remote repository.</p>
<pre><code class="language-powershell">repo -push</code></pre>
</li>

<li class="my-0">
<strong>repo -sync "optional commit message"</strong>
<p>Synchronizes your local repository with the remote, pulling changes and optionally creating a commit.</p>
<pre><code class="language-powershell">repo -sync "Sync with remote changes"</code></pre>
</li>
</ul>

<h3>Command Examples</h3>
<p>Here are some common workflows using these commands:</p>

<ol class="list-decimal pl-4 my-0">
<li class="my-0">
<p><strong>Starting a new project:</strong></p>
<pre><code class="language-powershell">repo -new "my-project"
repo -edit
repo -commit "Initial commit"
repo -push</code></pre>
</li>

<li class="my-0">
<p><strong>Working with an existing project:</strong></p>
<pre><code class="language-powershell">repo -clone "https://github.com/username/repo.git"
repo -edit
repo -commit "Update documentation"
repo -push</code></pre>
</li>

<li class="my-0">
<p><strong>Keeping your repository up to date:</strong></p>
<pre><code class="language-powershell">repo -sync "Merge remote changes"</code></pre>
</li>
</ol>

<p>Each command is designed to be simple and intuitive, making repository management tasks more efficient and less error-prone.</p>
</div>