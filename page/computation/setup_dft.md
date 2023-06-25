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


## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## Local Virtual Environment

It is often convenient to perform small modeling tasks on a local machine. Before installing packages for performing these jobs, it is good practice to use virtual environments to avoid incompatibilities between installed packages. Start by installing [Anaconda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html).

To create a virtual environment for testing ORCA, open a terminal and run `conda create --name orca`.

Note that your terminal line reads `(base) ~ $`. Now enter `conda activate orca` and you will notice that the terminal prompt changes to `(orca) ~ $`.

Whenever working with ORCA locally or installing related packages be sure that you have activated your `orca` virtual environment.  To deactivate the `orca` environment run `conda deactivate`

## Local ORCA
ORCA can be downloaded [here](https://orcaforum.kofo.mpg.de/index.php). You will need to register as a user before you can download.

After downloading, you can use the detailed instructions found [here](https://sites.google.com/site/orcainputlibrary/setting-up-orca) to install ORCA for local use.


## Local XTB

[XTB](https://xtb-docs.readthedocs.io/en/latest/setup.html) (extended tight binding) is a progam for peforming semiempirical quantum mechanical calculations. It is very convenient for rapid geometry optimizations. XTB can be used as a standalone program, but in this tutorial we will be calling on XTB from ORCA or crest.

XTB can be installed from a terminal with

```
conda config --add channels conda-forge
conda install xtb
```

Confirm installation with `which xtb`, which will return the path to the xtb executable. For me the output is `/Users/gairj/anaconda3/envs/orca/bin/xtb`.

To allow ORCA to use xtb, find the location where xtb was installed, go to that directory and copy the xtb file to the directory that holds the ORCA executables (`which ORCA` returns `/Applications/orca/orca`). Then rename the xtb file from `xtb` to `otool_xtb`. Now ORCA can use xtb on your local machine (this is already configured on HPC and AWS hybrid cloud). 

## Local CREST

[crest](https://crest-lab.github.io/crest-docs/) (Conformer–Rotamer Ensemble Sampling Tool) is a valuable tool for generating high-quality conformational ensembles from meta-dynamics simulations powered by semiempirical quantum chemical calculations. Crest jobs can be generated and submitted locally via a graphical user interface using ChimeraX+SEQCROW. To install crest locally, run

```
conda config --add channels conda-forge
conda install crest
```

*to do*

## Python tools
### CCTK
### AaronTools
