---
layout: default
title: Setup ORCA
parent: Computation
nav_order: 1
has_children: true
has_toc: false
summary: "Instructions for intalling ORCA and ChimeraX+SEQCROW for local DFT calculations."
permalink: /page/computation/setup.html
---

# {{page.title}}
{: .no_toc }

This page describes how to setup ORCA to perform DFT calculations on your personal machine. Plus instructions on how to setup ChimeraX+SEQCROW to setup, run, and analyze DFT jobs from a GUI.
{: .fs-6 .fw-300 .text-justify}



## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## Local ORCA
ORCA can be downloaded [here](https://orcaforum.kofo.mpg.de/index.php). You will need to register as a user before you can download.
{: .text-justify }

After downloading, you can use the detailed instructions found [here](https://sites.google.com/site/orcainputlibrary/setting-up-orca) to install ORCA for local use.
{: .text-justify }


## ChimeraX

ChimeraX is a first-rate (and free) molecular visualization program that can be downloaded [here](https://www.cgl.ucsf.edu/chimerax/).
{: .text-justify }


### SEQCROW

[SEQCROW](https://cxtoolshed.rbvi.ucsf.edu/apps/seqcrow) is an extension to ChimeraX that offers several tools for setting up and analyzing molecular modelling tasks. After installing ChimeraX, the SEQCROW extension can be added from the dropdown menu Tools ... More Tools. A window of popular extensions will popup and SEQCROW will be near the top of the list of popular extensions. Click the SEQCROW icon and then the "Download" icon.
{: .text-justify }


## Optional



### Anaconda

Anaconda is a useful tool for installing and maintaining compatible versions of open source programs. Start by installing [Anaconda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html). 

Before installing packages for performing these jobs, it is good practice to use virtual environments to avoid incompatibilities between installed packages. 

To create a virtual environment for testing molecular modelling packages, open a terminal and run `conda create --name molmodel`.

Note that your terminal line reads `(base) ~ $`(or something similarly generic). Now enter `conda activate molmodel` and you will notice that the terminal prompt changes to `molmodel ~ $`.

Whenever working with molecular modelling locally or installing related packages be sure that you have activated your `molmodel` virtual environment.  To deactivate the `molmodel` environment run `conda deactivate`

You can create as many virtual environments as you want. Feel free to create new environments when testing new packages. Avoid installing new packages in your base environment.

### CREST

[crest](https://crest-lab.github.io/crest-docs/) (Conformer–Rotamer Ensemble Sampling Tool) is a valuable tool for generating high-quality conformational ensembles from meta-dynamics simulations powered by semiempirical quantum chemical calculations. Crest jobs can be generated and submitted locally via a graphical user interface using ChimeraX+SEQCROW. To install crest locally, run

```
conda config --add channels conda-forge
conda install crest
```

### XTB

[XTB](https://xtb-docs.readthedocs.io/en/latest/setup.html) (extended tight binding) is a progam for peforming semiempirical quantum mechanical calculations. It is very convenient for rapid geometry optimizations. XTB can be used as a standalone program, but I typically use XTB via ORCA or ChimeraX+SEQCROW

XTB can be installed from a terminal with

```
conda config --add channels conda-forge
conda install xtb
```

Confirm installation with `which xtb`, which will return the path to the xtb executable. For me the output is `/Users/gairj/anaconda3/envs/orca/bin/xtb`.

To allow ORCA to use xtb, find the location where xtb was installed, go to that directory and copy the xtb file to the directory that holds the ORCA executables (`which ORCA` returns `/Applications/orca/orca`). Then rename the xtb file from `xtb` to `otool_xtb`. Now ORCA can use xtb on your local machine.


