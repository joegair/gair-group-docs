---
layout: default
title: DFT on MSU High Performance Computing
parent: Computation
nav_order: 4
has_toc: false
summary: "submit DFT jobs to HPC at MSU"
permalink: /page/computation/dft-msu-hpc.html
---


# {{page.title}}
{: .no_toc }


This tutorial will demonstrate how to get high performance computing (HPC) account at MSU, how to get access to ORCA and Gaussian on HPC, and how to submit DFT calculations on HPC. The goal is for this tutorial to be accessible to folks with no coding experience. Download the neccessary submission script and input files [here](https://github.com/joegair/gair-group-docs/tree/main/assets/data/20240410_first_hpc_job/download).
{: .fs-6 .fw-300 .text-justify}


## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


-----

# **"The Most Indiscriminate Reagent"**

In 1956, William von E. Doering and co-workers photolyzed diazomethane to generate methylene, which inserted into the C-H bonds of various alkanes with statistical selectivity ([*JACS* **1956**, 3224](https://pubs.acs.org/doi/pdf/10.1021/ja01594a071)). This reactivity earned methylene the title of "the most indiscriminate reagent known in organic chemistry." More recently, Huw Davies and co-workers demonstrated that carbenes derived from alpha-diazoacetates can be generated under mild conditions (blue LEDs), and intercepted for synthetic applications [*Chem. Sci.* **2018** 5112-5118](https://pubs.rsc.org/en/content/articlelanding/2018/sc/c8sc01165f). Notably, much higher yields were obtained from diazo compounds that absorbed at longer wavelengths (further into the visible region). This led me to wonder whether DFT would serve as a useful model to quickly check whether a given diazo compound absorbs visible light.
{: .text-justify }



